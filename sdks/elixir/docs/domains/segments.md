# SegmentsAPI

segments API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/segments.ex)

Client accessor: `ApolloSignal.Client.segments(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_segments`](#list-segments) | `GET` | `/v1/projects/{projectId}/segments` | `ApolloSignal.Types.SegmentPageResponse.t()` | — |
| [`get_segment`](#get-segment) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}` | `ApolloSignal.Types.SegmentResponse.t()` | — |
| [`list_contacts_in_segment`](#list-contacts-in-segment) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}/contacts` | `ApolloSignal.Types.CursorPage.t()` | — |
| [`create_segment`](#create-segment) | `POST` | `/v1/projects/{projectId}/segments` | `ApolloSignal.Types.SegmentResponse.t()` | — |
| [`delete_segment`](#delete-segment) | `DELETE` | `/v1/projects/{projectId}/segments/{segmentId}` | `nil` | — |

## list_segments

`GET /v1/projects/{projectId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.SegmentPageResponse.t()`


## get_segment

`GET /v1/projects/{projectId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `segmentId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.SegmentResponse.t()`


## list_contacts_in_segment

`GET /v1/projects/{projectId}/segments/{segmentId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `segmentId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.CursorPage.t()`


## create_segment

`POST /v1/projects/{projectId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |

### Request body

- Type: `ApolloSignal.Types.CreateSegmentBody.t()`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.SegmentResponse.t()`


## delete_segment

`DELETE /v1/projects/{projectId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String.t()` | Yes | — |
| `segmentId` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `nil`


---

Generated from the Apollo Signal API manifest by Tesseract.

