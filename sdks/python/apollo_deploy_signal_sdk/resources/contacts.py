"""ContactsAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import AddToSegmentBody, ContactPageResponse, ContactResponse, CreateContactBody, EmailValidationStatusResponse, EngagementScoreResponse, GetContactActivityResponse, GetContactTopicsResponse, ListContactSegmentsResponse, RecordValidationBody, SetImageUrlBody, UpdateContactBody, UpdateTopicsBody
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class ContactsAPI:
    "ContactsAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def list_contacts(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactPageResponse:
        "listContacts operation"
        path = "/v1/projects/${projectId}/contacts"
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
        return TypeAdapter(ContactPageResponse).validate_python(response.json())

    def get_contact(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactResponse:
        "getContact operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return TypeAdapter(ContactResponse).validate_python(response.json())

    def list_contact_segments(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ListContactSegmentsResponse:
        "listContactSegments operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/segments"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return TypeAdapter(ListContactSegmentsResponse).validate_python(response.json())

    def get_contact_topics(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> GetContactTopicsResponse:
        "getContactTopics operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/topics"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return TypeAdapter(GetContactTopicsResponse).validate_python(response.json())

    def create_contact(
        self,
        project_id: str,
        body: CreateContactBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactResponse:
        "createContact operation"
        path = "/v1/projects/${projectId}/contacts"
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
        return TypeAdapter(ContactResponse).validate_python(response.json())

    def update_contact(
        self,
        project_id: str,
        contact_id: str,
        body: UpdateContactBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactResponse:
        "updateContact operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return TypeAdapter(ContactResponse).validate_python(response.json())

    def delete_contact(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "deleteContact operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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

    def upload_contact_image(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactResponse:
        "uploadContactImage operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/image"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return TypeAdapter(ContactResponse).validate_python(response.json())

    def set_contact_image_url(
        self,
        project_id: str,
        contact_id: str,
        body: SetImageUrlBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> ContactResponse:
        "setContactImageUrl operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/image"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
        query: Dict[str, Any] = {}
        headers: Dict[str, str] = {}
        request_options = (options or RequestOptions()).copy()
        if headers:
            request_options.headers.update(headers)
        response = self._transport.request(
            method="PUT",
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
        return TypeAdapter(ContactResponse).validate_python(response.json())

    def delete_contact_image(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "deleteContactImage operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/image"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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

    def add_contact_to_segment(
        self,
        project_id: str,
        contact_id: str,
        body: AddToSegmentBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "addContactToSegment operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/segments"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return None

    def remove_contact_from_segment(
        self,
        project_id: str,
        contact_id: str,
        segment_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "removeContactFromSegment operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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

    def update_contact_topics(
        self,
        project_id: str,
        contact_id: str,
        body: UpdateTopicsBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "updateContactTopics operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/topics"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return None

    def get_contact_activity(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> GetContactActivityResponse:
        "getContactActivity operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/activity"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return TypeAdapter(GetContactActivityResponse).validate_python(response.json())

    def get_contact_engagement_score(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> EngagementScoreResponse:
        "getContactEngagementScore operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/engagement"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return TypeAdapter(EngagementScoreResponse).validate_python(response.json())

    def get_contact_email_validation_status(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> EmailValidationStatusResponse:
        "getContactEmailValidationStatus operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return TypeAdapter(EmailValidationStatusResponse).validate_python(response.json())

    def refresh_contact_engagement_score(
        self,
        project_id: str,
        contact_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> EngagementScoreResponse:
        "refreshContactEngagementScore operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/engagement/refresh"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return TypeAdapter(EngagementScoreResponse).validate_python(response.json())

    def record_contact_email_validation(
        self,
        project_id: str,
        contact_id: str,
        body: RecordValidationBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "recordContactEmailValidation operation"
        path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${contactId}", quote(SDKTransport.wire_value(contact_id), safe=""))
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
        return None

