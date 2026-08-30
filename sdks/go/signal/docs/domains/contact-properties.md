# ContactPropertiesAPI

contactProperties API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../contact-properties.go)

Client accessor: `client.ContactProperties`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListContactProperties`](#listcontactproperties) | `GET` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyPageResponse` | — |
| [`GetContactProperty`](#getcontactproperty) | `GET` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`CreateContactProperty`](#createcontactproperty) | `POST` | `/v1/projects/{projectId}/contact-properties` | `ContactPropertyResponse` | — |
| [`UpdateContactProperty`](#updatecontactproperty) | `PATCH` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ContactPropertyResponse` | — |
| [`DeleteContactProperty`](#deletecontactproperty) | `DELETE` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `struct{}` | — |

## ListContactProperties

`GET /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPropertyPageResponse`


## GetContactProperty

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


## CreateContactProperty

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


## UpdateContactProperty

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


## DeleteContactProperty

`DELETE /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `propertyId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


---

Generated from the Apollo Signal API manifest by Tesseract.

