package v4

import (
	"context"
)

// SendingDomainsAPI provides access to sendingDomains API operations.
type SendingDomainsAPI struct {
	transport *Transport
}

func (api *SendingDomainsAPI) ListDomains(
	ctx context.Context,
	projectId string,
) (*DomainListPageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/domains", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result DomainListPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SendingDomainsAPI) GetDomain(
	ctx context.Context,
	projectId string,
	domainId string,
) (*DomainResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/domains/${domainId}", "projectId", projectId, "domainId", domainId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result DomainResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SendingDomainsAPI) RegisterDomain(
	ctx context.Context,
	projectId string,
	body RegisterDomainRequest,
) (*DomainResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/domains", "projectId", projectId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result DomainResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SendingDomainsAPI) VerifyDomain(
	ctx context.Context,
	projectId string,
	domainId string,
) (*DomainResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/domains/${domainId}/verify", "projectId", projectId, "domainId", domainId)
	req := request{
		Method: "POST", Path: reqPath,




	}
	var result DomainResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SendingDomainsAPI) DeleteDomain(
	ctx context.Context,
	projectId string,
	domainId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/domains/${domainId}", "projectId", projectId, "domainId", domainId)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
func (api *SendingDomainsAPI) VerifyBimi(
	ctx context.Context,
	projectId string,
	domainId string,
) (*DomainResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/domains/${domainId}/bimi/verify", "projectId", projectId, "domainId", domainId)
	req := request{
		Method: "POST", Path: reqPath,




	}
	var result DomainResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SendingDomainsAPI) UpdateBimi(
	ctx context.Context,
	projectId string,
	domainId string,
	body UpdateBimiRequest,
) (*DomainResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/domains/${domainId}/bimi", "projectId", projectId, "domainId", domainId)
	req := request{
		Method: "PATCH", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result DomainResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
