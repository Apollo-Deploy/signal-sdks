# WebhooksAPI

webhooks API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/webhooks.cs)

Client accessor: `client.Webhooks`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListWebhooksAsync`](#listwebhooksasync) | `GET` | `/v1/projects/{projectId}/webhooks` | `WebhookPageResponse` | — |
| [`GetWebhookAsync`](#getwebhookasync) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `WebhookResponse` | — |
| [`ListWebhookDeliveriesAsync`](#listwebhookdeliveriesasync) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries` | `WebhookDeliveryPageResponse` | — |
| [`GetWebhookDeliveryAsync`](#getwebhookdeliveryasync) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}` | `WebhookDeliveryResponse` | — |
| [`CreateWebhookAsync`](#createwebhookasync) | `POST` | `/v1/projects/{projectId}/webhooks` | `WebhookCreateResponse` | — |
| [`UpdateWebhookAsync`](#updatewebhookasync) | `PATCH` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `WebhookResponse` | — |
| [`DeleteWebhookAsync`](#deletewebhookasync) | `DELETE` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `void` | — |
| [`TestWebhookAsync`](#testwebhookasync) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/test` | `WebhookDeliveryResponse` | — |
| [`ReplayWebhookDeliveryAsync`](#replaywebhookdeliveryasync) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}` | `void` | — |

## ListWebhooksAsync

`GET /v1/projects/{projectId}/webhooks`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookPageResponse`


## GetWebhookAsync

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


## ListWebhookDeliveriesAsync

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


## GetWebhookDeliveryAsync

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


## CreateWebhookAsync

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


## UpdateWebhookAsync

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


## DeleteWebhookAsync

`DELETE /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `endpointId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


## TestWebhookAsync

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


## ReplayWebhookDeliveryAsync

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
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

