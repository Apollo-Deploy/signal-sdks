import Foundation

/// Concrete JSON fallback used only for manifest values whose shape is intentionally open.
public enum JSONValue: Codable, Sendable, Equatable {
    case string(String)
    case number(Double)
    case boolean(Bool)
    case object([String: JSONValue])
    case array([JSONValue])
    case null

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            self = .null
        } else if let value = try? container.decode(Bool.self) {
            self = .boolean(value)
        } else if let value = try? container.decode(Double.self) {
            self = .number(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([String: JSONValue].self) {
            self = .object(value)
        } else if let value = try? container.decode([JSONValue].self) {
            self = .array(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Value is not representable as JSONValue"
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case let .string(value):
            try value.encode(to: encoder)
        case let .number(value):
            try value.encode(to: encoder)
        case let .boolean(value):
            try value.encode(to: encoder)
        case let .object(value):
            try value.encode(to: encoder)
        case let .array(value):
            try value.encode(to: encoder)
        case .null:
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }
}


public struct AttachmentRequest: Codable, Sendable {
    public let filename: String
    public let content: String
    public let contentType: String
    public let disposition: String?
    public let contentId: String?

    public init(
        filename: String,
        content: String,
        contentType: String,
        disposition: String? = nil,
        contentId: String? = nil
    ) {
        self.filename = filename
        self.content = content
        self.contentType = contentType
        self.disposition = disposition
        self.contentId = contentId
    }

    private enum CodingKeys: String, CodingKey {
        case filename = "filename"
        case content = "content"
        case contentType = "contentType"
        case disposition = "disposition"
        case contentId = "contentId"
    }
}


public struct DeliveryWindowRequest: Codable, Sendable {
    public let start: String
    public let end: String

    public init(
        start: String,
        end: String
    ) {
        self.start = start
        self.end = end
    }

    private enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
    }
}


public struct TrackingSettingsRequest: Codable, Sendable {
    public let openTracking: Bool?
    public let clickTracking: Bool?
    public let unsubscribeTracking: Bool?
    public let readEngagement: Bool?

    public init(
        openTracking: Bool? = nil,
        clickTracking: Bool? = nil,
        unsubscribeTracking: Bool? = nil,
        readEngagement: Bool? = nil
    ) {
        self.openTracking = openTracking
        self.clickTracking = clickTracking
        self.unsubscribeTracking = unsubscribeTracking
        self.readEngagement = readEngagement
    }

    private enum CodingKeys: String, CodingKey {
        case openTracking = "openTracking"
        case clickTracking = "clickTracking"
        case unsubscribeTracking = "unsubscribeTracking"
        case readEngagement = "readEngagement"
    }
}


public struct SendEmailRequest: Codable, Sendable {
    public let from: String
    public let to: [String]
    public let cc: [String]?
    public let bcc: [String]?
    public let replyTo: String?
    public let subject: String?
    public let html: String?
    public let text: String?
    public let tags: [String: String]?
    public let metadata: [String: String]?
    public let idempotencyKey: String?
    public let testMode: Bool?
    public let attachments: [AttachmentRequest]?
    public let scheduledAt: String?
    public let deliveryWindow: DeliveryWindowRequest?
    public let sendTimeCategory: String?
    public let trackingSettings: TrackingSettingsRequest?

    public init(
        from: String,
        to: [String],
        cc: [String]? = nil,
        bcc: [String]? = nil,
        replyTo: String? = nil,
        subject: String? = nil,
        html: String? = nil,
        text: String? = nil,
        tags: [String: String]? = nil,
        metadata: [String: String]? = nil,
        idempotencyKey: String? = nil,
        testMode: Bool? = nil,
        attachments: [AttachmentRequest]? = nil,
        scheduledAt: String? = nil,
        deliveryWindow: DeliveryWindowRequest? = nil,
        sendTimeCategory: String? = nil,
        trackingSettings: TrackingSettingsRequest? = nil
    ) {
        self.from = from
        self.to = to
        self.cc = cc
        self.bcc = bcc
        self.replyTo = replyTo
        self.subject = subject
        self.html = html
        self.text = text
        self.tags = tags
        self.metadata = metadata
        self.idempotencyKey = idempotencyKey
        self.testMode = testMode
        self.attachments = attachments
        self.scheduledAt = scheduledAt
        self.deliveryWindow = deliveryWindow
        self.sendTimeCategory = sendTimeCategory
        self.trackingSettings = trackingSettings
    }

    private enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
        case cc = "cc"
        case bcc = "bcc"
        case replyTo = "replyTo"
        case subject = "subject"
        case html = "html"
        case text = "text"
        case tags = "tags"
        case metadata = "metadata"
        case idempotencyKey = "idempotencyKey"
        case testMode = "testMode"
        case attachments = "attachments"
        case scheduledAt = "scheduledAt"
        case deliveryWindow = "deliveryWindow"
        case sendTimeCategory = "sendTimeCategory"
        case trackingSettings = "trackingSettings"
    }
}


public struct BatchSendItemResponse: Codable, Sendable {
    public let index: Int
    public let id: String?
    public let messageId: String?
    public let status: String?
    public let createdAt: String?
    public let scheduledAt: String?
    public let error: String?

    public init(
        index: Int,
        id: String? = nil,
        messageId: String? = nil,
        status: String? = nil,
        createdAt: String? = nil,
        scheduledAt: String? = nil,
        error: String? = nil
    ) {
        self.index = index
        self.id = id
        self.messageId = messageId
        self.status = status
        self.createdAt = createdAt
        self.scheduledAt = scheduledAt
        self.error = error
    }

    private enum CodingKeys: String, CodingKey {
        case index = "index"
        case id = "id"
        case messageId = "messageId"
        case status = "status"
        case createdAt = "createdAt"
        case scheduledAt = "scheduledAt"
        case error = "error"
    }
}


public struct SendEmailResponse: Codable, Sendable {
    public let id: String
    public let messageId: String?
    public let status: String
    public let createdAt: String
    public let scheduledAt: String?
    public let audienceId: String?
    public let messages: [BatchSendItemResponse]?

    public init(
        id: String,
        messageId: String?,
        status: String,
        createdAt: String,
        scheduledAt: String? = nil,
        audienceId: String? = nil,
        messages: [BatchSendItemResponse]? = nil
    ) {
        self.id = id
        self.messageId = messageId
        self.status = status
        self.createdAt = createdAt
        self.scheduledAt = scheduledAt
        self.audienceId = audienceId
        self.messages = messages
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case messageId = "messageId"
        case status = "status"
        case createdAt = "createdAt"
        case scheduledAt = "scheduledAt"
        case audienceId = "audienceId"
        case messages = "messages"
    }
}


public struct EmailDetailResponse: Codable, Sendable {
    public let id: String
    public let messageId: String?
    public let from: String
    public let to: [String]
    public let cc: [String]?
    public let bcc: [String]?
    public let replyTo: String?
    public let subject: String
    public let html: String?
    public let text: String?
    public let status: String
    public let error: String?
    public let tags: [String: String]?
    public let metadata: [String: String]?
    public let testMode: Bool
    public let topicId: String?
    public let createdAt: String
    public let sentAt: String?
    public let updatedAt: String?

    public init(
        id: String,
        messageId: String?,
        from: String,
        to: [String],
        cc: [String]?,
        bcc: [String]?,
        replyTo: String?,
        subject: String,
        html: String? = nil,
        text: String? = nil,
        status: String,
        error: String?,
        tags: [String: String]?,
        metadata: [String: String]?,
        testMode: Bool,
        topicId: String? = nil,
        createdAt: String,
        sentAt: String?,
        updatedAt: String?
    ) {
        self.id = id
        self.messageId = messageId
        self.from = from
        self.to = to
        self.cc = cc
        self.bcc = bcc
        self.replyTo = replyTo
        self.subject = subject
        self.html = html
        self.text = text
        self.status = status
        self.error = error
        self.tags = tags
        self.metadata = metadata
        self.testMode = testMode
        self.topicId = topicId
        self.createdAt = createdAt
        self.sentAt = sentAt
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case messageId = "messageId"
        case from = "from"
        case to = "to"
        case cc = "cc"
        case bcc = "bcc"
        case replyTo = "replyTo"
        case subject = "subject"
        case html = "html"
        case text = "text"
        case status = "status"
        case error = "error"
        case tags = "tags"
        case metadata = "metadata"
        case testMode = "testMode"
        case topicId = "topicId"
        case createdAt = "createdAt"
        case sentAt = "sentAt"
        case updatedAt = "updatedAt"
    }
}


public struct BatchSendRequest: Codable, Sendable {
    public let items: [SendEmailRequest]

