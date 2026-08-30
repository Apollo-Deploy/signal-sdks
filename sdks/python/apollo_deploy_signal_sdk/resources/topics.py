"""TopicsAPI operations."""

from typing import Any, Dict, Iterator, List, Literal, Optional, Union
from urllib.parse import quote

from pydantic import TypeAdapter
from ..types import CreateTopicBody, CursorPage, TopicPageResponse, TopicResponse, UpdateTopicBody
from ..errors import SDKError
from ..transport import RequestOptions, SDKTransport


class TopicsAPI:
    "TopicsAPI API operations"

    def __init__(self, transport: SDKTransport):
        self._transport = transport

    def list_topics(
        self,
        project_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> TopicPageResponse:
        "listTopics operation"
        path = "/v1/projects/${projectId}/topics"
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
        return TypeAdapter(TopicPageResponse).validate_python(response.json())

    def get_topic(
        self,
        project_id: str,
        topic_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> TopicResponse:
        "getTopic operation"
        path = "/v1/projects/${projectId}/topics/${topicId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${topicId}", quote(SDKTransport.wire_value(topic_id), safe=""))
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
        return TypeAdapter(TopicResponse).validate_python(response.json())

    def list_contacts_in_topic(
        self,
        project_id: str,
        topic_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> CursorPage:
        "listContactsInTopic operation"
        path = "/v1/projects/${projectId}/topics/${topicId}/contacts"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${topicId}", quote(SDKTransport.wire_value(topic_id), safe=""))
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

    def create_topic(
        self,
        project_id: str,
        body: CreateTopicBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> TopicResponse:
        "createTopic operation"
        path = "/v1/projects/${projectId}/topics"
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
        return TypeAdapter(TopicResponse).validate_python(response.json())

    def update_topic(
        self,
        project_id: str,
        topic_id: str,
        body: UpdateTopicBody,
        *,
        options: Optional[RequestOptions] = None,
    ) -> TopicResponse:
        "updateTopic operation"
        path = "/v1/projects/${projectId}/topics/${topicId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${topicId}", quote(SDKTransport.wire_value(topic_id), safe=""))
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
        return TypeAdapter(TopicResponse).validate_python(response.json())

    def delete_topic(
        self,
        project_id: str,
        topic_id: str,
        *,
        options: Optional[RequestOptions] = None,
    ) -> None:
        "deleteTopic operation"
        path = "/v1/projects/${projectId}/topics/${topicId}"
        path = path.replace("${projectId}", quote(SDKTransport.wire_value(project_id), safe=""))
        path = path.replace("${topicId}", quote(SDKTransport.wire_value(topic_id), safe=""))
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

