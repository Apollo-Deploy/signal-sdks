namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>ApiKeysAPI API operations.</summary>
public class ApiKeysAPI
{
    private readonly Transport _transport;

    public ApiKeysAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<ListApiKeysResponse> ListApiKeysAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/api-keys";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<ListApiKeysResponse>(request, cancellationToken);
    }

    public async Task<ApiKey> GetApiKeyAsync(
        string projectId,
        string keyId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/api-keys/${keyId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${keyId}", Uri.EscapeDataString(Transport.StringValue(keyId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<ApiKey>(request, cancellationToken);
    }

    public async Task<ApiKeyUsageResponse> GetApiKeyUsageAsync(
        string projectId,
        string keyId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/api-keys/${keyId}/usage";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${keyId}", Uri.EscapeDataString(Transport.StringValue(keyId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<ApiKeyUsageResponse>(request, cancellationToken);
    }

    public async Task ExportApiKeyUsageAsync(
        string projectId,
        string keyId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/api-keys/${keyId}/usage/export";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${keyId}", Uri.EscapeDataString(Transport.StringValue(keyId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        await _transport.ExecuteRawAsync(request, cancellationToken);
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
