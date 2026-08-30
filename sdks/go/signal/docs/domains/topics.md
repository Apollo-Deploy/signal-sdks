# TopicsAPI

topics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../topics.go)

Client accessor: `client.Topics`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListTopics`](#listtopics) | `GET` | `/v1/projects/{projectId}/topics` | `TopicPageResponse` | — |
| [`GetTopic`](#gettopic) | `GET` | `/v1/projects/{projectId}/topics/{topicId}` | `TopicResponse` | — |
| [`ListContactsInTopic`](#listcontactsintopic) | `GET` | `/v1/projects/{projectId}/topics/{topicId}/contacts` | `CursorPage` | — |
| [`CreateTopic`](#createtopic) | `POST` | `/v1/projects/{projectId}/topics` | `TopicResponse` | — |
| [`UpdateTopic`](#updatetopic) | `PATCH` | `/v1/projects/{projectId}/topics/{topicId}` | `TopicResponse` | — |
| [`DeleteTopic`](#deletetopic) | `DELETE` | `/v1/projects/{projectId}/topics/{topicId}` | `struct{}` | — |

## ListTopics

`GET /v1/projects/{projectId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicPageResponse`


## GetTopic

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


## ListContactsInTopic

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


## CreateTopic

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


## UpdateTopic

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


## DeleteTopic

`DELETE /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `topicId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


---

Generated from the Apollo Signal API manifest by Tesseract.

