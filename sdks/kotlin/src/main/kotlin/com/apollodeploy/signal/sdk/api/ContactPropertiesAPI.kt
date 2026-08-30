package com.apollodeploy.signal.sdk.api

import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.models.*
import io.ktor.http.HttpMethod
import io.ktor.http.encodeURLPathPart
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.coroutines.flow.Flow

/** ContactPropertiesAPI API operations. */
class ContactPropertiesAPI(
    private val transport: Transport,
) {
/** listContactProperties operation. */
    suspend fun listContactProperties(
        projectId: String,
    ): ContactPropertyPageResponse {
        var path = "/v1/projects/\${projectId}/contact-properties"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactPropertyPageResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getContactProperty operation. */
    suspend fun getContactProperty(
        projectId: String,
        propertyId: String,
    ): ContactPropertyResponse {
        var path = "/v1/projects/\${projectId}/contact-properties/\${propertyId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${propertyId}", propertyId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactPropertyResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** createContactProperty operation. */
    suspend fun createContactProperty(
        projectId: String,
        body: CreateContactPropertyBody,
    ): ContactPropertyResponse {
        var path = "/v1/projects/\${projectId}/contact-properties"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactPropertyResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** updateContactProperty operation. */
    suspend fun updateContactProperty(
        projectId: String,
        propertyId: String,
        body: UpdateContactPropertyBody,
    ): ContactPropertyResponse {
        var path = "/v1/projects/\${projectId}/contact-properties/\${propertyId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${propertyId}", propertyId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactPropertyResponse>(
            method = HttpMethod.Patch,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** deleteContactProperty operation. */
    suspend fun deleteContactProperty(
        projectId: String,
        propertyId: String,
    ): Unit {
        var path = "/v1/projects/\${projectId}/contact-properties/\${propertyId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${propertyId}", propertyId.toString().encodeURLPathPart())

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
