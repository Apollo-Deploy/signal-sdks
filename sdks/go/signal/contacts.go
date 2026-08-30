package v4

import (
	"context"
)

// ContactsAPI provides access to contacts API operations.
type ContactsAPI struct {
	transport *Transport
}

func (api *ContactsAPI) ListContacts(
	ctx context.Context,
	projectId string,
) (*ContactPageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ContactPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) GetContact(
	ctx context.Context,
	projectId string,
	contactId string,
) (*ContactResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ContactResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) ListContactSegments(
	ctx context.Context,
	projectId string,
	contactId string,
) (*ListContactSegmentsResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/segments", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ListContactSegmentsResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) GetContactTopics(
	ctx context.Context,
	projectId string,
	contactId string,
) (*GetContactTopicsResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/topics", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result GetContactTopicsResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) CreateContact(
	ctx context.Context,
	projectId string,
	body CreateContactBody,
) (*ContactResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts", "projectId", projectId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result ContactResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) UpdateContact(
	ctx context.Context,
	projectId string,
	contactId string,
	body UpdateContactBody,
) (*ContactResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "PATCH", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result ContactResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) DeleteContact(
	ctx context.Context,
	projectId string,
	contactId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
func (api *ContactsAPI) UploadContactImage(
	ctx context.Context,
	projectId string,
	contactId string,
) (*ContactResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/image", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "POST", Path: reqPath,




	}
	var result ContactResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) SetContactImageUrl(
	ctx context.Context,
	projectId string,
	contactId string,
	body SetImageUrlBody,
) (*ContactResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/image", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "PUT", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result ContactResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) DeleteContactImage(
	ctx context.Context,
	projectId string,
	contactId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/image", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
func (api *ContactsAPI) AddContactToSegment(
	ctx context.Context,
	projectId string,
	contactId string,
	body AddToSegmentBody,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/segments", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	return api.transport.Execute(ctx, req, nil)
}
func (api *ContactsAPI) RemoveContactFromSegment(
	ctx context.Context,
	projectId string,
	contactId string,
	segmentId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}", "projectId", projectId, "contactId", contactId, "segmentId", segmentId)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
func (api *ContactsAPI) UpdateContactTopics(
	ctx context.Context,
	projectId string,
	contactId string,
	body UpdateTopicsBody,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/topics", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "PATCH", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	return api.transport.Execute(ctx, req, nil)
}
func (api *ContactsAPI) GetContactActivity(
	ctx context.Context,
	projectId string,
	contactId string,
) (*GetContactActivityResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/activity", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result GetContactActivityResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) GetContactEngagementScore(
	ctx context.Context,
	projectId string,
	contactId string,
) (*EngagementScoreResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/engagement", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result EngagementScoreResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) GetContactEmailValidationStatus(
	ctx context.Context,
	projectId string,
	contactId string,
) (*EmailValidationStatusResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/email-validation", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result EmailValidationStatusResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) RefreshContactEngagementScore(
	ctx context.Context,
	projectId string,
	contactId string,
) (*EngagementScoreResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/engagement/refresh", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "POST", Path: reqPath,




	}
	var result EngagementScoreResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ContactsAPI) RecordContactEmailValidation(
	ctx context.Context,
	projectId string,
	contactId string,
	body RecordValidationBody,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/contacts/${contactId}/email-validation", "projectId", projectId, "contactId", contactId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	return api.transport.Execute(ctx, req, nil)
}
