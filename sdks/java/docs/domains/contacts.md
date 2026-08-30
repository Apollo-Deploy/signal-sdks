# ContactsAPI

contacts API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/main/java/com/apollodeploy/signal/sdk/api/ContactsAPI.java)

Client accessor: `ApolloSignalApiClient.contacts()`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listContacts`](#listcontacts) | `GET` | `/v1/projects/{projectId}/contacts` | `ContactPageResponse` | — |
| [`getContact`](#getcontact) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}` | `ContactResponse` | — |
| [`listContactSegments`](#listcontactsegments) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/segments` | `ListContactSegmentsResponse` | — |
| [`getContactTopics`](#getcontacttopics) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/topics` | `GetContactTopicsResponse` | — |
| [`createContact`](#createcontact) | `POST` | `/v1/projects/{projectId}/contacts` | `ContactResponse` | — |
| [`updateContact`](#updatecontact) | `PATCH` | `/v1/projects/{projectId}/contacts/{contactId}` | `ContactResponse` | — |
| [`deleteContact`](#deletecontact) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}` | `void` | — |
| [`uploadContactImage`](#uploadcontactimage) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `ContactResponse` | — |
| [`setContactImageUrl`](#setcontactimageurl) | `PUT` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `ContactResponse` | — |
| [`deleteContactImage`](#deletecontactimage) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `void` | — |
| [`addContactToSegment`](#addcontacttosegment) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/segments` | `void` | — |
| [`removeContactFromSegment`](#removecontactfromsegment) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}/segments/{segmentId}` | `void` | — |
| [`updateContactTopics`](#updatecontacttopics) | `PATCH` | `/v1/projects/{projectId}/contacts/{contactId}/topics` | `void` | — |
| [`getContactActivity`](#getcontactactivity) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/activity` | `GetContactActivityResponse` | — |
| [`getContactEngagementScore`](#getcontactengagementscore) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/engagement` | `EngagementScoreResponse` | — |
| [`getContactEmailValidationStatus`](#getcontactemailvalidationstatus) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/email-validation` | `EmailValidationStatusResponse` | — |
| [`refreshContactEngagementScore`](#refreshcontactengagementscore) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/engagement/refresh` | `EngagementScoreResponse` | — |
| [`recordContactEmailValidation`](#recordcontactemailvalidation) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/email-validation` | `void` | — |

## listContacts

`GET /v1/projects/{projectId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPageResponse`


## getContact

`GET /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## listContactSegments

`GET /v1/projects/{projectId}/contacts/{contactId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ListContactSegmentsResponse`


## getContactTopics

`GET /v1/projects/{projectId}/contacts/{contactId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `GetContactTopicsResponse`


## createContact

`POST /v1/projects/{projectId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Request body

- Type: `CreateContactBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## updateContact

`PATCH /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Request body

- Type: `UpdateContactBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## deleteContact

`DELETE /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## uploadContactImage

`POST /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## setContactImageUrl

`PUT /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Request body

- Type: `SetImageUrlBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## deleteContactImage

`DELETE /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## addContactToSegment

`POST /v1/projects/{projectId}/contacts/{contactId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Request body

- Type: `AddToSegmentBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## removeContactFromSegment

`DELETE /v1/projects/{projectId}/contacts/{contactId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |
| `segmentId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## updateContactTopics

`PATCH /v1/projects/{projectId}/contacts/{contactId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Request body

- Type: `UpdateTopicsBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## getContactActivity

`GET /v1/projects/{projectId}/contacts/{contactId}/activity`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `GetContactActivityResponse`


## getContactEngagementScore

`GET /v1/projects/{projectId}/contacts/{contactId}/engagement`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EngagementScoreResponse`


## getContactEmailValidationStatus

`GET /v1/projects/{projectId}/contacts/{contactId}/email-validation`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailValidationStatusResponse`


## refreshContactEngagementScore

`POST /v1/projects/{projectId}/contacts/{contactId}/engagement/refresh`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EngagementScoreResponse`


## recordContactEmailValidation

`POST /v1/projects/{projectId}/contacts/{contactId}/email-validation`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `contactId` | Path | `String` | Yes | — |

### Request body

- Type: `RecordValidationBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

