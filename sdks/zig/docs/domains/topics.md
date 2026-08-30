# TopicsAPI

topics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/domain/topics.zig)

Client accessor: `client.topics()`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listTopics`](#listtopics) | `GET` | `/v1/projects/{projectId}/topics` | `TopicPageResponse` | — |
| [`getTopic`](#gettopic) | `GET` | `/v1/projects/{projectId}/topics/{topicId}` | `TopicResponse` | — |
| [`listContactsInTopic`](#listcontactsintopic) | `GET` | `/v1/projects/{projectId}/topics/{topicId}/contacts` | `CursorPage` | — |
| [`createTopic`](#createtopic) | `POST` | `/v1/projects/{projectId}/topics` | `TopicResponse` | — |
| [`updateTopic`](#updatetopic) | `PATCH` | `/v1/projects/{projectId}/topics/{topicId}` | `TopicResponse` | — |
| [`deleteTopic`](#deletetopic) | `DELETE` | `/v1/projects/{projectId}/topics/{topicId}` | `void` | — |

## listTopics

`GET /v1/projects/{projectId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicPageResponse`


## getTopic

`GET /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `topicId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicResponse`


## listContactsInTopic

`GET /v1/projects/{projectId}/topics/{topicId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `topicId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `CursorPage`


## createTopic

`POST /v1/projects/{projectId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |

### Request body

- Type: `CreateTopicBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicResponse`


## updateTopic

`PATCH /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `topicId` | Path | `[]const u8` | Yes | — |

### Request body

- Type: `UpdateTopicBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicResponse`


## deleteTopic

`DELETE /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `topicId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

