namespace ApolloDeploySignal;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;

/// <summary>Configuration for the HTTP transport layer.</summary>
public sealed class TransportConfig
{
    public string BaseUrl { get; set; } = "";
    public int TimeoutMs { get; set; } = 15000;
    public int MaxRetries { get; set; } = 3;
    public bool RetryUnsafeRequests { get; set; }
    public Dictionary<string, string>? DefaultHeaders { get; set; }
}

/// <summary>
/// Low-level HTTP transport handling authentication, serialization, bounded retries,
/// cancellation, and normalized API errors.
/// </summary>
public sealed class Transport : IDisposable
{
    private const int MaxRetryCount = 8;
    private const int MaxResponseBodyBytes = 5 * 1024 * 1024;
    private const int MaxSseEventBytes = 1024 * 1024;
    private const int MaxSseLineChars = 1024 * 1024;

    private static readonly HashSet<HttpStatusCode> RetryableStatuses = new()
    {
        HttpStatusCode.RequestTimeout,
        (HttpStatusCode)425,
        (HttpStatusCode)429,
        HttpStatusCode.InternalServerError,
        HttpStatusCode.BadGateway,
        HttpStatusCode.ServiceUnavailable,
        HttpStatusCode.GatewayTimeout,
    };

    private readonly TransportConfig _config;
    private readonly HttpClient _httpClient;
    private readonly bool _ownsHttpClient;

    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
        PropertyNameCaseInsensitive = true,
        DefaultIgnoreCondition = System.Text.Json.Serialization.JsonIgnoreCondition.WhenWritingNull,
    };

    public static string StringValue(object? value)
    {
        if (value is null) return "";
        if (value is bool boolean) return boolean ? "true" : "false";
        if (value is DateTimeOffset dateTimeOffset)
            return dateTimeOffset.ToString("O", CultureInfo.InvariantCulture);
        if (value is DateTime dateTime)
            return dateTime.ToString("O", CultureInfo.InvariantCulture);
        if (value is Enum enumValue)
        {
            var member = enumValue.GetType().GetMember(enumValue.ToString()).FirstOrDefault();
            var wireValue = member?.GetCustomAttribute<EnumMemberAttribute>()?.Value;
            if (!string.IsNullOrEmpty(wireValue)) return wireValue;
        }
        if (value is IFormattable formattable)
            return formattable.ToString(null, CultureInfo.InvariantCulture) ?? "";
        return value.ToString() ?? "";
    }

    public sealed class EmailValidationStatusInputJsonConverter : JsonConverter<EmailValidationStatusInput>
    {
        public override EmailValidationStatusInput Read(
            ref Utf8JsonReader reader,
            Type typeToConvert,
            JsonSerializerOptions options)
        {
            if (reader.TokenType != JsonTokenType.String)
                throw new JsonException("Expected a string EmailValidationStatusInput wire value");
            return reader.GetString() switch
            {
                "valid" => EmailValidationStatusInput.Valid,
                "risky" => EmailValidationStatusInput.Risky,
                "invalid" => EmailValidationStatusInput.Invalid,
                "unknown" => EmailValidationStatusInput.Unknown,
                _ => throw new JsonException("Unknown EmailValidationStatusInput wire value"),
            };
        }

        public override void Write(
            Utf8JsonWriter writer,
            EmailValidationStatusInput value,
            JsonSerializerOptions options)
        {
            switch (value)
            {
                case EmailValidationStatusInput.Valid:
                    writer.WriteStringValue("valid");
                    return;
                case EmailValidationStatusInput.Risky:
                    writer.WriteStringValue("risky");
                    return;
                case EmailValidationStatusInput.Invalid:
                    writer.WriteStringValue("invalid");
                    return;
                case EmailValidationStatusInput.Unknown:
                    writer.WriteStringValue("unknown");
                    return;
                default:
                    throw new JsonException("Unknown EmailValidationStatusInput enum member");
            }
        }
    }


    public Transport(TransportConfig config, HttpClient? httpClient = null)
    {
        if (string.IsNullOrWhiteSpace(config.BaseUrl))
            throw new ArgumentException("BaseUrl must not be blank", nameof(config));
        if (config.TimeoutMs <= 0)
            throw new ArgumentOutOfRangeException(nameof(config), "TimeoutMs must be greater than zero");
        if (config.MaxRetries is < 0 or > MaxRetryCount)
            throw new ArgumentOutOfRangeException(
                nameof(config),
                $"MaxRetries must be between 0 and {MaxRetryCount}");

        _config = config;
        _ownsHttpClient = httpClient is null;
        _httpClient = httpClient ?? new HttpClient();
        _httpClient.Timeout = Timeout.InfiniteTimeSpan;
    }

    public sealed class Request
    {
        public HttpMethod Method { get; set; } = HttpMethod.Get;
        public string Path { get; set; } = "";
        public List<KeyValuePair<string, string>>? Query { get; set; }
        public object? Body { get; set; }
        public string? ContentType { get; set; }
        public Dictionary<string, string>? Headers { get; set; }
        public int? TimeoutMs { get; set; }
    }

    public async Task<T> ExecuteAsync<T>(Request request, CancellationToken cancellationToken = default)
    {
        try
        {
            using var timeoutSource = CreateTimeoutSource(request, cancellationToken);
            using var response = await SendWithRetriesAsync(
                request,
                HttpCompletionOption.ResponseHeadersRead,
                timeoutSource.Token);
            var body = Encoding.UTF8.GetString(
                await ReadBoundedBodyAsync(response, timeoutSource.Token));
            EnsureSuccess(response, body);

            if (string.IsNullOrWhiteSpace(body))
            {
                throw new SdkException(
                    (int)response.StatusCode,
                    "EMPTY_RESPONSE",
                    "Successful response body was empty",
                    GetRequestId(response));
            }

            try
            {
                return JsonSerializer.Deserialize<T>(body, JsonOptions)
                    ?? throw new JsonException("Response body was JSON null");
            }
            catch (JsonException error)
            {
                throw new SdkException(
                    (int)response.StatusCode,
                    "DESERIALIZE_ERROR",
                    "Failed to deserialize response body",
                    GetRequestId(response),
                    error);
            }
        }
        catch (OperationCanceledException error)
            when (IsTimeoutCancellation(cancellationToken, error))
        {
            throw TimeoutError(request, error);
        }
    }

    public async Task<byte[]> ExecuteRawAsync(Request request, CancellationToken cancellationToken = default)
    {
        try
        {
            using var timeoutSource = CreateTimeoutSource(request, cancellationToken);
            using var response = await SendWithRetriesAsync(
                request,
                HttpCompletionOption.ResponseHeadersRead,
                timeoutSource.Token);
            var body = await ReadBoundedBodyAsync(response, timeoutSource.Token);
            if (!response.IsSuccessStatusCode)
                throw ParseErrorResponse(response, Encoding.UTF8.GetString(body));
            return body;
        }
        catch (OperationCanceledException error)
            when (IsTimeoutCancellation(cancellationToken, error))
        {
            throw TimeoutError(request, error);
        }
    }

    /// <summary>Executes and incrementally parses a bounded text/event-stream response.</summary>
    public async IAsyncEnumerable<T> StreamAsync<T>(
        Request request,
        [EnumeratorCancellation] CancellationToken cancellationToken = default)
    {
        using var timeoutSource = CreateTimeoutSource(request, cancellationToken);
        using var response = await SendWithRetriesAsync(
            request,
            HttpCompletionOption.ResponseHeadersRead,
            timeoutSource.Token);
        if (!response.IsSuccessStatusCode)
        {
            var body = Encoding.UTF8.GetString(
                await ReadBoundedBodyAsync(response, timeoutSource.Token));
            throw ParseErrorResponse(response, body);
        }

        await using var stream = await response.Content.ReadAsStreamAsync(timeoutSource.Token);
        using var reader = new StreamReader(
            stream,
            Encoding.UTF8,
            detectEncodingFromByteOrderMarks: true,
            bufferSize: 8192,
            leaveOpen: false);
        var lineReader = new BoundedSseLineReader(reader, response);
        var data = new StringBuilder();
        var eventBytes = 0;

        while (true)
        {
            var line = await lineReader.ReadBoundedLineAsync(timeoutSource.Token);
            if (line is null)
            {
                if (data.Length > 0)
                    yield return DeserializeSse<T>(data.ToString(), response);
                yield break;
            }

            if (line.Length == 0)
            {
                if (data.Length > 0)
                {
                    var payload = data.ToString();
                    data.Clear();
                    eventBytes = 0;
                    yield return DeserializeSse<T>(payload, response);
                }
                continue;
            }

            if (line[0] == ':') continue;
            var separator = line.IndexOf(':');
            var field = separator < 0 ? line : line[..separator];
            if (!field.Equals("data", StringComparison.Ordinal)) continue;

            var value = separator < 0 ? "" : line[(separator + 1)..];
            if (value.StartsWith(' ')) value = value[1..];
            var addedBytes = Encoding.UTF8.GetByteCount(value) + (data.Length > 0 ? 1 : 0);
            if (eventBytes + addedBytes > MaxSseEventBytes)
            {
                throw new SdkException(
                    (int)response.StatusCode,
                    "SSE_EVENT_TOO_LARGE",
                    $"SSE event exceeded {MaxSseEventBytes} bytes",
                    GetRequestId(response));
            }
            if (data.Length > 0) data.Append('\n');
            data.Append(value);
            eventBytes += addedBytes;
        }
    }

    public void Dispose()
    {
        if (_ownsHttpClient) _httpClient.Dispose();
    }

    private static async Task<byte[]> ReadBoundedBodyAsync(
        HttpResponseMessage response,
        CancellationToken cancellationToken)
    {
        await using var stream = await response.Content.ReadAsStreamAsync(cancellationToken);
        using var output = new MemoryStream();
        var buffer = new byte[8192];
        while (true)
        {
            var count = await stream.ReadAsync(buffer.AsMemory(), cancellationToken);
            if (count == 0) break;
            if (output.Length + count > MaxResponseBodyBytes)
            {
                throw new SdkException(
                    (int)response.StatusCode,
                    "RESPONSE_TOO_LARGE",
                    $"Response body exceeded {MaxResponseBodyBytes} bytes",
                    GetRequestId(response));
            }
            output.Write(buffer, 0, count);
        }
        return output.ToArray();
    }

    private CancellationTokenSource CreateTimeoutSource(
        Request request,
        CancellationToken cancellationToken)
    {
        var timeoutMs = request.TimeoutMs ?? _config.TimeoutMs;
        if (timeoutMs <= 0)
            throw new ArgumentOutOfRangeException(nameof(request), "TimeoutMs must be greater than zero");

        var source = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
        source.CancelAfter(timeoutMs);
        return source;
    }

    private static bool IsTimeoutCancellation(
        CancellationToken callerToken,
        OperationCanceledException error) =>
        !callerToken.IsCancellationRequested && error.CancellationToken.IsCancellationRequested;

    private SdkException TimeoutError(Request request, Exception innerException) =>
        new(
            0,
            "TIMEOUT",
            $"Request timed out after {request.TimeoutMs ?? _config.TimeoutMs} ms",
            null,
            innerException);

    private sealed class BoundedSseLineReader
    {
        private readonly StreamReader _reader;
        private readonly HttpResponseMessage _response;
        private long _totalBytes;

        public BoundedSseLineReader(StreamReader reader, HttpResponseMessage response)
        {
            _reader = reader;
            _response = response;
        }

        public async Task<string?> ReadBoundedLineAsync(CancellationToken cancellationToken)
        {
            var result = new StringBuilder();
            var character = new char[1];
            while (true)
            {
                var count = await _reader.ReadAsync(character.AsMemory(), cancellationToken);
                if (count == 0)
                    return result.Length == 0 ? null : Finish(result);
                if (character[0] == '\n')
                {
                    if (result.Length > 0 && result[^1] == '\r') result.Length -= 1;
                    return Finish(result);
                }
                if (result.Length >= MaxSseLineChars)
                {
                    throw new SdkException(
                        (int)_response.StatusCode,
                        "SSE_LINE_TOO_LARGE",
                        $"SSE line exceeded {MaxSseLineChars} characters",
                        GetRequestId(_response));
                }
                result.Append(character[0]);
            }
        }

        private string Finish(StringBuilder result)
        {
            var line = result.ToString();
            var lineBytes = Encoding.UTF8.GetByteCount(line) + 1;
            if (_totalBytes + lineBytes > MaxResponseBodyBytes)
            {
                throw new SdkException(
                    (int)_response.StatusCode,
                    "RESPONSE_TOO_LARGE",
                    $"Response body exceeded {MaxResponseBodyBytes} bytes",
                    GetRequestId(_response));
            }
            _totalBytes += lineBytes;
            return line;
        }
    }

    private static T DeserializeSse<T>(string payload, HttpResponseMessage response)
    {
        try
        {
            if (typeof(T) == typeof(string)) return (T)(object)payload;
            return JsonSerializer.Deserialize<T>(payload, JsonOptions)
                ?? throw new JsonException("SSE data was JSON null");
        }
        catch (JsonException error)
        {
            throw new SdkException(
                (int)response.StatusCode,
                "SSE_DESERIALIZE_ERROR",
                "Failed to deserialize SSE event data",
                GetRequestId(response),
                error);
        }
    }

    private async Task<HttpResponseMessage> SendWithRetriesAsync(
        Request request,
        HttpCompletionOption completionOption,
        CancellationToken cancellationToken)
    {
        var canRetry = CanRetry(request);

        for (var attempt = 0; attempt <= _config.MaxRetries; attempt++)
        {
            try
            {
                using var httpRequest = BuildRequest(request);
                var response = await _httpClient.SendAsync(
                    httpRequest,
                    completionOption,
                    cancellationToken);

                if (response.IsSuccessStatusCode ||
                    !canRetry ||
                    !RetryableStatuses.Contains(response.StatusCode) ||
                    attempt == _config.MaxRetries)
                {
                    return response;
                }

                var delay = GetRetryDelay(response, attempt);
                response.Dispose();
                await Task.Delay(delay, cancellationToken);
            }
            catch (OperationCanceledException) when (cancellationToken.IsCancellationRequested)
            {
                throw;
            }
            catch (Exception error) when (IsNetworkError(error))
            {
                if (!canRetry || attempt == _config.MaxRetries)
                {
                    throw new SdkException(
                        0,
                        "REQUEST_ERROR",
                        "Network error: " + error.Message,
                        null,
                        error);
                }

                await Task.Delay(GetBackoff(attempt), cancellationToken);
            }
            catch (SdkException)
            {
                throw;
            }
            catch (Exception error)
            {
                throw new SdkException(0, "REQUEST_ERROR", error.Message, null, error);
            }
        }

        throw new SdkException(
            0,
            "MAX_RETRIES_EXCEEDED",
            "Request failed after " + (_config.MaxRetries + 1) + " attempts",
            null);
    }

    private HttpRequestMessage BuildRequest(Request request)
    {
        if (request.Path.Contains('?') || request.Path.Contains('#'))
            throw new ArgumentException(
                "Request paths cannot contain a query or fragment",
                nameof(request));

        var baseUri = new Uri(_config.BaseUrl, UriKind.Absolute);
        if (baseUri.Scheme != Uri.UriSchemeHttp && baseUri.Scheme != Uri.UriSchemeHttps)
            throw new ArgumentException("BaseUrl must be an absolute HTTP(S) URL", nameof(_config));

        var target = new StringBuilder(baseUri.GetLeftPart(UriPartial.Authority));
        var basePath = baseUri
            .GetComponents(UriComponents.Path, UriFormat.UriEscaped)
            .TrimEnd('/');
        var requestPath = request.Path.TrimStart('/');
        target.Append('/');
        if (!string.IsNullOrEmpty(basePath))
            target.Append(basePath).Append('/');
        target.Append(requestPath);

        var query = new List<string>();
        var baseQuery = baseUri.GetComponents(UriComponents.Query, UriFormat.UriEscaped);
        if (!string.IsNullOrEmpty(baseQuery))
            query.AddRange(baseQuery.Split('&', StringSplitOptions.RemoveEmptyEntries));

        if (request.Query != null)
        {
            var requestQueryNames = request.Query
                .Select(pair => pair.Key)
                .ToHashSet(StringComparer.Ordinal);
            query.RemoveAll(value => requestQueryNames.Any(name => QueryPairMatches(value, name)));
            query.AddRange(request.Query.Select(pair =>
                Uri.EscapeDataString(pair.Key) + "=" + Uri.EscapeDataString(pair.Value)));
        }


        var renderedQuery = string.Join(
            "&",
            query.Where(value => !string.IsNullOrWhiteSpace(value)));
        if (!string.IsNullOrEmpty(renderedQuery))
            target.Append('?').Append(renderedQuery);
        var httpRequest = new HttpRequestMessage(
            request.Method,
            new Uri(target.ToString(), UriKind.Absolute));

        httpRequest.Headers.TryAddWithoutValidation("Accept", "application/json");
        httpRequest.Headers.TryAddWithoutValidation("User-Agent", "ApolloDeploy.Signal/4.0.1");

        if (_config.DefaultHeaders != null)
        {
            foreach (var (key, value) in _config.DefaultHeaders)
                SetHeader(httpRequest, key, value);
        }

        if (request.Body != null)
            httpRequest.Content = CreateRequestContent(request);

        if (request.Headers != null)
        {
            foreach (var (key, value) in request.Headers)
            {
                if (key.Equals("Content-Type", StringComparison.OrdinalIgnoreCase) &&
                    httpRequest.Content is not MultipartFormDataContent &&
                    httpRequest.Content != null)
                    httpRequest.Content.Headers.ContentType =
                        new System.Net.Http.Headers.MediaTypeHeaderValue(value);
                else
                    SetHeader(httpRequest, key, value);
            }
        }

        var authCookies = new SortedDictionary<string, string>(StringComparer.Ordinal);
        var claimedSecurityHeaders = new HashSet<string>(StringComparer.OrdinalIgnoreCase);


        if (authCookies.Count > 0) MergeAuthCookies(httpRequest, authCookies);

        return httpRequest;
    }

    private static bool QueryPairMatches(string pair, string name)
    {
        var separator = pair.IndexOf('=');
        var encodedName = separator >= 0 ? pair[..separator] : pair;
        return string.Equals(
            Uri.UnescapeDataString(encodedName.Replace("+", " ", StringComparison.Ordinal)),
            name,
            StringComparison.Ordinal);
    }

    private static void MergeAuthCookies(
        HttpRequestMessage request,
        IReadOnlyDictionary<string, string> authCookies)
    {
        var authNames = new HashSet<string>(authCookies.Keys, StringComparer.Ordinal);
        authNames.UnionWith(authCookies.Keys.Select(Uri.EscapeDataString));
        var pairs = new List<string>();

        if (request.Headers.TryGetValues("Cookie", out var values))
        {
            foreach (var segment in string.Join("; ", values).Split(';'))
            {
                var pair = segment.Trim();
                if (pair.Length == 0) continue;
                var separator = pair.IndexOf('=');
                var name = (separator < 0 ? pair : pair[..separator]).Trim();
                if (!authNames.Contains(name)) pairs.Add(pair);
            }
        }

        pairs.AddRange(authCookies.Select(pair =>
            Uri.EscapeDataString(pair.Key) + "=" + Uri.EscapeDataString(pair.Value)));
        SetHeader(request, "Cookie", string.Join("; ", pairs));
    }

    private static void SetHeader(HttpRequestMessage request, string name, string value)
    {
        request.Headers.Remove(name);
        request.Headers.TryAddWithoutValidation(name, value);
    }

    private static void SetSecurityHeader(
        HttpRequestMessage request,
        ISet<string> claimedHeaders,
        string name,
        string value)
    {
        if (!claimedHeaders.Add(name))
            throw new InvalidOperationException(
                $"Multiple configured security schemes target the {name} header");
        SetHeader(request, name, value);
    }

    internal static string EncodeCookieComponent(string value) => Uri.EscapeDataString(value);

    private static HttpContent CreateRequestContent(Request request)
    {
        var contentType = request.ContentType ?? "application/json";
        var mediaType = contentType.Split(';', 2)[0].Trim().ToLowerInvariant();

        if (mediaType == "multipart/form-data")
            return CreateMultipartContent(request.Body!);

        if (mediaType == "application/json" || mediaType.EndsWith("+json", StringComparison.Ordinal))
        {
            var json = JsonSerializer.Serialize(request.Body, JsonOptions);
            return new StringContent(json, Encoding.UTF8, contentType);
        }

        if (request.Body is byte[] bytes)
        {
            var content = new ByteArrayContent(bytes);
            content.Headers.ContentType = MediaTypeHeaderValue.Parse(contentType);
            return content;
        }

        if (request.Body is Stream stream)
        {
            var content = new StreamContent(stream);
            content.Headers.ContentType = MediaTypeHeaderValue.Parse(contentType);
            return content;
        }

        if (mediaType.StartsWith("text/", StringComparison.Ordinal))
            return new StringContent(
                Convert.ToString(request.Body, CultureInfo.InvariantCulture) ?? "",
                Encoding.UTF8,
                contentType);

        throw new SdkException(
            0,
            "UNSUPPORTED_BODY",
            $"Request body type is not supported for content type {contentType}",
            null);
    }

    private static MultipartFormDataContent CreateMultipartContent(object body)
    {
        var content = new MultipartFormDataContent();
        AddMultipartValues(content, body);
        return content;
    }

    private static void AddMultipartValues(MultipartFormDataContent content, object body)
    {
        if (body is JsonElement element)
        {
            AddJsonMultipartValue(content, null, element);
            return;
        }

        if (body is IDictionary dictionary)
        {
            foreach (DictionaryEntry entry in dictionary)
            {
                if (entry.Key is not null)
                    AddMultipartValue(content, entry.Key.ToString() ?? "value", entry.Value);
            }
            return;
        }

        foreach (var property in body.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public))
        {
            if (property.GetIndexParameters().Length == 0)
            {
                var wireName = property.GetCustomAttribute<JsonPropertyNameAttribute>()?.Name ?? property.Name;
                AddMultipartValue(content, wireName, property.GetValue(body));
            }
        }
    }

    private static void AddMultipartValue(
        MultipartFormDataContent content,
        string name,
        object? value)
    {
        if (value is null) return;
        if (value is byte[] bytes)
        {
            var part = new ByteArrayContent(bytes);
            part.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");
            content.Add(part, name);
            return;
        }
        if (value is Stream stream)
        {
            content.Add(new StreamContent(stream), name);
            return;
        }
        if (value is IEnumerable values && value is not string)
        {
            foreach (var item in values) AddMultipartValue(content, name, item);
            return;
        }
        if (value is JsonElement element)
        {
            AddJsonMultipartValue(content, name, element);
            return;
        }
        if (value is string || value.GetType().IsPrimitive || value is decimal || value is Guid ||
            value is DateTime || value is DateTimeOffset)
        {
            content.Add(new StringContent(Convert.ToString(value, CultureInfo.InvariantCulture) ?? ""), name);
            return;
        }

        var json = JsonSerializer.Serialize(value, value.GetType(), JsonOptions);
        content.Add(new StringContent(json, Encoding.UTF8, "application/json"), name);
    }

    private static void AddJsonMultipartValue(
        MultipartFormDataContent content,
        string? name,
        JsonElement value)
    {
        switch (value.ValueKind)
        {
            case JsonValueKind.Object:
                foreach (var property in value.EnumerateObject())
                    AddJsonMultipartValue(content, property.Name, property.Value);
                break;
            case JsonValueKind.Array:
                if (name != null)
                    foreach (var item in value.EnumerateArray())
                        AddJsonMultipartValue(content, name, item);
                break;
            case JsonValueKind.String:
                if (name != null) content.Add(new StringContent(value.GetString() ?? ""), name);
                break;
            case JsonValueKind.Null:
                break;
            default:
                if (name != null) content.Add(new StringContent(value.GetRawText()), name);
                break;
        }
    }

    private bool CanRetry(Request request)
    {
        if (_config.RetryUnsafeRequests ||
            request.Method == HttpMethod.Get ||
            request.Method == HttpMethod.Head ||
            request.Method == HttpMethod.Options ||
            request.Method == HttpMethod.Put ||
            request.Method == HttpMethod.Delete)
        {
            return true;
        }

        return _config.DefaultHeaders?.Any(pair =>
                   (pair.Key.Equals("Idempotency-Key", StringComparison.OrdinalIgnoreCase) ||
                    pair.Key.Equals("X-Idempotency-Key", StringComparison.OrdinalIgnoreCase)) &&
                   !string.IsNullOrEmpty(pair.Value)) == true ||
               request.Headers?.Any(pair =>
                   (pair.Key.Equals("Idempotency-Key", StringComparison.OrdinalIgnoreCase) ||
                    pair.Key.Equals("X-Idempotency-Key", StringComparison.OrdinalIgnoreCase)) &&
                   !string.IsNullOrEmpty(pair.Value)) == true;
    }

    private static TimeSpan GetRetryDelay(HttpResponseMessage response, int attempt)
    {
        var retryAfter = response.Headers.RetryAfter;
        if (retryAfter?.Delta is { } delta)
            return ClampDelay(delta);
        if (retryAfter?.Date is { } date)
            return ClampDelay(date - DateTimeOffset.UtcNow);
        return GetBackoff(attempt);
    }

    private static TimeSpan GetBackoff(int attempt)
    {
        var exponential = Math.Min(30_000, 200 * Math.Pow(2, Math.Min(attempt, 10)));
        var jitter = Random.Shared.NextDouble() * exponential / 2;
        return TimeSpan.FromMilliseconds(Math.Min(30_000, exponential + jitter));
    }

    private static TimeSpan ClampDelay(TimeSpan delay)
    {
        if (delay < TimeSpan.Zero) return TimeSpan.Zero;
        return delay > TimeSpan.FromSeconds(30) ? TimeSpan.FromSeconds(30) : delay;
    }

    private static bool IsNetworkError(Exception error) =>
        error is HttpRequestException or IOException or TaskCanceledException or TimeoutException;

    private static void EnsureSuccess(HttpResponseMessage response, string body)
    {
        if (!response.IsSuccessStatusCode)
            throw ParseErrorResponse(response, body);
    }

    private static SdkException ParseErrorResponse(HttpResponseMessage response, string body)
    {
        var requestId = GetRequestId(response);
        try
        {
            using var document = JsonDocument.Parse(body);
            var root = document.RootElement;
            var code = ReadString(root, "code");
            var message = ReadString(root, "message");

            if (root.TryGetProperty("error", out var error))
            {
                if (error.ValueKind == JsonValueKind.Object)
                {
                    code ??= ReadString(error, "code");
                    message ??= ReadString(error, "message");
                }
                else if (error.ValueKind == JsonValueKind.String)
                {
                    message ??= error.GetString();
                }
            }

            message ??= string.IsNullOrWhiteSpace(body)
                ? "HTTP " + (int)response.StatusCode + ": " + response.ReasonPhrase
                : body.Trim();

            return new SdkException((int)response.StatusCode, code, message, requestId);
        }
        catch (JsonException)
        {
            return new SdkException(
                (int)response.StatusCode,
                null,
                string.IsNullOrWhiteSpace(body)
                    ? "HTTP " + (int)response.StatusCode + ": " + response.ReasonPhrase
                    : body.Trim(),
                requestId);
        }
    }

    private static string? ReadString(JsonElement value, string property) =>
        value.TryGetProperty(property, out var element) && element.ValueKind == JsonValueKind.String
            ? element.GetString()
            : null;

    private static string? GetRequestId(HttpResponseMessage response)
    {
        foreach (var name in new[] { "x-request-id", "request-id" })
        {
            if (response.Headers.TryGetValues(name, out var values))
                return values.FirstOrDefault();
        }
        return null;
    }
}
