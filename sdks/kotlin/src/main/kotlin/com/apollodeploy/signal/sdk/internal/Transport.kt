package com.apollodeploy.signal.sdk.internal

import com.apollodeploy.signal.sdk.exceptions.SdkException
import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.plugins.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.client.request.forms.FormBuilder
import io.ktor.client.request.forms.MultiPartFormDataContent
import io.ktor.client.request.forms.formData
import io.ktor.client.statement.*
import io.ktor.http.*
import io.ktor.http.content.ByteArrayContent
import io.ktor.http.content.TextContent
import io.ktor.serialization.kotlinx.json.*
import java.io.ByteArrayOutputStream
import java.io.EOFException
import java.time.ZonedDateTime
import java.time.format.DateTimeFormatter
import kotlin.math.max
import kotlin.random.Random
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonNull
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.JsonPrimitive
import kotlinx.serialization.json.encodeToJsonElement
import kotlinx.serialization.json.jsonPrimitive
import io.ktor.utils.io.readAvailable
import io.ktor.utils.io.LineEnding
import io.ktor.utils.io.readLineStrictTo
import io.ktor.utils.io.charsets.TooLongLineException

/** Internal transport configuration. */
data class TransportConfig(
    val baseUrl: String,
    val defaultHeaders: Map<String, String> = emptyMap(),
    val timeoutMs: Long = 15_000,
    val maxRetries: Int = 3,
    val retryUnsafeRequests: Boolean = false,
)

/**
 * HTTP transport layer for the SDK.
 *
 * Retries transient failures for idempotent methods. POST and PATCH are retried
 * only when [TransportConfig.retryUnsafeRequests] is enabled or an
 * `X-Idempotency-Key` header is present.
 */
