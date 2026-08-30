package com.apollodeploy.signal.sdk.api

import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.models.*
import io.ktor.http.HttpMethod
import io.ktor.http.encodeURLPathPart
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.coroutines.flow.Flow

/** SendingDomainsAPI API operations. */
class SendingDomainsAPI(
    private val transport: Transport,
) {
/** listDomains operation. */
    suspend fun listDomains(
        projectId: String,
    ): DomainListPageResponse {
        var path = "/v1/projects/\${projectId}/domains"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<DomainListPageResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getDomain operation. */
    suspend fun getDomain(
        projectId: String,
        domainId: String,
    ): DomainResponse {
        var path = "/v1/projects/\${projectId}/domains/\${domainId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${domainId}", domainId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<DomainResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** registerDomain operation. */
    suspend fun registerDomain(
        projectId: String,
        body: RegisterDomainRequest,
    ): DomainResponse {
        var path = "/v1/projects/\${projectId}/domains"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<DomainResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** verifyDomain operation. */
    suspend fun verifyDomain(
        projectId: String,
        domainId: String,
    ): DomainResponse {
        var path = "/v1/projects/\${projectId}/domains/\${domainId}/verify"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${domainId}", domainId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<DomainResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** deleteDomain operation. */
    suspend fun deleteDomain(
        projectId: String,
        domainId: String,
    ): Unit {
        var path = "/v1/projects/\${projectId}/domains/\${domainId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${domainId}", domainId.toString().encodeURLPathPart())

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

/** verifyBimi operation. */
    suspend fun verifyBimi(
        projectId: String,
        domainId: String,
    ): DomainResponse {
        var path = "/v1/projects/\${projectId}/domains/\${domainId}/bimi/verify"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${domainId}", domainId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<DomainResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** updateBimi operation. */
    suspend fun updateBimi(
        projectId: String,
        domainId: String,
        body: UpdateBimiRequest,
    ): DomainResponse {
        var path = "/v1/projects/\${projectId}/domains/\${domainId}/bimi"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${domainId}", domainId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<DomainResponse>(
            method = HttpMethod.Patch,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

}
