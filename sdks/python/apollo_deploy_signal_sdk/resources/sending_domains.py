"""SendingDomainsAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import DomainListPageResponse, DomainResponse, RegisterDomainRequest, UpdateBimiRequest
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class SendingDomainsAPI:
    "SendingDomainsAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def list_domains(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> DomainListPageResponse:
        "listDomains operation"
        path = "/v1/projects/${projectId}/domains"
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
        return TypeAdapter(DomainListPageResponse).validate_python(response.json())

    def get_domain(
        self,
        project_id: str,
        domain_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> DomainResponse:
        "getDomain operation"
        path = "/v1/projects/${projectId}/domains/${domainId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${domainId}", quote(SDKTransport.wire_value(domain_id), safe=""))
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
        return TypeAdapter(DomainResponse).validate_python(response.json())

    def register_domain(
        self,
        project_id: str,
        body: RegisterDomainRequest,
        *,
        options: Optional[RequestOptions] = None,
    ) -> DomainResponse:
        "registerDomain operation"
        path = "/v1/projects/${projectId}/domains"
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
        return TypeAdapter(DomainResponse).validate_python(response.json())

    def verify_domain(
        self,
        project_id: str,
        domain_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> DomainResponse:
        "verifyDomain operation"
        path = "/v1/projects/${projectId}/domains/${domainId}/verify"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${domainId}", quote(SDKTransport.wire_value(domain_id), safe=""))
        query: Dict[str, Any] = {}
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="POST",
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
        return TypeAdapter(DomainResponse).validate_python(response.json())

    def delete_domain(
        self,
        project_id: str,
        domain_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "deleteDomain operation"
        path = "/v1/projects/${projectId}/domains/${domainId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${domainId}", quote(SDKTransport.wire_value(domain_id), safe=""))
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

    def verify_bimi(
        self,
        project_id: str,
        domain_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> DomainResponse:
        "verifyBimi operation"
        path = "/v1/projects/${projectId}/domains/${domainId}/bimi/verify"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${domainId}", quote(SDKTransport.wire_value(domain_id), safe=""))
        query: Dict[str, Any] = {}
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="POST",
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
        return TypeAdapter(DomainResponse).validate_python(response.json())

    def update_bimi(
        self,
        project_id: str,
        domain_id: str,
        body: UpdateBimiRequest,
        *,
        options: Optional[RequestOptions] = None,
    ) -> DomainResponse:
        "updateBimi operation"
        path = "/v1/projects/${projectId}/domains/${domainId}/bimi"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${domainId}", quote(SDKTransport.wire_value(domain_id), safe=""))
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
        return TypeAdapter(DomainResponse).validate_python(response.json())

