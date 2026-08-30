# ProjectsAPI

projects API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/main/java/com/apollodeploy/signal/sdk/api/ProjectsAPI.java)

Client accessor: `ApolloSignalApiClient.projects()`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listProjects`](#listprojects) | `GET` | `/v1/projects` | `ProjectPageResponse` | — |
| [`getProject`](#getproject) | `GET` | `/v1/projects/{projectId}` | `ProjectResponse` | — |
| [`updateProject`](#updateproject) | `PATCH` | `/v1/projects/{projectId}` | `ProjectResponse` | — |
| [`listEmails`](#listemails) | `GET` | `/v1/projects/{projectId}/emails` | `EmailPageResponse` | — |
| [`getProjectEmail`](#getprojectemail) | `GET` | `/v1/projects/{projectId}/emails/{emailId}` | `EmailDetailResponse` | — |
| [`getEmailTimeline`](#getemailtimeline) | `GET` | `/v1/projects/{projectId}/emails/{emailId}/events` | `EmailTimelineResponse` | — |

## listProjects

`GET /v1/projects`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectPageResponse`


## getProject

`GET /v1/projects/{projectId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectResponse`


## updateProject

`PATCH /v1/projects/{projectId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Request body

- Type: `UpdateProjectRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectResponse`


## listEmails

`GET /v1/projects/{projectId}/emails`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailPageResponse`


## getProjectEmail

`GET /v1/projects/{projectId}/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `emailId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailDetailResponse`


## getEmailTimeline

`GET /v1/projects/{projectId}/emails/{emailId}/events`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `emailId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailTimelineResponse`


---

Generated from the Apollo Signal API manifest by Tesseract.

