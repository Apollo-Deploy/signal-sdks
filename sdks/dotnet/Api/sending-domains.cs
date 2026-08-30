namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>SendingDomainsAPI API operations.</summary>
public class SendingDomainsAPI
{
    private readonly Transport _transport;

    public SendingDomainsAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<DomainListPageResponse> ListDomainsAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/domains";
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
        return await _transport.ExecuteAsync<DomainListPageResponse>(request, cancellationToken);
    }

    public async Task<DomainResponse> GetDomainAsync(
        string projectId,
        string domainId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/domains/${domainId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${domainId}", Uri.EscapeDataString(Transport.StringValue(domainId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<DomainResponse>(request, cancellationToken);
    }

    public async Task<DomainResponse> RegisterDomainAsync(
        string projectId,
        RegisterDomainRequest body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/domains";
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
        return await _transport.ExecuteAsync<DomainResponse>(request, cancellationToken);
    }

    public async Task<DomainResponse> VerifyDomainAsync(
        string projectId,
        string domainId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/domains/${domainId}/verify";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${domainId}", Uri.EscapeDataString(Transport.StringValue(domainId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<DomainResponse>(request, cancellationToken);
    }

    public async Task DeleteDomainAsync(
        string projectId,
        string domainId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/domains/${domainId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${domainId}", Uri.EscapeDataString(Transport.StringValue(domainId)));
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

    public async Task<DomainResponse> VerifyBimiAsync(
        string projectId,
        string domainId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/domains/${domainId}/bimi/verify";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${domainId}", Uri.EscapeDataString(Transport.StringValue(domainId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<DomainResponse>(request, cancellationToken);
    }

    public async Task<DomainResponse> UpdateBimiAsync(
        string projectId,
        string domainId,
        UpdateBimiRequest body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/domains/${domainId}/bimi";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${domainId}", Uri.EscapeDataString(Transport.StringValue(domainId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("PATCH"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
            Body = body,
            ContentType = "application/json",
        };
        return await _transport.ExecuteAsync<DomainResponse>(request, cancellationToken);
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
