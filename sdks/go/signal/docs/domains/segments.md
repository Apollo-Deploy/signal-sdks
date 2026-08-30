# SegmentsAPI

segments API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../segments.go)

Client accessor: `client.Segments`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`ListSegments`](#listsegments) | `GET` | `/v1/projects/{projectId}/segments` | `SegmentPageResponse` | — |
| [`GetSegment`](#getsegment) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}` | `SegmentResponse` | — |
| [`ListContactsInSegment`](#listcontactsinsegment) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}/contacts` | `CursorPage` | — |
| [`CreateSegment`](#createsegment) | `POST` | `/v1/projects/{projectId}/segments` | `SegmentResponse` | — |
| [`DeleteSegment`](#deletesegment) | `DELETE` | `/v1/projects/{projectId}/segments/{segmentId}` | `struct{}` | — |

## ListSegments

`GET /v1/projects/{projectId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SegmentPageResponse`


## GetSegment

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


## ListContactsInSegment

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


## CreateSegment

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


## DeleteSegment

`DELETE /v1/projects/{projectId}/segments/{segmentId}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |
| `segmentId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `2XX`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `struct{}`


---

Generated from the Apollo Signal API manifest by Tesseract.

