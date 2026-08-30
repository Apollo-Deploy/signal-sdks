package signal

import (
	"context"
)

// SuppressionsAPI provides access to suppressions API operations.
type SuppressionsAPI struct {
	transport *Transport
}

func (api *SuppressionsAPI) ListSuppressions(
	ctx context.Context,
	projectId string,
) (*SuppressionPageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/suppressions", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result SuppressionPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SuppressionsAPI) ExportSuppressions(
	ctx context.Context,
	projectId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/suppressions/export", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
func (api *SuppressionsAPI) AddSuppression(
	ctx context.Context,
	projectId string,
	body AddSuppressionBody,
) (*SuppressionResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/suppressions", "projectId", projectId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result SuppressionResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SuppressionsAPI) RemoveSuppression(
	ctx context.Context,
	projectId string,
	email string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/suppressions/${email}", "projectId", projectId, "email", email)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
func (api *SuppressionsAPI) ImportSuppressions(
	ctx context.Context,
	projectId string,
	body SuppressionImportBody,
) (*SuppressionImportResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/suppressions/import", "projectId", projectId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result SuppressionImportResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
