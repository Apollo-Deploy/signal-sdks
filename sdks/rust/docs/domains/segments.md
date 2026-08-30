# SegmentsAPI

segments API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/api/segments.rs)

Client accessor: `client.segments`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`list_segments`](#list-segments) | `GET` | `/v1/projects/{projectId}/segments` | `SegmentPageResponse` | — |
| [`get_segment`](#get-segment) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}` | `SegmentResponse` | — |
| [`list_contacts_in_segment`](#list-contacts-in-segment) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}/contacts` | `CursorPage` | — |
| [`create_segment`](#create-segment) | `POST` | `/v1/projects/{projectId}/segments` | `SegmentResponse` | — |
| [`delete_segment`](#delete-segment) | `DELETE` | `/v1/projects/{projectId}/segments/{segmentId}` | `()` | — |

## list_segments

`GET /v1/projects/{projectId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SegmentPageResponse`


## get_segment

`GET /v1/projects/{projectId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `segmentId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SegmentResponse`


## list_contacts_in_segment

`GET /v1/projects/{projectId}/segments/{segmentId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `segmentId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `CursorPage`


## create_segment

`POST /v1/projects/{projectId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |

### Request body

- Type: `CreateSegmentBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SegmentResponse`


## delete_segment

`DELETE /v1/projects/{projectId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `String` | Yes | — |
| `segmentId` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `()`


---

Generated from the Apollo Signal API manifest by Tesseract.

