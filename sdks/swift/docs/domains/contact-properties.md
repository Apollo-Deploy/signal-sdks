# ContactPropertiesAPI

contactProperties API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Sources/ApolloSignal/Domains/ContactPropertiesApi.swift)

Client accessor: `client.contactProperties`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listContactProperties`](#listcontactproperties) | `GET` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyPageResponse` | — |
| [`getContactProperty`](#getcontactproperty) | `GET` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`createContactProperty`](#createcontactproperty) | `POST` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyResponse` | — |
| [`updateContactProperty`](#updatecontactproperty) | `PATCH` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`deleteContactProperty`](#deletecontactproperty) | `DELETE` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `Void` | — |

## listContactProperties

`GET /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyPageResponse`


## getContactProperty

`GET /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `propertyId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyResponse`


## createContactProperty

`POST /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Request body

- Type: `CreateContactPropertyBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyResponse`


## updateContactProperty

`PATCH /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `propertyId` | Path | `String` | Yes | — |

### Request body

- Type: `UpdateContactPropertyBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyResponse`


## deleteContactProperty

`DELETE /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `propertyId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `Void`


---

Generated from the Apollo Signal API manifest by Tesseract.

