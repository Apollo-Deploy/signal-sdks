# SegmentsAPI

segments API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/segments.cs)

Client accessor: `client.Segments`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListSegmentsAsync`](#listsegmentsasync) | `GET` | `/v1/projects/{projectId}/segments` | `SegmentPageResponse` | — |
| [`GetSegmentAsync`](#getsegmentasync) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}` | `SegmentResponse` | — |
| [`ListContactsInSegmentAsync`](#listcontactsinsegmentasync) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}/contacts` | `CursorPage` | — |
| [`CreateSegmentAsync`](#createsegmentasync) | `POST` | `/v1/projects/{projectId}/segments` | `SegmentResponse` | — |
| [`DeleteSegmentAsync`](#deletesegmentasync) | `DELETE` | `/v1/projects/{projectId}/segments/{segmentId}` | `void` | — |

## ListSegmentsAsync

`GET /v1/projects/{projectId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SegmentPageResponse`


## GetSegmentAsync

`GET /v1/projects/{projectId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `segmentId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SegmentResponse`


## ListContactsInSegmentAsync

`GET /v1/projects/{projectId}/segments/{segmentId}/contacts`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `segmentId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `CursorPage`


## CreateSegmentAsync

`POST /v1/projects/{projectId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Request body

- Type: `CreateSegmentBody`
- Required: Yes
- Content type: `application/json`

### Response

- Response schema selectors: `201`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SegmentResponse`


## DeleteSegmentAsync

`DELETE /v1/projects/{projectId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `segmentId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `void`


---

Generated from the Apollo Signal API manifest by Tesseract.

