# ContactPropertiesAPI

contactProperties API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/contact_properties.ex)

Client accessor: `ApolloSignal.Client.contact_properties(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_contact_properties`](#list-contact-properties) | `GET` | `/v1/projects/{projectId}/contact-properties` | `ApolloSignal.Types.ContactPropertyPageResponse.t()` | — |
| [`get_contact_property`](#get-contact-property) | `GET` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ApolloSignal.Types.ContactPropertyResponse.t()` | — |
| [`create_contact_property`](#create-contact-property) | `POST` | `/v1/projects/{projectId}/contact-properties` | `ApolloSignal.Types.ContactPropertyResponse.t()` | — |
| [`update_contact_property`](#update-contact-property) | `PATCH` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `ApolloSignal.Types.ContactPropertyResponse.t()` | — |
| [`delete_contact_property`](#delete-contact-property) | `DELETE` | `/v1/projects/{projectId}/contact-properties/{propertyId}` | `nil` | — |

## list_contact_properties

`GET /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ContactPropertyPageResponse.t()`


## get_contact_property

`GET /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `propertyId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ContactPropertyResponse.t()`


## create_contact_property

`POST /v1/projects/{projectId}/contact-properties`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.CreateContactPropertyBody.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ContactPropertyResponse.t()`


## update_contact_property

`PATCH /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `propertyId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.UpdateContactPropertyBody.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ContactPropertyResponse.t()`


## delete_contact_property

`DELETE /v1/projects/{projectId}/contact-properties/{propertyId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `propertyId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


---

Generated from the Apollo Signal API manifest by Tesseract.

