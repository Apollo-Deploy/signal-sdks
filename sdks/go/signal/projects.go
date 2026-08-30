package v4

import (
	"context"
)

// ProjectsAPI provides access to projects API operations.
type ProjectsAPI struct {
	transport *Transport
}

func (api *ProjectsAPI) ListProjects(
	ctx context.Context,
) (*ProjectPageResponse, error) {
	reqPath := buildPath("/v1/projects")
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ProjectPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ProjectsAPI) GetProject(
	ctx context.Context,
	projectId string,
) (*ProjectResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result ProjectResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ProjectsAPI) UpdateProject(
	ctx context.Context,
	projectId string,
	body UpdateProjectRequest,
) (*ProjectResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}", "projectId", projectId)
	req := request{
		Method: "PATCH", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result ProjectResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ProjectsAPI) ListEmails(
	ctx context.Context,
	projectId string,
) (*EmailPageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/emails", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result EmailPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ProjectsAPI) GetProjectEmail(
	ctx context.Context,
	projectId string,
	emailId string,
) (*EmailDetailResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/emails/${emailId}", "projectId", projectId, "emailId", emailId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result EmailDetailResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *ProjectsAPI) GetEmailTimeline(
	ctx context.Context,
	projectId string,
	emailId string,
) (*EmailTimelineResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/emails/${emailId}/events", "projectId", projectId, "emailId", emailId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result EmailTimelineResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
