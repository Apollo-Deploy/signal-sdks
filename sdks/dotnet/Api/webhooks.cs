namespace ApolloDeploySignal.Api;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

/// <summary>WebhooksAPI API operations.</summary>
public class WebhooksAPI
{
    private readonly Transport _transport;

    public WebhooksAPI(Transport transport)
    {
        _transport = transport;
    }

    public async Task<WebhookPageResponse> ListWebhooksAsync(
        string projectId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/webhooks";
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
        return await _transport.ExecuteAsync<WebhookPageResponse>(request, cancellationToken);
    }

    public async Task<WebhookResponse> GetWebhookAsync(
        string projectId,
        string endpointId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/webhooks/${endpointId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${endpointId}", Uri.EscapeDataString(Transport.StringValue(endpointId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<WebhookResponse>(request, cancellationToken);
    }

    public async Task<WebhookDeliveryPageResponse> ListWebhookDeliveriesAsync(
        string projectId,
        string endpointId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${endpointId}", Uri.EscapeDataString(Transport.StringValue(endpointId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<WebhookDeliveryPageResponse>(request, cancellationToken);
    }

    public async Task<WebhookDeliveryResponse> GetWebhookDeliveryAsync(
        string projectId,
        string endpointId,
        string deliveryId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries/${deliveryId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${endpointId}", Uri.EscapeDataString(Transport.StringValue(endpointId)));
        path = path.Replace("${deliveryId}", Uri.EscapeDataString(Transport.StringValue(deliveryId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("GET"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<WebhookDeliveryResponse>(request, cancellationToken);
    }

    public async Task<WebhookCreateResponse> CreateWebhookAsync(
        string projectId,
        CreateWebhookBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/webhooks";
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
        return await _transport.ExecuteAsync<WebhookCreateResponse>(request, cancellationToken);
    }

    public async Task<WebhookResponse> UpdateWebhookAsync(
        string projectId,
        string endpointId,
        UpdateWebhookBody body,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/webhooks/${endpointId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${endpointId}", Uri.EscapeDataString(Transport.StringValue(endpointId)));
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
        return await _transport.ExecuteAsync<WebhookResponse>(request, cancellationToken);
    }

    public async Task DeleteWebhookAsync(
        string projectId,
        string endpointId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/webhooks/${endpointId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${endpointId}", Uri.EscapeDataString(Transport.StringValue(endpointId)));
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

    public async Task<WebhookDeliveryResponse> TestWebhookAsync(
        string projectId,
        string endpointId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/webhooks/${endpointId}/test";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${endpointId}", Uri.EscapeDataString(Transport.StringValue(endpointId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
            Path = path,
            Query = BuildQuery(null),
            Headers = requestHeaders,
            TimeoutMs = null,
        };
        return await _transport.ExecuteAsync<WebhookDeliveryResponse>(request, cancellationToken);
    }

    public async Task ReplayWebhookDeliveryAsync(
        string projectId,
        string endpointId,
        string deliveryId,
        CancellationToken cancellationToken = default)
    {
        var path = "/v1/projects/${projectId}/webhooks/${endpointId}/replay/${deliveryId}";
        path = path.Replace("${projectId}", Uri.EscapeDataString(Transport.StringValue(projectId)));
        path = path.Replace("${endpointId}", Uri.EscapeDataString(Transport.StringValue(endpointId)));
        path = path.Replace("${deliveryId}", Uri.EscapeDataString(Transport.StringValue(deliveryId)));
        Dictionary<string, string>? requestHeaders = null;
        var request = new Transport.Request
        {
            Method = new HttpMethod("POST"),
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
