namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>SuppressionsAPI API operations.</summary>
public class SuppressionsAPI
{
    private readonly Transport _transport;

    public SuppressionsAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<SuppressionPageResponse> ListSuppressionsAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/suppressions";
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
        return await _transport.ExecuteAsync<SuppressionPageResponse>(request, cancellationToken);
    }

    public async Task ExportSuppressionsAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/suppressions/export";
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
        await _transport.ExecuteRawAsync(request, cancellationToken);
    }

    public async Task<SuppressionResponse> AddSuppressionAsync(
        string projectId,
        AddSuppressionBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/suppressions";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
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
        return await _transport.ExecuteAsync<SuppressionResponse>(request, cancellationToken);
    }

    public async Task RemoveSuppressionAsync(
        string projectId,
        string email,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/suppressions/${email}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${email}", Uri.EscapeDataString(Transport.StringValue(email)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("DELETE"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        await _transport.ExecuteRawAsync(request, cancellationToken);
    }

    public async Task<SuppressionImportResponse> ImportSuppressionsAsync(
        string projectId,
        SuppressionImportBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/suppressions/import";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
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
        return await _transport.ExecuteAsync<SuppressionImportResponse>(request, cancellationToken);
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
