package com.apollodeploy.signal.sdk.api

import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.models.*
import io.ktor.http.HttpMethod
import io.ktor.http.encodeURLPathPart
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.coroutines.flow.Flow

/** MetricsAPI API operations. */
class MetricsAPI(
    private val transport: Transport,
) {
/** getTopicPerformance operation. */
    suspend fun getTopicPerformance(
        id: String,
        window: String? = null,
        projectId: String? = null,
    ): TopicPerformanceResponse {
        var path = "/v1/metrics/topics/\${id}"
        path = path.replace("\${id}", id.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        window?.let { query += "window" to it.toString() }
        projectId?.let { query += "projectId" to it.toString() }
        val headers = mutableMapOf<String, String>()

        return transport.execute<TopicPerformanceResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getEmailPerformance operation. */
    suspend fun getEmailPerformance(
        id: String,
    ): EmailPerformanceResponse {
        var path = "/v1/metrics/emails/\${id}"
        path = path.replace("\${id}", id.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<EmailPerformanceResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getEmailEngagement operation. */
    suspend fun getEmailEngagement(
        id: String,
    ): EmailReadScrollAnalyticsResponse {
        var path = "/v1/metrics/emails/\${id}/engagement"
        path = path.replace("\${id}", id.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<EmailReadScrollAnalyticsResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getProjectMetricsSummary operation. */
    suspend fun getProjectMetricsSummary(
        window: String? = null,
        projectId: String? = null,
    ): ProjectMetricsSummaryResponse {
        var path = "/v1/metrics/summary"

        val query = mutableListOf<Pair<String, String>>()
        window?.let { query += "window" to it.toString() }
        projectId?.let { query += "projectId" to it.toString() }
        val headers = mutableMapOf<String, String>()

        return transport.execute<ProjectMetricsSummaryResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getProjectMetricsTimeline operation. */
    suspend fun getProjectMetricsTimeline(
        window: String? = null,
        granularity: String? = null,
        format: String? = null,
        projectId: String? = null,
    ): ProjectMetricsTimelineResponse {
        var path = "/v1/metrics/timeline"

        val query = mutableListOf<Pair<String, String>>()
        window?.let { query += "window" to it.toString() }
        granularity?.let { query += "granularity" to it.toString() }
        format?.let { query += "format" to it.toString() }
        projectId?.let { query += "projectId" to it.toString() }
        val headers = mutableMapOf<String, String>()

        return transport.execute<ProjectMetricsTimelineResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getMetricsAdvisor operation. */
    suspend fun getMetricsAdvisor(
        projectId: String? = null,
    ): AdvisorReportResponse {
        var path = "/v1/metrics/advisor"

        val query = mutableListOf<Pair<String, String>>()
        projectId?.let { query += "projectId" to it.toString() }
        val headers = mutableMapOf<String, String>()

        return transport.execute<AdvisorReportResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

}
