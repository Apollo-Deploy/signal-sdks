namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>MetricsAPI API operations.</summary>
public class MetricsAPI
{
    private readonly Transport _transport;

    public MetricsAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<TopicPerformanceResponse> GetTopicPerformanceAsync(
        string id,
        IReadOnlyDictionary<string, object?>? query = null,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/metrics/topics/${id}";
        path = path.Replace("${id}", Uri.EscapeDataString(Transport.StringValue(id)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(query),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<TopicPerformanceResponse>(request, cancellationToken);
    }

    public async Task<EmailPerformanceResponse> GetEmailPerformanceAsync(
        string id,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/metrics/emails/${id}";
        path = path.Replace("${id}", Uri.EscapeDataString(Transport.StringValue(id)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<EmailPerformanceResponse>(request, cancellationToken);
    }

    public async Task<EmailReadScrollAnalyticsResponse> GetEmailEngagementAsync(
        string id,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/metrics/emails/${id}/engagement";
        path = path.Replace("${id}", Uri.EscapeDataString(Transport.StringValue(id)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<EmailReadScrollAnalyticsResponse>(request, cancellationToken);
    }

    public async Task<ProjectMetricsSummaryResponse> GetProjectMetricsSummaryAsync(
        IReadOnlyDictionary<string, object?>? query = null,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/metrics/summary";
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(query),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<ProjectMetricsSummaryResponse>(request, cancellationToken);
    }

    public async Task<ProjectMetricsTimelineResponse> GetProjectMetricsTimelineAsync(
        IReadOnlyDictionary<string, object?>? query = null,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/metrics/timeline";
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(query),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<ProjectMetricsTimelineResponse>(request, cancellationToken);
    }

    public async Task<AdvisorReportResponse> GetMetricsAdvisorAsync(
        IReadOnlyDictionary<string, object?>? query = null,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/metrics/advisor";
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(query),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<AdvisorReportResponse>(request, cancellationToken);
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