    public init(
        items: [SendEmailRequest]
    ) {
        self.items = items
    }

    private enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}


public struct BatchSendResponse: Codable, Sendable {
    public let results: [BatchSendItemResponse]

    public init(
        results: [BatchSendItemResponse]
    ) {
        self.results = results
    }

    private enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}


public struct CancelResponse: Codable, Sendable {
    public let cancelled: Bool?

    public init(
        cancelled: Bool? = nil
    ) {
        self.cancelled = cancelled
    }

    private enum CodingKeys: String, CodingKey {
        case cancelled = "cancelled"
    }
}


public struct BulkCancelResponse: Codable, Sendable {
    public let cancelled: Int

    public init(
        cancelled: Int
    ) {
        self.cancelled = cancelled
    }

    private enum CodingKeys: String, CodingKey {
        case cancelled = "cancelled"
    }
}


public struct StreamTokenResponse: Codable, Sendable {
    public let token: String
    public let expiresAt: String

    public init(
        token: String,
        expiresAt: String
    ) {
        self.token = token
        self.expiresAt = expiresAt
    }

    private enum CodingKeys: String, CodingKey {
        case token = "token"
        case expiresAt = "expiresAt"
    }
}


public struct StreamEventResponse: Codable, Sendable {
    public let type: String
    public let emailId: String
    public let occurredAt: String
    public let data: [String: String]?

    public init(
        type: String,
        emailId: String,
        occurredAt: String,
        data: [String: String]? = nil
    ) {
        self.type = type
        self.emailId = emailId
        self.occurredAt = occurredAt
        self.data = data
    }

    private enum CodingKeys: String, CodingKey {
        case type = "type"
        case emailId = "emailId"
        case occurredAt = "occurredAt"
        case data = "data"
    }
}


public struct ValidateLinksRequest: Codable, Sendable {
    public let html: String?

    public init(
        html: String? = nil
    ) {
        self.html = html
    }

    private enum CodingKeys: String, CodingKey {
        case html = "html"
    }
}


public struct LinkResultItem: Codable, Sendable {
    public let url: String
    public let status: String
    public let statusCode: Int?
    public let error: String?

    public init(
        url: String,
        status: String,
        statusCode: Int? = nil,
        error: String? = nil
    ) {
        self.url = url
        self.status = status
        self.statusCode = statusCode
        self.error = error
    }

    private enum CodingKeys: String, CodingKey {
        case url = "url"
        case status = "status"
        case statusCode = "statusCode"
        case error = "error"
    }
}


public struct ValidateLinksResponse: Codable, Sendable {
    public let links: [LinkResultItem]
    public let totalLinks: Int
    public let brokenLinks: Int
    public let errorLinks: Int

    public init(
        links: [LinkResultItem],
        totalLinks: Int,
        brokenLinks: Int,
        errorLinks: Int
    ) {
        self.links = links
        self.totalLinks = totalLinks
        self.brokenLinks = brokenLinks
        self.errorLinks = errorLinks
    }

    private enum CodingKeys: String, CodingKey {
        case links = "links"
        case totalLinks = "totalLinks"
        case brokenLinks = "brokenLinks"
        case errorLinks = "errorLinks"
    }
}


public struct MetricsWindowResponse: Codable, Sendable {
    public let from: String
    public let to: String
    public let label: String

    public init(
        from: String,
        to: String,
        label: String
    ) {
        self.from = from
        self.to = to
        self.label = label
    }

    private enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
        case label = "label"
    }
}


public struct TopicPerformanceResponse: Codable, Sendable {
    public let topicId: String
    public let topicName: String
    public let window: MetricsWindowResponse
    public let totalEmails: Int
    public let delivered: Int
    public let deliveryRate: Double
    public let opened: Int
    public let openRate: Double
    public let clicked: Int
    public let clickRate: Double
    public let bounced: Int
    public let bounceRate: Double
    public let complained: Int
    public let complaintRate: Double
    public let unsubscribed: Int
    public let unsubscribeRate: Double
    public let readEngaged: Int
    public let readEngagementRate: Double
    public let avgReadTimeSeconds: Double?
    public let optInCount: Int
    public let optOutCount: Int
    public let computedAt: String

    public init(
        topicId: String,
        topicName: String,
        window: MetricsWindowResponse,
        totalEmails: Int,
        delivered: Int,
        deliveryRate: Double,
        opened: Int,
        openRate: Double,
        clicked: Int,
        clickRate: Double,
        bounced: Int,
        bounceRate: Double,
        complained: Int,
        complaintRate: Double,
        unsubscribed: Int,
        unsubscribeRate: Double,
        readEngaged: Int,
        readEngagementRate: Double,
        avgReadTimeSeconds: Double?,
        optInCount: Int,
        optOutCount: Int,
        computedAt: String
    ) {
        self.topicId = topicId
        self.topicName = topicName
        self.window = window
        self.totalEmails = totalEmails
        self.delivered = delivered
        self.deliveryRate = deliveryRate
        self.opened = opened
        self.openRate = openRate
        self.clicked = clicked
        self.clickRate = clickRate
        self.bounced = bounced
        self.bounceRate = bounceRate
        self.complained = complained
        self.complaintRate = complaintRate
        self.unsubscribed = unsubscribed
        self.unsubscribeRate = unsubscribeRate
        self.readEngaged = readEngaged
        self.readEngagementRate = readEngagementRate
        self.avgReadTimeSeconds = avgReadTimeSeconds
        self.optInCount = optInCount
        self.optOutCount = optOutCount
        self.computedAt = computedAt
    }

    private enum CodingKeys: String, CodingKey {
        case topicId = "topicId"
        case topicName = "topicName"
        case window = "window"
        case totalEmails = "totalEmails"
        case delivered = "delivered"
        case deliveryRate = "deliveryRate"
        case opened = "opened"
        case openRate = "openRate"
        case clicked = "clicked"
        case clickRate = "clickRate"
        case bounced = "bounced"
        case bounceRate = "bounceRate"
        case complained = "complained"
        case complaintRate = "complaintRate"
        case unsubscribed = "unsubscribed"
        case unsubscribeRate = "unsubscribeRate"
        case readEngaged = "readEngaged"
        case readEngagementRate = "readEngagementRate"
        case avgReadTimeSeconds = "avgReadTimeSeconds"
        case optInCount = "optInCount"
        case optOutCount = "optOutCount"
        case computedAt = "computedAt"
    }
}


public struct EmailPerformanceResponse: Codable, Sendable {
    public let emailId: String
    public let subject: String
    public let fromAddress: String
    public let topicId: String?
    public let status: String
    public let delivered: Bool
    public let opened: Bool
    public let clicked: Bool
    public let totalClicks: Int
    public let bounced: Bool
    public let complained: Bool
    public let unsubscribed: Bool
    public let readEngaged: Bool
    public let readTimeSeconds: Double?
    public let readCategory: String?
    public let sentAt: String?
    public let lastEventAt: String?
    public let computedAt: String

    public init(
        emailId: String,
        subject: String,
        fromAddress: String,
        topicId: String?,
        status: String,
        delivered: Bool,
        opened: Bool,
        clicked: Bool,
        totalClicks: Int,
        bounced: Bool,
        complained: Bool,
        unsubscribed: Bool,
        readEngaged: Bool,
        readTimeSeconds: Double?,
        readCategory: String?,
        sentAt: String?,
        lastEventAt: String?,
        computedAt: String
    ) {
        self.emailId = emailId
        self.subject = subject
        self.fromAddress = fromAddress
        self.topicId = topicId
        self.status = status
        self.delivered = delivered
        self.opened = opened
        self.clicked = clicked
        self.totalClicks = totalClicks
        self.bounced = bounced
        self.complained = complained
        self.unsubscribed = unsubscribed
        self.readEngaged = readEngaged
        self.readTimeSeconds = readTimeSeconds
        self.readCategory = readCategory
        self.sentAt = sentAt
        self.lastEventAt = lastEventAt
        self.computedAt = computedAt
    }

    private enum CodingKeys: String, CodingKey {
        case emailId = "emailId"
        case subject = "subject"
        case fromAddress = "fromAddress"
        case topicId = "topicId"
        case status = "status"
        case delivered = "delivered"
        case opened = "opened"
        case clicked = "clicked"
        case totalClicks = "totalClicks"
        case bounced = "bounced"
        case complained = "complained"
        case unsubscribed = "unsubscribed"
        case readEngaged = "readEngaged"
        case readTimeSeconds = "readTimeSeconds"
        case readCategory = "readCategory"
        case sentAt = "sentAt"
        case lastEventAt = "lastEventAt"
        case computedAt = "computedAt"
    }
}


