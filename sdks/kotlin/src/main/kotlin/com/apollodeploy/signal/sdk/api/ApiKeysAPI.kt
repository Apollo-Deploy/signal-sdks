package com.apollodeploy.signal.sdk.api

import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.models.*
import io.ktor.http.HttpMethod
import io.ktor.http.encodeURLPathPart
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.coroutines.flow.Flow

/** ApiKeysAPI API operations. */
class ApiKeysAPI(
    private val transport: Transport,
) {
/** listApiKeys operation. */
    suspend fun listApiKeys(
        projectId: String,
    ): ListApiKeysResponse {
        var path = "/v1/projects/\${projectId}/api-keys"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ListApiKeysResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getApiKey operation. */
    suspend fun getApiKey(
        projectId: String,
        keyId: String,
    ): ApiKey {
        var path = "/v1/projects/\${projectId}/api-keys/\${keyId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${keyId}", keyId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ApiKey>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getApiKeyUsage operation. */
    suspend fun getApiKeyUsage(
        projectId: String,
        keyId: String,
    ): ApiKeyUsageResponse {
        var path = "/v1/projects/\${projectId}/api-keys/\${keyId}/usage"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${keyId}", keyId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ApiKeyUsageResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** exportApiKeyUsage operation. */
    suspend fun exportApiKeyUsage(
        projectId: String,
        keyId: String,
    ): Unit {
        var path = "/v1/projects/\${projectId}/api-keys/\${keyId}/usage/export"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${keyId}", keyId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        transport.executeRaw(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
        return Unit
    }

}
