# ContactsAPI

contacts API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../apollo_deploy_signal_sdk/resources/contacts.py)

Client accessor: `client.contacts`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_contacts`](#list-contacts) | `GET` | `/v1/projects/{projectId}/contacts` | `ContactPageResponse` | — |
| [`get_contact`](#get-contact) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}` | `ContactResponse` | — |
| [`list_contact_segments`](#list-contact-segments) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/segments` | `ListContactSegmentsResponse` | — |
| [`get_contact_topics`](#get-contact-topics) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/topics` | `GetContactTopicsResponse` | — |
| [`create_contact`](#create-contact) | `POST` | `/v1/projects/{projectId}/contacts` | `ContactResponse` | — |
| [`update_contact`](#update-contact) | `PATCH` | `/v1/projects/{projectId}/contacts/{contactId}` | `ContactResponse` | — |
| [`delete_contact`](#delete-contact) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}` | `None` | — |
| [`upload_contact_image`](#upload-contact-image) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `ContactResponse` | — |
| [`set_contact_image_url`](#set-contact-image-url) | `PUT` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `ContactResponse` | — |
| [`delete_contact_image`](#delete-contact-image) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}/image` | `None` | — |
| [`add_contact_to_segment`](#add-contact-to-segment) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/segments` | `None` | — |
| [`remove_contact_from_segment`](#remove-contact-from-segment) | `DELETE` | `/v1/projects/{projectId}/contacts/{contactId}/segments/{segmentId}` | `None` | — |
| [`update_contact_topics`](#update-contact-topics) | `PATCH` | `/v1/projects/{projectId}/contacts/{contactId}/topics` | `None` | — |
| [`get_contact_activity`](#get-contact-activity) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/activity` | `GetContactActivityResponse` | — |
| [`get_contact_engagement_score`](#get-contact-engagement-score) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/engagement` | `EngagementScoreResponse` | — |
| [`get_contact_email_validation_status`](#get-contact-email-validation-status) | `GET` | `/v1/projects/{projectId}/contacts/{contactId}/email-validation` | `EmailValidationStatusResponse` | — |
| [`refresh_contact_engagement_score`](#refresh-contact-engagement-score) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/engagement/refresh` | `EngagementScoreResponse` | — |
| [`record_contact_email_validation`](#record-contact-email-validation) | `POST` | `/v1/projects/{projectId}/contacts/{contactId}/email-validation` | `None` | — |

## list_contacts

`GET /v1/projects/{projectId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactPageResponse`


## get_contact

`GET /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## list_contact_segments

`GET /v1/projects/{projectId}/contacts/{contactId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ListContactSegmentsResponse`


## get_contact_topics

`GET /v1/projects/{projectId}/contacts/{contactId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `GetContactTopicsResponse`


## create_contact

`POST /v1/projects/{projectId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |

### Request body

- Type: `CreateContactBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## update_contact

`PATCH /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Request body

- Type: `UpdateContactBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## delete_contact

`DELETE /v1/projects/{projectId}/contacts/{contactId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `None`


## upload_contact_image

`POST /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## set_contact_image_url

`PUT /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Request body

- Type: `SetImageUrlBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ContactResponse`


## delete_contact_image

`DELETE /v1/projects/{projectId}/contacts/{contactId}/image`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `None`


## add_contact_to_segment

`POST /v1/projects/{projectId}/contacts/{contactId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Request body

- Type: `AddToSegmentBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `None`


## remove_contact_from_segment

`DELETE /v1/projects/{projectId}/contacts/{contactId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |
| `segmentId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `None`


## update_contact_topics

`PATCH /v1/projects/{projectId}/contacts/{contactId}/topics`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Request body

- Type: `UpdateTopicsBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `None`


## get_contact_activity

`GET /v1/projects/{projectId}/contacts/{contactId}/activity`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `GetContactActivityResponse`


## get_contact_engagement_score

`GET /v1/projects/{projectId}/contacts/{contactId}/engagement`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EngagementScoreResponse`


## get_contact_email_validation_status

`GET /v1/projects/{projectId}/contacts/{contactId}/email-validation`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailValidationStatusResponse`


## refresh_contact_engagement_score

`POST /v1/projects/{projectId}/contacts/{contactId}/engagement/refresh`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EngagementScoreResponse`


## record_contact_email_validation

`POST /v1/projects/{projectId}/contacts/{contactId}/email-validation`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `str` | Yes | — |
| `contactId` | Path | `str` | Yes | — |

### Request body

- Type: `RecordValidationBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `None`


---

Generated from the Apollo Signal API manifest by Tesseract.

