import Foundation

/// ContactPropertiesAPI API operations.
public final class ContactPropertiesApi: @unchecked Sendable {
    private let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func listContactProperties(
        projectId: String
    ) async throws -> ContactPropertyPageResponse {
        var path = "/v1/projects/{projectId}/contact-properties"
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
        return try await transport.execute(request, as: ContactPropertyPageResponse.self)
    }

    public func getContactProperty(
        projectId: String,
        propertyId: String
    ) async throws -> ContactPropertyResponse {
        var path = "/v1/projects/{projectId}/contact-properties/{propertyId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{propertyId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(propertyId))
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
        return try await transport.execute(request, as: ContactPropertyResponse.self)
    }

    public func createContactProperty(
        projectId: String,
        body: CreateContactPropertyBody
    ) async throws -> ContactPropertyResponse {
        var path = "/v1/projects/{projectId}/contact-properties"
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
        return try await transport.execute(request, as: ContactPropertyResponse.self)
    }

    public func updateContactProperty(
        projectId: String,
        propertyId: String,
        body: UpdateContactPropertyBody
    ) async throws -> ContactPropertyResponse {
        var path = "/v1/projects/{projectId}/contact-properties/{propertyId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{propertyId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(propertyId))
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
        return try await transport.execute(request, as: ContactPropertyResponse.self)
    }

    public func deleteContactProperty(
        projectId: String,
        propertyId: String
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/contact-properties/{propertyId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{propertyId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(propertyId))
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

}