class Transport(
    private val config: TransportConfig,
) : AutoCloseable {
    init {
        require(config.baseUrl.isNotBlank()) { "baseUrl must not be blank" }
        require(config.timeoutMs > 0) { "timeoutMs must be greater than zero" }
        require(config.maxRetries in 0..MAX_RETRIES) {
            "maxRetries must be between 0 and $MAX_RETRIES"
        }
        val claimedSecurityHeaders = mutableSetOf<String>()
        fun claimSecurityHeader(name: String, value: String?) {
            if (value.isNullOrBlank()) return
            require(claimedSecurityHeaders.add(name.lowercase())) {
                "Multiple configured security schemes target the $name header"
            }
        }
    }

    @PublishedApi
    internal val json = Json {
        ignoreUnknownKeys = true
        isLenient = true
        encodeDefaults = true
        coerceInputValues = true
    }

    private val client = HttpClient(CIO) {
        install(ContentNegotiation) {
            json(json)
        }

        install(HttpTimeout) {
            requestTimeoutMillis = config.timeoutMs
            connectTimeoutMillis = config.timeoutMs
            socketTimeoutMillis = config.timeoutMs
        }

        defaultRequest {
            url(config.baseUrl)
            accept(ContentType.Application.Json)
            if (config.defaultHeaders.keys.none { it.equals(HttpHeaders.UserAgent, ignoreCase = true) }) {
                header(HttpHeaders.UserAgent, "com.apollodeploy.signal.sdk/4.0.0")
            }
            config.defaultHeaders.forEach { (key, value) -> headers.append(key, value) }
        }
    }

    /** Execute an HTTP request and deserialize its JSON response. */
    suspend inline fun <reified T> execute(
        method: HttpMethod,
        path: String,
        query: List<Pair<String, String>>? = null,
        body: Any? = null,
        contentType: String? = null,
        headers: Map<String, String>? = null,
        operationTimeoutMs: Long? = null,
    ): T {
        val response = executeResponse(
            method,
            path,
            query,
            body,
            contentType,
            headers,
            operationTimeoutMs,
        )
        if (response.body.isBlank()) {
            if (T::class == Unit::class) {
                @Suppress("UNCHECKED_CAST")
                return Unit as T
            }
            throw SdkException(
                status = response.status,
                code = "EMPTY_RESPONSE",
                message = "Successful response body was empty",
                requestId = response.requestId,
            )
        }
        return json.decodeFromString<T>(response.body)
    }

    /** Execute an HTTP request and return its raw response body. */
    suspend fun executeRaw(
        method: HttpMethod,
        path: String,
        query: List<Pair<String, String>>? = null,
        body: Any? = null,
        contentType: String? = null,
        headers: Map<String, String>? = null,
        operationTimeoutMs: Long? = null,
    ): String = executeResponse(
        method,
        path,
        query,
        body,
        contentType,
        headers,
        operationTimeoutMs,
    ).body

    @PublishedApi
    internal data class RawResponse(
        val body: String,
        val status: Int,
        val requestId: String?,
    )

    @PublishedApi
    internal suspend fun executeResponse(
        method: HttpMethod,
        path: String,
        query: List<Pair<String, String>>?,
        body: Any?,
        contentType: String?,
        headers: Map<String, String>?,
        operationTimeoutMs: Long?,
    ): RawResponse {
        val canRetry = canRetry(method, headers)
        var lastError: Throwable? = null

        for (attempt in 0..config.maxRetries) {
            try {
                val response = client.request {
                    configureRequest(
                        method,
                        path,
                        query,
                        body,
                        contentType,
                        headers,
                        operationTimeoutMs,
                    )
                }

                if (response.status.value in 200..299) {
                    return RawResponse(
                        body = readResponseBody(response),
                        status = response.status.value,
                        requestId = response.headers["x-request-id"]
                            ?: response.headers["request-id"],
                    )
                }

                val error = buildSdkException(response)
                if (!canRetry || !isRetryableStatus(response.status.value) || attempt == config.maxRetries) {
                    throw error
                }

                lastError = error
                delay(retryDelayMs(response.headers[HttpHeaders.RetryAfter], attempt))
            } catch (error: CancellationException) {
                throw error
            } catch (error: SdkException) {
                throw error
            } catch (error: Exception) {
                if (!canRetry || attempt == config.maxRetries) {
                    throw SdkException(
                        status = null,
                        code = null,
                        message = "Network error: ${error.message ?: error::class.simpleName}",
                        requestId = null,
                        cause = error,
                    )
                }

                lastError = error
                delay(retryDelayMs(null, attempt))
            }
        }

        throw SdkException(
            status = null,
            code = null,
            message = "Request failed after ${config.maxRetries + 1} attempts",
            requestId = null,
            cause = lastError,
        )
    }

    /** Execute an SSE request and decode each complete event as it arrives. */
    internal inline fun <reified T> executeSse(
        method: HttpMethod,
        path: String,
        query: List<Pair<String, String>>? = null,
        body: Any? = null,
        contentType: String? = null,
        headers: Map<String, String>? = null,
        operationTimeoutMs: Long? = null,
    ): Flow<T> = flow {
        val canRetry = canRetry(method, headers)
        var lastError: Throwable? = null
        var emittedEvent = false

        for (attempt in 0..config.maxRetries) {
            var streamCompleted = false
            try {
                client.prepareRequest {
                    configureRequest(
                        method,
                        path,
                        query,
                        body,
                        contentType,
                        headers,
                        operationTimeoutMs,
                    )
                }.execute { response ->
                    if (response.status.value in 200..299) {
                        readSseEvents(response, { data -> json.decodeFromString<T>(data) }) { event ->
                            emittedEvent = true
                            emit(event)
                        }
                        streamCompleted = true
                    } else {
                        val error = buildSdkException(response)
                        if (!canRetry ||
                            !isRetryableStatus(response.status.value) ||
                            attempt == config.maxRetries
                        ) {
                            throw error
                        }

                        lastError = error
                        delay(retryDelayMs(response.headers[HttpHeaders.RetryAfter], attempt))
                    }
                }

                if (streamCompleted) return@flow
            } catch (error: CancellationException) {
                throw error
            } catch (error: SdkException) {
                throw error
            } catch (error: Exception) {
                if (!canRetry || emittedEvent || attempt == config.maxRetries) {
                    throw SdkException(
                        status = null,
                        code = null,
                        message = "Network error: ${error.message ?: error::class.simpleName}",
                        requestId = null,
                        cause = error,
                    )
                }

                lastError = error
                delay(retryDelayMs(null, attempt))
            }
        }

        throw SdkException(
            status = null,
            code = null,
            message = "Request failed after ${config.maxRetries + 1} attempts",
            requestId = null,
            cause = lastError,
        )
    }

    private fun HttpRequestBuilder.configureRequest(
        method: HttpMethod,
        path: String,
        query: List<Pair<String, String>>?,
        body: Any?,
        contentType: String?,
        headers: Map<String, String>?,
        operationTimeoutMs: Long?,
    ) {
        this.method = method
        url {
            require('?' !in path && '#' !in path) {
                "Request paths cannot contain a query or fragment"
            }
            takeFrom(config.baseUrl)
            encodedFragment = ""
            val basePath = encodedPath.trimEnd('/')
            val requestPath = path.trimStart('/')
            encodedPath = when {
                requestPath.isNotEmpty() && basePath.isNotEmpty() -> "$basePath/$requestPath"
                requestPath.isNotEmpty() -> "/$requestPath"
                basePath.isNotEmpty() -> "$basePath/"
                else -> "/"
            }
            query.orEmpty()
                .map { (key, _) -> key }
                .toSet()
                .forEach { key -> parameters.remove(key) }
            query?.forEach { (key, value) -> parameters.append(key, value) }
        }

        if (body != null) {
            val declaredContentType = contentType
                ?: headers?.entries?.firstOrNull {
                    it.key.equals(HttpHeaders.ContentType, ignoreCase = true)
                }?.value
                ?: ContentType.Application.Json.toString()
            val mediaType = declaredContentType.substringBefore(';').trim().lowercase()
            val parsedContentType = ContentType.parse(declaredContentType)

            when {
                mediaType == "application/json" || mediaType.endsWith("+json") -> {
                    contentType(parsedContentType)
                    setBody(body)
                }
                mediaType == "multipart/form-data" -> setBody(createMultipartContent(body))
                body is ByteArray -> {
                    contentType(parsedContentType)
                    setBody(ByteArrayContent(body, parsedContentType))
                }
                body is String -> setBody(TextContent(body, parsedContentType))
                else -> throw SdkException(
                    status = null,
                    code = "UNSUPPORTED_BODY",
                    message = "Request body type is not supported for content type $declaredContentType",
                    requestId = null,
                )
            }
        }

        headers?.forEach { (key, value) ->
            if (!key.equals(HttpHeaders.ContentType, ignoreCase = true)) {
                this.headers.append(key, value)
            }
        }
        operationTimeoutMs?.let { value ->
            timeout {
                requestTimeoutMillis = value
                connectTimeoutMillis = value
                socketTimeoutMillis = value
            }
        }
    }

    private fun createMultipartContent(body: Any): MultiPartFormDataContent {
        val parts = formData {
            when (body) {
                is Map<*, *> -> body.forEach { (name, value) ->
                    if (name is String) appendMultipartValue(this, name, value)
                }
                is JsonObject -> body.forEach { (name, value) ->
                    appendJsonMultipartValue(this, name, value)
                }
                else -> throw SdkException(
                    status = null,
                    code = "UNSUPPORTED_BODY",
                    message = "Multipart request body must be a generated field map or JSON object",
                    requestId = null,
                )
            }
        }
        return MultiPartFormDataContent(parts)
    }

    private fun appendMultipartValue(
        form: FormBuilder,
        name: String,
        value: Any?,
    ) {
        when (value) {
            null -> Unit
            is ByteArray -> form.append(
                name,
                value,
                Headers.build {
                    append(HttpHeaders.ContentType, ContentType.Application.OctetStream.toString())
                },
            )
            is Iterable<*> -> value.forEach { item -> appendMultipartValue(form, name, item) }
            is Array<*> -> value.forEach { item -> appendMultipartValue(form, name, item) }
            is JsonElement -> appendJsonMultipartValue(form, name, value)
            is String -> form.append(name, value)
            is Number, is Boolean -> form.append(name, value.toString())
            else -> form.append(name, json.encodeToJsonElement(value).toString())
        }
    }

    private fun appendJsonMultipartValue(
        form: FormBuilder,
        name: String,
        value: JsonElement,
    ) {
        when (value) {
            is JsonObject -> form.append(name, value.toString())
            is JsonArray -> value.forEach { item -> appendJsonMultipartValue(form, name, item) }
            is JsonPrimitive -> {
                if (value !is JsonNull) form.append(name, if (value.isString) value.content else value.toString())
            }
            else -> Unit
        }
    }

    internal fun encodeCookieComponent(value: String): String {
        val bytes = value.toByteArray(Charsets.UTF_8)
        return buildString(bytes.size) {
            bytes.forEach { byte ->
                val unsigned = byte.toInt() and 0xff
                if (
                    unsigned == 0x21 ||
                    unsigned in 0x23..0x2B ||
                    unsigned in 0x2D..0x3A ||
                    unsigned in 0x3C..0x5B ||
                    unsigned in 0x5D..0x7E
                ) {
                    append(unsigned.toChar())
                } else {
                    append('%')
                    append(unsigned.toString(16).uppercase().padStart(2, '0'))
                }
            }
        }
    }

    private fun appendConfiguredCookie(
        headers: HeadersBuilder,
        name: String,
        value: String,
    ) {
        val encodedName = encodeCookieComponent(name)
        val encodedValue = encodeCookieComponent(value)
        val retained = headers.getAll(HttpHeaders.Cookie)
            .orEmpty()
            .flatMap { it.split(';') }
            .map(String::trim)
            .filter { cookie ->
                val existingName = cookie.substringBefore('=').trim()
                !existingName.equals(name, ignoreCase = true) &&
                    !existingName.equals(encodedName, ignoreCase = true)
            }
        headers.remove(HttpHeaders.Cookie)
        headers.append(
            HttpHeaders.Cookie,
            (retained + "$encodedName=$encodedValue").joinToString("; "),
        )
    }

    private suspend fun readResponseBody(response: HttpResponse): String {
        val channel = response.bodyAsChannel()
        val buffer = ByteArray(READ_BUFFER_BYTES)
        val result = ByteArrayOutputStream()
        var totalBytes = 0

        while (true) {
            val read = channel.readAvailable(buffer, 0, buffer.size)
            if (read == -1) break
            if (read == 0) continue

            totalBytes += read
            if (totalBytes > MAX_RESPONSE_BODY_BYTES) {
                throw SdkException(
                    status = response.status.value,
                    code = "RESPONSE_BODY_TOO_LARGE",
                    message = "Response body exceeds $MAX_RESPONSE_BODY_BYTES bytes",
                    requestId = response.headers["x-request-id"]
                        ?: response.headers["request-id"],
                )
            }
            result.write(buffer, 0, read)
        }

        return result.toString(Charsets.UTF_8.name())
    }

    private suspend fun <T> readSseEvents(
        response: HttpResponse,
        decode: (String) -> T,
        emitEvent: suspend (T) -> Unit,
    ) {
        val channel = response.bodyAsChannel()
        val data = StringBuilder()
        val lineBuffer = StringBuilder()
        var eventBytes = 0

        while (true) {
            lineBuffer.clear()
            var completeLine: Boolean
            try {
                completeLine = channel.readLineStrictTo(
                    lineBuffer,
                    MAX_SSE_LINE_BYTES.toLong(),
                    LineEnding.Lenient,
                ) >= 0
            } catch (error: EOFException) {
                if (lineBuffer.isEmpty()) break
                completeLine = false
            } catch (error: TooLongLineException) {
                throw SdkException(
                    status = response.status.value,
                    code = "SSE_LINE_TOO_LARGE",
                    message = "SSE line exceeds $MAX_SSE_LINE_BYTES bytes",
                    requestId = response.headers["x-request-id"]
                        ?: response.headers["request-id"],
                    cause = error,
                )
            }

            if (lineBuffer.isEmpty() && !completeLine) break
            val line = lineBuffer.toString()
            val lineBytes = line.toByteArray(Charsets.UTF_8).size
            if (lineBytes > MAX_SSE_LINE_BYTES) {
                throw SdkException(
                    status = response.status.value,
                    code = "SSE_LINE_TOO_LARGE",
                    message = "SSE line exceeds $MAX_SSE_LINE_BYTES bytes",
                    requestId = response.headers["x-request-id"]
                        ?: response.headers["request-id"],
                )
            }

            when {
                line.isEmpty() -> {
                    if (data.isNotEmpty()) {
                        emitEvent(decode(data.toString()))
                        data.clear()
                        eventBytes = 0
                    }
                }
                line.startsWith(":") -> Unit
                line.startsWith("data:") -> {
                    val value = line.substring(5).removePrefix(" ")
                    val valueBytes = value.toByteArray(Charsets.UTF_8).size
                    val separatorBytes = if (data.isEmpty()) 0 else 1
                    if (eventBytes + valueBytes + separatorBytes > MAX_SSE_EVENT_BYTES) {
                        throw SdkException(
                            status = response.status.value,
                            code = "SSE_EVENT_TOO_LARGE",
                            message = "SSE event exceeds $MAX_SSE_EVENT_BYTES bytes",
                            requestId = response.headers["x-request-id"]
                                ?: response.headers["request-id"],
                        )
                    }
                    if (data.isNotEmpty()) data.append('\n')
                    data.append(value)
                    eventBytes += valueBytes + separatorBytes
                }
            }

            if (!completeLine) break
        }

        if (data.isNotEmpty()) {
            emitEvent(decode(data.toString()))
        }
    }

    override fun close() {
        client.close()
    }

    private fun canRetry(method: HttpMethod, headers: Map<String, String>?): Boolean {
        if (config.retryUnsafeRequests || method in RETRYABLE_METHODS) return true
        return config.defaultHeaders.any { (name, value) ->
            (name.equals("Idempotency-Key", ignoreCase = true) ||
                name.equals("X-Idempotency-Key", ignoreCase = true)) &&
                value.isNotEmpty()
        } || headers?.any { (name, value) ->
            (name.equals("Idempotency-Key", ignoreCase = true) ||
                name.equals("X-Idempotency-Key", ignoreCase = true)) &&
                value.isNotEmpty()
        } == true
    }

    private fun retryDelayMs(retryAfter: String?, attempt: Int): Long {
        val serverDelay = retryAfter?.trim()?.let { value ->
            value.toLongOrNull()?.let { seconds ->
                seconds.coerceIn(0L, MAX_RETRY_DELAY_MS / 1_000L) * 1_000L
            }
                ?: runCatching {
                    max(
                        0L,
                        ZonedDateTime.parse(value, DateTimeFormatter.RFC_1123_DATE_TIME)
                            .toInstant()
                            .toEpochMilli() - System.currentTimeMillis(),
                    )
                }.getOrNull()
        }
        if (serverDelay != null) return serverDelay.coerceAtMost(MAX_RETRY_DELAY_MS)

        val base = (200L * (1L shl attempt.coerceAtMost(10))).coerceAtMost(MAX_RETRY_DELAY_MS)
        return (base + Random.nextLong(base / 2 + 1)).coerceAtMost(MAX_RETRY_DELAY_MS)
    }

    private suspend fun buildSdkException(response: HttpResponse): SdkException {
        val status = response.status.value
        val body = readResponseBody(response)
        val requestId = response.headers["x-request-id"] ?: response.headers["request-id"]

        var code: String? = null
        var message = body.takeIf { it.isNotBlank() } ?: "API error (status $status)"

        if (body.isNotBlank()) {
            runCatching {
                val jsonBody = json.decodeFromString<JsonObject>(body)
                val error = jsonBody["error"]
                code = jsonBody["code"]?.jsonPrimitive?.content
                    ?: (error as? JsonObject)?.get("code")?.jsonPrimitive?.content
                message = jsonBody["message"]?.jsonPrimitive?.content
                    ?: (error as? JsonObject)?.get("message")?.jsonPrimitive?.content
                    ?: error?.jsonPrimitive?.content
                    ?: message
            }
        }

        return SdkException(status, code, message, requestId)
    }

    internal companion object {
        val RETRYABLE_METHODS = setOf(
            HttpMethod.Get,
            HttpMethod.Head,
            HttpMethod.Options,
            HttpMethod.Put,
            HttpMethod.Delete,
        )
        val RETRYABLE_STATUSES = setOf(408, 425, 429, 500, 502, 503, 504)
        const val MAX_RETRIES = 8
        const val MAX_RETRY_DELAY_MS = 30_000L
        const val MAX_RESPONSE_BODY_BYTES = 5 * 1024 * 1024
        const val MAX_SSE_LINE_BYTES = 1024 * 1024
        const val MAX_SSE_EVENT_BYTES = 1024 * 1024
        const val READ_BUFFER_BYTES = 8 * 1024

        internal fun isRetryableStatus(status: Int): Boolean = status in RETRYABLE_STATUSES
    }
}
