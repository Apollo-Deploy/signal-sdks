package v4

import (
	"context"
)

// TopicsAPI provides access to topics API operations.
type TopicsAPI struct {
	transport *Transport
}

func (api *TopicsAPI) ListTopics(
	ctx context.Context,
	projectId string,
) (*TopicPageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/topics", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result TopicPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *TopicsAPI) GetTopic(
	ctx context.Context,
	projectId string,
	topicId string,
) (*TopicResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/topics/${topicId}", "projectId", projectId, "topicId", topicId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result TopicResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *TopicsAPI) ListContactsInTopic(
	ctx context.Context,
	projectId string,
	topicId string,
) (*CursorPage, error) {
	reqPath := buildPath("/v1/projects/${projectId}/topics/${topicId}/contacts", "projectId", projectId, "topicId", topicId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result CursorPage
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *TopicsAPI) CreateTopic(
	ctx context.Context,
	projectId string,
	body CreateTopicBody,
) (*TopicResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/topics", "projectId", projectId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result TopicResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *TopicsAPI) UpdateTopic(
	ctx context.Context,
	projectId string,
	topicId string,
	body UpdateTopicBody,
) (*TopicResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/topics/${topicId}", "projectId", projectId, "topicId", topicId)
	req := request{
		Method: "PATCH", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result TopicResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *TopicsAPI) DeleteTopic(
	ctx context.Context,
	projectId string,
	topicId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/topics/${topicId}", "projectId", projectId, "topicId", topicId)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
