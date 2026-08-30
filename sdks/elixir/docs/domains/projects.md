# ProjectsAPI

projects API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/projects.ex)

Client accessor: `ApolloSignal.Client.projects(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_projects`](#list-projects) | `GET` | `/v1/projects` | `ApolloSignal.Types.ProjectPageResponse.t()` | — |
| [`get_project`](#get-project) | `GET` | `/v1/projects/{projectId}` | `ApolloSignal.Types.ProjectResponse.t()` | — |
| [`update_project`](#update-project) | `PATCH` | `/v1/projects/{projectId}` | `ApolloSignal.Types.ProjectResponse.t()` | — |
| [`list_emails`](#list-emails) | `GET` | `/v1/projects/{projectId}/emails` | `ApolloSignal.Types.EmailPageResponse.t()` | — |
| [`get_project_email`](#get-project-email) | `GET` | `/v1/projects/{projectId}/emails/{emailId}` | `ApolloSignal.Types.EmailDetailResponse.t()` | — |
| [`get_email_timeline`](#get-email-timeline) | `GET` | `/v1/projects/{projectId}/emails/{emailId}/events` | `ApolloSignal.Types.EmailTimelineResponse.t()` | — |

## list_projects

`GET /v1/projects`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ProjectPageResponse.t()`


## get_project

`GET /v1/projects/{projectId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ProjectResponse.t()`


## update_project

`PATCH /v1/projects/{projectId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.UpdateProjectRequest.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ProjectResponse.t()`


## list_emails

`GET /v1/projects/{projectId}/emails`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.EmailPageResponse.t()`


## get_project_email

`GET /v1/projects/{projectId}/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `emailId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.EmailDetailResponse.t()`


## get_email_timeline

`GET /v1/projects/{projectId}/emails/{emailId}/events`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `emailId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.EmailTimelineResponse.t()`


---

Generated from the Apollo Signal API manifest by Tesseract.

