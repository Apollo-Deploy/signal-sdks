# TopicsAPI

topics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/topics.ex)

Client accessor: `ApolloSignal.Client.topics(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_topics`](#list-topics) | `GET` | `/v1/projects/{projectId}/topics` | `ApolloSignal.Types.TopicPageResponse.t()` | — |
| [`get_topic`](#get-topic) | `GET` | `/v1/projects/{projectId}/topics/{topicId}` | `ApolloSignal.Types.TopicResponse.t()` | — |
| [`list_contacts_in_topic`](#list-contacts-in-topic) | `GET` | `/v1/projects/{projectId}/topics/{topicId}/contacts` | `ApolloSignal.Types.CursorPage.t()` | — |
| [`create_topic`](#create-topic) | `POST` | `/v1/projects/{projectId}/topics` | `ApolloSignal.Types.TopicResponse.t()` | — |
| [`update_topic`](#update-topic) | `PATCH` | `/v1/projects/{projectId}/topics/{topicId}` | `ApolloSignal.Types.TopicResponse.t()` | — |
| [`delete_topic`](#delete-topic) | `DELETE` | `/v1/projects/{projectId}/topics/{topicId}` | `nil` | — |

## list_topics

`GET /v1/projects/{projectId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.TopicPageResponse.t()`


## get_topic

`GET /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `topicId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.TopicResponse.t()`


## list_contacts_in_topic

`GET /v1/projects/{projectId}/topics/{topicId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `topicId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.CursorPage.t()`


## create_topic

`POST /v1/projects/{projectId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.CreateTopicBody.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.TopicResponse.t()`


## update_topic

`PATCH /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `topicId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.UpdateTopicBody.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.TopicResponse.t()`


## delete_topic

`DELETE /v1/projects/{projectId}/topics/{topicId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `topicId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


---

Generated from the Apollo Signal API manifest by Tesseract.

