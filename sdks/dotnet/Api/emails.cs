namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>EmailsAPI API operations.</summary>
public class EmailsAPI
{
    private readonly Transport _transport;

    public EmailsAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<SendEmailResponse> SendEmailAsync(
        SendEmailRequest body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/emails";
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
            Body = body,
            ContentType = "application/json",
        };
        return await _transport.ExecuteAsync<SendEmailResponse>(request, cancellationToken);
    }

    public async Task<EmailDetailResponse> GetEmailAsync(
        string emailId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/emails/${emailId}";
        path = path.Replace("${emailId}", Uri.EscapeDataString(Transport.StringValue(emailId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<EmailDetailResponse>(request, cancellationToken);
    }

    public async Task<BatchSendResponse> BatchSendEmailsAsync(
        BatchSendRequest body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/emails/batch";
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
            Body = body,
            ContentType = "application/json",
        };
        return await _transport.ExecuteAsync<BatchSendResponse>(request, cancellationToken);
    }

    public async Task<CancelResponse> CancelEmailAsync(
        string emailId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/emails/${emailId}";
        path = path.Replace("${emailId}", Uri.EscapeDataString(Transport.StringValue(emailId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("DELETE"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<CancelResponse>(request, cancellationToken);
    }

    public async Task<BulkCancelResponse> BulkCancelEmailsAsync(
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/emails";
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("DELETE"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<BulkCancelResponse>(request, cancellationToken);
    }

    public async Task<StreamTokenResponse> IssueStreamTokenAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/emails/${projectId}/stream/token";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<StreamTokenResponse>(request, cancellationToken);
    }

    /// <summary>Incrementally parses bounded text/event-stream data into typed events.</summary>
    /// <remarks>Raw SSE lines are intentionally not exposed as a string sequence.</remarks>
    public async IAsyncEnumerable<StreamEventResponse> StreamEmailEventsAsync(
        [System.Runtime.CompilerServices.EnumeratorCancellation] CancellationToken cancellationToken = default)
    {
        var path = "/v1/emails/stream";
        var queryParams = BuildQuery(null);
        Dictionary<string, string>? requestHeaders = null;
        requestHeaders ??= new Dictionary<string, string>();
        requestHeaders["Accept"] = "text/event-stream";
        await foreach (var eventValue in _transport.StreamAsync<StreamEventResponse>(new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = queryParams,
            Headers = requestHeaders,
            TimeoutMs = null,
        }, cancellationToken))
        {
            yield return eventValue;
        }
    }

    public async Task<ValidateLinksResponse> ValidateLinksAsync(
        ValidateLinksRequest body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/emails/validate";
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
            Body = body,
            ContentType = "application/json",
        };
        return await _transport.ExecuteAsync<ValidateLinksResponse>(request, cancellationToken);
    }

    private static List<KeyValuePair<string, string>>? BuildQuery(IReadOnlyDictionary<string, object?>? query)
    {
        if (query is null || query.Count == 0) return null;
        var result = new List<KeyValuePair<string, string>>();
        foreach (var (key, value) in query)
        {
            if (value is string text)
            {
                result.Add(new KeyValuePair<string, string>(key, text));
            }
            else if (value is IEnumerable values)
            {
                foreach (var item in values)
                {
                    if (item is not null)
                        result.Add(new KeyValuePair<string, string>(key, Transport.StringValue(item)));
                }
            }
            else if (value is not null)
            {
                result.Add(new KeyValuePair<string, string>(key, Transport.StringValue(value)));
            }
        }
        return result.Count == 0 ? null : result;
    }
}
