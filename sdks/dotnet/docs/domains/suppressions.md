# SuppressionsAPI

suppressions API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/suppressions.cs)

Client accessor: `client.Suppressions`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListSuppressionsAsync`](#listsuppressionsasync) | `GET` | `/v1/projects/{projectId}/suppressions` | `SuppressionPageResponse` | — |
| [`ExportSuppressionsAsync`](#exportsuppressionsasync) | `GET` | `/v1/projects/{projectId}/suppressions/export` | `void` | — |
| [`AddSuppressionAsync`](#addsuppressionasync) | `POST` | `/v1/projects/{projectId}/suppressions` | `SuppressionResponse` | — |
| [`RemoveSuppressionAsync`](#removesuppressionasync) | `DELETE` | `/v1/projects/{projectId}/suppressions/{email}` | `void` | — |
| [`ImportSuppressionsAsync`](#importsuppressionsasync) | `POST` | `/v1/projects/{projectId}/suppressions/import` | `SuppressionImportResponse` | — |

## ListSuppressionsAsync

`GET /v1/projects/{projectId}/suppressions`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SuppressionPageResponse`


## ExportSuppressionsAsync

`GET /v1/projects/{projectId}/suppressions/export`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## AddSuppressionAsync

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


## RemoveSuppressionAsync

`DELETE /v1/projects/{projectId}/suppressions/{email}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `email` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## ImportSuppressionsAsync

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

