# ContactPropertiesAPI

contactProperties API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/api/contact_properties.rs)

Client accessor: `client.contact_properties`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_contact_properties`](#list-contact-properties) | `GET` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyPageResponse` | — |
| [`get_contact_property`](#get-contact-property) | `GET` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`create_contact_property`](#create-contact-property) | `POST` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyResponse` | — |
| [`update_contact_property`](#update-contact-property) | `PATCH` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`delete_contact_property`](#delete-contact-property) | `DELETE` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `()` | — |

## list_contact_properties

`GET /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyPageResponse`


## get_contact_property

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


## create_contact_property

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


## update_contact_property

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


## delete_contact_property

`DELETE /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `propertyId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `()`


---

Generated from the Apollo Signal API manifest by Tesseract.

