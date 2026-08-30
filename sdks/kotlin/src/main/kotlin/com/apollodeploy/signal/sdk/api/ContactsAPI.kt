package com.apollodeploy.signal.sdk.api

import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.models.*
import io.ktor.http.HttpMethod
import io.ktor.http.encodeURLPathPart
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.coroutines.flow.Flow

/** ContactsAPI API operations. */
class ContactsAPI(
    private val transport: Transport,
) {
/** listContacts operation. */
    suspend fun listContacts(
        projectId: String,
    ): ContactPageResponse {
        var path = "/v1/projects/\${projectId}/contacts"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactPageResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getContact operation. */
    suspend fun getContact(
        projectId: String,
        contactId: String,
    ): ContactResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** listContactSegments operation. */
    suspend fun listContactSegments(
        projectId: String,
        contactId: String,
    ): ListContactSegmentsResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/segments"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ListContactSegmentsResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getContactTopics operation. */
    suspend fun getContactTopics(
        projectId: String,
        contactId: String,
    ): GetContactTopicsResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/topics"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<GetContactTopicsResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** createContact operation. */
    suspend fun createContact(
        projectId: String,
        body: CreateContactBody,
    ): ContactResponse {
        var path = "/v1/projects/\${projectId}/contacts"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** updateContact operation. */
    suspend fun updateContact(
        projectId: String,
        contactId: String,
        body: UpdateContactBody,
    ): ContactResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactResponse>(
            method = HttpMethod.Patch,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** deleteContact operation. */
    suspend fun deleteContact(
        projectId: String,
        contactId: String,
    ): Unit {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

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

/** uploadContactImage operation. */
    suspend fun uploadContactImage(
        projectId: String,
        contactId: String,
    ): ContactResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/image"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** setContactImageUrl operation. */
    suspend fun setContactImageUrl(
        projectId: String,
        contactId: String,
        body: SetImageUrlBody,
    ): ContactResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/image"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<ContactResponse>(
            method = HttpMethod.Put,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** deleteContactImage operation. */
    suspend fun deleteContactImage(
        projectId: String,
        contactId: String,
    ): Unit {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/image"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

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

/** addContactToSegment operation. */
    suspend fun addContactToSegment(
        projectId: String,
        contactId: String,
        body: AddToSegmentBody,
    ): Unit {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/segments"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        transport.executeRaw(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
        return Unit
    }

/** removeContactFromSegment operation. */
    suspend fun removeContactFromSegment(
        projectId: String,
        contactId: String,
        segmentId: String,
    ): Unit {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/segments/\${segmentId}"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())
        path = path.replace("\${segmentId}", segmentId.toString().encodeURLPathPart())

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

/** updateContactTopics operation. */
    suspend fun updateContactTopics(
        projectId: String,
        contactId: String,
        body: UpdateTopicsBody,
    ): Unit {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/topics"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        transport.executeRaw(
            method = HttpMethod.Patch,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
        return Unit
    }

/** getContactActivity operation. */
    suspend fun getContactActivity(
        projectId: String,
        contactId: String,
    ): GetContactActivityResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/activity"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<GetContactActivityResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getContactEngagementScore operation. */
    suspend fun getContactEngagementScore(
        projectId: String,
        contactId: String,
    ): EngagementScoreResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/engagement"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<EngagementScoreResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** getContactEmailValidationStatus operation. */
    suspend fun getContactEmailValidationStatus(
        projectId: String,
        contactId: String,
    ): EmailValidationStatusResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/email-validation"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<EmailValidationStatusResponse>(
            method = HttpMethod.Get,
            path = path,
            query = query.ifEmpty { null },
            body = null,
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** refreshContactEngagementScore operation. */
    suspend fun refreshContactEngagementScore(
        projectId: String,
        contactId: String,
    ): EngagementScoreResponse {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/engagement/refresh"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        return transport.execute<EngagementScoreResponse>(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = JsonObject(emptyMap()),
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
    }

/** recordContactEmailValidation operation. */
    suspend fun recordContactEmailValidation(
        projectId: String,
        contactId: String,
        body: RecordValidationBody,
    ): Unit {
        var path = "/v1/projects/\${projectId}/contacts/\${contactId}/email-validation"
        path = path.replace("\${projectId}", projectId.toString().encodeURLPathPart())
        path = path.replace("\${contactId}", contactId.toString().encodeURLPathPart())

        val query = mutableListOf<Pair<String, String>>()
        val headers = mutableMapOf<String, String>()

        transport.executeRaw(
            method = HttpMethod.Post,
            path = path,
            query = query.ifEmpty { null },
            body = Json.encodeToJsonElement(body),
            contentType = "application/json",
            headers = headers.ifEmpty { null },
            operationTimeoutMs = null,
        )
        return Unit
    }

}
