# SuppressionsAPI

suppressions API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/suppressions.ex)

Client accessor: `ApolloSignal.Client.suppressions(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_suppressions`](#list-suppressions) | `GET` | `/v1/projects/{projectId}/suppressions` | `ApolloSignal.Types.SuppressionPageResponse.t()` | — |
| [`export_suppressions`](#export-suppressions) | `GET` | `/v1/projects/{projectId}/suppressions/export` | `nil` | — |
| [`add_suppression`](#add-suppression) | `POST` | `/v1/projects/{projectId}/suppressions` | `ApolloSignal.Types.SuppressionResponse.t()` | — |
| [`remove_suppression`](#remove-suppression) | `DELETE` | `/v1/projects/{projectId}/suppressions/{email}` | `nil` | — |
| [`import_suppressions`](#import-suppressions) | `POST` | `/v1/projects/{projectId}/suppressions/import` | `ApolloSignal.Types.SuppressionImportResponse.t()` | — |

## list_suppressions

`GET /v1/projects/{projectId}/suppressions`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.SuppressionPageResponse.t()`


## export_suppressions

`GET /v1/projects/{projectId}/suppressions/export`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


## add_suppression

`POST /v1/projects/{projectId}/suppressions`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.AddSuppressionBody.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.SuppressionResponse.t()`


## remove_suppression

`DELETE /v1/projects/{projectId}/suppressions/{email}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `email` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


## import_suppressions

`POST /v1/projects/{projectId}/suppressions/import`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.SuppressionImportBody.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.SuppressionImportResponse.t()`


---

Generated from the Apollo Signal API manifest by Tesseract.

