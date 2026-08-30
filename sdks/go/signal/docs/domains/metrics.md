# MetricsAPI

metrics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../metrics.go)

Client accessor: `client.Metrics`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`GetTopicPerformance`](#gettopicperformance) | `GET` | `/v1/metrics/topics/{id}` | `TopicPerformanceResponse` | — |
| [`GetEmailPerformance`](#getemailperformance) | `GET` | `/v1/metrics/emails/{id}` | `EmailPerformanceResponse` | — |
| [`GetEmailEngagement`](#getemailengagement) | `GET` | `/v1/metrics/emails/{id}/engagement` | `EmailReadScrollAnalyticsResponse` | — |
| [`GetProjectMetricsSummary`](#getprojectmetricssummary) | `GET` | `/v1/metrics/summary` | `ProjectMetricsSummaryResponse` | — |
| [`GetProjectMetricsTimeline`](#getprojectmetricstimeline) | `GET` | `/v1/metrics/timeline` | `ProjectMetricsTimelineResponse` | — |
| [`GetMetricsAdvisor`](#getmetricsadvisor) | `GET` | `/v1/metrics/advisor` | `AdvisorReportResponse` | — |

## GetTopicPerformance

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


## GetEmailPerformance

`GET /v1/metrics/emails/{id}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailPerformanceResponse`


## GetEmailEngagement

`GET /v1/metrics/emails/{id}/engagement`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `string` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailReadScrollAnalyticsResponse`


## GetProjectMetricsSummary

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


## GetProjectMetricsTimeline

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


## GetMetricsAdvisor

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

