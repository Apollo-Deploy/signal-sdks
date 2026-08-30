package com.apollodeploy.signal.sdk

import com.apollodeploy.signal.sdk.api.*
import com.apollodeploy.signal.sdk.internal.Transport
import com.apollodeploy.signal.sdk.internal.TransportConfig

/** Configuration for the Apollo Signal API API client. */
data class ClientConfig(
    val baseUrl: String = "https://signal.apollodeploy.com",
    /** Headers sent with every request. */
    val defaultHeaders: Map<String, String> = emptyMap(),
    /** Request timeout in milliseconds. */
    val timeoutMs: Long = 15_000,
    /** Number of retries after the initial request. */
    val maxRetries: Int = 3,
    /** Allow automatic retries for POST and PATCH requests. */
    val retryUnsafeRequests: Boolean = false,
)

/** Primary API client for Apollo Signal API. */
class ApolloSignalApiClient(
    config: ClientConfig = ClientConfig(),
) : AutoCloseable {
    private val transport = Transport(
        TransportConfig(
            baseUrl = config.baseUrl,
            defaultHeaders = config.defaultHeaders,
            timeoutMs = config.timeoutMs,
            maxRetries = config.maxRetries,
            retryUnsafeRequests = config.retryUnsafeRequests,
        ),
    )

    /** EmailsAPI API operations. */
    val emails: EmailsAPI = EmailsAPI(transport)
    /** MetricsAPI API operations. */
    val metrics: MetricsAPI = MetricsAPI(transport)
    /** SuppressionsAPI API operations. */
    val suppressions: SuppressionsAPI = SuppressionsAPI(transport)
    /** SegmentsAPI API operations. */
    val segments: SegmentsAPI = SegmentsAPI(transport)
    /** TopicsAPI API operations. */
    val topics: TopicsAPI = TopicsAPI(transport)
    /** ContactPropertiesAPI API operations. */
    val contactProperties: ContactPropertiesAPI = ContactPropertiesAPI(transport)
    /** ContactsAPI API operations. */
    val contacts: ContactsAPI = ContactsAPI(transport)
    /** WebhooksAPI API operations. */
    val webhooks: WebhooksAPI = WebhooksAPI(transport)
    /** ApiKeysAPI API operations. */
    val apiKeys: ApiKeysAPI = ApiKeysAPI(transport)
    /** ProjectsAPI API operations. */
    val projects: ProjectsAPI = ProjectsAPI(transport)
    /** SendingDomainsAPI API operations. */
    val sendingDomains: SendingDomainsAPI = SendingDomainsAPI(transport)

    override fun close() {
        transport.close()
    }
}
