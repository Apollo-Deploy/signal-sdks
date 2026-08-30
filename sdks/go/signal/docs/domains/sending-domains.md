# SendingDomainsAPI

sendingDomains API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../sending-domains.go)

Client accessor: `client.SendingDomains`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListDomains`](#listdomains) | `GET` | `/v1/projects/{projectId}/domains` | `DomainListPageResponse` | — |
| [`GetDomain`](#getdomain) | `GET` | `/v1/projects/{projectId}/domains/{domainId}` | `DomainResponse` | — |
| [`RegisterDomain`](#registerdomain) | `POST` | `/v1/projects/{projectId}/domains` | `DomainResponse` | — |
| [`VerifyDomain`](#verifydomain) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/verify` | `DomainResponse` | — |
| [`DeleteDomain`](#deletedomain) | `DELETE` | `/v1/projects/{projectId}/domains/{domainId}` | `struct{}` | — |
| [`VerifyBimi`](#verifybimi) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/bimi/verify` | `DomainResponse` | — |
| [`UpdateBimi`](#updatebimi) | `PATCH` | `/v1/projects/{projectId}/domains/{domainId}/bimi` | `DomainResponse` | — |

## ListDomains

`GET /v1/projects/{projectId}/domains`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainListPageResponse`


## GetDomain

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


## RegisterDomain

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


## VerifyDomain

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


## DeleteDomain

`DELETE /v1/projects/{projectId}/domains/{domainId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `domainId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


## VerifyBimi

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


## UpdateBimi

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

