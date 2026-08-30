# WebhooksAPI

webhooks API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../webhooks.go)

Client accessor: `client.Webhooks`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListWebhooks`](#listwebhooks) | `GET` | `/v1/projects/{projectId}/webhooks` | `WebhookPageResponse` | — |
| [`GetWebhook`](#getwebhook) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `WebhookResponse` | — |
| [`ListWebhookDeliveries`](#listwebhookdeliveries) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries` | `WebhookDeliveryPageResponse` | — |
| [`GetWebhookDelivery`](#getwebhookdelivery) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}` | `WebhookDeliveryResponse` | — |
| [`CreateWebhook`](#createwebhook) | `POST` | `/v1/projects/{projectId}/webhooks` | `WebhookCreateResponse` | — |
| [`UpdateWebhook`](#updatewebhook) | `PATCH` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `WebhookResponse` | — |
| [`DeleteWebhook`](#deletewebhook) | `DELETE` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `struct{}` | — |
| [`TestWebhook`](#testwebhook) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/test` | `WebhookDeliveryResponse` | — |
| [`ReplayWebhookDelivery`](#replaywebhookdelivery) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}` | `struct{}` | — |

## ListWebhooks

`GET /v1/projects/{projectId}/webhooks`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookPageResponse`


## GetWebhook

`GET /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `endpointId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookResponse`


## ListWebhookDeliveries

`GET /v1/projects/{projectId}/webhooks/{endpointId}/deliveries`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `endpointId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookDeliveryPageResponse`


## GetWebhookDelivery

`GET /v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `endpointId` | Path | `string` | Yes | — |
| `deliveryId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookDeliveryResponse`


## CreateWebhook

`POST /v1/projects/{projectId}/webhooks`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Request body

- Type: `CreateWebhookBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookCreateResponse`


## UpdateWebhook

`PATCH /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `endpointId` | Path | `string` | Yes | — |

### Request body

- Type: `UpdateWebhookBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookResponse`


## DeleteWebhook

`DELETE /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `endpointId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


## TestWebhook

`POST /v1/projects/{projectId}/webhooks/{endpointId}/test`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `endpointId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `202`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookDeliveryResponse`


## ReplayWebhookDelivery

`POST /v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `endpointId` | Path | `string` | Yes | — |
| `deliveryId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


---

Generated from the Apollo Signal API manifest by Tesseract.

