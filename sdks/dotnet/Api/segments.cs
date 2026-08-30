namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>SegmentsAPI API operations.</summary>
public class SegmentsAPI
{
    private readonly Transport _transport;

    public SegmentsAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<SegmentPageResponse> ListSegmentsAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/segments";
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
        return await _transport.ExecuteAsync<SegmentPageResponse>(request, cancellationToken);
    }

    public async Task<SegmentResponse> GetSegmentAsync(
        string projectId,
        string segmentId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/segments/${segmentId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${segmentId}", Uri.EscapeDataString(Transport.StringValue(segmentId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<SegmentResponse>(request, cancellationToken);
    }

    public async Task<CursorPage> ListContactsInSegmentAsync(
        string projectId,
        string segmentId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/segments/${segmentId}/contacts";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${segmentId}", Uri.EscapeDataString(Transport.StringValue(segmentId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<CursorPage>(request, cancellationToken);
    }

    public async Task<SegmentResponse> CreateSegmentAsync(
        string projectId,
        CreateSegmentBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/segments";
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
        return await _transport.ExecuteAsync<SegmentResponse>(request, cancellationToken);
    }

    public async Task DeleteSegmentAsync(
        string projectId,
        string segmentId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/segments/${segmentId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
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