public struct EmailReadScrollAnalyticsResponse: Codable, Sendable {
    public let emailId: String
    public let subject: String
    public let computedAt: String
    public let readEngaged: Bool
    public let readTimeSeconds: Double?
    public let readCategory: String?
    public let mailClient: String?
    public let deviceType: String?
    public let os: String?
    public let readEngagedAt: String?
    public let shortEmail: Bool
    public let depth25Count: Int
    public let depth50Count: Int
    public let depth75Count: Int
    public let depth100Count: Int
    public let maxDepthPct: Int?
    public let depth25Rate: Double?
    public let depth50Rate: Double?
    public let depth75Rate: Double?
    public let depth100Rate: Double?

    public init(
        emailId: String,
        subject: String,
        computedAt: String,
        readEngaged: Bool,
        readTimeSeconds: Double?,
        readCategory: String?,
        mailClient: String?,
        deviceType: String?,
        os: String?,
        readEngagedAt: String?,
        shortEmail: Bool,
        depth25Count: Int,
        depth50Count: Int,
        depth75Count: Int,
        depth100Count: Int,
        maxDepthPct: Int?,
        depth25Rate: Double?,
        depth50Rate: Double?,
        depth75Rate: Double?,
        depth100Rate: Double?
    ) {
        self.emailId = emailId
        self.subject = subject
        self.computedAt = computedAt
        self.readEngaged = readEngaged
        self.readTimeSeconds = readTimeSeconds
        self.readCategory = readCategory
        self.mailClient = mailClient
        self.deviceType = deviceType
        self.os = os
        self.readEngagedAt = readEngagedAt
        self.shortEmail = shortEmail
        self.depth25Count = depth25Count
        self.depth50Count = depth50Count
        self.depth75Count = depth75Count
        self.depth100Count = depth100Count
        self.maxDepthPct = maxDepthPct
        self.depth25Rate = depth25Rate
        self.depth50Rate = depth50Rate
        self.depth75Rate = depth75Rate
        self.depth100Rate = depth100Rate
    }

    private enum CodingKeys: String, CodingKey {
        case emailId = "emailId"
        case subject = "subject"
        case computedAt = "computedAt"
        case readEngaged = "readEngaged"
        case readTimeSeconds = "readTimeSeconds"
        case readCategory = "readCategory"
        case mailClient = "mailClient"
        case deviceType = "deviceType"
        case os = "os"
        case readEngagedAt = "readEngagedAt"
        case shortEmail = "shortEmail"
        case depth25Count = "depth25Count"
        case depth50Count = "depth50Count"
        case depth75Count = "depth75Count"
        case depth100Count = "depth100Count"
        case maxDepthPct = "maxDepthPct"
        case depth25Rate = "depth25Rate"
        case depth50Rate = "depth50Rate"
        case depth75Rate = "depth75Rate"
        case depth100Rate = "depth100Rate"
    }
}


public struct ProjectMetricsSummaryResponse: Codable, Sendable {
    public let projectId: String
    public let window: MetricsWindowResponse
    public let sent: Int
    public let delivered: Int
    public let opened: Int
    public let clicked: Int
    public let bounced: Int
    public let complained: Int
    public let failed: Int
    public let unsubscribed: Int
    public let readEngaged: Int
    public let deliveryRate: Double
    public let openRate: Double
    public let clickRate: Double
    public let bounceRate: Double
    public let complaintRate: Double
    public let readEngagementRate: Double

    public init(
        projectId: String,
        window: MetricsWindowResponse,
        sent: Int,
        delivered: Int,
        opened: Int,
        clicked: Int,
        bounced: Int,
        complained: Int,
        failed: Int,
        unsubscribed: Int,
        readEngaged: Int,
        deliveryRate: Double,
        openRate: Double,
        clickRate: Double,
        bounceRate: Double,
        complaintRate: Double,
        readEngagementRate: Double
    ) {
        self.projectId = projectId
        self.window = window
        self.sent = sent
        self.delivered = delivered
        self.opened = opened
        self.clicked = clicked
        self.bounced = bounced
        self.complained = complained
        self.failed = failed
        self.unsubscribed = unsubscribed
        self.readEngaged = readEngaged
        self.deliveryRate = deliveryRate
        self.openRate = openRate
        self.clickRate = clickRate
        self.bounceRate = bounceRate
        self.complaintRate = complaintRate
        self.readEngagementRate = readEngagementRate
    }

    private enum CodingKeys: String, CodingKey {
        case projectId = "projectId"
        case window = "window"
        case sent = "sent"
        case delivered = "delivered"
        case opened = "opened"
        case clicked = "clicked"
        case bounced = "bounced"
        case complained = "complained"
        case failed = "failed"
        case unsubscribed = "unsubscribed"
        case readEngaged = "readEngaged"
        case deliveryRate = "deliveryRate"
        case openRate = "openRate"
        case clickRate = "clickRate"
        case bounceRate = "bounceRate"
        case complaintRate = "complaintRate"
        case readEngagementRate = "readEngagementRate"
    }
}


public struct ProjectTimelineBucketResponse: Codable, Sendable {
    public let bucket: String
    public let type: String
    public let count: Int

    public init(
        bucket: String,
        type: String,
        count: Int
    ) {
        self.bucket = bucket
        self.type = type
        self.count = count
    }

    private enum CodingKeys: String, CodingKey {
        case bucket = "bucket"
        case type = "type"
        case count = "count"
    }
}


public struct ProjectMetricsTimelineResponse: Codable, Sendable {
    public let projectId: String
    public let window: MetricsWindowResponse
    public let granularity: String
    public let format: String
    public let buckets: [ProjectTimelineBucketResponse]

    public init(
        projectId: String,
        window: MetricsWindowResponse,
        granularity: String,
        format: String,
        buckets: [ProjectTimelineBucketResponse]
    ) {
        self.projectId = projectId
        self.window = window
        self.granularity = granularity
        self.format = format
        self.buckets = buckets
    }

    private enum CodingKeys: String, CodingKey {
        case projectId = "projectId"
        case window = "window"
        case granularity = "granularity"
        case format = "format"
        case buckets = "buckets"
    }
}


public struct AdvisorRecommendationDataResponse: Codable, Sendable {
    public let bounceRate: Double?
    public let bounced: Int?
    public let accepted: Int?
    public let complaintRate: Double?
    public let accepted24h: Int?
    public let avgDailyAccepted7d: Int?
    public let daysSinceLastSend: Int?
    public let reportedOpenRate: Double?
    public let adjustedOpenRate: Double?
    public let proxyRate: Double?
    public let proxyOpens: Int?
    public let totalOpens: Int?
    public let humanOpenRate: Double?
    public let delivered: Int?
    public let unsubRate: Double?
    public let unsubscribed: Int?
    public let dmarcAlignmentFailureRate7d: Double?
    public let dmarcDomain: String?
    public let dmarcCurrentPolicy: String?
    public let dmarcRecommendedPolicy: String?
    public let dmarcObservedMessages: Int?
    public let dmarcAlignedMessages: Int?
    public let dmarcAccountedRate: Double?
    public let dmarcUnknownMessages: Int?
    public let dmarcUnknownSources: Int?
    public let dmarcReportingDays: Int?

    public init(
        bounceRate: Double? = nil,
        bounced: Int? = nil,
        accepted: Int? = nil,
        complaintRate: Double? = nil,
        accepted24h: Int? = nil,
        avgDailyAccepted7d: Int? = nil,
        daysSinceLastSend: Int? = nil,
        reportedOpenRate: Double? = nil,
        adjustedOpenRate: Double? = nil,
        proxyRate: Double? = nil,
        proxyOpens: Int? = nil,
        totalOpens: Int? = nil,
        humanOpenRate: Double? = nil,
        delivered: Int? = nil,
        unsubRate: Double? = nil,
        unsubscribed: Int? = nil,
        dmarcAlignmentFailureRate7d: Double? = nil,
        dmarcDomain: String? = nil,
        dmarcCurrentPolicy: String? = nil,
        dmarcRecommendedPolicy: String? = nil,
        dmarcObservedMessages: Int? = nil,
        dmarcAlignedMessages: Int? = nil,
        dmarcAccountedRate: Double? = nil,
        dmarcUnknownMessages: Int? = nil,
        dmarcUnknownSources: Int? = nil,
        dmarcReportingDays: Int? = nil
    ) {
        self.bounceRate = bounceRate
        self.bounced = bounced
        self.accepted = accepted
        self.complaintRate = complaintRate
        self.accepted24h = accepted24h
        self.avgDailyAccepted7d = avgDailyAccepted7d
        self.daysSinceLastSend = daysSinceLastSend
        self.reportedOpenRate = reportedOpenRate
        self.adjustedOpenRate = adjustedOpenRate
        self.proxyRate = proxyRate
        self.proxyOpens = proxyOpens
        self.totalOpens = totalOpens
        self.humanOpenRate = humanOpenRate
        self.delivered = delivered
        self.unsubRate = unsubRate
        self.unsubscribed = unsubscribed
        self.dmarcAlignmentFailureRate7d = dmarcAlignmentFailureRate7d
        self.dmarcDomain = dmarcDomain
        self.dmarcCurrentPolicy = dmarcCurrentPolicy
        self.dmarcRecommendedPolicy = dmarcRecommendedPolicy
        self.dmarcObservedMessages = dmarcObservedMessages
        self.dmarcAlignedMessages = dmarcAlignedMessages
        self.dmarcAccountedRate = dmarcAccountedRate
        self.dmarcUnknownMessages = dmarcUnknownMessages
        self.dmarcUnknownSources = dmarcUnknownSources
        self.dmarcReportingDays = dmarcReportingDays
    }

