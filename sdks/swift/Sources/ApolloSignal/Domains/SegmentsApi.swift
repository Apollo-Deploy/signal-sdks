import Foundation

/// SegmentsAPI API operations.
public final class SegmentsApi: @unchecked Sendable {
    private let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func listSegments(
        projectId: String
    ) async throws -> SegmentPageResponse {
        var path = "/v1/projects/{projectId}/segments"
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
        return try await transport.execute(request, as: SegmentPageResponse.self)
    }

    public func getSegment(
        projectId: String,
        segmentId: String
    ) async throws -> SegmentResponse {
        var path = "/v1/projects/{projectId}/segments/{segmentId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{segmentId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(segmentId))
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
        return try await transport.execute(request, as: SegmentResponse.self)
    }

    public func listContactsInSegment(
        projectId: String,
        segmentId: String
    ) async throws -> CursorPage {
        var path = "/v1/projects/{projectId}/segments/{segmentId}/contacts"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{segmentId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(segmentId))
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
        return try await transport.execute(request, as: CursorPage.self)
    }

    public func createSegment(
        projectId: String,
        body: CreateSegmentBody
    ) async throws -> SegmentResponse {
        var path = "/v1/projects/{projectId}/segments"
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
        return try await transport.execute(request, as: SegmentResponse.self)
    }

    public func deleteSegment(
        projectId: String,
        segmentId: String
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/segments/{segmentId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
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

}
