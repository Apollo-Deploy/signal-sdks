# SendingDomainsAPI

sendingDomains API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/sending_domains.ex)

Client accessor: `ApolloSignal.Client.sending_domains(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_domains`](#list-domains) | `GET` | `/v1/projects/{projectId}/domains` | `ApolloSignal.Types.DomainListPageResponse.t()` | — |
| [`get_domain`](#get-domain) | `GET` | `/v1/projects/{projectId}/domains/{domainId}` | `ApolloSignal.Types.DomainResponse.t()` | — |
| [`register_domain`](#register-domain) | `POST` | `/v1/projects/{projectId}/domains` | `ApolloSignal.Types.DomainResponse.t()` | — |
| [`verify_domain`](#verify-domain) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/verify` | `ApolloSignal.Types.DomainResponse.t()` | — |
| [`delete_domain`](#delete-domain) | `DELETE` | `/v1/projects/{projectId}/domains/{domainId}` | `nil` | — |
| [`verify_bimi`](#verify-bimi) | `POST` | `/v1/projects/{projectId}/domains/{domainId}/bimi/verify` | `ApolloSignal.Types.DomainResponse.t()` | — |
| [`update_bimi`](#update-bimi) | `PATCH` | `/v1/projects/{projectId}/domains/{domainId}/bimi` | `ApolloSignal.Types.DomainResponse.t()` | — |

## list_domains

`GET /v1/projects/{projectId}/domains`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.DomainListPageResponse.t()`


## get_domain

`GET /v1/projects/{projectId}/domains/{domainId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `domainId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.DomainResponse.t()`


## register_domain

`POST /v1/projects/{projectId}/domains`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.RegisterDomainRequest.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.DomainResponse.t()`


## verify_domain

`POST /v1/projects/{projectId}/domains/{domainId}/verify`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `domainId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.DomainResponse.t()`


## delete_domain

`DELETE /v1/projects/{projectId}/domains/{domainId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `domainId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


## verify_bimi

`POST /v1/projects/{projectId}/domains/{domainId}/bimi/verify`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `domainId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.DomainResponse.t()`


## update_bimi

`PATCH /v1/projects/{projectId}/domains/{domainId}/bimi`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `domainId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.UpdateBimiRequest.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.DomainResponse.t()`


---

Generated from the Apollo Signal API manifest by Tesseract.

