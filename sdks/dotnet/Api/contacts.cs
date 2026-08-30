namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>ContactsAPI API operations.</summary>
public class ContactsAPI
{
    private readonly Transport _transport;

    public ContactsAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<ContactPageResponse> ListContactsAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts";
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
        return await _transport.ExecuteAsync<ContactPageResponse>(request, cancellationToken);
    }

    public async Task<ContactResponse> GetContactAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<ContactResponse>(request, cancellationToken);
    }

    public async Task<List<string>> ListContactSegmentsAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/segments";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<List<string>>(request, cancellationToken);
    }

    public async Task<List<TopicSubscriptionResponse>> GetContactTopicsAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/topics";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<List<TopicSubscriptionResponse>>(request, cancellationToken);
    }

    public async Task<ContactResponse> CreateContactAsync(
        string projectId,
        CreateContactBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts";
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
        return await _transport.ExecuteAsync<ContactResponse>(request, cancellationToken);
    }

    public async Task<ContactResponse> UpdateContactAsync(
        string projectId,
        string contactId,
        UpdateContactBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
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
        return await _transport.ExecuteAsync<ContactResponse>(request, cancellationToken);
    }

    public async Task DeleteContactAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
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

    public async Task<ContactResponse> UploadContactImageAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/image";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<ContactResponse>(request, cancellationToken);
    }

    public async Task<ContactResponse> SetContactImageUrlAsync(
        string projectId,
        string contactId,
        SetImageUrlBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/image";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("PUT"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
            Body = body,
            ContentType = "application/json",
        };
        return await _transport.ExecuteAsync<ContactResponse>(request, cancellationToken);
    }

    public async Task DeleteContactImageAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/image";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
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

    public async Task AddContactToSegmentAsync(
        string projectId,
        string contactId,
        AddToSegmentBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/segments";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
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
        await _transport.ExecuteRawAsync(request, cancellationToken);
    }

    public async Task RemoveContactFromSegmentAsync(
        string projectId,
        string contactId,
        string segmentId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        path = path.Replace("${segmentId}", Uri.EscapeDataString(Transport.StringValue(segmentId)));
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

    public async Task UpdateContactTopicsAsync(
        string projectId,
        string contactId,
        UpdateTopicsBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/topics";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
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
        await _transport.ExecuteRawAsync(request, cancellationToken);
    }

    public async Task<List<ActivityResponse>> GetContactActivityAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/activity";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<List<ActivityResponse>>(request, cancellationToken);
    }

    public async Task<EngagementScoreResponse> GetContactEngagementScoreAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/engagement";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<EngagementScoreResponse>(request, cancellationToken);
    }

    public async Task<EmailValidationStatusResponse> GetContactEmailValidationStatusAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<EmailValidationStatusResponse>(request, cancellationToken);
    }

    public async Task<EngagementScoreResponse> RefreshContactEngagementScoreAsync(
        string projectId,
        string contactId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/engagement/refresh";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<EngagementScoreResponse>(request, cancellationToken);
    }

    public async Task RecordContactEmailValidationAsync(
        string projectId,
        string contactId,
        RecordValidationBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${contactId}", Uri.EscapeDataString(Transport.StringValue(contactId)));
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
