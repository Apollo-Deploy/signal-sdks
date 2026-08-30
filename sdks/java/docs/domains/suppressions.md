# SuppressionsAPI

suppressions API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/main/java/com/apollodeploy/signal/sdk/api/SuppressionsAPI.java)

Client accessor: `ApolloSignalApiClient.suppressions()`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listSuppressions`](#listsuppressions) | `GET` | `/v1/projects/{projectId}/suppressions` | `SuppressionPageResponse` | — |
| [`exportSuppressions`](#exportsuppressions) | `GET` | `/v1/projects/{projectId}/suppressions/export` | `void` | — |
| [`addSuppression`](#addsuppression) | `POST` | `/v1/projects/{projectId}/suppressions` | `SuppressionResponse` | — |
| [`removeSuppression`](#removesuppression) | `DELETE` | `/v1/projects/{projectId}/suppressions/{email}` | `void` | — |
| [`importSuppressions`](#importsuppressions) | `POST` | `/v1/projects/{projectId}/suppressions/import` | `SuppressionImportResponse` | — |

## listSuppressions

`GET /v1/projects/{projectId}/suppressions`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SuppressionPageResponse`


## exportSuppressions

`GET /v1/projects/{projectId}/suppressions/export`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## addSuppression

`POST /v1/projects/{projectId}/suppressions`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Request body

- Type: `AddSuppressionBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SuppressionResponse`


## removeSuppression

`DELETE /v1/projects/{projectId}/suppressions/{email}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `email` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## importSuppressions

`POST /v1/projects/{projectId}/suppressions/import`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Request body

- Type: `SuppressionImportBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SuppressionImportResponse`


---

Generated from the Apollo Signal API manifest by Tesseract.

