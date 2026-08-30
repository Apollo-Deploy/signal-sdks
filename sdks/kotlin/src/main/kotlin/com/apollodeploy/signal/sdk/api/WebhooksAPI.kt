package com.apollodeploy.signal.sdk.api

import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.models.*
import io.ktor.http.HttpMethod
import io.ktor.http.encodeURLPathPart
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.coroutines.flow.Flow

/** WebhooksAPI API operations. */
class WebhooksAPI(
    private val transport: Transport,
) {
/** listWebhooks operation. */
    suspend fun listWebhooks(
        projectId: String,
    ): WebhookPageResponse {
        var path = "/v1/projects/\${projectId}/webhooks"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<WebhookPageResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getWebhook operation. */
    suspend fun getWebhook(
        projectId: String,
        endpointId: String,
    ): WebhookResponse {
        var path = "/v1/projects/\${projectId}/webhooks/\${endpointId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${endpointId}", endpointId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<WebhookResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** listWebhookDeliveries operation. */
    suspend fun listWebhookDeliveries(
        projectId: String,
        endpointId: String,
    ): WebhookDeliveryPageResponse {
        var path = "/v1/projects/\${projectId}/webhooks/\${endpointId}/deliveries"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${endpointId}", endpointId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<WebhookDeliveryPageResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getWebhookDelivery operation. */
    suspend fun getWebhookDelivery(
        projectId: String,
        endpointId: String,
        deliveryId: String,
    ): WebhookDeliveryResponse {
        var path = "/v1/projects/\${projectId}/webhooks/\${endpointId}/deliveries/\${deliveryId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${endpointId}", endpointId.toString().encodeURLPathPart())
        path = path.replace("\${deliveryId}", deliveryId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<WebhookDeliveryResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** createWebhook operation. */
    suspend fun createWebhook(
        projectId: String,
        body: CreateWebhookBody,
    ): WebhookCreateResponse {
        var path = "/v1/projects/\${projectId}/webhooks"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<WebhookCreateResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** updateWebhook operation. */
    suspend fun updateWebhook(
        projectId: String,
        endpointId: String,
        body: UpdateWebhookBody,
    ): WebhookResponse {
        var path = "/v1/projects/\${projectId}/webhooks/\${endpointId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${endpointId}", endpointId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<WebhookResponse>(
            method = HttpMethod.Patch,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** deleteWebhook operation. */
    suspend fun deleteWebhook(
        projectId: String,
        endpointId: String,
    ): Unit {
        var path = "/v1/projects/\${projectId}/webhooks/\${endpointId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${endpointId}", endpointId.toString().encodeURLPathPart())

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

/** testWebhook operation. */
    suspend fun testWebhook(
        projectId: String,
        endpointId: String,
    ): WebhookDeliveryResponse {
        var path = "/v1/projects/\${projectId}/webhooks/\${endpointId}/test"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${endpointId}", endpointId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<WebhookDeliveryResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** replayWebhookDelivery operation. */
    suspend fun replayWebhookDelivery(
        projectId: String,
        endpointId: String,
        deliveryId: String,
    ): Unit {
        var path = "/v1/projects/\${projectId}/webhooks/\${endpointId}/replay/\${deliveryId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${endpointId}", endpointId.toString().encodeURLPathPart())
        path = path.replace("\${deliveryId}", deliveryId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        transport.executeRaw(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
        return Unit
    }

}
