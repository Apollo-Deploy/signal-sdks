# SuppressionsAPI

suppressions API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../suppressions.go)

Client accessor: `client.Suppressions`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListSuppressions`](#listsuppressions) | `GET` | `/v1/projects/{projectId}/suppressions` | `SuppressionPageResponse` | — |
| [`ExportSuppressions`](#exportsuppressions) | `GET` | `/v1/projects/{projectId}/suppressions/export` | `struct{}` | — |
| [`AddSuppression`](#addsuppression) | `POST` | `/v1/projects/{projectId}/suppressions` | `SuppressionResponse` | — |
| [`RemoveSuppression`](#removesuppression) | `DELETE` | `/v1/projects/{projectId}/suppressions/{email}` | `struct{}` | — |
| [`ImportSuppressions`](#importsuppressions) | `POST` | `/v1/projects/{projectId}/suppressions/import` | `SuppressionImportResponse` | — |

## ListSuppressions

`GET /v1/projects/{projectId}/suppressions`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SuppressionPageResponse`


## ExportSuppressions

`GET /v1/projects/{projectId}/suppressions/export`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


## AddSuppression

`POST /v1/projects/{projectId}/suppressions`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Request body

- Type: `AddSuppressionBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SuppressionResponse`


## RemoveSuppression

`DELETE /v1/projects/{projectId}/suppressions/{email}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `email` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


## ImportSuppressions

`POST /v1/projects/{projectId}/suppressions/import`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

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

