namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>ProjectsAPI API operations.</summary>
public class ProjectsAPI
{
    private readonly Transport _transport;

    public ProjectsAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<ProjectPageResponse> ListProjectsAsync(
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects";
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<ProjectPageResponse>(request, cancellationToken);
    }

    public async Task<ProjectResponse> GetProjectAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}";
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
        return await _transport.ExecuteAsync<ProjectResponse>(request, cancellationToken);
    }

    public async Task<ProjectResponse> UpdateProjectAsync(
        string projectId,
        UpdateProjectRequest body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
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
        return await _transport.ExecuteAsync<ProjectResponse>(request, cancellationToken);
    }

    public async Task<EmailPageResponse> ListEmailsAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/emails";
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
        return await _transport.ExecuteAsync<EmailPageResponse>(request, cancellationToken);
    }

    public async Task<EmailDetailResponse> GetProjectEmailAsync(
        string projectId,
        string emailId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/emails/${emailId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
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

    public async Task<EmailTimelineResponse> GetEmailTimelineAsync(
        string projectId,
        string emailId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/emails/${emailId}/events";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
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
        return await _transport.ExecuteAsync<EmailTimelineResponse>(request, cancellationToken);
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
