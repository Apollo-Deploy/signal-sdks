# SendingDomainsAPI

sendingDomains API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/api/sending_domains.rs)

Client accessor: `client.sending_domains`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_domains`](#list-domains) | `GET` | `/v1/projects/{projectId}/domains` | `DomainListPageResponse` | — |
| [`get_domain`](#get-domain) | `GET` | `/v1/projects/{projectId}/domains/{domainId}` | `DomainResponse` | — |
| [`register_domain`](#register-domain) | `POST` | `/v1/projects/{projectId}/domains` | `DomainResponse` | — |
| [`verify_domain`](#verify-domain) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/verify` | `DomainResponse` | — |
| [`delete_domain`](#delete-domain) | `DELETE` | `/v1/projects/{projectId}/domains/{domainId}` | `()` | — |
| [`verify_bimi`](#verify-bimi) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/bimi/verify` | `DomainResponse` | — |
| [`update_bimi`](#update-bimi) | `PATCH` | `/v1/projects/{projectId}/domains/{domainId}/bimi` | `DomainResponse` | — |

## list_domains

`GET /v1/projects/{projectId}/domains`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainListPageResponse`


## get_domain

`GET /v1/projects/{projectId}/domains/{domainId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `domainId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainResponse`


## register_domain

`POST /v1/projects/{projectId}/domains`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Request body

- Type: `RegisterDomainRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainResponse`


## verify_domain

`POST /v1/projects/{projectId}/domains/{domainId}/verify`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `domainId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainResponse`


## delete_domain

`DELETE /v1/projects/{projectId}/domains/{domainId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `domainId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `()`


## verify_bimi

`POST /v1/projects/{projectId}/domains/{domainId}/bimi/verify`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `domainId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `DomainResponse`


## update_bimi

`PATCH /v1/projects/{projectId}/domains/{domainId}/bimi`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `domainId` | Path | `String` | Yes | — |

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

