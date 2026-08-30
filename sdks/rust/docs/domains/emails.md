# EmailsAPI

emails API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/api/emails.rs)

Client accessor: `client.emails`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`send_email`](#send-email) | `POST` | `/v1/emails` | `SendEmailResponse` | — |
| [`get_email`](#get-email) | `GET` | `/v1/emails/{emailId}` | `EmailDetailResponse` | — |
| [`batch_send_emails`](#batch-send-emails) | `POST` | `/v1/emails/batch` | `BatchSendResponse` | — |
| [`cancel_email`](#cancel-email) | `DELETE` | `/v1/emails/{emailId}` | `CancelResponse` | — |
| [`bulk_cancel_emails`](#bulk-cancel-emails) | `DELETE` | `/v1/emails` | `BulkCancelResponse` | — |
| [`issue_stream_token`](#issue-stream-token) | `POST` | `/v1/emails/{projectId}/stream/token` | `StreamTokenResponse` | — |
| [`stream_email_events`](#stream-email-events) | `GET` | `/v1/emails/stream` | `StreamEventResponse` | — |
| [`validate_links`](#validate-links) | `POST` | `/v1/emails/validate` | `ValidateLinksResponse` | — |

## send_email

`POST /v1/emails`

### Request body

- Type: `SendEmailRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SendEmailResponse`


## get_email

`GET /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailDetailResponse`


## batch_send_emails

`POST /v1/emails/batch`

### Request body

- Type: `BatchSendRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `BatchSendResponse`


## cancel_email

`DELETE /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `CancelResponse`


## bulk_cancel_emails

`DELETE /v1/emails`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `BulkCancelResponse`


## issue_stream_token

`POST /v1/emails/{projectId}/stream/token`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `StreamTokenResponse`


## stream_email_events

`GET /v1/emails/stream`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `StreamEventResponse`
- Streaming: Server-Sent Events with payload `StreamEventResponse`


## validate_links

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

