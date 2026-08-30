# SendingDomainsAPI

sendingDomains API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/sending-domains.cs)

Client accessor: `client.SendingDomains`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListDomainsAsync`](#listdomainsasync) | `GET` | `/v1/projects/{projectId}/domains` | `DomainListPageResponse` | — |
| [`GetDomainAsync`](#getdomainasync) | `GET` | `/v1/projects/{projectId}/domains/{domainId}` | `DomainResponse` | — |
| [`RegisterDomainAsync`](#registerdomainasync) | `POST` | `/v1/projects/{projectId}/domains` | `DomainResponse` | — |
| [`VerifyDomainAsync`](#verifydomainasync) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/verify` | `DomainResponse` | — |
| [`DeleteDomainAsync`](#deletedomainasync) | `DELETE` | `/v1/projects/{projectId}/domains/{domainId}` | `void` | — |
| [`VerifyBimiAsync`](#verifybimiasync) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/bimi/verify` | `DomainResponse` | — |
| [`UpdateBimiAsync`](#updatebimiasync) | `PATCH` | `/v1/projects/{projectId}/domains/{domainId}/bimi` | `DomainResponse` | — |

## ListDomainsAsync

`GET /v1/projects/{projectId}/domains`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainListPageResponse`


## GetDomainAsync

`GET /v1/projects/{projectId}/domains/{domainId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `domainId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainResponse`


## RegisterDomainAsync

`POST /v1/projects/{projectId}/domains`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Request body

- Type: `RegisterDomainRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainResponse`


## VerifyDomainAsync

`POST /v1/projects/{projectId}/domains/{domainId}/verify`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `domainId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainResponse`


## DeleteDomainAsync

`DELETE /v1/projects/{projectId}/domains/{domainId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `domainId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## VerifyBimiAsync

`POST /v1/projects/{projectId}/domains/{domainId}/bimi/verify`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `domainId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainResponse`


## UpdateBimiAsync

`PATCH /v1/projects/{projectId}/domains/{domainId}/bimi`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `domainId` | Path | `string` | Yes | — |

### Request body

- Type: `UpdateBimiRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainResponse`


---

Generated from the Apollo Signal API manifest by Tesseract.

