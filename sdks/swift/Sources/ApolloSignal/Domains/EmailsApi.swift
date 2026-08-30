import Foundation

/// EmailsAPI API operations.
public final class EmailsApi: @unchecked Sendable {
    private let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func sendEmail(
        body: SendEmailRequest
    ) async throws -> SendEmailResponse {
        let path = "/v1/emails"

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
        return try await transport.execute(request, as: SendEmailResponse.self)
    }

    public func getEmail(
        emailId: String
    ) async throws -> EmailDetailResponse {
        var path = "/v1/emails/{emailId}"
        path = path.replacingOccurrences(
            of: "{emailId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(emailId))
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
        return try await transport.execute(request, as: EmailDetailResponse.self)
    }

    public func batchSendEmails(
        body: BatchSendRequest
    ) async throws -> BatchSendResponse {
        let path = "/v1/emails/batch"

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
        return try await transport.execute(request, as: BatchSendResponse.self)
    }

    public func cancelEmail(
        emailId: String
    ) async throws -> CancelResponse {
        var path = "/v1/emails/{emailId}"
        path = path.replacingOccurrences(
            of: "{emailId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(emailId))
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
        return try await transport.execute(request, as: CancelResponse.self)
    }

    public func bulkCancelEmails(
    ) async throws -> BulkCancelResponse {
        let path = "/v1/emails"

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
        return try await transport.execute(request, as: BulkCancelResponse.self)
    }

    public func issueStreamToken(
        projectId: String
    ) async throws -> StreamTokenResponse {
        var path = "/v1/emails/{projectId}/stream/token"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
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
        return try await transport.execute(request, as: StreamTokenResponse.self)
    }

    public func streamEmailEvents(
    ) throws -> AsyncThrowingStream<SSEEvent<StreamEventResponse>, Error> {
        let path = "/v1/emails/stream"

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
        return transport.stream(request, as: StreamEventResponse.self)
    }

    public func validateLinks(
        body: ValidateLinksRequest
    ) async throws -> ValidateLinksResponse {
        let path = "/v1/emails/validate"

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
        return try await transport.execute(request, as: ValidateLinksResponse.self)
    }

}
