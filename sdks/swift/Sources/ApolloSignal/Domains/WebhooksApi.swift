import Foundation

/// WebhooksAPI API operations.
public final class WebhooksApi: @unchecked Sendable {
    private let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func listWebhooks(
        projectId: String
    ) async throws -> WebhookPageResponse {
        var path = "/v1/projects/{projectId}/webhooks"
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
        return try await transport.execute(request, as: WebhookPageResponse.self)
    }

    public func getWebhook(
        projectId: String,
        endpointId: String
    ) async throws -> WebhookResponse {
        var path = "/v1/projects/{projectId}/webhooks/{endpointId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{endpointId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(endpointId))
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
        return try await transport.execute(request, as: WebhookResponse.self)
    }

    public func listWebhookDeliveries(
        projectId: String,
        endpointId: String
    ) async throws -> WebhookDeliveryPageResponse {
        var path = "/v1/projects/{projectId}/webhooks/{endpointId}/deliveries"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{endpointId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(endpointId))
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
        return try await transport.execute(request, as: WebhookDeliveryPageResponse.self)
    }

    public func getWebhookDelivery(
        projectId: String,
        endpointId: String,
        deliveryId: String
    ) async throws -> WebhookDeliveryResponse {
        var path = "/v1/projects/{projectId}/webhooks/{endpointId}/deliveries/{deliveryId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{endpointId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(endpointId))
        )
        path = path.replacingOccurrences(
            of: "{deliveryId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(deliveryId))
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
        return try await transport.execute(request, as: WebhookDeliveryResponse.self)
    }

    public func createWebhook(
        projectId: String,
        body: CreateWebhookBody
    ) async throws -> WebhookCreateResponse {
        var path = "/v1/projects/{projectId}/webhooks"
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
        return try await transport.execute(request, as: WebhookCreateResponse.self)
    }

    public func updateWebhook(
        projectId: String,
        endpointId: String,
        body: UpdateWebhookBody
    ) async throws -> WebhookResponse {
        var path = "/v1/projects/{projectId}/webhooks/{endpointId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{endpointId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(endpointId))
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
        return try await transport.execute(request, as: WebhookResponse.self)
    }

    public func deleteWebhook(
        projectId: String,
        endpointId: String
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/webhooks/{endpointId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{endpointId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(endpointId))
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

    public func testWebhook(
        projectId: String,
        endpointId: String
    ) async throws -> WebhookDeliveryResponse {
        var path = "/v1/projects/{projectId}/webhooks/{endpointId}/test"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{endpointId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(endpointId))
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
        return try await transport.execute(request, as: WebhookDeliveryResponse.self)
    }

    public func replayWebhookDelivery(
        projectId: String,
        endpointId: String,
        deliveryId: String
    ) async throws -> Void {
        var path = "/v1/projects/{projectId}/webhooks/{endpointId}/replay/{deliveryId}"
        path = path.replacingOccurrences(
            of: "{projectId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(projectId))
        )
        path = path.replacingOccurrences(
            of: "{endpointId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(endpointId))
        )
        path = path.replacingOccurrences(
            of: "{deliveryId}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(deliveryId))
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
        try await transport.executeVoid(request)
    }

}
