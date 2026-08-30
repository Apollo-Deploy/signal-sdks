"""SegmentsAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import CreateSegmentBody, CursorPage, SegmentPageResponse, SegmentResponse
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class SegmentsAPI:
    "SegmentsAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def list_segments(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> SegmentPageResponse:
        "listSegments operation"
        path = "/v1/projects/${projectId}/segments"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
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
        return TypeAdapter(SegmentPageResponse).validate_python(response.json())

    def get_segment(
        self,
        project_id: str,
        segment_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> SegmentResponse:
        "getSegment operation"
        path = "/v1/projects/${projectId}/segments/${segmentId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${segmentId}", quote(SDKTransport.wire_value(segment_id), safe=""))
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
        return TypeAdapter(SegmentResponse).validate_python(response.json())

    def list_contacts_in_segment(
        self,
        project_id: str,
        segment_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> CursorPage:
        "listContactsInSegment operation"
        path = "/v1/projects/${projectId}/segments/${segmentId}/contacts"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${segmentId}", quote(SDKTransport.wire_value(segment_id), safe=""))
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
        return TypeAdapter(CursorPage).validate_python(response.json())

    def create_segment(
        self,
        project_id: str,
        body: CreateSegmentBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> SegmentResponse:
        "createSegment operation"
        path = "/v1/projects/${projectId}/segments"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        query: Dict[str, Any] = {}
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="POST",
            path=path,
            query=query or None,
            body=body,
            content_type="application/json",
            options=request_options,
        )
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(SegmentResponse).validate_python(response.json())

    def delete_segment(
        self,
        project_id: str,
        segment_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "deleteSegment operation"
        path = "/v1/projects/${projectId}/segments/${segmentId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${segmentId}", quote(SDKTransport.wire_value(segment_id), safe=""))
        query: Dict[str, Any] = {}
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="DELETE",
            path=path,
            query=query or None,
            options=request_options,
        )
        return None

