package signal

import (
	"context"
)

// WebhooksAPI provides access to webhooks API operations.
type WebhooksAPI struct {
	transport *Transport
}

func (api *WebhooksAPI) ListWebhooks(
	ctx context.Context,
	projectId string,
) (*WebhookPageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/webhooks", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result WebhookPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *WebhooksAPI) GetWebhook(
	ctx context.Context,
	projectId string,
	endpointId string,
) (*WebhookResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/webhooks/${endpointId}", "projectId", projectId, "endpointId", endpointId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result WebhookResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *WebhooksAPI) ListWebhookDeliveries(
	ctx context.Context,
	projectId string,
	endpointId string,
) (*WebhookDeliveryPageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/webhooks/${endpointId}/deliveries", "projectId", projectId, "endpointId", endpointId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result WebhookDeliveryPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *WebhooksAPI) GetWebhookDelivery(
	ctx context.Context,
	projectId string,
	endpointId string,
	deliveryId string,
) (*WebhookDeliveryResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/webhooks/${endpointId}/deliveries/${deliveryId}", "projectId", projectId, "endpointId", endpointId, "deliveryId", deliveryId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result WebhookDeliveryResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *WebhooksAPI) CreateWebhook(
	ctx context.Context,
	projectId string,
	body CreateWebhookBody,
) (*WebhookCreateResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/webhooks", "projectId", projectId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result WebhookCreateResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *WebhooksAPI) UpdateWebhook(
	ctx context.Context,
	projectId string,
	endpointId string,
	body UpdateWebhookBody,
) (*WebhookResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/webhooks/${endpointId}", "projectId", projectId, "endpointId", endpointId)
	req := request{
		Method: "PATCH", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result WebhookResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *WebhooksAPI) DeleteWebhook(
	ctx context.Context,
	projectId string,
	endpointId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/webhooks/${endpointId}", "projectId", projectId, "endpointId", endpointId)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
func (api *WebhooksAPI) TestWebhook(
	ctx context.Context,
	projectId string,
	endpointId string,
) (*WebhookDeliveryResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/webhooks/${endpointId}/test", "projectId", projectId, "endpointId", endpointId)
	req := request{
		Method: "POST", Path: reqPath,




	}
	var result WebhookDeliveryResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *WebhooksAPI) ReplayWebhookDelivery(
	ctx context.Context,
	projectId string,
	endpointId string,
	deliveryId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/webhooks/${endpointId}/replay/${deliveryId}", "projectId", projectId, "endpointId", endpointId, "deliveryId", deliveryId)
	req := request{
		Method: "POST", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
