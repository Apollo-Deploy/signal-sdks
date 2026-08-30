package v4

import (
	"context"
)

// ApiKeysAPI provides access to apiKeys API operations.
type ApiKeysAPI struct {
	transport *Transport
}

func (api *ApiKeysAPI) ListApiKeys(
	ctx context.Context,
	projectId string,
) (*ListApiKeysResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/api-keys", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ListApiKeysResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ApiKeysAPI) GetApiKey(
	ctx context.Context,
	projectId string,
	keyId string,
) (*ApiKey, error) {
	reqPath := buildPath("/v1/projects/${projectId}/api-keys/${keyId}", "projectId", projectId, "keyId", keyId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ApiKey
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ApiKeysAPI) GetApiKeyUsage(
	ctx context.Context,
	projectId string,
	keyId string,
) (*ApiKeyUsageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/api-keys/${keyId}/usage", "projectId", projectId, "keyId", keyId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ApiKeyUsageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ApiKeysAPI) ExportApiKeyUsage(
	ctx context.Context,
	projectId string,
	keyId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/api-keys/${keyId}/usage/export", "projectId", projectId, "keyId", keyId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
