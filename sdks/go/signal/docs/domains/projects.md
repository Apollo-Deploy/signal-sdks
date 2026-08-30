# ProjectsAPI

projects API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../projects.go)

Client accessor: `client.Projects`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListProjects`](#listprojects) | `GET` | `/v1/projects` | `ProjectPageResponse` | — |
| [`GetProject`](#getproject) | `GET` | `/v1/projects/{projectId}` | `ProjectResponse` | — |
| [`UpdateProject`](#updateproject) | `PATCH` | `/v1/projects/{projectId}` | `ProjectResponse` | — |
| [`ListEmails`](#listemails) | `GET` | `/v1/projects/{projectId}/emails` | `EmailPageResponse` | — |
| [`GetProjectEmail`](#getprojectemail) | `GET` | `/v1/projects/{projectId}/emails/{emailId}` | `EmailDetailResponse` | — |
| [`GetEmailTimeline`](#getemailtimeline) | `GET` | `/v1/projects/{projectId}/emails/{emailId}/events` | `EmailTimelineResponse` | — |

## ListProjects

`GET /v1/projects`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectPageResponse`


## GetProject

`GET /v1/projects/{projectId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectResponse`


## UpdateProject

`PATCH /v1/projects/{projectId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Request body

- Type: `UpdateProjectRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectResponse`


## ListEmails

`GET /v1/projects/{projectId}/emails`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailPageResponse`


## GetProjectEmail

`GET /v1/projects/{projectId}/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `emailId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailDetailResponse`


## GetEmailTimeline

`GET /v1/projects/{projectId}/emails/{emailId}/events`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `emailId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailTimelineResponse`


---

Generated from the Apollo Signal API manifest by Tesseract.

