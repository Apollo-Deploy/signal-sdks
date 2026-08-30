# ApiKeysAPI

apiKeys API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../api-keys.go)

Client accessor: `client.ApiKeys`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListApiKeys`](#listapikeys) | `GET` | `/v1/projects/{projectId}/api-keys` | `ListApiKeysResponse` | — |
| [`GetApiKey`](#getapikey) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}` | `ApiKey` | — |
| [`GetApiKeyUsage`](#getapikeyusage) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}/usage` | `ApiKeyUsageResponse` | — |
| [`ExportApiKeyUsage`](#exportapikeyusage) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}/usage/export` | `struct{}` | — |

## ListApiKeys

`GET /v1/projects/{projectId}/api-keys`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ListApiKeysResponse`


## GetApiKey

`GET /v1/projects/{projectId}/api-keys/{keyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `keyId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApiKey`


## GetApiKeyUsage

`GET /v1/projects/{projectId}/api-keys/{keyId}/usage`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `keyId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApiKeyUsageResponse`


## ExportApiKeyUsage

`GET /v1/projects/{projectId}/api-keys/{keyId}/usage/export`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `keyId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


---

Generated from the Apollo Signal API manifest by Tesseract.

