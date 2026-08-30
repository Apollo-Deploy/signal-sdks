package com.apollodeploy.signal.sdk.api

import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.models.*
import io.ktor.http.HttpMethod
import io.ktor.http.encodeURLPathPart
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.coroutines.flow.Flow

/** TopicsAPI API operations. */
class TopicsAPI(
    private val transport: Transport,
) {
/** listTopics operation. */
    suspend fun listTopics(
        projectId: String,
    ): TopicPageResponse {
        var path = "/v1/projects/\${projectId}/topics"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<TopicPageResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getTopic operation. */
    suspend fun getTopic(
        projectId: String,
        topicId: String,
    ): TopicResponse {
        var path = "/v1/projects/\${projectId}/topics/\${topicId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${topicId}", topicId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<TopicResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** listContactsInTopic operation. */
    suspend fun listContactsInTopic(
        projectId: String,
        topicId: String,
    ): CursorPage {
        var path = "/v1/projects/\${projectId}/topics/\${topicId}/contacts"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${topicId}", topicId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<CursorPage>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** createTopic operation. */
    suspend fun createTopic(
        projectId: String,
        body: CreateTopicBody,
    ): TopicResponse {
        var path = "/v1/projects/\${projectId}/topics"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<TopicResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** updateTopic operation. */
    suspend fun updateTopic(
        projectId: String,
        topicId: String,
        body: UpdateTopicBody,
    ): TopicResponse {
        var path = "/v1/projects/\${projectId}/topics/\${topicId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${topicId}", topicId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<TopicResponse>(
            method = HttpMethod.Patch,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** deleteTopic operation. */
    suspend fun deleteTopic(
        projectId: String,
        topicId: String,
    ): Unit {
        var path = "/v1/projects/\${projectId}/topics/\${topicId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${topicId}", topicId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        transport.executeRaw(
            method = HttpMethod.Delete,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
        return Unit
    }

}
