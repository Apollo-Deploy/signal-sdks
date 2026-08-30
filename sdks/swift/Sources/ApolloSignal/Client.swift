import Foundation

/// Invalid combinations of generated SDK client configuration.
public enum SDKConfigurationError: Error, Sendable {
    case conflictingSecuritySchemes(header: String)
}

/// Configuration for the Apollo Signal API API client.
public struct ClientConfig: Sendable {
    public let baseURL: String
    public let defaultHeaders: [String: String]
    public let timeoutMilliseconds: Int
    public let maxRetries: Int
    public let retryUnsafeRequests: Bool
    public let maxRequestBodyBytes: Int
    public let maxResponseBodyBytes: Int

    public init(
        baseURL: String = "https://signal.apollodeploy.com",
        defaultHeaders: [String: String] = [:],
        timeoutMilliseconds: Int = 15_000,
        maxRetries: Int = 3,
        retryUnsafeRequests: Bool = false,
        maxRequestBodyBytes: Int = 5 * 1024 * 1024,
        maxResponseBodyBytes: Int = 5 * 1024 * 1024
    ) {
        self.baseURL = baseURL
        self.defaultHeaders = defaultHeaders
        self.timeoutMilliseconds = timeoutMilliseconds
        self.maxRetries = maxRetries
        self.retryUnsafeRequests = retryUnsafeRequests
        self.maxRequestBodyBytes = maxRequestBodyBytes
        self.maxResponseBodyBytes = maxResponseBodyBytes
    }
}

/// Primary API client for Apollo Signal API.
public final class ApolloSignalApi: @unchecked Sendable {
    private let transport: Transport

    public let emails: EmailsApi
    public let metrics: MetricsApi
    public let suppressions: SuppressionsApi
    public let segments: SegmentsApi
    public let topics: TopicsApi
    public let contactProperties: ContactPropertiesApi
    public let contacts: ContactsApi
    public let webhooks: WebhooksApi
    public let apiKeys: ApiKeysApi
    public let projects: ProjectsApi
    public let sendingDomains: SendingDomainsApi

    public init(configuration: ClientConfig = ClientConfig()) throws {
        let authHeaders: [String: String] = [:]
        let authQuery: [String: String] = [:]
        let authCookies: [String: String] = [:]

        transport = Transport(
            configuration: Transport.Configuration(
                baseURL: configuration.baseURL,
                defaultHeaders: configuration.defaultHeaders,
                timeoutMilliseconds: configuration.timeoutMilliseconds,
                maxRetries: configuration.maxRetries,
                retryUnsafeRequests: configuration.retryUnsafeRequests,
                maxRequestBodyBytes: configuration.maxRequestBodyBytes,
                maxResponseBodyBytes: configuration.maxResponseBodyBytes,
                authHeaders: authHeaders,
                authQuery: authQuery,
                authCookies: authCookies,
                userAgent: "ApolloSignal/1.0.4"
            )
        )
        emails = EmailsApi(transport: transport)
        metrics = MetricsApi(transport: transport)
        suppressions = SuppressionsApi(transport: transport)
        segments = SegmentsApi(transport: transport)
        topics = TopicsApi(transport: transport)
        contactProperties = ContactPropertiesApi(transport: transport)
        contacts = ContactsApi(transport: transport)
        webhooks = WebhooksApi(transport: transport)
        apiKeys = ApiKeysApi(transport: transport)
        projects = ProjectsApi(transport: transport)
        sendingDomains = SendingDomainsApi(transport: transport)
    }
}
