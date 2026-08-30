# SendingDomainsAPI

sendingDomains API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/domain/sending-domains.ts)

Client accessor: `client.sendingDomains`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listDomains`](#listdomains) | `GET` | `/v1/projects/{projectId}/domains` | `DomainListPageResponse` | — |
| [`getDomain`](#getdomain) | `GET` | `/v1/projects/{projectId}/domains/{domainId}` | `DomainResponse` | — |
| [`registerDomain`](#registerdomain) | `POST` | `/v1/projects/{projectId}/domains` | `DomainResponse` | — |
| [`verifyDomain`](#verifydomain) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/verify` | `DomainResponse` | — |
| [`deleteDomain`](#deletedomain) | `DELETE` | `/v1/projects/{projectId}/domains/{domainId}` | `void` | — |
| [`verifyBimi`](#verifybimi) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/bimi/verify` | `DomainResponse` | — |
| [`updateBimi`](#updatebimi) | `PATCH` | `/v1/projects/{projectId}/domains/{domainId}/bimi` | `DomainResponse` | — |

## listDomains

`GET /v1/projects/{projectId}/domains`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainListPageResponse`


## getDomain

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


## registerDomain

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


## verifyDomain

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


## deleteDomain

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


## verifyBimi

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


## updateBimi

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

