package v4

import (
	"context"
)

// ContactPropertiesAPI provides access to contactProperties API operations.
type ContactPropertiesAPI struct {
	transport *Transport
}

func (api *ContactPropertiesAPI) ListContactProperties(
	ctx context.Context,
	projectId string,
) (*ContactPropertyPageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contact-properties", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ContactPropertyPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactPropertiesAPI) GetContactProperty(
	ctx context.Context,
	projectId string,
	propertyId string,
) (*ContactPropertyResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contact-properties/${propertyId}", "projectId", projectId, "propertyId", propertyId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ContactPropertyResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactPropertiesAPI) CreateContactProperty(
	ctx context.Context,
	projectId string,
	body CreateContactPropertyBody,
) (*ContactPropertyResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contact-properties", "projectId", projectId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result ContactPropertyResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactPropertiesAPI) UpdateContactProperty(
	ctx context.Context,
	projectId string,
	propertyId string,
	body UpdateContactPropertyBody,
) (*ContactPropertyResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contact-properties/${propertyId}", "projectId", projectId, "propertyId", propertyId)
	req := request{
		Method: "PATCH", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result ContactPropertyResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactPropertiesAPI) DeleteContactProperty(
	ctx context.Context,
	projectId string,
	propertyId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/contact-properties/${propertyId}", "projectId", projectId, "propertyId", propertyId)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
