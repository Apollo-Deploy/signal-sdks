import Foundation

/// ApiKeysAPI API operations.
public final class ApiKeysApi: @unchecked Sendable {
    private let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func listApiKeys(
        projectId: String
    ) async throws -> ListApiKeysResponse {
        var path = "/v1/projects/{projectId}/api-keys"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData: Data? = nil
        let request = Transport.Request(
            method: "GET",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: nil,
            timeoutMilliseconds: nil
        )
        return try await transport.execute(request, as: ListApiKeysResponse.self)
    }

    public func getApiKey(
        projectId: String,
        keyId: String
    ) async throws -> ApiKey {
        var path = "/v1/projects/{projectId}/api-keys/{keyId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{keyId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(keyId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData: Data? = nil
        let request = Transport.Request(
            method: "GET",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: nil,
            timeoutMilliseconds: nil
        )
        return try await transport.execute(request, as: ApiKey.self)
    }

    public func getApiKeyUsage(
        projectId: String,
        keyId: String
    ) async throws -> ApiKeyUsageResponse {
        var path = "/v1/projects/{projectId}/api-keys/{keyId}/usage"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{keyId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(keyId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData: Data? = nil
        let request = Transport.Request(
            method: "GET",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: nil,
            timeoutMilliseconds: nil
        )
        return try await transport.execute(request, as: ApiKeyUsageResponse.self)
    }

    public func exportApiKeyUsage(
        projectId: String,
        keyId: String
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/api-keys/{keyId}/usage/export"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{keyId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(keyId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData: Data? = nil
        let request = Transport.Request(
            method: "GET",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: nil,
            timeoutMilliseconds: nil
        )
        try await transport.executeVoid(request)
    }

}
