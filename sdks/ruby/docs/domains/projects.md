# ProjectsAPI

projects API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_deploy_signal_sdk/resources/projects.rb)

Client accessor: `client.projects`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_projects`](#list-projects) | `GET` | `/v1/projects` | `ProjectPageResponse` | — |
| [`get_project`](#get-project) | `GET` | `/v1/projects/{projectId}` | `ProjectResponse` | — |
| [`update_project`](#update-project) | `PATCH` | `/v1/projects/{projectId}` | `ProjectResponse` | — |
| [`list_emails`](#list-emails) | `GET` | `/v1/projects/{projectId}/emails` | `EmailPageResponse` | — |
| [`get_project_email`](#get-project-email) | `GET` | `/v1/projects/{projectId}/emails/{emailId}` | `EmailDetailResponse` | — |
| [`get_email_timeline`](#get-email-timeline) | `GET` | `/v1/projects/{projectId}/emails/{emailId}/events` | `EmailTimelineResponse` | — |

## list_projects

`GET /v1/projects`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectPageResponse`


## get_project

`GET /v1/projects/{projectId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectResponse`


## update_project

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


## list_emails

`GET /v1/projects/{projectId}/emails`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailPageResponse`


## get_project_email

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


## get_email_timeline

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

