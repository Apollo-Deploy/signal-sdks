package v4

import (
	"context"
	"fmt"
	"net/url"
)

// MetricsAPI provides access to metrics API operations.
type MetricsAPI struct {
	transport *Transport
}

func (api *MetricsAPI) GetTopicPerformance(
	ctx context.Context,
	id string,
	window *string,
	projectId *string,
) (*TopicPerformanceResponse, error) {
	reqPath := buildPath("/v1/metrics/topics/${id}", "id", id)
	query := url.Values{}
	if window != nil { query.Set("window", fmt.Sprint(*window)) }
	if projectId != nil { query.Set("projectId", fmt.Sprint(*projectId)) }
	req := request{
		Method: "GET", Path: reqPath,
		Query: query,



	}
	var result TopicPerformanceResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *MetricsAPI) GetEmailPerformance(
	ctx context.Context,
	id string,
) (*EmailPerformanceResponse, error) {
	reqPath := buildPath("/v1/metrics/emails/${id}", "id", id)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result EmailPerformanceResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *MetricsAPI) GetEmailEngagement(
	ctx context.Context,
	id string,
) (*EmailReadScrollAnalyticsResponse, error) {
	reqPath := buildPath("/v1/metrics/emails/${id}/engagement", "id", id)
	req := request{
		Method: "GET", Path: reqPath,




	}
	var result EmailReadScrollAnalyticsResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *MetricsAPI) GetProjectMetricsSummary(
	ctx context.Context,
	window *string,
	projectId *string,
) (*ProjectMetricsSummaryResponse, error) {
	reqPath := buildPath("/v1/metrics/summary")
	query := url.Values{}
	if window != nil { query.Set("window", fmt.Sprint(*window)) }
	if projectId != nil { query.Set("projectId", fmt.Sprint(*projectId)) }
	req := request{
		Method: "GET", Path: reqPath,
		Query: query,



	}
	var result ProjectMetricsSummaryResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *MetricsAPI) GetProjectMetricsTimeline(
	ctx context.Context,
	window *string,
	granularity *string,
	format *string,
	projectId *string,
) (*ProjectMetricsTimelineResponse, error) {
	reqPath := buildPath("/v1/metrics/timeline")
	query := url.Values{}
	if window != nil { query.Set("window", fmt.Sprint(*window)) }
	if granularity != nil { query.Set("granularity", fmt.Sprint(*granularity)) }
	if format != nil { query.Set("format", fmt.Sprint(*format)) }
	if projectId != nil { query.Set("projectId", fmt.Sprint(*projectId)) }
	req := request{
		Method: "GET", Path: reqPath,
		Query: query,



	}
	var result ProjectMetricsTimelineResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
func (api *MetricsAPI) GetMetricsAdvisor(
	ctx context.Context,
	projectId *string,
) (*AdvisorReportResponse, error) {
	reqPath := buildPath("/v1/metrics/advisor")
	query := url.Values{}
	if projectId != nil { query.Set("projectId", fmt.Sprint(*projectId)) }
	req := request{
		Method: "GET", Path: reqPath,
		Query: query,



	}
	var result AdvisorReportResponse
	if err := api.transport.Execute(ctx, req, &result); err != nil { return nil, err }
	return &result, nil
}
