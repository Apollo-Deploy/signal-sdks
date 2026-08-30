# SegmentsAPI

segments API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../src/Api/Segments.php)

Client accessor: `$client->segments()`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`listSegments`](#listsegments) | `GET` | `/v1/projects/{projectId}/segments` | `SegmentPageResponse` | — |
| [`getSegment`](#getsegment) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}` | `SegmentResponse` | — |
| [`listContactsInSegment`](#listcontactsinsegment) | `GET` | `/v1/projects/{projectId}/segments/{segmentId}/contacts` | `CursorPage` | — |
| [`createSegment`](#createsegment) | `POST` | `/v1/projects/{projectId}/segments` | `SegmentResponse` | — |
| [`deleteSegment`](#deletesegment) | `DELETE` | `/v1/projects/{projectId}/segments/{segmentId}` | `void` | — |

## listSegments

`GET /v1/projects/{projectId}/segments`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `SegmentPageResponse`


## getSegment

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


## listContactsInSegment

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


## createSegment

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


## deleteSegment

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

