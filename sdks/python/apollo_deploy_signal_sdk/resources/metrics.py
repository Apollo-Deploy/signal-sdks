"""MetricsAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import AdvisorReportResponse, EmailPerformanceResponse, EmailReadScrollAnalyticsResponse, GetMetricsAdvisorQuery, GetProjectMetricsSummaryQuery, GetProjectMetricsTimelineQuery, GetTopicPerformanceQuery, ProjectMetricsSummaryResponse, ProjectMetricsTimelineResponse, TopicPerformanceResponse
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class MetricsAPI:
    "MetricsAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def get_topic_performance(
        self,
        id: str,
        *,
        window: Optional[str] = None,
        project_id: Optional[str] = None,
        options: Optional[RequestOptions] = None,
    ) -> TopicPerformanceResponse:
        "getTopicPerformance operation"
        path = "/v1/metrics/topics/${id}"
        path = path.replace("${id}", quote(SDKTransport.wire_value(id), safe=""))
        query: Dict[str, Any] = {}
        if window is not None:
            query["window"] = SDKTransport.wire_query_value(window)
        if project_id is not None:
            query["projectId"] = SDKTransport.wire_query_value(project_id)
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="GET",
            path=path,
            query=query or None,
            options=request_options,
        )
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(TopicPerformanceResponse).validate_python(response.json())

    def get_email_performance(
        self,
        id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> EmailPerformanceResponse:
        "getEmailPerformance operation"
        path = "/v1/metrics/emails/${id}"
        path = path.replace("${id}", quote(SDKTransport.wire_value(id), safe=""))
        query: Dict[str, Any] = {}
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="GET",
            path=path,
            query=query or None,
            options=request_options,
        )
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(EmailPerformanceResponse).validate_python(response.json())

    def get_email_engagement(
        self,
        id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> EmailReadScrollAnalyticsResponse:
        "getEmailEngagement operation"
        path = "/v1/metrics/emails/${id}/engagement"
        path = path.replace("${id}", quote(SDKTransport.wire_value(id), safe=""))
        query: Dict[str, Any] = {}
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="GET",
            path=path,
            query=query or None,
            options=request_options,
        )
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(EmailReadScrollAnalyticsResponse).validate_python(response.json())

    def get_project_metrics_summary(
        self,
        *,
        window: Optional[str] = None,
        project_id: Optional[str] = None,
        options: Optional[RequestOptions] = None,
    ) -> ProjectMetricsSummaryResponse:
        "getProjectMetricsSummary operation"
        path = "/v1/metrics/summary"
        query: Dict[str, Any] = {}
        if window is not None:
            query["window"] = SDKTransport.wire_query_value(window)
        if project_id is not None:
            query["projectId"] = SDKTransport.wire_query_value(project_id)
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="GET",
            path=path,
            query=query or None,
            options=request_options,
        )
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(ProjectMetricsSummaryResponse).validate_python(response.json())

    def get_project_metrics_timeline(
        self,
        *,
        window: Optional[str] = None,
        granularity: Optional[str] = None,
        format: Optional[str] = None,
        project_id: Optional[str] = None,
        options: Optional[RequestOptions] = None,
    ) -> ProjectMetricsTimelineResponse:
        "getProjectMetricsTimeline operation"
        path = "/v1/metrics/timeline"
        query: Dict[str, Any] = {}
        if window is not None:
            query["window"] = SDKTransport.wire_query_value(window)
        if granularity is not None:
            query["granularity"] = SDKTransport.wire_query_value(granularity)
        if format is not None:
            query["format"] = SDKTransport.wire_query_value(format)
        if project_id is not None:
            query["projectId"] = SDKTransport.wire_query_value(project_id)
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="GET",
            path=path,
            query=query or None,
            options=request_options,
        )
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(ProjectMetricsTimelineResponse).validate_python(response.json())

    def get_metrics_advisor(
        self,
        *,
        project_id: Optional[str] = None,
        options: Optional[RequestOptions] = None,
    ) -> AdvisorReportResponse:
        "getMetricsAdvisor operation"
        path = "/v1/metrics/advisor"
        query: Dict[str, Any] = {}
        if project_id is not None:
            query["projectId"] = SDKTransport.wire_query_value(project_id)
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="GET",
            path=path,
            query=query or None,
            options=request_options,
        )
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(AdvisorReportResponse).validate_python(response.json())

