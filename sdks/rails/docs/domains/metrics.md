# MetricsAPI

metrics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../lib/apollo_deploy_signal_sdk_rails/resources/metrics.rb)

Client accessor: `client.metrics`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`get_topic_performance`](#get-topic-performance) | `GET` | `/v1/metrics/topics/{id}` | `TopicPerformanceResponse` | — |
| [`get_email_performance`](#get-email-performance) | `GET` | `/v1/metrics/emails/{id}` | `EmailPerformanceResponse` | — |
| [`get_email_engagement`](#get-email-engagement) | `GET` | `/v1/metrics/emails/{id}/engagement` | `EmailReadScrollAnalyticsResponse` | — |
| [`get_project_metrics_summary`](#get-project-metrics-summary) | `GET` | `/v1/metrics/summary` | `ProjectMetricsSummaryResponse` | — |
| [`get_project_metrics_timeline`](#get-project-metrics-timeline) | `GET` | `/v1/metrics/timeline` | `ProjectMetricsTimelineResponse` | — |
| [`get_metrics_advisor`](#get-metrics-advisor) | `GET` | `/v1/metrics/advisor` | `AdvisorReportResponse` | — |

## get_topic_performance

`GET /v1/metrics/topics/{id}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `String` | Yes | — |
| `window` | Query | `String` | No | Time window. |
| `projectId` | Query | `String` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `TopicPerformanceResponse`


## get_email_performance

`GET /v1/metrics/emails/{id}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailPerformanceResponse`


## get_email_engagement

`GET /v1/metrics/emails/{id}/engagement`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailReadScrollAnalyticsResponse`


## get_project_metrics_summary

`GET /v1/metrics/summary`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `window` | Query | `String` | No | Metrics time window. |
| `projectId` | Query | `String` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectMetricsSummaryResponse`


## get_project_metrics_timeline

`GET /v1/metrics/timeline`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `window` | Query | `String` | No | Metrics time window. |
| `granularity` | Query | `String` | No | `hour` or `day`. |
| `format` | Query | `String` | No | `compact` or `detailed`. |
| `projectId` | Query | `String` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `ProjectMetricsTimelineResponse`


## get_metrics_advisor

`GET /v1/metrics/advisor`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `projectId` | Query | `String` | No | Required for session auth; ignored for API key auth. |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `AdvisorReportResponse`


---

Generated from the Apollo Signal API manifest by Tesseract.

