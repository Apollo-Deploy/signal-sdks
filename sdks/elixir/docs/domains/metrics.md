# MetricsAPI

metrics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_signal/domains/metrics.ex)

Client accessor: `ApolloSignal.Client.metrics(client)`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`get_topic_performance`](#get-topic-performance) | `GET` | `/v1/metrics/topics/{id}` | `ApolloSignal.Types.TopicPerformanceResponse.t()` | — |
| [`get_email_performance`](#get-email-performance) | `GET` | `/v1/metrics/emails/{id}` | `ApolloSignal.Types.EmailPerformanceResponse.t()` | — |
| [`get_email_engagement`](#get-email-engagement) | `GET` | `/v1/metrics/emails/{id}/engagement` | `ApolloSignal.Types.EmailReadScrollAnalyticsResponse.t()` | — |
| [`get_project_metrics_summary`](#get-project-metrics-summary) | `GET` | `/v1/metrics/summary` | `ApolloSignal.Types.ProjectMetricsSummaryResponse.t()` | — |
| [`get_project_metrics_timeline`](#get-project-metrics-timeline) | `GET` | `/v1/metrics/timeline` | `ApolloSignal.Types.ProjectMetricsTimelineResponse.t()` | — |
| [`get_metrics_advisor`](#get-metrics-advisor) | `GET` | `/v1/metrics/advisor` | `ApolloSignal.Types.AdvisorReportResponse.t()` | — |

## get_topic_performance

`GET /v1/metrics/topics/{id}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `String.t()` | Yes | — |
| `window` | Query | `String.t()` | No | Time window. |
| `projectId` | Query | `String.t()` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.TopicPerformanceResponse.t()`


## get_email_performance

`GET /v1/metrics/emails/{id}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.EmailPerformanceResponse.t()`


## get_email_engagement

`GET /v1/metrics/emails/{id}/engagement`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `String.t()` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.EmailReadScrollAnalyticsResponse.t()`


## get_project_metrics_summary

`GET /v1/metrics/summary`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `window` | Query | `String.t()` | No | Metrics time window. |
| `projectId` | Query | `String.t()` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ProjectMetricsSummaryResponse.t()`


## get_project_metrics_timeline

`GET /v1/metrics/timeline`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `window` | Query | `String.t()` | No | Metrics time window. |
| `granularity` | Query | `String.t()` | No | `hour` or `day`. |
| `format` | Query | `String.t()` | No | `compact` or `detailed`. |
| `projectId` | Query | `String.t()` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.ProjectMetricsTimelineResponse.t()`


## get_metrics_advisor

`GET /v1/metrics/advisor`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Query | `String.t()` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ApolloSignal.Types.AdvisorReportResponse.t()`


---

Generated from the Apollo Signal API manifest by Tesseract.

