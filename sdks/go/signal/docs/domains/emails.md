# EmailsAPI

emails API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../emails.go)

Client accessor: `client.Emails`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`SendEmail`](#sendemail) | `POST` | `/v1/emails` | `SendEmailResponse` | — |
| [`GetEmail`](#getemail) | `GET` | `/v1/emails/{emailId}` | `EmailDetailResponse` | — |
| [`BatchSendEmails`](#batchsendemails) | `POST` | `/v1/emails/batch` | `BatchSendResponse` | — |
| [`CancelEmail`](#cancelemail) | `DELETE` | `/v1/emails/{emailId}` | `CancelResponse` | — |
| [`BulkCancelEmails`](#bulkcancelemails) | `DELETE` | `/v1/emails` | `BulkCancelResponse` | — |
| [`IssueStreamToken`](#issuestreamtoken) | `POST` | `/v1/emails/{projectId}/stream/token` | `StreamTokenResponse` | — |
| [`StreamEmailEvents`](#streamemailevents) | `GET` | `/v1/emails/stream` | `StreamEventResponse` | — |
| [`ValidateLinks`](#validatelinks) | `POST` | `/v1/emails/validate` | `ValidateLinksResponse` | — |

## SendEmail

`POST /v1/emails`

### Request body

- Type: `SendEmailRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SendEmailResponse`


## GetEmail

`GET /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailDetailResponse`


## BatchSendEmails

`POST /v1/emails/batch`

### Request body

- Type: `BatchSendRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `BatchSendResponse`


## CancelEmail

`DELETE /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `CancelResponse`


## BulkCancelEmails

`DELETE /v1/emails`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `BulkCancelResponse`


## IssueStreamToken

`POST /v1/emails/{projectId}/stream/token`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `StreamTokenResponse`


## StreamEmailEvents

`GET /v1/emails/stream`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `StreamEventResponse`
- Streaming: Server-Sent Events with payload `StreamEventResponse`


## ValidateLinks

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

