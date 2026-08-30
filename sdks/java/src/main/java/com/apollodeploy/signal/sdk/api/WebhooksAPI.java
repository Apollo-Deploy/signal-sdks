package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** WebhooksAPI API operations. */
public final class WebhooksAPI {
    private final Transport transport;

    public WebhooksAPI(Transport transport) {
        this.transport = transport;
    }

    public WebhookPageResponse listWebhooks(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/webhooks";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<WebhookPageResponse>() {
        });
    }

    public WebhookResponse getWebhook(
        String projectId,
        String endpointId
    ) {
        String path = "/v1/projects/${projectId}/webhooks/${endpointId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${endpointId}", Transport.encodePathSegment(String.valueOf(endpointId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<WebhookResponse>() {
        });
    }

    public WebhookDeliveryPageResponse listWebhookDeliveries(
        String projectId,
        String endpointId
    ) {
        String path = "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${endpointId}", Transport.encodePathSegment(String.valueOf(endpointId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<WebhookDeliveryPageResponse>() {
        });
    }

    public WebhookDeliveryResponse getWebhookDelivery(
        String projectId,
        String endpointId,
        String deliveryId
    ) {
        String path = "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries/${deliveryId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${endpointId}", Transport.encodePathSegment(String.valueOf(endpointId)));
        path = path.replace("${deliveryId}", Transport.encodePathSegment(String.valueOf(deliveryId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<WebhookDeliveryResponse>() {
        });
    }

    public WebhookCreateResponse createWebhook(
        String projectId,
        CreateWebhookBody body
    ) {
        String path = "/v1/projects/${projectId}/webhooks";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<WebhookCreateResponse>() {
        });
    }

    public WebhookResponse updateWebhook(
        String projectId,
        String endpointId,
        UpdateWebhookBody body
    ) {
        String path = "/v1/projects/${projectId}/webhooks/${endpointId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${endpointId}", Transport.encodePathSegment(String.valueOf(endpointId)));

        Transport.Request request = new Transport.Request("PATCH", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<WebhookResponse>() {
        });
    }

    public void deleteWebhook(
        String projectId,
        String endpointId
    ) {
        String path = "/v1/projects/${projectId}/webhooks/${endpointId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${endpointId}", Transport.encodePathSegment(String.valueOf(endpointId)));

        Transport.Request request = new Transport.Request("DELETE", path);
        transport.executeVoid(request);
    }

    public WebhookDeliveryResponse testWebhook(
        String projectId,
        String endpointId
    ) {
        String path = "/v1/projects/${projectId}/webhooks/${endpointId}/test";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${endpointId}", Transport.encodePathSegment(String.valueOf(endpointId)));

        Transport.Request request = new Transport.Request("POST", path);
        return transport.execute(request, new TypeReference<WebhookDeliveryResponse>() {
        });
    }

    public void replayWebhookDelivery(
        String projectId,
        String endpointId,
        String deliveryId
    ) {
        String path = "/v1/projects/${projectId}/webhooks/${endpointId}/replay/${deliveryId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${endpointId}", Transport.encodePathSegment(String.valueOf(endpointId)));
        path = path.replace("${deliveryId}", Transport.encodePathSegment(String.valueOf(deliveryId)));

        Transport.Request request = new Transport.Request("POST", path);
        transport.executeVoid(request);
    }

}
