# WebhooksAPI

webhooks API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_deploy_signal_sdk_rails/resources/webhooks.rb)

Client accessor: `client.webhooks`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_webhooks`](#list-webhooks) | `GET` | `/v1/projects/{projectId}/webhooks` | `WebhookPageResponse` | — |
| [`get_webhook`](#get-webhook) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `WebhookResponse` | — |
| [`list_webhook_deliveries`](#list-webhook-deliveries) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries` | `WebhookDeliveryPageResponse` | — |
| [`get_webhook_delivery`](#get-webhook-delivery) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}` | `WebhookDeliveryResponse` | — |
| [`create_webhook`](#create-webhook) | `POST` | `/v1/projects/{projectId}/webhooks` | `WebhookCreateResponse` | — |
| [`update_webhook`](#update-webhook) | `PATCH` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `WebhookResponse` | — |
| [`delete_webhook`](#delete-webhook) | `DELETE` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `nil` | — |
| [`test_webhook`](#test-webhook) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/test` | `WebhookDeliveryResponse` | — |
| [`replay_webhook_delivery`](#replay-webhook-delivery) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}` | `nil` | — |

## list_webhooks

`GET /v1/projects/{projectId}/webhooks`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookPageResponse`


## get_webhook

`GET /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `endpointId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookResponse`


## list_webhook_deliveries

`GET /v1/projects/{projectId}/webhooks/{endpointId}/deliveries`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `endpointId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookDeliveryPageResponse`


## get_webhook_delivery

`GET /v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `endpointId` | Path | `String` | Yes | — |
| `deliveryId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookDeliveryResponse`


## create_webhook

`POST /v1/projects/{projectId}/webhooks`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Request body

- Type: `CreateWebhookBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookCreateResponse`


## update_webhook

`PATCH /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `endpointId` | Path | `String` | Yes | — |

### Request body

- Type: `UpdateWebhookBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookResponse`


## delete_webhook

`DELETE /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `endpointId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


## test_webhook

`POST /v1/projects/{projectId}/webhooks/{endpointId}/test`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `endpointId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `202`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `WebhookDeliveryResponse`


## replay_webhook_delivery

`POST /v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `endpointId` | Path | `String` | Yes | — |
| `deliveryId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


---

Generated from the Apollo Signal API manifest by Tesseract.

