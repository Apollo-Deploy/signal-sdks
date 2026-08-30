# MetricsAPI

metrics API operations.

[Documentation index](../README.md) · [SDK overview](../../README.md) · [Generated source](../../Sources/ApolloSignal/Domains/MetricsApi.swift)

Client accessor: `client.metrics`

## Operations

| Method | HTTP | Path | Returns | Description |
|---|---|---|---|---|
| [`getTopicPerformance`](#gettopicperformance) | `GET` | `/v1/metrics/topics/{id}` | `TopicPerformanceResponse` | — |
| [`getEmailPerformance`](#getemailperformance) | `GET` | `/v1/metrics/emails/{id}` | `EmailPerformanceResponse` | — |
| [`getEmailEngagement`](#getemailengagement) | `GET` | `/v1/metrics/emails/{id}/engagement` | `EmailReadScrollAnalyticsResponse` | — |
| [`getProjectMetricsSummary`](#getprojectmetricssummary) | `GET` | `/v1/metrics/summary` | `ProjectMetricsSummaryResponse` | — |
| [`getProjectMetricsTimeline`](#getprojectmetricstimeline) | `GET` | `/v1/metrics/timeline` | `ProjectMetricsTimelineResponse` | — |
| [`getMetricsAdvisor`](#getmetricsadvisor) | `GET` | `/v1/metrics/advisor` | `AdvisorReportResponse` | — |

## getTopicPerformance

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


## getEmailPerformance

`GET /v1/metrics/emails/{id}`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailPerformanceResponse`


## getEmailEngagement

`GET /v1/metrics/emails/{id}/engagement`

### Parameters

| Name | Location | Type | Required | Description |
|---|---|---|:---:|---|
| `id` | Path | `String` | Yes | — |

### Response

- Response schema selectors: `200`
- HTTP success handling: every 2xx response is accepted; selectors identify the schema contract used for decoding.
- Type: `EmailReadScrollAnalyticsResponse`


## getProjectMetricsSummary

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


## getProjectMetricsTimeline

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


## getMetricsAdvisor

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

