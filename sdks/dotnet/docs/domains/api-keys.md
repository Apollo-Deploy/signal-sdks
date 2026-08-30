# ApiKeysAPI

apiKeys API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/api-keys.cs)

Client accessor: `client.ApiKeys`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListApiKeysAsync`](#listapikeysasync) | `GET` | `/v1/projects/{projectId}/api-keys` | `ListApiKeysResponse` | — |
| [`GetApiKeyAsync`](#getapikeyasync) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}` | `ApiKey` | — |
| [`GetApiKeyUsageAsync`](#getapikeyusageasync) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}/usage` | `ApiKeyUsageResponse` | — |
| [`ExportApiKeyUsageAsync`](#exportapikeyusageasync) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}/usage/export` | `void` | — |

## ListApiKeysAsync

`GET /v1/projects/{projectId}/api-keys`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ListApiKeysResponse`


## GetApiKeyAsync

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


## GetApiKeyUsageAsync

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


## ExportApiKeyUsageAsync

`GET /v1/projects/{projectId}/api-keys/{keyId}/usage/export`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `keyId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

