# ApiKeysAPI

apiKeys API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Sources/ApolloSignal/Domains/ApiKeysApi.swift)

Client accessor: `client.apiKeys`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listApiKeys`](#listapikeys) | `GET` | `/v1/projects/{projectId}/api-keys` | `ListApiKeysResponse` | — |
| [`getApiKey`](#getapikey) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}` | `ApiKey` | — |
| [`getApiKeyUsage`](#getapikeyusage) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}/usage` | `ApiKeyUsageResponse` | — |
| [`exportApiKeyUsage`](#exportapikeyusage) | `GET` | `/v1/projects/{projectId}/api-keys/{keyId}/usage/export` | `Void` | — |

## listApiKeys

`GET /v1/projects/{projectId}/api-keys`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ListApiKeysResponse`


## getApiKey

`GET /v1/projects/{projectId}/api-keys/{keyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `keyId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApiKey`


## getApiKeyUsage

`GET /v1/projects/{projectId}/api-keys/{keyId}/usage`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `keyId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApiKeyUsageResponse`


## exportApiKeyUsage

`GET /v1/projects/{projectId}/api-keys/{keyId}/usage/export`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `keyId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `Void`


---

Generated from the Apollo Signal API manifest by Tesseract.

