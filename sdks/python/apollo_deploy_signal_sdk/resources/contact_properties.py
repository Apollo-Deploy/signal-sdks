"""ContactPropertiesAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import ContactPropertyPageResponse, ContactPropertyResponse, CreateContactPropertyBody, UpdateContactPropertyBody
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class ContactPropertiesAPI:
    "ContactPropertiesAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def list_contact_properties(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactPropertyPageResponse:
        "listContactProperties operation"
        path = "/v1/projects/${projectId}/contact-properties"
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
        return TypeAdapter(ContactPropertyPageResponse).validate_python(response.json())

    def get_contact_property(
        self,
        project_id: str,
        property_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactPropertyResponse:
        "getContactProperty operation"
        path = "/v1/projects/${projectId}/contact-properties/${propertyId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${propertyId}", quote(SDKTransport.wire_value(property_id), safe=""))
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
        return TypeAdapter(ContactPropertyResponse).validate_python(response.json())

    def create_contact_property(
        self,
        project_id: str,
        body: CreateContactPropertyBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactPropertyResponse:
        "createContactProperty operation"
        path = "/v1/projects/${projectId}/contact-properties"
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
        return TypeAdapter(ContactPropertyResponse).validate_python(response.json())

    def update_contact_property(
        self,
        project_id: str,
        property_id: str,
        body: UpdateContactPropertyBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactPropertyResponse:
        "updateContactProperty operation"
        path = "/v1/projects/${projectId}/contact-properties/${propertyId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${propertyId}", quote(SDKTransport.wire_value(property_id), safe=""))
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
        return TypeAdapter(ContactPropertyResponse).validate_python(response.json())

    def delete_contact_property(
        self,
        project_id: str,
        property_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "deleteContactProperty operation"
        path = "/v1/projects/${projectId}/contact-properties/${propertyId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${propertyId}", quote(SDKTransport.wire_value(property_id), safe=""))
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

