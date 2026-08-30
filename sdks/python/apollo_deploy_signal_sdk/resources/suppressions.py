"""SuppressionsAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import AddSuppressionBody, SuppressionImportBody, SuppressionImportResponse, SuppressionPageResponse, SuppressionResponse
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class SuppressionsAPI:
    "SuppressionsAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def list_suppressions(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> SuppressionPageResponse:
        "listSuppressions operation"
        path = "/v1/projects/${projectId}/suppressions"
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
        return TypeAdapter(SuppressionPageResponse).validate_python(response.json())

    def export_suppressions(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "exportSuppressions operation"
        path = "/v1/projects/${projectId}/suppressions/export"
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
        return None

    def add_suppression(
        self,
        project_id: str,
        body: AddSuppressionBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> SuppressionResponse:
        "addSuppression operation"
        path = "/v1/projects/${projectId}/suppressions"
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
        return TypeAdapter(SuppressionResponse).validate_python(response.json())

    def remove_suppression(
        self,
        project_id: str,
        email: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "removeSuppression operation"
        path = "/v1/projects/${projectId}/suppressions/${email}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${email}", quote(SDKTransport.wire_value(email), safe=""))
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

    def import_suppressions(
        self,
        project_id: str,
        body: SuppressionImportBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> SuppressionImportResponse:
        "importSuppressions operation"
        path = "/v1/projects/${projectId}/suppressions/import"
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
        return TypeAdapter(SuppressionImportResponse).validate_python(response.json())

