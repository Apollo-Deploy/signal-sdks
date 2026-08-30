# ContactPropertiesAPI

contactProperties API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/contact-properties.cs)

Client accessor: `client.ContactProperties`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListContactPropertiesAsync`](#listcontactpropertiesasync) | `GET` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyPageResponse` | — |
| [`GetContactPropertyAsync`](#getcontactpropertyasync) | `GET` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`CreateContactPropertyAsync`](#createcontactpropertyasync) | `POST` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyResponse` | — |
| [`UpdateContactPropertyAsync`](#updatecontactpropertyasync) | `PATCH` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`DeleteContactPropertyAsync`](#deletecontactpropertyasync) | `DELETE` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `void` | — |

## ListContactPropertiesAsync

`GET /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyPageResponse`


## GetContactPropertyAsync

`GET /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `propertyId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyResponse`


## CreateContactPropertyAsync

`POST /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Request body

- Type: `CreateContactPropertyBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyResponse`


## UpdateContactPropertyAsync

`PATCH /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `propertyId` | Path | `string` | Yes | — |

### Request body

- Type: `UpdateContactPropertyBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyResponse`


## DeleteContactPropertyAsync

`DELETE /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `propertyId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

