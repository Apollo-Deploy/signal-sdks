package signal

import (
	"context"
)

// SegmentsAPI provides access to segments API operations.
type SegmentsAPI struct {
	transport *Transport
}

func (api *SegmentsAPI) ListSegments(
	ctx context.Context,
	projectId string,
) (*SegmentPageResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/segments", "projectId", projectId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result SegmentPageResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SegmentsAPI) GetSegment(
	ctx context.Context,
	projectId string,
	segmentId string,
) (*SegmentResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/segments/${segmentId}", "projectId", projectId, "segmentId", segmentId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result SegmentResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SegmentsAPI) ListContactsInSegment(
	ctx context.Context,
	projectId string,
	segmentId string,
) (*CursorPage, error) {
	reqPath := buildPath("/v1/projects/${projectId}/segments/${segmentId}/contacts", "projectId", projectId, "segmentId", segmentId)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result CursorPage
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SegmentsAPI) CreateSegment(
	ctx context.Context,
	projectId string,
	body CreateSegmentBody,
) (*SegmentResponse, error) {
	reqPath := buildPath("/v1/projects/${projectId}/segments", "projectId", projectId)
	req := request{
		Method: "POST", Path: reqPath,

		Body: body, ContentType: "application/json",


	}
	var result SegmentResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *SegmentsAPI) DeleteSegment(
	ctx context.Context,
	projectId string,
	segmentId string,
) error {
	reqPath := buildPath("/v1/projects/${projectId}/segments/${segmentId}", "projectId", projectId, "segmentId", segmentId)
	req := request{
		Method: "DELETE", Path: reqPath,




	}
	return api.transport.Execute(ctx, req, nil)
}
