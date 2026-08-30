import Foundation

/// SendingDomainsAPI API operations.
public final class SendingDomainsApi: @unchecked Sendable {
    private let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func listDomains(
        projectId: String
    ) async throws -> DomainListPageResponse {
        var path = "/v1/projects/{projectId}/domains"
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
        return try await transport.execute(request, as: DomainListPageResponse.self)
    }

    public func getDomain(
        projectId: String,
        domainId: String
    ) async throws -> DomainResponse {
        var path = "/v1/projects/{projectId}/domains/{domainId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{domainId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(domainId))
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
        return try await transport.execute(request, as: DomainResponse.self)
    }

    public func registerDomain(
        projectId: String,
        body: RegisterDomainRequest
    ) async throws -> DomainResponse {
        var path = "/v1/projects/{projectId}/domains"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData = try Transport.encodeJSON(body)
        let request = Transport.Request(
            method: "POST",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: "application/json",
            timeoutMilliseconds: nil
        )
        return try await transport.execute(request, as: DomainResponse.self)
    }

    public func verifyDomain(
        projectId: String,
        domainId: String
    ) async throws -> DomainResponse {
        var path = "/v1/projects/{projectId}/domains/{domainId}/verify"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{domainId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(domainId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData: Data? = Data("{}".utf8)
        let request = Transport.Request(
            method: "POST",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: "application/json",
            timeoutMilliseconds: nil
        )
        return try await transport.execute(request, as: DomainResponse.self)
    }

    public func deleteDomain(
        projectId: String,
        domainId: String
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/domains/{domainId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{domainId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(domainId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData: Data? = nil
        let request = Transport.Request(
            method: "DELETE",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: nil,
            timeoutMilliseconds: nil
        )
        try await transport.executeVoid(request)
    }

    public func verifyBimi(
        projectId: String,
        domainId: String
    ) async throws -> DomainResponse {
        var path = "/v1/projects/{projectId}/domains/{domainId}/bimi/verify"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{domainId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(domainId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData: Data? = Data("{}".utf8)
        let request = Transport.Request(
            method: "POST",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: "application/json",
            timeoutMilliseconds: nil
        )
        return try await transport.execute(request, as: DomainResponse.self)
    }

    public func updateBimi(
        projectId: String,
        domainId: String,
        body: UpdateBimiRequest
    ) async throws -> DomainResponse {
        var path = "/v1/projects/{projectId}/domains/{domainId}/bimi"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{domainId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(domainId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData = try Transport.encodeJSON(body)
        let request = Transport.Request(
            method: "PATCH",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: "application/json",
            timeoutMilliseconds: nil
        )
        return try await transport.execute(request, as: DomainResponse.self)
    }

}
