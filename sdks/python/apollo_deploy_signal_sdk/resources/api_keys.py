"""ApiKeysAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import ApiKey, ApiKeyUsageResponse, ListApiKeysResponse
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class ApiKeysAPI:
    "ApiKeysAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def list_api_keys(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ListApiKeysResponse:
        "listApiKeys operation"
        path = "/v1/projects/${projectId}/api-keys"
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
        return TypeAdapter(ListApiKeysResponse).validate_python(response.json())

    def get_api_key(
        self,
        project_id: str,
        key_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ApiKey:
        "getApiKey operation"
        path = "/v1/projects/${projectId}/api-keys/${keyId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${keyId}", quote(SDKTransport.wire_value(key_id), safe=""))
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
        return TypeAdapter(ApiKey).validate_python(response.json())

    def get_api_key_usage(
        self,
        project_id: str,
        key_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ApiKeyUsageResponse:
        "getApiKeyUsage operation"
        path = "/v1/projects/${projectId}/api-keys/${keyId}/usage"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${keyId}", quote(SDKTransport.wire_value(key_id), safe=""))
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
        return TypeAdapter(ApiKeyUsageResponse).validate_python(response.json())

    def export_api_key_usage(
        self,
        project_id: str,
        key_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "exportApiKeyUsage operation"
        path = "/v1/projects/${projectId}/api-keys/${keyId}/usage/export"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${keyId}", quote(SDKTransport.wire_value(key_id), safe=""))
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

