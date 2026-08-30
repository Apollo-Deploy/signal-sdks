# MetricsAPI

metrics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Api/metrics.cs)

Client accessor: `client.Metrics`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`GetTopicPerformanceAsync`](#gettopicperformanceasync) | `GET` | `/v1/metrics/topics/{id}` | `TopicPerformanceResponse` | — |
| [`GetEmailPerformanceAsync`](#getemailperformanceasync) | `GET` | `/v1/metrics/emails/{id}` | `EmailPerformanceResponse` | — |
| [`GetEmailEngagementAsync`](#getemailengagementasync) | `GET` | `/v1/metrics/emails/{id}/engagement` | `EmailReadScrollAnalyticsResponse` | — |
| [`GetProjectMetricsSummaryAsync`](#getprojectmetricssummaryasync) | `GET` | `/v1/metrics/summary` | `ProjectMetricsSummaryResponse` | — |
| [`GetProjectMetricsTimelineAsync`](#getprojectmetricstimelineasync) | `GET` | `/v1/metrics/timeline` | `ProjectMetricsTimelineResponse` | — |
| [`GetMetricsAdvisorAsync`](#getmetricsadvisorasync) | `GET` | `/v1/metrics/advisor` | `AdvisorReportResponse` | — |

## GetTopicPerformanceAsync

`GET /v1/metrics/topics/{id}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `string` | Yes | — |
| `window` | Query | `string` | No | Time window. |
| `projectId` | Query | `string` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicPerformanceResponse`


## GetEmailPerformanceAsync

`GET /v1/metrics/emails/{id}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailPerformanceResponse`


## GetEmailEngagementAsync

`GET /v1/metrics/emails/{id}/engagement`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailReadScrollAnalyticsResponse`


## GetProjectMetricsSummaryAsync

`GET /v1/metrics/summary`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `window` | Query | `string` | No | Metrics time window. |
| `projectId` | Query | `string` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectMetricsSummaryResponse`


## GetProjectMetricsTimelineAsync

`GET /v1/metrics/timeline`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `window` | Query | `string` | No | Metrics time window. |
| `granularity` | Query | `string` | No | `hour` or `day`. |
| `format` | Query | `string` | No | `compact` or `detailed`. |
| `projectId` | Query | `string` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectMetricsTimelineResponse`


## GetMetricsAdvisorAsync

`GET /v1/metrics/advisor`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Query | `string` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `AdvisorReportResponse`


---

Generated from the Apollo Signal API manifest by Tesseract.

