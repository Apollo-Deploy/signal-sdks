"""WebhooksAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import CreateWebhookBody, UpdateWebhookBody, WebhookCreateResponse, WebhookDeliveryPageResponse, WebhookDeliveryResponse, WebhookPageResponse, WebhookResponse
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class WebhooksAPI:
    "WebhooksAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def list_webhooks(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> WebhookPageResponse:
        "listWebhooks operation"
        path = "/v1/projects/${projectId}/webhooks"
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
        return TypeAdapter(WebhookPageResponse).validate_python(response.json())

    def get_webhook(
        self,
        project_id: str,
        endpoint_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> WebhookResponse:
        "getWebhook operation"
        path = "/v1/projects/${projectId}/webhooks/${endpointId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${endpointId}", quote(SDKTransport.wire_value(endpoint_id), safe=""))
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
        return TypeAdapter(WebhookResponse).validate_python(response.json())

    def list_webhook_deliveries(
        self,
        project_id: str,
        endpoint_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> WebhookDeliveryPageResponse:
        "listWebhookDeliveries operation"
        path = "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${endpointId}", quote(SDKTransport.wire_value(endpoint_id), safe=""))
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
        return TypeAdapter(WebhookDeliveryPageResponse).validate_python(response.json())

    def get_webhook_delivery(
        self,
        project_id: str,
        endpoint_id: str,
        delivery_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> WebhookDeliveryResponse:
        "getWebhookDelivery operation"
        path = "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries/${deliveryId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${endpointId}", quote(SDKTransport.wire_value(endpoint_id), safe=""))
        path = path.replace("${deliveryId}", quote(SDKTransport.wire_value(delivery_id), safe=""))
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
        return TypeAdapter(WebhookDeliveryResponse).validate_python(response.json())

    def create_webhook(
        self,
        project_id: str,
        body: CreateWebhookBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> WebhookCreateResponse:
        "createWebhook operation"
        path = "/v1/projects/${projectId}/webhooks"
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
        return TypeAdapter(WebhookCreateResponse).validate_python(response.json())

    def update_webhook(
        self,
        project_id: str,
        endpoint_id: str,
        body: UpdateWebhookBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> WebhookResponse:
        "updateWebhook operation"
        path = "/v1/projects/${projectId}/webhooks/${endpointId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${endpointId}", quote(SDKTransport.wire_value(endpoint_id), safe=""))
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
        return TypeAdapter(WebhookResponse).validate_python(response.json())

    def delete_webhook(
        self,
        project_id: str,
        endpoint_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "deleteWebhook operation"
        path = "/v1/projects/${projectId}/webhooks/${endpointId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${endpointId}", quote(SDKTransport.wire_value(endpoint_id), safe=""))
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

    def test_webhook(
        self,
        project_id: str,
        endpoint_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> WebhookDeliveryResponse:
        "testWebhook operation"
        path = "/v1/projects/${projectId}/webhooks/${endpointId}/test"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${endpointId}", quote(SDKTransport.wire_value(endpoint_id), safe=""))
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
        return TypeAdapter(WebhookDeliveryResponse).validate_python(response.json())

    def replay_webhook_delivery(
        self,
        project_id: str,
        endpoint_id: str,
        delivery_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "replayWebhookDelivery operation"
        path = "/v1/projects/${projectId}/webhooks/${endpointId}/replay/${deliveryId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${endpointId}", quote(SDKTransport.wire_value(endpoint_id), safe=""))
        path = path.replace("${deliveryId}", quote(SDKTransport.wire_value(delivery_id), safe=""))
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
        return None

