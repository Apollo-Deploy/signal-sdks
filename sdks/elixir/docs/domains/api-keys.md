# ApiKeysAPI

apiKeys API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/api_keys.ex)

Client accessor: `ApolloSignal.Client.api_keys(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_api_keys`](#list-api-keys) | `GET` | `/v1/projects/{projectId}/api-keys` | `ApolloSignal.Types.ListApiKeysResponse.t()` | — |
| [`get_api_key`](#get-api-key) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}` | `ApolloSignal.Types.ApiKey.t()` | — |
| [`get_api_key_usage`](#get-api-key-usage) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}/usage` | `ApolloSignal.Types.ApiKeyUsageResponse.t()` | — |
| [`export_api_key_usage`](#export-api-key-usage) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}/usage/export` | `nil` | — |

## list_api_keys

`GET /v1/projects/{projectId}/api-keys`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ListApiKeysResponse.t()`


## get_api_key

`GET /v1/projects/{projectId}/api-keys/{keyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `keyId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ApiKey.t()`


## get_api_key_usage

`GET /v1/projects/{projectId}/api-keys/{keyId}/usage`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `keyId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ApiKeyUsageResponse.t()`


## export_api_key_usage

`GET /v1/projects/{projectId}/api-keys/{keyId}/usage/export`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `keyId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


---

Generated from the Apollo Signal API manifest by Tesseract.

