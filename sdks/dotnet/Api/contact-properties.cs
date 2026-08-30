namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>ContactPropertiesAPI API operations.</summary>
public class ContactPropertiesAPI
{
    private readonly Transport _transport;

    public ContactPropertiesAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<ContactPropertyPageResponse> ListContactPropertiesAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contact-properties";
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
        return await _transport.ExecuteAsync<ContactPropertyPageResponse>(request, cancellationToken);
    }

    public async Task<ContactPropertyResponse> GetContactPropertyAsync(
        string projectId,
        string propertyId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contact-properties/${propertyId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${propertyId}", Uri.EscapeDataString(Transport.StringValue(propertyId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<ContactPropertyResponse>(request, cancellationToken);
    }

    public async Task<ContactPropertyResponse> CreateContactPropertyAsync(
        string projectId,
        CreateContactPropertyBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contact-properties";
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
        return await _transport.ExecuteAsync<ContactPropertyResponse>(request, cancellationToken);
    }

    public async Task<ContactPropertyResponse> UpdateContactPropertyAsync(
        string projectId,
        string propertyId,
        UpdateContactPropertyBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contact-properties/${propertyId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${propertyId}", Uri.EscapeDataString(Transport.StringValue(propertyId)));
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
        return await _transport.ExecuteAsync<ContactPropertyResponse>(request, cancellationToken);
    }

    public async Task DeleteContactPropertyAsync(
        string projectId,
        string propertyId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contact-properties/${propertyId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${propertyId}", Uri.EscapeDataString(Transport.StringValue(propertyId)));
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
