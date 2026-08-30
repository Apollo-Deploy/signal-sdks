# ContactsAPI

contacts API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../contacts.go)

Client accessor: `client.Contacts`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListContacts`](#listcontacts) | `GET` | `/v1/projects/{projectId}/contacts` | `ContactPageResponse` | — |
| [`GetContact`](#getcontact) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}` | `ContactResponse` | — |
| [`ListContactSegments`](#listcontactsegments) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/segments` | `ListContactSegmentsResponse` | — |
| [`GetContactTopics`](#getcontacttopics) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/topics` | `GetContactTopicsResponse` | — |
| [`CreateContact`](#createcontact) | `POST` | `/v1/projects/{projectId}/contacts` | `ContactResponse` | — |
| [`UpdateContact`](#updatecontact) | `PATCH` | `/v1/projects/{projectId}/contacts/{contactId}` | `ContactResponse` | — |
| [`DeleteContact`](#deletecontact) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}` | `struct{}` | — |
| [`UploadContactImage`](#uploadcontactimage) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `ContactResponse` | — |
| [`SetContactImageUrl`](#setcontactimageurl) | `PUT` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `ContactResponse` | — |
| [`DeleteContactImage`](#deletecontactimage) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `struct{}` | — |
| [`AddContactToSegment`](#addcontacttosegment) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/segments` | `struct{}` | — |
| [`RemoveContactFromSegment`](#removecontactfromsegment) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}/segments/{segmentId}` | `struct{}` | — |
| [`UpdateContactTopics`](#updatecontacttopics) | `PATCH` | `/v1/projects/{projectId}/contacts/{contactId}/topics` | `struct{}` | — |
| [`GetContactActivity`](#getcontactactivity) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/activity` | `GetContactActivityResponse` | — |
| [`GetContactEngagementScore`](#getcontactengagementscore) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/engagement` | `EngagementScoreResponse` | — |
| [`GetContactEmailValidationStatus`](#getcontactemailvalidationstatus) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/email-validation` | `EmailValidationStatusResponse` | — |
| [`RefreshContactEngagementScore`](#refreshcontactengagementscore) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/engagement/refresh` | `EngagementScoreResponse` | — |
| [`RecordContactEmailValidation`](#recordcontactemailvalidation) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/email-validation` | `struct{}` | — |

## ListContacts

`GET /v1/projects/{projectId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPageResponse`


## GetContact

`GET /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## ListContactSegments

`GET /v1/projects/{projectId}/contacts/{contactId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ListContactSegmentsResponse`


## GetContactTopics

`GET /v1/projects/{projectId}/contacts/{contactId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `GetContactTopicsResponse`


## CreateContact

`POST /v1/projects/{projectId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Request body

- Type: `CreateContactBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## UpdateContact

`PATCH /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Request body

- Type: `UpdateContactBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## DeleteContact

`DELETE /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


## UploadContactImage

`POST /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## SetContactImageUrl

`PUT /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Request body

- Type: `SetImageUrlBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## DeleteContactImage

`DELETE /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


## AddContactToSegment

`POST /v1/projects/{projectId}/contacts/{contactId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Request body

- Type: `AddToSegmentBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


## RemoveContactFromSegment

`DELETE /v1/projects/{projectId}/contacts/{contactId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |
| `segmentId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


## UpdateContactTopics

`PATCH /v1/projects/{projectId}/contacts/{contactId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Request body

- Type: `UpdateTopicsBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


## GetContactActivity

`GET /v1/projects/{projectId}/contacts/{contactId}/activity`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `GetContactActivityResponse`


## GetContactEngagementScore

`GET /v1/projects/{projectId}/contacts/{contactId}/engagement`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EngagementScoreResponse`


## GetContactEmailValidationStatus

`GET /v1/projects/{projectId}/contacts/{contactId}/email-validation`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailValidationStatusResponse`


## RefreshContactEngagementScore

`POST /v1/projects/{projectId}/contacts/{contactId}/engagement/refresh`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EngagementScoreResponse`


## RecordContactEmailValidation

`POST /v1/projects/{projectId}/contacts/{contactId}/email-validation`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Request body

- Type: `RecordValidationBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


---

Generated from the Apollo Signal API manifest by Tesseract.

