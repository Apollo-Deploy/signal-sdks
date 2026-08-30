package com.apollodeploy.signal.sdk.api

import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.models.*
import io.ktor.http.HttpMethod
import io.ktor.http.encodeURLPathPart
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.coroutines.flow.Flow

/** EmailsAPI API operations. */
class EmailsAPI(
    private val transport: Transport,
) {
/** sendEmail operation. */
    suspend fun sendEmail(
        body: SendEmailRequest,
    ): SendEmailResponse {
        var path = "/v1/emails"

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<SendEmailResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getEmail operation. */
    suspend fun getEmail(
        emailId: String,
    ): EmailDetailResponse {
        var path = "/v1/emails/\${emailId}"
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

/** batchSendEmails operation. */
    suspend fun batchSendEmails(
        body: BatchSendRequest,
    ): BatchSendResponse {
        var path = "/v1/emails/batch"

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<BatchSendResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** cancelEmail operation. */
    suspend fun cancelEmail(
        emailId: String,
    ): CancelResponse {
        var path = "/v1/emails/\${emailId}"
        path = path.replace("\${emailId}", emailId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<CancelResponse>(
            method = HttpMethod.Delete,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** bulkCancelEmails operation. */
    suspend fun bulkCancelEmails(
    ): BulkCancelResponse {
        var path = "/v1/emails"

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<BulkCancelResponse>(
            method = HttpMethod.Delete,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** issueStreamToken operation. */
    suspend fun issueStreamToken(
        projectId: String,
    ): StreamTokenResponse {
        var path = "/v1/emails/\${projectId}/stream/token"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<StreamTokenResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** streamEmailEvents operation. */
    suspend fun streamEmailEvents(
    ): Flow<StreamEventResponse> {
        var path = "/v1/emails/stream"

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        headers["Accept"] = "text/event-stream"
        return transport.executeSse<StreamEventResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** validateLinks operation. */
    suspend fun validateLinks(
        body: ValidateLinksRequest,
    ): ValidateLinksResponse {
        var path = "/v1/emails/validate"

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ValidateLinksResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

}