    private enum CodingKeys: String, CodingKey {
        case bounceRate = "bounceRate"
        case bounced = "bounced"
        case accepted = "accepted"
        case complaintRate = "complaintRate"
        case accepted24h = "accepted24h"
        case avgDailyAccepted7d = "avgDailyAccepted7d"
        case daysSinceLastSend = "daysSinceLastSend"
        case reportedOpenRate = "reportedOpenRate"
        case adjustedOpenRate = "adjustedOpenRate"
        case proxyRate = "proxyRate"
        case proxyOpens = "proxyOpens"
        case totalOpens = "totalOpens"
        case humanOpenRate = "humanOpenRate"
        case delivered = "delivered"
        case unsubRate = "unsubRate"
        case unsubscribed = "unsubscribed"
        case dmarcAlignmentFailureRate7d = "dmarcAlignmentFailureRate7d"
        case dmarcDomain = "dmarcDomain"
        case dmarcCurrentPolicy = "dmarcCurrentPolicy"
        case dmarcRecommendedPolicy = "dmarcRecommendedPolicy"
        case dmarcObservedMessages = "dmarcObservedMessages"
        case dmarcAlignedMessages = "dmarcAlignedMessages"
        case dmarcAccountedRate = "dmarcAccountedRate"
        case dmarcUnknownMessages = "dmarcUnknownMessages"
        case dmarcUnknownSources = "dmarcUnknownSources"
        case dmarcReportingDays = "dmarcReportingDays"
    }
}


public struct AdvisorRecommendationResponse: Codable, Sendable {
    public let code: String
    public let severity: String
    public let title: String
    public let message: String
    public let data: AdvisorRecommendationDataResponse?

    public init(
        code: String,
        severity: String,
        title: String,
        message: String,
        data: AdvisorRecommendationDataResponse? = nil
    ) {
        self.code = code
        self.severity = severity
        self.title = title
        self.message = message
        self.data = data
    }

    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case severity = "severity"
        case title = "title"
        case message = "message"
        case data = "data"
    }
}


public struct AdvisorReportResponse: Codable, Sendable {
    public let projectId: String
    public let generatedAt: String
    public let score: Int
    public let recommendations: [AdvisorRecommendationResponse]

    public init(
        projectId: String,
        generatedAt: String,
        score: Int,
        recommendations: [AdvisorRecommendationResponse]
    ) {
        self.projectId = projectId
        self.generatedAt = generatedAt
        self.score = score
        self.recommendations = recommendations
    }

    private enum CodingKeys: String, CodingKey {
        case projectId = "projectId"
        case generatedAt = "generatedAt"
        case score = "score"
        case recommendations = "recommendations"
    }
}


public struct SuppressionResponse: Codable, Sendable {
    public let id: String
    public let projectId: String
    public let email: String
    public let reason: String
    public let createdAt: String
    public let contactId: String?

    public init(
        id: String,
        projectId: String,
        email: String,
        reason: String,
        createdAt: String,
        contactId: String? = nil
    ) {
        self.id = id
        self.projectId = projectId
        self.email = email
        self.reason = reason
        self.createdAt = createdAt
        self.contactId = contactId
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case projectId = "projectId"
        case email = "email"
        case reason = "reason"
        case createdAt = "createdAt"
        case contactId = "contactId"
    }
}


public struct PageInfo: Codable, Sendable {
    public let page: Int
    public let size: Int
    public let total: Int
    public let totalPages: Int
    public let hasNextPage: Bool
    public let hasPreviousPage: Bool

    public init(
        page: Int,
        size: Int,
        total: Int,
        totalPages: Int,
        hasNextPage: Bool,
        hasPreviousPage: Bool
    ) {
        self.page = page
        self.size = size
        self.total = total
        self.totalPages = totalPages
        self.hasNextPage = hasNextPage
        self.hasPreviousPage = hasPreviousPage
    }

    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case size = "size"
        case total = "total"
        case totalPages = "totalPages"
        case hasNextPage = "hasNextPage"
        case hasPreviousPage = "hasPreviousPage"
    }
}


public struct SuppressionPageResponse: Codable, Sendable {
    public let data: [SuppressionResponse]
    public let page: PageInfo

