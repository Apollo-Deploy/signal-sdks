import Foundation

/// ContactsAPI API operations.
public final class ContactsApi: @unchecked Sendable {
    private let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func listContacts(
        projectId: String
    ) async throws -> ContactPageResponse {
        var path = "/v1/projects/{projectId}/contacts"
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
        return try await transport.execute(request, as: ContactPageResponse.self)
    }

    public func getContact(
        projectId: String,
        contactId: String
    ) async throws -> ContactResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        return try await transport.execute(request, as: ContactResponse.self)
    }

    public func listContactSegments(
        projectId: String,
        contactId: String
    ) async throws -> ListContactSegmentsResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/segments"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        return try await transport.execute(request, as: ListContactSegmentsResponse.self)
    }

    public func getContactTopics(
        projectId: String,
        contactId: String
    ) async throws -> GetContactTopicsResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/topics"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        return try await transport.execute(request, as: GetContactTopicsResponse.self)
    }

    public func createContact(
        projectId: String,
        body: CreateContactBody
    ) async throws -> ContactResponse {
        var path = "/v1/projects/{projectId}/contacts"
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
        return try await transport.execute(request, as: ContactResponse.self)
    }

    public func updateContact(
        projectId: String,
        contactId: String,
        body: UpdateContactBody
    ) async throws -> ContactResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        return try await transport.execute(request, as: ContactResponse.self)
    }

    public func deleteContact(
        projectId: String,
        contactId: String
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/contacts/{contactId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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

    public func uploadContactImage(
        projectId: String,
        contactId: String
    ) async throws -> ContactResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/image"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        return try await transport.execute(request, as: ContactResponse.self)
    }

    public func setContactImageUrl(
        projectId: String,
        contactId: String,
        body: SetImageUrlBody
    ) async throws -> ContactResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/image"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
        )

        let query = Transport.QueryParameters()
        let headers: [String: String] = [:]

        let bodyData = try Transport.encodeJSON(body)
        let request = Transport.Request(
            method: "PUT",
            path: path,
            query: query.isEmpty ? nil : query,
            headers: headers.isEmpty ? nil : headers,
            body: bodyData,
            contentType: "application/json",
            timeoutMilliseconds: nil
        )
        return try await transport.execute(request, as: ContactResponse.self)
    }

    public func deleteContactImage(
        projectId: String,
        contactId: String
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/image"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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

    public func addContactToSegment(
        projectId: String,
        contactId: String,
        body: AddToSegmentBody
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/segments"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        try await transport.executeVoid(request)
    }

    public func removeContactFromSegment(
        projectId: String,
        contactId: String,
        segmentId: String
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/segments/{segmentId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
        )
        path = path.replacingOccurrences(
            of: "{segmentId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(segmentId))
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

    public func updateContactTopics(
        projectId: String,
        contactId: String,
        body: UpdateTopicsBody
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/topics"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        try await transport.executeVoid(request)
    }

    public func getContactActivity(
        projectId: String,
        contactId: String
    ) async throws -> GetContactActivityResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/activity"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        return try await transport.execute(request, as: GetContactActivityResponse.self)
    }

    public func getContactEngagementScore(
        projectId: String,
        contactId: String
    ) async throws -> EngagementScoreResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/engagement"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        return try await transport.execute(request, as: EngagementScoreResponse.self)
    }

    public func getContactEmailValidationStatus(
        projectId: String,
        contactId: String
    ) async throws -> EmailValidationStatusResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/email-validation"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        return try await transport.execute(request, as: EmailValidationStatusResponse.self)
    }

    public func refreshContactEngagementScore(
        projectId: String,
        contactId: String
    ) async throws -> EngagementScoreResponse {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/engagement/refresh"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        return try await transport.execute(request, as: EngagementScoreResponse.self)
    }

    public func recordContactEmailValidation(
        projectId: String,
        contactId: String,
        body: RecordValidationBody
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/contacts/{contactId}/email-validation"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{contactId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(contactId))
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
        try await transport.executeVoid(request)
    }

}
