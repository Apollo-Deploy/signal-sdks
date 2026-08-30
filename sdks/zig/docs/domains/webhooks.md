# WebhooksAPI

webhooks API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/domain/webhooks.zig)

Client accessor: `client.webhooks()`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listWebhooks`](#listwebhooks) | `GET` | `/v1/projects/{projectId}/webhooks` | `WebhookPageResponse` | — |
| [`getWebhook`](#getwebhook) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `WebhookResponse` | — |
| [`listWebhookDeliveries`](#listwebhookdeliveries) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries` | `WebhookDeliveryPageResponse` | — |
| [`getWebhookDelivery`](#getwebhookdelivery) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}` | `WebhookDeliveryResponse` | — |
| [`createWebhook`](#createwebhook) | `POST` | `/v1/projects/{projectId}/webhooks` | `WebhookCreateResponse` | — |
| [`updateWebhook`](#updatewebhook) | `PATCH` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `WebhookResponse` | — |
| [`deleteWebhook`](#deletewebhook) | `DELETE` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `void` | — |
| [`testWebhook`](#testwebhook) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/test` | `WebhookDeliveryResponse` | — |
| [`replayWebhookDelivery`](#replaywebhookdelivery) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}` | `void` | — |

## listWebhooks

`GET /v1/projects/{projectId}/webhooks`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookPageResponse`


## getWebhook

`GET /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `endpointId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookResponse`


## listWebhookDeliveries

`GET /v1/projects/{projectId}/webhooks/{endpointId}/deliveries`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `endpointId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookDeliveryPageResponse`


## getWebhookDelivery

`GET /v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `endpointId` | Path | `[]const u8` | Yes | — |
| `deliveryId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookDeliveryResponse`


## createWebhook

`POST /v1/projects/{projectId}/webhooks`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |

### Request body

- Type: `CreateWebhookBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookCreateResponse`


## updateWebhook

`PATCH /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `endpointId` | Path | `[]const u8` | Yes | — |

### Request body

- Type: `UpdateWebhookBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookResponse`


## deleteWebhook

`DELETE /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `endpointId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## testWebhook

`POST /v1/projects/{projectId}/webhooks/{endpointId}/test`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `endpointId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `202`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookDeliveryResponse`


## replayWebhookDelivery

`POST /v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `[]const u8` | Yes | — |
| `endpointId` | Path | `[]const u8` | Yes | — |
| `deliveryId` | Path | `[]const u8` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