    public init(
        data: [SuppressionResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct AddSuppressionBody: Codable, Sendable {
    public let email: String

    public init(
        email: String
    ) {
        self.email = email
    }

    private enum CodingKeys: String, CodingKey {
        case email = "email"
    }
}


public struct SuppressionImportRowSerializable: Codable, Sendable {
    public let email: String
    public let reason: String?

    public init(
        email: String,
        reason: String? = nil
    ) {
        self.email = email
        self.reason = reason
    }

    private enum CodingKeys: String, CodingKey {
        case email = "email"
        case reason = "reason"
    }
}


public struct SuppressionImportBody: Codable, Sendable {
    public let suppressions: [SuppressionImportRowSerializable]

    public init(
        suppressions: [SuppressionImportRowSerializable]
    ) {
        self.suppressions = suppressions
    }

    private enum CodingKeys: String, CodingKey {
        case suppressions = "suppressions"
    }
}


public struct SuppressionImportResponse: Codable, Sendable {
    public let imported: Int
    public let skipped: Int

    public init(
        imported: Int,
        skipped: Int
    ) {
        self.imported = imported
        self.skipped = skipped
    }

    private enum CodingKeys: String, CodingKey {
        case imported = "imported"
        case skipped = "skipped"
    }
}


public struct SegmentResponse: Codable, Sendable {
    public let object: String?
    public let id: String
    public let name: String
    public let projectId: String
    public let createdAt: String
    public let contactCount: Int?
    public let unsubscribedCount: Int?

    public init(
        object: String? = nil,
        id: String,
        name: String,
        projectId: String,
        createdAt: String,
        contactCount: Int? = nil,
        unsubscribedCount: Int? = nil
    ) {
        self.object = object
        self.id = id
        self.name = name
        self.projectId = projectId
        self.createdAt = createdAt
        self.contactCount = contactCount
        self.unsubscribedCount = unsubscribedCount
    }

    private enum CodingKeys: String, CodingKey {
        case object = "object"
        case id = "id"
        case name = "name"
        case projectId = "projectId"
        case createdAt = "createdAt"
        case contactCount = "contactCount"
        case unsubscribedCount = "unsubscribedCount"
    }
}


public struct SegmentPageResponse: Codable, Sendable {
    public let data: [SegmentResponse]
    public let page: PageInfo

    public init(
        data: [SegmentResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct SegmentContactResponse: Codable, Sendable {
    public let contactId: String
    public let email: String
    public let firstName: String?
    public let lastName: String?
    public let segments: [String]

    public init(
        contactId: String,
        email: String,
        firstName: String?,
        lastName: String?,
        segments: [String]
    ) {
        self.contactId = contactId
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.segments = segments
    }

    private enum CodingKeys: String, CodingKey {
        case contactId = "contactId"
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case segments = "segments"
    }
}


public struct CursorInfo: Codable, Sendable {
    public let nextCursor: String?
    public let previousCursor: String?
    public let hasNextPage: Bool
    public let hasPreviousPage: Bool

    public init(
        nextCursor: String?,
        previousCursor: String?,
        hasNextPage: Bool,
        hasPreviousPage: Bool
    ) {
        self.nextCursor = nextCursor
        self.previousCursor = previousCursor
        self.hasNextPage = hasNextPage
        self.hasPreviousPage = hasPreviousPage
    }

    private enum CodingKeys: String, CodingKey {
        case nextCursor = "nextCursor"
        case previousCursor = "previousCursor"
        case hasNextPage = "hasNextPage"
        case hasPreviousPage = "hasPreviousPage"
    }
}


public struct CursorPage: Codable, Sendable {
    public let data: [SegmentContactResponse]
    public let cursor: CursorInfo

    public init(
        data: [SegmentContactResponse],
        cursor: CursorInfo
    ) {
        self.data = data
        self.cursor = cursor
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case cursor = "cursor"
    }
}


public struct CreateSegmentBody: Codable, Sendable {
    public let name: String

    public init(
        name: String
    ) {
        self.name = name
    }

    private enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}


public struct TopicResponse: Codable, Sendable {
    public let object: String?
    public let id: String
    public let name: String
    public let defaultSubscription: String
    public let description: String?
    public let visibility: String
    public let projectId: String
    public let optInCount: Int
    public let optOutCount: Int
    public let createdAt: String
    public let updatedAt: String

    public init(
        object: String? = nil,
        id: String,
        name: String,
        defaultSubscription: String,
        description: String?,
        visibility: String,
        projectId: String,
        optInCount: Int,
        optOutCount: Int,
        createdAt: String,
        updatedAt: String
    ) {
        self.object = object
        self.id = id
        self.name = name
        self.defaultSubscription = defaultSubscription
        self.description = description
        self.visibility = visibility
        self.projectId = projectId
        self.optInCount = optInCount
        self.optOutCount = optOutCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case object = "object"
        case id = "id"
        case name = "name"
        case defaultSubscription = "defaultSubscription"
        case description = "description"
        case visibility = "visibility"
        case projectId = "projectId"
        case optInCount = "optInCount"
        case optOutCount = "optOutCount"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }
}


public struct TopicPageResponse: Codable, Sendable {
    public let data: [TopicResponse]
    public let page: PageInfo

    public init(
        data: [TopicResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct CreateTopicBody: Codable, Sendable {
    public let name: String
    public let defaultSubscription: String
    public let description: String?
    public let visibility: String?

    public init(
        name: String,
        defaultSubscription: String,
        description: String? = nil,
        visibility: String? = nil
    ) {
        self.name = name
        self.defaultSubscription = defaultSubscription
        self.description = description
        self.visibility = visibility
    }

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case defaultSubscription = "defaultSubscription"
        case description = "description"
        case visibility = "visibility"
    }
}


public struct UpdateTopicBody: Codable, Sendable {
    public let name: String?
    public let description: String?
    public let visibility: String?

    public init(
        name: String? = nil,
        description: String? = nil,
        visibility: String? = nil
    ) {
        self.name = name
        self.description = description
        self.visibility = visibility
    }

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case visibility = "visibility"
    }
}


public struct ContactPropertyResponse: Codable, Sendable {
    public let object: String?
    public let id: String
    public let key: String
    public let type: String
    public let fallbackValue: String?
    public let projectId: String
    public let createdAt: String
    public let updatedAt: String

    public init(
        object: String? = nil,
        id: String,
        key: String,
        type: String,
        fallbackValue: String?,
        projectId: String,
        createdAt: String,
        updatedAt: String
    ) {
        self.object = object
        self.id = id
        self.key = key
        self.type = type
        self.fallbackValue = fallbackValue
        self.projectId = projectId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case object = "object"
        case id = "id"
        case key = "key"
        case type = "type"
        case fallbackValue = "fallbackValue"
        case projectId = "projectId"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }
}


public struct ContactPropertyPageResponse: Codable, Sendable {
    public let data: [ContactPropertyResponse]
    public let page: PageInfo

    public init(
        data: [ContactPropertyResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct CreateContactPropertyBody: Codable, Sendable {
    public let key: String
    public let type: String
    public let fallbackValue: String?

    public init(
        key: String,
        type: String,
        fallbackValue: String? = nil
    ) {
        self.key = key
        self.type = type
        self.fallbackValue = fallbackValue
    }

    private enum CodingKeys: String, CodingKey {
        case key = "key"
        case type = "type"
        case fallbackValue = "fallbackValue"
    }
}


public struct UpdateContactPropertyBody: Codable, Sendable {
    public let fallbackValue: String?

    public init(
        fallbackValue: String? = nil
    ) {
        self.fallbackValue = fallbackValue
    }

    private enum CodingKeys: String, CodingKey {
        case fallbackValue = "fallbackValue"
    }
}


public struct TopicSubscriptionResponse: Codable, Sendable {
    public let topicId: String
    public let subscription: String

    public init(
        topicId: String,
        subscription: String
    ) {
        self.topicId = topicId
        self.subscription = subscription
    }

    private enum CodingKeys: String, CodingKey {
        case topicId = "topicId"
        case subscription = "subscription"
    }
}


public struct ContactResponse: Codable, Sendable {
    public let object: String?
    public let id: String
    public let email: String
    public let phone: String?
    public let firstName: String?
    public let lastName: String?
    public let unsubscribed: Bool
    public let properties: [String: String]
    public let profileImageUrl: String?
    public let projectId: String
    public let segments: [String]
    public let topics: [TopicSubscriptionResponse]
    public let createdAt: String
    public let updatedAt: String

    public init(
        object: String? = nil,
        id: String,
        email: String,
        phone: String? = nil,
        firstName: String?,
        lastName: String?,
        unsubscribed: Bool,
        properties: [String: String],
        profileImageUrl: String?,
        projectId: String,
        segments: [String],
        topics: [TopicSubscriptionResponse],
        createdAt: String,
        updatedAt: String
    ) {
        self.object = object
        self.id = id
        self.email = email
        self.phone = phone
        self.firstName = firstName
        self.lastName = lastName
        self.unsubscribed = unsubscribed
        self.properties = properties
        self.profileImageUrl = profileImageUrl
        self.projectId = projectId
        self.segments = segments
        self.topics = topics
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case object = "object"
        case id = "id"
        case email = "email"
        case phone = "phone"
        case firstName = "firstName"
        case lastName = "lastName"
        case unsubscribed = "unsubscribed"
        case properties = "properties"
        case profileImageUrl = "profileImageUrl"
        case projectId = "projectId"
        case segments = "segments"
        case topics = "topics"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }
}


public struct ContactPageResponse: Codable, Sendable {
    public let data: [ContactResponse]
    public let page: PageInfo

    public init(
        data: [ContactResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct SegmentRef: Codable, Sendable {
    public let id: String

    public init(
        id: String
    ) {
        self.id = id
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
    }
}


public struct TopicSubscriptionBody: Codable, Sendable {
    public let id: String
    public let subscription: String

    public init(
        id: String,
        subscription: String
    ) {
        self.id = id
        self.subscription = subscription
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case subscription = "subscription"
    }
}


public struct CreateContactBody: Codable, Sendable {
    public let email: String
    public let phone: String?
    public let firstName: String?
    public let lastName: String?
    public let unsubscribed: Bool?
    public let properties: [String: String]?
    public let segments: [SegmentRef]?
    public let topics: [TopicSubscriptionBody]?

    public init(
        email: String,
        phone: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        unsubscribed: Bool? = nil,
        properties: [String: String]? = nil,
        segments: [SegmentRef]? = nil,
        topics: [TopicSubscriptionBody]? = nil
    ) {
        self.email = email
        self.phone = phone
        self.firstName = firstName
        self.lastName = lastName
        self.unsubscribed = unsubscribed
        self.properties = properties
        self.segments = segments
        self.topics = topics
    }

    private enum CodingKeys: String, CodingKey {
        case email = "email"
        case phone = "phone"
        case firstName = "firstName"
        case lastName = "lastName"
        case unsubscribed = "unsubscribed"
        case properties = "properties"
        case segments = "segments"
        case topics = "topics"
    }
}


public struct UpdateContactBody: Codable, Sendable {
    public let firstName: String?
    public let lastName: String?
    public let phone: String?
    public let unsubscribed: Bool?
    public let properties: [String: String]?

    public init(
        firstName: String? = nil,
        lastName: String? = nil,
        phone: String? = nil,
        unsubscribed: Bool? = nil,
        properties: [String: String]? = nil
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.unsubscribed = unsubscribed
        self.properties = properties
    }

    private enum CodingKeys: String, CodingKey {
        case firstName = "firstName"
        case lastName = "lastName"
        case phone = "phone"
        case unsubscribed = "unsubscribed"
        case properties = "properties"
    }
}


public struct SetImageUrlBody: Codable, Sendable {
    public let url: String

    public init(
        url: String
    ) {
        self.url = url
    }

    private enum CodingKeys: String, CodingKey {
        case url = "url"
    }
}


public struct AddToSegmentBody: Codable, Sendable {
    public let segmentId: String

    public init(
        segmentId: String
    ) {
        self.segmentId = segmentId
    }

    private enum CodingKeys: String, CodingKey {
        case segmentId = "segmentId"
    }
}


public struct UpdateTopicsBody: Codable, Sendable {
    public let topics: [TopicSubscriptionBody]

    public init(
        topics: [TopicSubscriptionBody]
    ) {
        self.topics = topics
    }

    private enum CodingKeys: String, CodingKey {
        case topics = "topics"
    }
}


public struct ActivityMetadataResponse: Codable, Sendable {
    public let topicId: String?

    public init(
        topicId: String? = nil
    ) {
        self.topicId = topicId
    }

    private enum CodingKeys: String, CodingKey {
        case topicId = "topicId"
    }
}


public struct ActivityResponse: Codable, Sendable {
    public let object: String?
    public let id: String
    public let type: String
    public let referenceId: String?
    public let referenceName: String?
    public let metadata: ActivityMetadataResponse?
    public let occurredAt: String

    public init(
        object: String? = nil,
        id: String,
        type: String,
        referenceId: String? = nil,
        referenceName: String? = nil,
        metadata: ActivityMetadataResponse? = nil,
        occurredAt: String
    ) {
        self.object = object
        self.id = id
        self.type = type
        self.referenceId = referenceId
        self.referenceName = referenceName
        self.metadata = metadata
        self.occurredAt = occurredAt
    }

    private enum CodingKeys: String, CodingKey {
        case object = "object"
        case id = "id"
        case type = "type"
        case referenceId = "referenceId"
        case referenceName = "referenceName"
        case metadata = "metadata"
        case occurredAt = "occurredAt"
    }
}


public struct EngagementScoreResponse: Codable, Sendable {
    public let object: String?
    public let score: Int
    public let tier: String
    public let scoredAt: String

    public init(
        object: String? = nil,
        score: Int,
        tier: String,
        scoredAt: String
    ) {
        self.object = object
        self.score = score
        self.tier = tier
        self.scoredAt = scoredAt
    }

    private enum CodingKeys: String, CodingKey {
        case object = "object"
        case score = "score"
        case tier = "tier"
        case scoredAt = "scoredAt"
    }
}


public struct EmailValidationStatusResponse: Codable, Sendable {
    public let object: String?
    public let status: String
    public let reason: String?
    public let validatedAt: String?

    public init(
        object: String? = nil,
        status: String,
        reason: String?,
        validatedAt: String?
    ) {
        self.object = object
        self.status = status
        self.reason = reason
        self.validatedAt = validatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case object = "object"
        case status = "status"
        case reason = "reason"
        case validatedAt = "validatedAt"
    }
}


public struct RecordValidationBody: Codable, Sendable {
    public let status: EmailValidationStatusInput
    public let reason: String?

    public init(
        status: EmailValidationStatusInput,
        reason: String? = nil
    ) {
        self.status = status
        self.reason = reason
    }

    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case reason = "reason"
    }
}


public struct WebhookFilterSerializable: Codable, Sendable {
    public let field: String
    public let `operator`: String
    public let value: String?

    public init(
        field: String,
        `operator`: String,
        value: String? = nil
    ) {
        self.field = field
        self.`operator` = `operator`
        self.value = value
    }

    private enum CodingKeys: String, CodingKey {
        case field = "field"
        case `operator` = "operator"
        case value = "value"
    }
}


public struct WebhookTransformationSerializable: Codable, Sendable {
    public let type: String
    public let from: String?
    public let to: String?
    public let field: String?
    public let value: String?
    public let template: String?

    public init(
        type: String,
        from: String? = nil,
        to: String? = nil,
        field: String? = nil,
        value: String? = nil,
        template: String? = nil
    ) {
        self.type = type
        self.from = from
        self.to = to
        self.field = field
        self.value = value
        self.template = template
    }

    private enum CodingKeys: String, CodingKey {
        case type = "type"
        case from = "from"
        case to = "to"
        case field = "field"
        case value = "value"
        case template = "template"
    }
}


public struct WebhookResponse: Codable, Sendable {
    public let id: String
    public let projectId: String
    public let name: String
    public let url: String
    public let events: [String]
    public let enabled: Bool
    public let filters: [WebhookFilterSerializable]?
    public let transformations: [WebhookTransformationSerializable]?
    public let createdAt: String
    public let updatedAt: String

    public init(
        id: String,
        projectId: String,
        name: String,
        url: String,
        events: [String],
        enabled: Bool,
        filters: [WebhookFilterSerializable]?,
        transformations: [WebhookTransformationSerializable]?,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.projectId = projectId
        self.name = name
        self.url = url
        self.events = events
        self.enabled = enabled
        self.filters = filters
        self.transformations = transformations
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case projectId = "projectId"
        case name = "name"
        case url = "url"
        case events = "events"
        case enabled = "enabled"
        case filters = "filters"
        case transformations = "transformations"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }
}


public struct WebhookPageResponse: Codable, Sendable {
    public let data: [WebhookResponse]
    public let page: PageInfo

    public init(
        data: [WebhookResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct WebhookDeliveryResponse: Codable, Sendable {
    public let id: String
    public let projectId: String
    public let webhookEndpointId: String
    public let eventType: String
    public let status: String
    public let attemptCount: Int
    public let lastStatusCode: Int?
    public let lastError: String?
    public let responseBodySnippet: String?
    public let nextAttemptAt: String?
    public let createdAt: String
    public let updatedAt: String

    public init(
        id: String,
        projectId: String,
        webhookEndpointId: String,
        eventType: String,
        status: String,
        attemptCount: Int,
        lastStatusCode: Int?,
        lastError: String?,
        responseBodySnippet: String?,
        nextAttemptAt: String?,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.projectId = projectId
        self.webhookEndpointId = webhookEndpointId
        self.eventType = eventType
        self.status = status
        self.attemptCount = attemptCount
        self.lastStatusCode = lastStatusCode
        self.lastError = lastError
        self.responseBodySnippet = responseBodySnippet
        self.nextAttemptAt = nextAttemptAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case projectId = "projectId"
        case webhookEndpointId = "webhookEndpointId"
        case eventType = "eventType"
        case status = "status"
        case attemptCount = "attemptCount"
        case lastStatusCode = "lastStatusCode"
        case lastError = "lastError"
        case responseBodySnippet = "responseBodySnippet"
        case nextAttemptAt = "nextAttemptAt"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }
}


public struct WebhookDeliveryPageResponse: Codable, Sendable {
    public let data: [WebhookDeliveryResponse]
    public let page: PageInfo

    public init(
        data: [WebhookDeliveryResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct CreateWebhookBody: Codable, Sendable {
    public let url: String
    public let events: [String]
    public let name: String?
    public let secret: String?
    public let filters: [WebhookFilterSerializable]?
    public let transformations: [WebhookTransformationSerializable]?

    public init(
        url: String,
        events: [String],
        name: String? = nil,
        secret: String? = nil,
        filters: [WebhookFilterSerializable]? = nil,
        transformations: [WebhookTransformationSerializable]? = nil
    ) {
        self.url = url
        self.events = events
        self.name = name
        self.secret = secret
        self.filters = filters
        self.transformations = transformations
    }

    private enum CodingKeys: String, CodingKey {
        case url = "url"
        case events = "events"
        case name = "name"
        case secret = "secret"
        case filters = "filters"
        case transformations = "transformations"
    }
}


public struct WebhookCreateResponse: Codable, Sendable {
    public let id: String
    public let projectId: String
    public let name: String
    public let url: String
    public let events: [String]
    public let enabled: Bool
    public let filters: [WebhookFilterSerializable]?
    public let transformations: [WebhookTransformationSerializable]?
    public let createdAt: String
    public let updatedAt: String
    public let secret: String

    public init(
        id: String,
        projectId: String,
        name: String,
        url: String,
        events: [String],
        enabled: Bool,
        filters: [WebhookFilterSerializable]?,
        transformations: [WebhookTransformationSerializable]?,
        createdAt: String,
        updatedAt: String,
        secret: String
    ) {
        self.id = id
        self.projectId = projectId
        self.name = name
        self.url = url
        self.events = events
        self.enabled = enabled
        self.filters = filters
        self.transformations = transformations
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.secret = secret
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case projectId = "projectId"
        case name = "name"
        case url = "url"
        case events = "events"
        case enabled = "enabled"
        case filters = "filters"
        case transformations = "transformations"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case secret = "secret"
    }
}


public struct UpdateWebhookBody: Codable, Sendable {
    public let name: String?
    public let url: String?
    public let events: [String]?
    public let secret: String?
    public let enabled: Bool?
    public let filters: [WebhookFilterSerializable]?
    public let transformations: [WebhookTransformationSerializable]?

    public init(
        name: String? = nil,
        url: String? = nil,
        events: [String]? = nil,
        secret: String? = nil,
        enabled: Bool? = nil,
        filters: [WebhookFilterSerializable]? = nil,
        transformations: [WebhookTransformationSerializable]? = nil
    ) {
        self.name = name
        self.url = url
        self.events = events
        self.secret = secret
        self.enabled = enabled
        self.filters = filters
        self.transformations = transformations
    }

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case events = "events"
        case secret = "secret"
        case enabled = "enabled"
        case filters = "filters"
        case transformations = "transformations"
    }
}


public struct ApiKey: Codable, Sendable {
    public let id: String
    public let configId: String
    public let name: String?
    public let start: String?
    public let prefix: String?
    public let organizationId: String
    public let projectId: String?
    public let enabled: Bool
    public let rateLimitEnabled: Bool
    public let rateLimitTimeWindow: Int?
    public let rateLimitMax: Int?
    public let requestCount: Int
    public let remaining: Int?
    public let lastRequest: String?
    public let expiresAt: String?
    public let createdAt: String
    public let updatedAt: String
    public let metadata: [String: String]?
    public let permissions: [String: [String]]?

    public init(
        id: String,
        configId: String,
        name: String?,
        start: String?,
        prefix: String?,
        organizationId: String,
        projectId: String?,
        enabled: Bool,
        rateLimitEnabled: Bool,
        rateLimitTimeWindow: Int?,
        rateLimitMax: Int?,
        requestCount: Int,
        remaining: Int?,
        lastRequest: String?,
        expiresAt: String?,
        createdAt: String,
        updatedAt: String,
        metadata: [String: String]?,
        permissions: [String: [String]]?
    ) {
        self.id = id
        self.configId = configId
        self.name = name
        self.start = start
        self.prefix = prefix
        self.organizationId = organizationId
        self.projectId = projectId
        self.enabled = enabled
        self.rateLimitEnabled = rateLimitEnabled
        self.rateLimitTimeWindow = rateLimitTimeWindow
        self.rateLimitMax = rateLimitMax
        self.requestCount = requestCount
        self.remaining = remaining
        self.lastRequest = lastRequest
        self.expiresAt = expiresAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.metadata = metadata
        self.permissions = permissions
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case configId = "configId"
        case name = "name"
        case start = "start"
        case prefix = "prefix"
        case organizationId = "organizationId"
        case projectId = "projectId"
        case enabled = "enabled"
        case rateLimitEnabled = "rateLimitEnabled"
        case rateLimitTimeWindow = "rateLimitTimeWindow"
        case rateLimitMax = "rateLimitMax"
        case requestCount = "requestCount"
        case remaining = "remaining"
        case lastRequest = "lastRequest"
        case expiresAt = "expiresAt"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case metadata = "metadata"
        case permissions = "permissions"
    }
}


public struct ApiKeyUsageRecord: Codable, Sendable {
    public let id: String
    public let keyId: String
    public let orgId: String
    public let method: String
    public let route: String
    public let statusCode: Int
    public let durationMs: Int?
    public let ip: String?
    public let ts: String

    public init(
        id: String,
        keyId: String,
        orgId: String,
        method: String,
        route: String,
        statusCode: Int,
        durationMs: Int?,
        ip: String?,
        ts: String
    ) {
        self.id = id
        self.keyId = keyId
        self.orgId = orgId
        self.method = method
        self.route = route
        self.statusCode = statusCode
        self.durationMs = durationMs
        self.ip = ip
        self.ts = ts
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case keyId = "keyId"
        case orgId = "orgId"
        case method = "method"
        case route = "route"
        case statusCode = "statusCode"
        case durationMs = "durationMs"
        case ip = "ip"
        case ts = "ts"
    }
}


public struct UsagePage: Codable, Sendable {
    public let size: Int
    public let totalPages: Int
    public let hasMore: Bool

    public init(
        size: Int,
        totalPages: Int,
        hasMore: Bool
    ) {
        self.size = size
        self.totalPages = totalPages
        self.hasMore = hasMore
    }

    private enum CodingKeys: String, CodingKey {
        case size = "size"
        case totalPages = "totalPages"
        case hasMore = "hasMore"
    }
}


public struct ApiKeyUsageResponse: Codable, Sendable {
    public let data: [ApiKeyUsageRecord]
    public let page: UsagePage

    public init(
        data: [ApiKeyUsageRecord],
        page: UsagePage
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct ProjectLimitsModel: Codable, Sendable {
    public let dailySends: Int
    public let perSecondSends: Int
    public let maxRecipientsPerMessage: Int
    public let maxDomains: Int
    public let maxApiKeys: Int
    public let maxWebhooks: Int

    public init(
        dailySends: Int,
        perSecondSends: Int,
        maxRecipientsPerMessage: Int,
        maxDomains: Int,
        maxApiKeys: Int,
        maxWebhooks: Int
    ) {
        self.dailySends = dailySends
        self.perSecondSends = perSecondSends
        self.maxRecipientsPerMessage = maxRecipientsPerMessage
        self.maxDomains = maxDomains
        self.maxApiKeys = maxApiKeys
        self.maxWebhooks = maxWebhooks
    }

    private enum CodingKeys: String, CodingKey {
        case dailySends = "dailySends"
        case perSecondSends = "perSecondSends"
        case maxRecipientsPerMessage = "maxRecipientsPerMessage"
        case maxDomains = "maxDomains"
        case maxApiKeys = "maxApiKeys"
        case maxWebhooks = "maxWebhooks"
    }
}


public struct ProjectTrackingSettingsModel: Codable, Sendable {
    public let openTracking: Bool
    public let clickTracking: Bool
    public let unsubscribeTracking: Bool
    public let readEngagement: Bool
    public let scrollDepth: Bool?

    public init(
        openTracking: Bool,
        clickTracking: Bool,
        unsubscribeTracking: Bool,
        readEngagement: Bool,
        scrollDepth: Bool? = nil
    ) {
        self.openTracking = openTracking
        self.clickTracking = clickTracking
        self.unsubscribeTracking = unsubscribeTracking
        self.readEngagement = readEngagement
        self.scrollDepth = scrollDepth
    }

    private enum CodingKeys: String, CodingKey {
        case openTracking = "openTracking"
        case clickTracking = "clickTracking"
        case unsubscribeTracking = "unsubscribeTracking"
        case readEngagement = "readEngagement"
        case scrollDepth = "scrollDepth"
    }
}


public struct ProjectResponse: Codable, Sendable {
    public let id: String
    public let name: String
    public let slug: String
    public let status: String
    public let suspensionReason: String?
    public let region: String
    public let limits: ProjectLimitsModel
    public let trackingSettings: ProjectTrackingSettingsModel
    public let createdAt: String
    public let updatedAt: String

    public init(
        id: String,
        name: String,
        slug: String,
        status: String,
        suspensionReason: String?,
        region: String,
        limits: ProjectLimitsModel,
        trackingSettings: ProjectTrackingSettingsModel,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.slug = slug
        self.status = status
        self.suspensionReason = suspensionReason
        self.region = region
        self.limits = limits
        self.trackingSettings = trackingSettings
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case status = "status"
        case suspensionReason = "suspensionReason"
        case region = "region"
        case limits = "limits"
        case trackingSettings = "trackingSettings"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }
}


public struct ProjectPageResponse: Codable, Sendable {
    public let data: [ProjectResponse]
    public let page: PageInfo

    public init(
        data: [ProjectResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct UpdateProjectRequest: Codable, Sendable {
    public let name: String?
    public let slug: String?
    public let limits: ProjectLimitsModel?
    public let trackingSettings: ProjectTrackingSettingsModel?

    public init(
        name: String? = nil,
        slug: String? = nil,
        limits: ProjectLimitsModel? = nil,
        trackingSettings: ProjectTrackingSettingsModel? = nil
    ) {
        self.name = name
        self.slug = slug
        self.limits = limits
        self.trackingSettings = trackingSettings
    }

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case slug = "slug"
        case limits = "limits"
        case trackingSettings = "trackingSettings"
    }
}


public struct EmailPageResponse: Codable, Sendable {
    public let data: [EmailDetailResponse]
    public let page: PageInfo

    public init(
        data: [EmailDetailResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct EmailTimelineItem: Codable, Sendable {
    public let id: String
    public let type: String
    public let providerEventId: String?
    public let payload: [String: String?]?
    public let occurredAt: String
    public let createdAt: String

    public init(
        id: String,
        type: String,
        providerEventId: String?,
        payload: [String: String?]?,
        occurredAt: String,
        createdAt: String
    ) {
        self.id = id
        self.type = type
        self.providerEventId = providerEventId
        self.payload = payload
        self.occurredAt = occurredAt
        self.createdAt = createdAt
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case providerEventId = "providerEventId"
        case payload = "payload"
        case occurredAt = "occurredAt"
        case createdAt = "createdAt"
    }
}


public struct EmailTimelineResponse: Codable, Sendable {
    public let items: [EmailTimelineItem]

    public init(
        items: [EmailTimelineItem]
    ) {
        self.items = items
    }

    private enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}


public struct DomainListItemResponse: Codable, Sendable {
    public let id: String
    public let domain: String
    public let region: String
    public let status: String
    public let dkimStatus: String
    public let bimiStatus: String
    public let trackingStatus: String
    public let updatedAt: String

    public init(
        id: String,
        domain: String,
        region: String,
        status: String,
        dkimStatus: String,
        bimiStatus: String,
        trackingStatus: String,
        updatedAt: String
    ) {
        self.id = id
        self.domain = domain
        self.region = region
        self.status = status
        self.dkimStatus = dkimStatus
        self.bimiStatus = bimiStatus
        self.trackingStatus = trackingStatus
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case domain = "domain"
        case region = "region"
        case status = "status"
        case dkimStatus = "dkimStatus"
        case bimiStatus = "bimiStatus"
        case trackingStatus = "trackingStatus"
        case updatedAt = "updatedAt"
    }
}


public struct DomainListPageResponse: Codable, Sendable {
    public let data: [DomainListItemResponse]
    public let page: PageInfo

    public init(
        data: [DomainListItemResponse],
        page: PageInfo
    ) {
        self.data = data
        self.page = page
    }

    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case page = "page"
    }
}


public struct DkimRecordResponse: Codable, Sendable {
    public let name: String
    public let type: String
    public let value: String
    public let status: String?

    public init(
        name: String,
        type: String,
        value: String,
        status: String? = nil
    ) {
        self.name = name
        self.type = type
        self.value = value
        self.status = status
    }

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case value = "value"
        case status = "status"
    }
}


public struct DnsRecordResponse: Codable, Sendable {
    public let name: String
    public let type: String
    public let value: String
    public let priority: Int?
    public let optional: Bool?
    public let status: String?

    public init(
        name: String,
        type: String,
        value: String,
        priority: Int? = nil,
        optional: Bool? = nil,
        status: String? = nil
    ) {
        self.name = name
        self.type = type
        self.value = value
        self.priority = priority
        self.optional = optional
        self.status = status
    }

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case value = "value"
        case priority = "priority"
        case optional = "optional"
        case status = "status"
    }
}


public struct VerificationRecordsResponse: Codable, Sendable {
    public let dkim: [DkimRecordResponse]
    public let mailFromMx: DnsRecordResponse
    public let mailFromSpf: DnsRecordResponse
    public let dmarcRecommended: DnsRecordResponse?
    public let bimi: DnsRecordResponse?
    public let trackingCname: DnsRecordResponse?

    public init(
        dkim: [DkimRecordResponse],
        mailFromMx: DnsRecordResponse,
        mailFromSpf: DnsRecordResponse,
        dmarcRecommended: DnsRecordResponse? = nil,
        bimi: DnsRecordResponse? = nil,
        trackingCname: DnsRecordResponse? = nil
    ) {
        self.dkim = dkim
        self.mailFromMx = mailFromMx
        self.mailFromSpf = mailFromSpf
        self.dmarcRecommended = dmarcRecommended
        self.bimi = bimi
        self.trackingCname = trackingCname
    }

    private enum CodingKeys: String, CodingKey {
        case dkim = "dkim"
        case mailFromMx = "mailFromMx"
        case mailFromSpf = "mailFromSpf"
        case dmarcRecommended = "dmarcRecommended"
        case bimi = "bimi"
        case trackingCname = "trackingCname"
    }
}


public struct DomainResponse: Codable, Sendable {
    public let id: String
    public let projectId: String
    public let domain: String
    public let region: String
    public let status: String
    public let dkimStatus: String
    public let spfStatus: String
    public let dmarcStatus: String
    public let mailFromStatus: String
    public let mailFromDomain: String
    public let verificationRecords: VerificationRecordsResponse
    public let bimiStatus: String
    public let bimiLogoUrl: String?
    public let createdAt: String
    public let updatedAt: String
    public let verifiedAt: String?

    public init(
        id: String,
        projectId: String,
        domain: String,
        region: String,
        status: String,
        dkimStatus: String,
        spfStatus: String,
        dmarcStatus: String,
        mailFromStatus: String,
        mailFromDomain: String,
        verificationRecords: VerificationRecordsResponse,
        bimiStatus: String,
        bimiLogoUrl: String?,
        createdAt: String,
        updatedAt: String,
        verifiedAt: String?
    ) {
        self.id = id
        self.projectId = projectId
        self.domain = domain
        self.region = region
        self.status = status
        self.dkimStatus = dkimStatus
        self.spfStatus = spfStatus
        self.dmarcStatus = dmarcStatus
        self.mailFromStatus = mailFromStatus
        self.mailFromDomain = mailFromDomain
        self.verificationRecords = verificationRecords
        self.bimiStatus = bimiStatus
        self.bimiLogoUrl = bimiLogoUrl
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.verifiedAt = verifiedAt
    }

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case projectId = "projectId"
        case domain = "domain"
        case region = "region"
        case status = "status"
        case dkimStatus = "dkimStatus"
        case spfStatus = "spfStatus"
        case dmarcStatus = "dmarcStatus"
        case mailFromStatus = "mailFromStatus"
        case mailFromDomain = "mailFromDomain"
        case verificationRecords = "verificationRecords"
        case bimiStatus = "bimiStatus"
        case bimiLogoUrl = "bimiLogoUrl"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case verifiedAt = "verifiedAt"
    }
}


public struct RegisterDomainRequest: Codable, Sendable {
    public let domain: String
    public let region: String

    public init(
        domain: String,
        region: String
    ) {
        self.domain = domain
        self.region = region
    }

    private enum CodingKeys: String, CodingKey {
        case domain = "domain"
        case region = "region"
    }
}


public struct UpdateBimiRequest: Codable, Sendable {
    public let logoUrl: String?

    public init(
        logoUrl: String? = nil
    ) {
        self.logoUrl = logoUrl
    }

    private enum CodingKeys: String, CodingKey {
        case logoUrl = "logoUrl"
    }
}


public enum EmailValidationStatusInput: String, Codable, Sendable, CustomStringConvertible {
    case valid = "valid"
    case risky = "risky"
    case invalid = "invalid"
    case unknown = "unknown"

    public var description: String { String(describing: rawValue) }
}


public struct GetTopicPerformanceQuery: Codable, Sendable {
    public let window: String?
    public let projectId: String?

    public init(
        window: String? = nil,
        projectId: String? = nil
    ) {
        self.window = window
        self.projectId = projectId
    }

    private enum CodingKeys: String, CodingKey {
        case window = "window"
        case projectId = "projectId"
    }
}


public struct GetProjectMetricsSummaryQuery: Codable, Sendable {
    public let window: String?
    public let projectId: String?

    public init(
        window: String? = nil,
        projectId: String? = nil
    ) {
        self.window = window
        self.projectId = projectId
    }

    private enum CodingKeys: String, CodingKey {
        case window = "window"
        case projectId = "projectId"
    }
}


public struct GetProjectMetricsTimelineQuery: Codable, Sendable {
    public let window: String?
    public let granularity: String?
    public let format: String?
    public let projectId: String?

    public init(
        window: String? = nil,
        granularity: String? = nil,
        format: String? = nil,
        projectId: String? = nil
    ) {
        self.window = window
        self.granularity = granularity
        self.format = format
        self.projectId = projectId
    }

    private enum CodingKeys: String, CodingKey {
        case window = "window"
        case granularity = "granularity"
        case format = "format"
        case projectId = "projectId"
    }
}


public struct GetMetricsAdvisorQuery: Codable, Sendable {
    public let projectId: String?

    public init(
        projectId: String? = nil
    ) {
        self.projectId = projectId
    }

    private enum CodingKeys: String, CodingKey {
        case projectId = "projectId"
    }
}


public typealias ListContactSegmentsResponse = [String]


public typealias GetContactTopicsResponse = [TopicSubscriptionResponse]


public typealias GetContactActivityResponse = [ActivityResponse]


public typealias ListApiKeysResponse = [String: [ApiKey]]

