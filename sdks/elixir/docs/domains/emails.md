# EmailsAPI

emails API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/emails.ex)

Client accessor: `ApolloSignal.Client.emails(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`send_email`](#send-email) | `POST` | `/v1/emails` | `ApolloSignal.Types.SendEmailResponse.t()` | — |
| [`get_email`](#get-email) | `GET` | `/v1/emails/{emailId}` | `ApolloSignal.Types.EmailDetailResponse.t()` | — |
| [`batch_send_emails`](#batch-send-emails) | `POST` | `/v1/emails/batch` | `ApolloSignal.Types.BatchSendResponse.t()` | — |
| [`cancel_email`](#cancel-email) | `DELETE` | `/v1/emails/{emailId}` | `ApolloSignal.Types.CancelResponse.t()` | — |
| [`bulk_cancel_emails`](#bulk-cancel-emails) | `DELETE` | `/v1/emails` | `ApolloSignal.Types.BulkCancelResponse.t()` | — |
| [`issue_stream_token`](#issue-stream-token) | `POST` | `/v1/emails/{projectId}/stream/token` | `ApolloSignal.Types.StreamTokenResponse.t()` | — |
| [`stream_email_events`](#stream-email-events) | `GET` | `/v1/emails/stream` | `ApolloSignal.Types.StreamEventResponse.t()` | — |
| [`validate_links`](#validate-links) | `POST` | `/v1/emails/validate` | `ApolloSignal.Types.ValidateLinksResponse.t()` | — |

## send_email

`POST /v1/emails`

### Request body

- Type: `ApolloSignal.Types.SendEmailRequest.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.SendEmailResponse.t()`


## get_email

`GET /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.EmailDetailResponse.t()`


## batch_send_emails

`POST /v1/emails/batch`

### Request body

- Type: `ApolloSignal.Types.BatchSendRequest.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.BatchSendResponse.t()`


## cancel_email

`DELETE /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.CancelResponse.t()`


## bulk_cancel_emails

`DELETE /v1/emails`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.BulkCancelResponse.t()`


## issue_stream_token

`POST /v1/emails/{projectId}/stream/token`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.StreamTokenResponse.t()`


## stream_email_events

`GET /v1/emails/stream`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.StreamEventResponse.t()`
- Streaming: Server-Sent Events with payload `ApolloSignal.Types.StreamEventResponse.t()`


## validate_links

`POST /v1/emails/validate`

### Request body

- Type: `ApolloSignal.Types.ValidateLinksRequest.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ValidateLinksResponse.t()`


---

Generated from the Apollo Signal API manifest by Tesseract.

