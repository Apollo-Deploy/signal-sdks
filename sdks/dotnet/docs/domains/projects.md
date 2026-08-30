# ProjectsAPI

projects API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/projects.cs)

Client accessor: `client.Projects`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListProjectsAsync`](#listprojectsasync) | `GET` | `/v1/projects` | `ProjectPageResponse` | — |
| [`GetProjectAsync`](#getprojectasync) | `GET` | `/v1/projects/{projectId}` | `ProjectResponse` | — |
| [`UpdateProjectAsync`](#updateprojectasync) | `PATCH` | `/v1/projects/{projectId}` | `ProjectResponse` | — |
| [`ListEmailsAsync`](#listemailsasync) | `GET` | `/v1/projects/{projectId}/emails` | `EmailPageResponse` | — |
| [`GetProjectEmailAsync`](#getprojectemailasync) | `GET` | `/v1/projects/{projectId}/emails/{emailId}` | `EmailDetailResponse` | — |
| [`GetEmailTimelineAsync`](#getemailtimelineasync) | `GET` | `/v1/projects/{projectId}/emails/{emailId}/events` | `EmailTimelineResponse` | — |

## ListProjectsAsync

`GET /v1/projects`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectPageResponse`


## GetProjectAsync

`GET /v1/projects/{projectId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectResponse`


## UpdateProjectAsync

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


## ListEmailsAsync

`GET /v1/projects/{projectId}/emails`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailPageResponse`


## GetProjectEmailAsync

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


## GetEmailTimelineAsync

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

