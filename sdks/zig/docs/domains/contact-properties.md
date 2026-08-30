# ContactPropertiesAPI

contactProperties API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/domain/contact_properties.zig)

Client accessor: `client.contactProperties()`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listContactProperties`](#listcontactproperties) | `GET` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyPageResponse` | — |
| [`getContactProperty`](#getcontactproperty) | `GET` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`createContactProperty`](#createcontactproperty) | `POST` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyResponse` | — |
| [`updateContactProperty`](#updatecontactproperty) | `PATCH` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`deleteContactProperty`](#deletecontactproperty) | `DELETE` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `void` | — |

## listContactProperties

`GET /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyPageResponse`


## getContactProperty

`GET /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `propertyId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyResponse`


## createContactProperty

`POST /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |

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
| `projectId` | Path | `[]const u8` | Yes | — |
| `propertyId` | Path | `[]const u8` | Yes | — |

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
| `projectId` | Path | `[]const u8` | Yes | — |
| `propertyId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

