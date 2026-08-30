# ContactsAPI

contacts API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/contacts.cs)

Client accessor: `client.Contacts`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListContactsAsync`](#listcontactsasync) | `GET` | `/v1/projects/{projectId}/contacts` | `ContactPageResponse` | — |
| [`GetContactAsync`](#getcontactasync) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}` | `ContactResponse` | — |
| [`ListContactSegmentsAsync`](#listcontactsegmentsasync) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/segments` | `List<string>` | — |
| [`GetContactTopicsAsync`](#getcontacttopicsasync) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/topics` | `List<TopicSubscriptionResponse>` | — |
| [`CreateContactAsync`](#createcontactasync) | `POST` | `/v1/projects/{projectId}/contacts` | `ContactResponse` | — |
| [`UpdateContactAsync`](#updatecontactasync) | `PATCH` | `/v1/projects/{projectId}/contacts/{contactId}` | `ContactResponse` | — |
| [`DeleteContactAsync`](#deletecontactasync) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}` | `void` | — |
| [`UploadContactImageAsync`](#uploadcontactimageasync) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `ContactResponse` | — |
| [`SetContactImageUrlAsync`](#setcontactimageurlasync) | `PUT` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `ContactResponse` | — |
| [`DeleteContactImageAsync`](#deletecontactimageasync) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `void` | — |
| [`AddContactToSegmentAsync`](#addcontacttosegmentasync) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/segments` | `void` | — |
| [`RemoveContactFromSegmentAsync`](#removecontactfromsegmentasync) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}/segments/{segmentId}` | `void` | — |
| [`UpdateContactTopicsAsync`](#updatecontacttopicsasync) | `PATCH` | `/v1/projects/{projectId}/contacts/{contactId}/topics` | `void` | — |
| [`GetContactActivityAsync`](#getcontactactivityasync) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/activity` | `List<ActivityResponse>` | — |
| [`GetContactEngagementScoreAsync`](#getcontactengagementscoreasync) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/engagement` | `EngagementScoreResponse` | — |
| [`GetContactEmailValidationStatusAsync`](#getcontactemailvalidationstatusasync) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/email-validation` | `EmailValidationStatusResponse` | — |
| [`RefreshContactEngagementScoreAsync`](#refreshcontactengagementscoreasync) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/engagement/refresh` | `EngagementScoreResponse` | — |
| [`RecordContactEmailValidationAsync`](#recordcontactemailvalidationasync) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/email-validation` | `void` | — |

## ListContactsAsync

`GET /v1/projects/{projectId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPageResponse`


## GetContactAsync

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


## ListContactSegmentsAsync

`GET /v1/projects/{projectId}/contacts/{contactId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `List<string>`


## GetContactTopicsAsync

`GET /v1/projects/{projectId}/contacts/{contactId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `List<TopicSubscriptionResponse>`


## CreateContactAsync

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


## UpdateContactAsync

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


## DeleteContactAsync

`DELETE /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## UploadContactImageAsync

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


## SetContactImageUrlAsync

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


## DeleteContactImageAsync

`DELETE /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## AddContactToSegmentAsync

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
- Type: `void`


## RemoveContactFromSegmentAsync

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
- Type: `void`


## UpdateContactTopicsAsync

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
- Type: `void`


## GetContactActivityAsync

`GET /v1/projects/{projectId}/contacts/{contactId}/activity`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `contactId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `List<ActivityResponse>`


## GetContactEngagementScoreAsync

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


## GetContactEmailValidationStatusAsync

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


## RefreshContactEngagementScoreAsync

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


## RecordContactEmailValidationAsync

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
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

