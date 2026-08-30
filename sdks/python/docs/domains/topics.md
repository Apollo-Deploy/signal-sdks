# TopicsAPI

topics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../apollo_deploy_signal_sdk/resources/topics.py)

Client accessor: `client.topics`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_topics`](#list-topics) | `GET` | `/v1/projects/{projectId}/topics` | `TopicPageResponse` | — |
| [`get_topic`](#get-topic) | `GET` | `/v1/projects/{projectId}/topics/{topicId}` | `TopicResponse` | — |
| [`list_contacts_in_topic`](#list-contacts-in-topic) | `GET` | `/v1/projects/{projectId}/topics/{topicId}/contacts` | `CursorPage` | — |
| [`create_topic`](#create-topic) | `POST` | `/v1/projects/{projectId}/topics` | `TopicResponse` | — |
| [`update_topic`](#update-topic) | `PATCH` | `/v1/projects/{projectId}/topics/{topicId}` | `TopicResponse` | — |
| [`delete_topic`](#delete-topic) | `DELETE` | `/v1/projects/{projectId}/topics/{topicId}` | `None` | — |

## list_topics

`GET /v1/projects/{projectId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicPageResponse`


## get_topic

`GET /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `topicId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicResponse`


## list_contacts_in_topic

`GET /v1/projects/{projectId}/topics/{topicId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `topicId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `CursorPage`


## create_topic

`POST /v1/projects/{projectId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |

### Request body

- Type: `CreateTopicBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicResponse`


## update_topic

`PATCH /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `topicId` | Path | `str` | Yes | — |

### Request body

- Type: `UpdateTopicBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicResponse`


## delete_topic

`DELETE /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `topicId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `None`


---

Generated from the Apollo Signal API manifest by Tesseract.

