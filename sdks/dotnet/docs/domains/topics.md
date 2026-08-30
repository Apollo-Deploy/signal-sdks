# TopicsAPI

topics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/topics.cs)

Client accessor: `client.Topics`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListTopicsAsync`](#listtopicsasync) | `GET` | `/v1/projects/{projectId}/topics` | `TopicPageResponse` | — |
| [`GetTopicAsync`](#gettopicasync) | `GET` | `/v1/projects/{projectId}/topics/{topicId}` | `TopicResponse` | — |
| [`ListContactsInTopicAsync`](#listcontactsintopicasync) | `GET` | `/v1/projects/{projectId}/topics/{topicId}/contacts` | `CursorPage` | — |
| [`CreateTopicAsync`](#createtopicasync) | `POST` | `/v1/projects/{projectId}/topics` | `TopicResponse` | — |
| [`UpdateTopicAsync`](#updatetopicasync) | `PATCH` | `/v1/projects/{projectId}/topics/{topicId}` | `TopicResponse` | — |
| [`DeleteTopicAsync`](#deletetopicasync) | `DELETE` | `/v1/projects/{projectId}/topics/{topicId}` | `void` | — |

## ListTopicsAsync

`GET /v1/projects/{projectId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicPageResponse`


## GetTopicAsync

`GET /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `topicId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicResponse`


## ListContactsInTopicAsync

`GET /v1/projects/{projectId}/topics/{topicId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `topicId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `CursorPage`


## CreateTopicAsync

`POST /v1/projects/{projectId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Request body

- Type: `CreateTopicBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicResponse`


## UpdateTopicAsync

`PATCH /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `topicId` | Path | `string` | Yes | — |

### Request body

- Type: `UpdateTopicBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicResponse`


## DeleteTopicAsync

`DELETE /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `topicId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

