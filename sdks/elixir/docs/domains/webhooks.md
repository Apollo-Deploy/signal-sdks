# WebhooksAPI

webhooks API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/webhooks.ex)

Client accessor: `ApolloSignal.Client.webhooks(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_webhooks`](#list-webhooks) | `GET` | `/v1/projects/{projectId}/webhooks` | `ApolloSignal.Types.WebhookPageResponse.t()` | — |
| [`get_webhook`](#get-webhook) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `ApolloSignal.Types.WebhookResponse.t()` | — |
| [`list_webhook_deliveries`](#list-webhook-deliveries) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries` | `ApolloSignal.Types.WebhookDeliveryPageResponse.t()` | — |
| [`get_webhook_delivery`](#get-webhook-delivery) | `GET` | `/v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}` | `ApolloSignal.Types.WebhookDeliveryResponse.t()` | — |
| [`create_webhook`](#create-webhook) | `POST` | `/v1/projects/{projectId}/webhooks` | `ApolloSignal.Types.WebhookCreateResponse.t()` | — |
| [`update_webhook`](#update-webhook) | `PATCH` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `ApolloSignal.Types.WebhookResponse.t()` | — |
| [`delete_webhook`](#delete-webhook) | `DELETE` | `/v1/projects/{projectId}/webhooks/{endpointId}` | `nil` | — |
| [`test_webhook`](#test-webhook) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/test` | `ApolloSignal.Types.WebhookDeliveryResponse.t()` | — |
| [`replay_webhook_delivery`](#replay-webhook-delivery) | `POST` | `/v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}` | `nil` | — |

## list_webhooks

`GET /v1/projects/{projectId}/webhooks`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.WebhookPageResponse.t()`


## get_webhook

`GET /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `endpointId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.WebhookResponse.t()`


## list_webhook_deliveries

`GET /v1/projects/{projectId}/webhooks/{endpointId}/deliveries`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `endpointId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.WebhookDeliveryPageResponse.t()`


## get_webhook_delivery

`GET /v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `endpointId` | Path | `String.t()` | Yes | — |
| `deliveryId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.WebhookDeliveryResponse.t()`


## create_webhook

`POST /v1/projects/{projectId}/webhooks`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.CreateWebhookBody.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.WebhookCreateResponse.t()`


## update_webhook

`PATCH /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `endpointId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.UpdateWebhookBody.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.WebhookResponse.t()`


## delete_webhook

`DELETE /v1/projects/{projectId}/webhooks/{endpointId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `endpointId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


## test_webhook

`POST /v1/projects/{projectId}/webhooks/{endpointId}/test`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `endpointId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `202`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.WebhookDeliveryResponse.t()`


## replay_webhook_delivery

`POST /v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `endpointId` | Path | `String.t()` | Yes | — |
| `deliveryId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


---

Generated from the Apollo Signal API manifest by Tesseract.

