# SuppressionsAPI

suppressions API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../apollo_deploy_signal_sdk/resources/suppressions.py)

Client accessor: `client.suppressions`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_suppressions`](#list-suppressions) | `GET` | `/v1/projects/{projectId}/suppressions` | `SuppressionPageResponse` | — |
| [`export_suppressions`](#export-suppressions) | `GET` | `/v1/projects/{projectId}/suppressions/export` | `None` | — |
| [`add_suppression`](#add-suppression) | `POST` | `/v1/projects/{projectId}/suppressions` | `SuppressionResponse` | — |
| [`remove_suppression`](#remove-suppression) | `DELETE` | `/v1/projects/{projectId}/suppressions/{email}` | `None` | — |
| [`import_suppressions`](#import-suppressions) | `POST` | `/v1/projects/{projectId}/suppressions/import` | `SuppressionImportResponse` | — |

## list_suppressions

`GET /v1/projects/{projectId}/suppressions`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SuppressionPageResponse`


## export_suppressions

`GET /v1/projects/{projectId}/suppressions/export`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `None`


## add_suppression

`POST /v1/projects/{projectId}/suppressions`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |

### Request body

- Type: `AddSuppressionBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SuppressionResponse`


## remove_suppression

`DELETE /v1/projects/{projectId}/suppressions/{email}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `email` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `None`


## import_suppressions

`POST /v1/projects/{projectId}/suppressions/import`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |

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

