package com.apollodeploy.signal.sdk.api

import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.models.*
import io.ktor.http.HttpMethod
import io.ktor.http.encodeURLPathPart
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.coroutines.flow.Flow

/** ProjectsAPI API operations. */
class ProjectsAPI(
    private val transport: Transport,
) {
/** listProjects operation. */
    suspend fun listProjects(
    ): ProjectPageResponse {
        var path = "/v1/projects"

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ProjectPageResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getProject operation. */
    suspend fun getProject(
        projectId: String,
    ): ProjectResponse {
        var path = "/v1/projects/\${projectId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ProjectResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** updateProject operation. */
    suspend fun updateProject(
        projectId: String,
        body: UpdateProjectRequest,
    ): ProjectResponse {
        var path = "/v1/projects/\${projectId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ProjectResponse>(
            method = HttpMethod.Patch,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** listEmails operation. */
    suspend fun listEmails(
        projectId: String,
    ): EmailPageResponse {
        var path = "/v1/projects/\${projectId}/emails"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<EmailPageResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getProjectEmail operation. */
    suspend fun getProjectEmail(
        projectId: String,
        emailId: String,
    ): EmailDetailResponse {
        var path = "/v1/projects/\${projectId}/emails/\${emailId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${emailId}", emailId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<EmailDetailResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getEmailTimeline operation. */
    suspend fun getEmailTimeline(
        projectId: String,
        emailId: String,
    ): EmailTimelineResponse {
        var path = "/v1/projects/\${projectId}/emails/\${emailId}/events"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${emailId}", emailId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<EmailTimelineResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

}
