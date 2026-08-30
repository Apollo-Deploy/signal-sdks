import Foundation

/// MetricsAPI API operations.
public final class MetricsApi: @unchecked Sendable {
    private let transport: Transport

    init(transport: Transport) {
        self.transport = transport
    }

    public func getTopicPerformance(
        id: String,
        window: String? = nil,
        projectId: String? = nil
    ) async throws -> TopicPerformanceResponse {
        var path = "/v1/metrics/topics/{id}"
        path = path.replacingOccurrences(
            of: "{id}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(id))
        )

        var query = Transport.QueryParameters()
        if let value = window {
            query["window"] = Transport.stringValue(value)
        }
        if let value = projectId {
            query["projectId"] = Transport.stringValue(value)
        }
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
        return try await transport.execute(request, as: TopicPerformanceResponse.self)
    }

    public func getEmailPerformance(
        id: String
    ) async throws -> EmailPerformanceResponse {
        var path = "/v1/metrics/emails/{id}"
        path = path.replacingOccurrences(
            of: "{id}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(id))
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
        return try await transport.execute(request, as: EmailPerformanceResponse.self)
    }

    public func getEmailEngagement(
        id: String
    ) async throws -> EmailReadScrollAnalyticsResponse {
        var path = "/v1/metrics/emails/{id}/engagement"
        path = path.replacingOccurrences(
            of: "{id}",
            with: Transport.percentEncodePathComponent(Transport.stringValue(id))
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
        return try await transport.execute(request, as: EmailReadScrollAnalyticsResponse.self)
    }

    public func getProjectMetricsSummary(
        window: String? = nil,
        projectId: String? = nil
    ) async throws -> ProjectMetricsSummaryResponse {
        let path = "/v1/metrics/summary"

        var query = Transport.QueryParameters()
        if let value = window {
            query["window"] = Transport.stringValue(value)
        }
        if let value = projectId {
            query["projectId"] = Transport.stringValue(value)
        }
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
        return try await transport.execute(request, as: ProjectMetricsSummaryResponse.self)
    }

    public func getProjectMetricsTimeline(
        window: String? = nil,
        granularity: String? = nil,
        format: String? = nil,
        projectId: String? = nil
    ) async throws -> ProjectMetricsTimelineResponse {
        let path = "/v1/metrics/timeline"

        var query = Transport.QueryParameters()
        if let value = window {
            query["window"] = Transport.stringValue(value)
        }
        if let value = granularity {
            query["granularity"] = Transport.stringValue(value)
        }
        if let value = format {
            query["format"] = Transport.stringValue(value)
        }
        if let value = projectId {
            query["projectId"] = Transport.stringValue(value)
        }
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
        return try await transport.execute(request, as: ProjectMetricsTimelineResponse.self)
    }

    public func getMetricsAdvisor(
        projectId: String? = nil
    ) async throws -> AdvisorReportResponse {
        let path = "/v1/metrics/advisor"

        var query = Transport.QueryParameters()
        if let value = projectId {
            query["projectId"] = Transport.stringValue(value)
        }
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
        return try await transport.execute(request, as: AdvisorReportResponse.self)
    }

}
