"""ProjectsAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import EmailDetailResponse, EmailPageResponse, EmailTimelineResponse, ProjectPageResponse, ProjectResponse, UpdateProjectRequest
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class ProjectsAPI:
    "ProjectsAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def list_projects(
        self,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ProjectPageResponse:
        "listProjects operation"
        path = "/v1/projects"
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
        return TypeAdapter(ProjectPageResponse).validate_python(response.json())

    def get_project(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ProjectResponse:
        "getProject operation"
        path = "/v1/projects/${projectId}"
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
        return TypeAdapter(ProjectResponse).validate_python(response.json())

    def update_project(
        self,
        project_id: str,
        body: UpdateProjectRequest,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ProjectResponse:
        "updateProject operation"
        path = "/v1/projects/${projectId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        query: Dict[str, Any] = {}
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="PATCH",
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
        return TypeAdapter(ProjectResponse).validate_python(response.json())

    def list_emails(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> EmailPageResponse:
        "listEmails operation"
        path = "/v1/projects/${projectId}/emails"
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
        return TypeAdapter(EmailPageResponse).validate_python(response.json())

    def get_project_email(
        self,
        project_id: str,
        email_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> EmailDetailResponse:
        "getProjectEmail operation"
        path = "/v1/projects/${projectId}/emails/${emailId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${emailId}", quote(SDKTransport.wire_value(email_id), safe=""))
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
        return TypeAdapter(EmailDetailResponse).validate_python(response.json())

    def get_email_timeline(
        self,
        project_id: str,
        email_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> EmailTimelineResponse:
        "getEmailTimeline operation"
        path = "/v1/projects/${projectId}/emails/${emailId}/events"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${emailId}", quote(SDKTransport.wire_value(email_id), safe=""))
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
        return TypeAdapter(EmailTimelineResponse).validate_python(response.json())

