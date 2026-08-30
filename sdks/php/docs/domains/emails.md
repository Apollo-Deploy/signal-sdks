# EmailsAPI

emails API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/Api/Emails.php)

Client accessor: `$client->emails()`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`sendEmail`](#sendemail) | `POST` | `/v1/emails` | `SendEmailResponse` | — |
| [`getEmail`](#getemail) | `GET` | `/v1/emails/{emailId}` | `EmailDetailResponse` | — |
| [`batchSendEmails`](#batchsendemails) | `POST` | `/v1/emails/batch` | `BatchSendResponse` | — |
| [`cancelEmail`](#cancelemail) | `DELETE` | `/v1/emails/{emailId}` | `CancelResponse` | — |
| [`bulkCancelEmails`](#bulkcancelemails) | `DELETE` | `/v1/emails` | `BulkCancelResponse` | — |
| [`issueStreamToken`](#issuestreamtoken) | `POST` | `/v1/emails/{projectId}/stream/token` | `StreamTokenResponse` | — |
| [`streamEmailEvents`](#streamemailevents) | `GET` | `/v1/emails/stream` | `StreamEventResponse` | — |
| [`validateLinks`](#validatelinks) | `POST` | `/v1/emails/validate` | `ValidateLinksResponse` | — |

## sendEmail

`POST /v1/emails`

### Request body

- Type: `SendEmailRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SendEmailResponse`


## getEmail

`GET /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailDetailResponse`


## batchSendEmails

`POST /v1/emails/batch`

### Request body

- Type: `BatchSendRequest`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `BatchSendResponse`


## cancelEmail

`DELETE /v1/emails/{emailId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `emailId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `CancelResponse`


## bulkCancelEmails

`DELETE /v1/emails`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `BulkCancelResponse`


## issueStreamToken

`POST /v1/emails/{projectId}/stream/token`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `StreamTokenResponse`


## streamEmailEvents

`GET /v1/emails/stream`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `StreamEventResponse`
- Streaming: Server-Sent Events with payload `StreamEventResponse`


## validateLinks

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

