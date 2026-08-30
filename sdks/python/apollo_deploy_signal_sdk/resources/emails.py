"""EmailsAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import BatchSendRequest, BatchSendResponse, BulkCancelResponse, CancelResponse, EmailDetailResponse, SendEmailRequest, SendEmailResponse, StreamEventResponse, StreamTokenResponse, ValidateLinksRequest, ValidateLinksResponse
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport, SSEEvent


class EmailsAPI:
    "EmailsAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def send_email(
        self,
        body: SendEmailRequest,
        *,
        options: Optional[RequestOptions] = None,
    ) -> SendEmailResponse:
        "sendEmail operation"
        path = "/v1/emails"
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
        return TypeAdapter(SendEmailResponse).validate_python(response.json())

    def get_email(
        self,
        email_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> EmailDetailResponse:
        "getEmail operation"
        path = "/v1/emails/${emailId}"
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

    def batch_send_emails(
        self,
        body: BatchSendRequest,
        *,
        options: Optional[RequestOptions] = None,
    ) -> BatchSendResponse:
        "batchSendEmails operation"
        path = "/v1/emails/batch"
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
        return TypeAdapter(BatchSendResponse).validate_python(response.json())

    def cancel_email(
        self,
        email_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> CancelResponse:
        "cancelEmail operation"
        path = "/v1/emails/${emailId}"
        path = path.replace("${emailId}", quote(SDKTransport.wire_value(email_id), safe=""))
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
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(CancelResponse).validate_python(response.json())

    def bulk_cancel_emails(
        self,
        *,
        options: Optional[RequestOptions] = None,
    ) -> BulkCancelResponse:
        "bulkCancelEmails operation"
        path = "/v1/emails"
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
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(BulkCancelResponse).validate_python(response.json())

    def issue_stream_token(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> StreamTokenResponse:
        "issueStreamToken operation"
        path = "/v1/emails/${projectId}/stream/token"
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
            options=request_options,
        )
        if not response.content:
            raise SDKError(
                "Successful response did not contain the expected JSON body",
                response.status_code,
                "empty_response",
                response.headers.get("x-request-id") or response.headers.get("request-id"),
            )
        return TypeAdapter(StreamTokenResponse).validate_python(response.json())

    def stream_email_events(
        self,
        *,
        options: Optional[RequestOptions] = None,
    ) -> Iterator[SSEEvent[StreamEventResponse]]:
        "streamEmailEvents operation"
        path = "/v1/emails/stream"
        query: Dict[str, Any] = {}
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        return self._transport.stream(
            method="GET",
            path=path,
            query=query or None,
            options=request_options,
            type_adapter=TypeAdapter(StreamEventResponse),
        )

    def validate_links(
        self,
        body: ValidateLinksRequest,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ValidateLinksResponse:
        "validateLinks operation"
        path = "/v1/emails/validate"
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
        return TypeAdapter(ValidateLinksResponse).validate_python(response.json())

