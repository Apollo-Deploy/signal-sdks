# EmailsAPI

emails API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/emails.cs)

Client accessor: `client.Emails`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`SendEmailAsync`](#sendemailasync) | `POST` | `/v1/emails` | `SendEmailResponse` | — |
| [`GetEmailAsync`](#getemailasync) | `GET` | `/v1/emails/{emailId}` | `EmailDetailResponse` | — |
| [`BatchSendEmailsAsync`](#batchsendemailsasync) | `POST` | `/v1/emails/batch` | `BatchSendResponse` | — |
| [`CancelEmailAsync`](#cancelemailasync) | `DELETE` | `/v1/emails/{emailId}` | `CancelResponse` | — |
| [`BulkCancelEmailsAsync`](#bulkcancelemailsasync) | `DELETE` | `/v1/emails` | `BulkCancelResponse` | — |
| [`IssueStreamTokenAsync`](#issuestreamtokenasync) | `POST` | `/v1/emails/{projectId}/stream/token` | `StreamTokenResponse` | — |
| [`StreamEmailEventsAsync`](#streamemaileventsasync) | `GET` | `/v1/emails/stream` | `StreamEventResponse` | — |
| [`ValidateLinksAsync`](#validatelinksasync) | `POST` | `/v1/emails/validate` | `ValidateLinksResponse` | — |

## SendEmailAsync

`POST /v1/emails`

### Request body

- Type: `SendEmailRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SendEmailResponse`


## GetEmailAsync

`GET /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailDetailResponse`


## BatchSendEmailsAsync

`POST /v1/emails/batch`

### Request body

- Type: `BatchSendRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `BatchSendResponse`


## CancelEmailAsync

`DELETE /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `CancelResponse`


## BulkCancelEmailsAsync

`DELETE /v1/emails`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `BulkCancelResponse`


## IssueStreamTokenAsync

`POST /v1/emails/{projectId}/stream/token`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `StreamTokenResponse`


## StreamEmailEventsAsync

`GET /v1/emails/stream`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `StreamEventResponse`
- Streaming: Server-Sent Events with payload `StreamEventResponse`


## ValidateLinksAsync

`POST /v1/emails/validate`

### Request body

- Type: `ValidateLinksRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ValidateLinksResponse`


---

Generated from the Apollo Signal API manifest by Tesseract.

