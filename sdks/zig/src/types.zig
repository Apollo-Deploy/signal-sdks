const std = @import("std");

/// AttachmentRequest model.
pub const AttachmentRequest = struct {
    filename: []const u8,
    content: []const u8,
    contentType: []const u8,
    disposition: ?[]const u8 = null,
    contentId: ?[]const u8 = null,
};

/// DeliveryWindowRequest model.
pub const DeliveryWindowRequest = struct {
    start: []const u8,
    end: []const u8,
};

/// TrackingSettingsRequest model.
pub const TrackingSettingsRequest = struct {
    openTracking: ?bool = null,
    clickTracking: ?bool = null,
    unsubscribeTracking: ?bool = null,
    readEngagement: ?bool = null,
};

/// SendEmailRequest model.
pub const SendEmailRequest = struct {
    from: []const u8,
    to: [][]const u8,
    cc: ?[][]const u8 = null,
    bcc: ?[][]const u8 = null,
    replyTo: ?[]const u8 = null,
    subject: ?[]const u8 = null,
    html: ?[]const u8 = null,
    text: ?[]const u8 = null,
    tags: ?std.json.ArrayHashMap([]const u8) = null,
    metadata: ?std.json.ArrayHashMap([]const u8) = null,
    idempotencyKey: ?[]const u8 = null,
    testMode: ?bool = null,
    attachments: ?[]AttachmentRequest = null,
    scheduledAt: ?[]const u8 = null,
    deliveryWindow: ?DeliveryWindowRequest = null,
    sendTimeCategory: ?[]const u8 = null,
    trackingSettings: ?TrackingSettingsRequest = null,
};

/// BatchSendItemResponse model.
pub const BatchSendItemResponse = struct {
    index: i64,
    id: ?[]const u8 = null,
    messageId: ?[]const u8 = null,
    status: ?[]const u8 = null,
    createdAt: ?[]const u8 = null,
    scheduledAt: ?[]const u8 = null,
    @"error": ?[]const u8 = null,
};

/// SendEmailResponse model.
pub const SendEmailResponse = struct {
    id: []const u8,
    messageId: ?[]const u8 = null,
    status: []const u8,
    createdAt: []const u8,
    scheduledAt: ?[]const u8 = null,
    audienceId: ?[]const u8 = null,
    messages: ?[]BatchSendItemResponse = null,
};

/// EmailDetailResponse model.
pub const EmailDetailResponse = struct {
    id: []const u8,
    messageId: ?[]const u8 = null,
    from: []const u8,
    to: [][]const u8,
    cc: ?[][]const u8 = null,
    bcc: ?[][]const u8 = null,
    replyTo: ?[]const u8 = null,
    subject: []const u8,
    html: ?[]const u8 = null,
    text: ?[]const u8 = null,
    status: []const u8,
    @"error": ?[]const u8 = null,
    tags: ?std.json.ArrayHashMap([]const u8) = null,
    metadata: ?std.json.ArrayHashMap([]const u8) = null,
    testMode: bool,
    topicId: ?[]const u8 = null,
    createdAt: []const u8,
    sentAt: ?[]const u8 = null,
    updatedAt: ?[]const u8 = null,
};

/// BatchSendRequest model.
pub const BatchSendRequest = struct {
    items: []SendEmailRequest,
};

/// BatchSendResponse model.
pub const BatchSendResponse = struct {
    results: []BatchSendItemResponse,
};

/// CancelResponse model.
pub const CancelResponse = struct {
    cancelled: ?bool = null,
};

/// BulkCancelResponse model.
pub const BulkCancelResponse = struct {
    cancelled: i64,
};

/// StreamTokenResponse model.
pub const StreamTokenResponse = struct {
    token: []const u8,
    expiresAt: []const u8,
};

/// StreamEventResponse model.
pub const StreamEventResponse = struct {
    type: []const u8,
    emailId: []const u8,
    occurredAt: []const u8,
    data: ?std.json.ArrayHashMap([]const u8) = null,
};

/// ValidateLinksRequest model.
pub const ValidateLinksRequest = struct {
    html: ?[]const u8 = null,
};

/// LinkResultItem model.
pub const LinkResultItem = struct {
    url: []const u8,
    status: []const u8,
    statusCode: ?i64 = null,
    @"error": ?[]const u8 = null,
};

/// ValidateLinksResponse model.
pub const ValidateLinksResponse = struct {
    links: []LinkResultItem,
    totalLinks: i64,
    brokenLinks: i64,
    errorLinks: i64,
};

/// MetricsWindowResponse model.
pub const MetricsWindowResponse = struct {
    from: []const u8,
    to: []const u8,
    label: []const u8,
};

/// TopicPerformanceResponse model.
pub const TopicPerformanceResponse = struct {
    topicId: []const u8,
    topicName: []const u8,
    window: MetricsWindowResponse,
    totalEmails: i64,
    delivered: i64,
    deliveryRate: f64,
    opened: i64,
    openRate: f64,
    clicked: i64,
    clickRate: f64,
    bounced: i64,
    bounceRate: f64,
    complained: i64,
    complaintRate: f64,
    unsubscribed: i64,
    unsubscribeRate: f64,
    readEngaged: i64,
    readEngagementRate: f64,
    avgReadTimeSeconds: ?f64 = null,
    optInCount: i64,
    optOutCount: i64,
    computedAt: []const u8,
};

/// EmailPerformanceResponse model.
pub const EmailPerformanceResponse = struct {
    emailId: []const u8,
    subject: []const u8,
    fromAddress: []const u8,
    topicId: ?[]const u8 = null,
    status: []const u8,
    delivered: bool,
    opened: bool,
    clicked: bool,
    totalClicks: i64,
    bounced: bool,
    complained: bool,
    unsubscribed: bool,
    readEngaged: bool,
    readTimeSeconds: ?f64 = null,
    readCategory: ?[]const u8 = null,
    sentAt: ?[]const u8 = null,
    lastEventAt: ?[]const u8 = null,
    computedAt: []const u8,
};

/// EmailReadScrollAnalyticsResponse model.
pub const EmailReadScrollAnalyticsResponse = struct {
    emailId: []const u8,
    subject: []const u8,
    computedAt: []const u8,
    readEngaged: bool,
    readTimeSeconds: ?f64 = null,
    readCategory: ?[]const u8 = null,
    mailClient: ?[]const u8 = null,
    deviceType: ?[]const u8 = null,
    os: ?[]const u8 = null,
    readEngagedAt: ?[]const u8 = null,
    shortEmail: bool,
    depth25Count: i64,
    depth50Count: i64,
    depth75Count: i64,
    depth100Count: i64,
    maxDepthPct: ?i64 = null,
    depth25Rate: ?f64 = null,
    depth50Rate: ?f64 = null,
    depth75Rate: ?f64 = null,
    depth100Rate: ?f64 = null,
};

/// ProjectMetricsSummaryResponse model.
pub const ProjectMetricsSummaryResponse = struct {
    projectId: []const u8,
    window: MetricsWindowResponse,
    sent: i64,
    delivered: i64,
    opened: i64,
    clicked: i64,
    bounced: i64,
    complained: i64,
    failed: i64,
    unsubscribed: i64,
    readEngaged: i64,
    deliveryRate: f64,
    openRate: f64,
    clickRate: f64,
    bounceRate: f64,
    complaintRate: f64,
    readEngagementRate: f64,
};

/// ProjectTimelineBucketResponse model.
pub const ProjectTimelineBucketResponse = struct {
    bucket: []const u8,
    type: []const u8,
    count: i64,
};

/// ProjectMetricsTimelineResponse model.
pub const ProjectMetricsTimelineResponse = struct {
    projectId: []const u8,
    window: MetricsWindowResponse,
    granularity: []const u8,
    format: []const u8,
    buckets: []ProjectTimelineBucketResponse,
};

/// AdvisorRecommendationDataResponse model.
pub const AdvisorRecommendationDataResponse = struct {
    bounceRate: ?f64 = null,
    bounced: ?i64 = null,
    accepted: ?i64 = null,
    complaintRate: ?f64 = null,
    accepted24h: ?i64 = null,
    avgDailyAccepted7d: ?i64 = null,
    daysSinceLastSend: ?i64 = null,
    reportedOpenRate: ?f64 = null,
    adjustedOpenRate: ?f64 = null,
    proxyRate: ?f64 = null,
    proxyOpens: ?i64 = null,
    totalOpens: ?i64 = null,
    humanOpenRate: ?f64 = null,
    delivered: ?i64 = null,
    unsubRate: ?f64 = null,
    unsubscribed: ?i64 = null,
    dmarcAlignmentFailureRate7d: ?f64 = null,
    dmarcDomain: ?[]const u8 = null,
    dmarcCurrentPolicy: ?[]const u8 = null,
    dmarcRecommendedPolicy: ?[]const u8 = null,
    dmarcObservedMessages: ?i64 = null,
    dmarcAlignedMessages: ?i64 = null,
    dmarcAccountedRate: ?f64 = null,
    dmarcUnknownMessages: ?i64 = null,
    dmarcUnknownSources: ?i64 = null,
    dmarcReportingDays: ?i64 = null,
};

/// AdvisorRecommendationResponse model.
pub const AdvisorRecommendationResponse = struct {
    code: []const u8,
    severity: []const u8,
    title: []const u8,
    message: []const u8,
    data: ?AdvisorRecommendationDataResponse = null,
};

/// AdvisorReportResponse model.
pub const AdvisorReportResponse = struct {
    projectId: []const u8,
    generatedAt: []const u8,
    score: i64,
    recommendations: []AdvisorRecommendationResponse,
};

/// SuppressionResponse model.
pub const SuppressionResponse = struct {
    id: []const u8,
    projectId: []const u8,
    email: []const u8,
    reason: []const u8,
    createdAt: []const u8,
    contactId: ?[]const u8 = null,
};

/// PageInfo model.
pub const PageInfo = struct {
    page: i64,
    size: i64,
    total: i64,
    totalPages: i64,
    hasNextPage: bool,
    hasPreviousPage: bool,
};

/// SuppressionPageResponse model.
pub const SuppressionPageResponse = struct {
    data: []SuppressionResponse,
    page: PageInfo,
};

/// AddSuppressionBody model.
pub const AddSuppressionBody = struct {
    email: []const u8,
};

/// SuppressionImportRowSerializable model.
pub const SuppressionImportRowSerializable = struct {
    email: []const u8,
    reason: ?[]const u8 = null,
};

/// SuppressionImportBody model.
pub const SuppressionImportBody = struct {
    suppressions: []SuppressionImportRowSerializable,
};

/// SuppressionImportResponse model.
pub const SuppressionImportResponse = struct {
    imported: i64,
    skipped: i64,
};

/// SegmentResponse model.
pub const SegmentResponse = struct {
    object: ?[]const u8 = null,
    id: []const u8,
    name: []const u8,
    projectId: []const u8,
    createdAt: []const u8,
    contactCount: ?i64 = null,
    unsubscribedCount: ?i64 = null,
};

/// SegmentPageResponse model.
pub const SegmentPageResponse = struct {
    data: []SegmentResponse,
    page: PageInfo,
};

/// SegmentContactResponse model.
pub const SegmentContactResponse = struct {
    contactId: []const u8,
    email: []const u8,
    firstName: ?[]const u8 = null,
    lastName: ?[]const u8 = null,
    segments: [][]const u8,
};

/// CursorInfo model.
pub const CursorInfo = struct {
    nextCursor: ?[]const u8 = null,
    previousCursor: ?[]const u8 = null,
    hasNextPage: bool,
    hasPreviousPage: bool,
};

/// CursorPage model.
pub const CursorPage = struct {
    data: []SegmentContactResponse,
    cursor: CursorInfo,
};

/// CreateSegmentBody model.
pub const CreateSegmentBody = struct {
    name: []const u8,
};

/// TopicResponse model.
pub const TopicResponse = struct {
    object: ?[]const u8 = null,
    id: []const u8,
    name: []const u8,
    defaultSubscription: []const u8,
    description: ?[]const u8 = null,
    visibility: []const u8,
    projectId: []const u8,
    optInCount: i64,
    optOutCount: i64,
    createdAt: []const u8,
    updatedAt: []const u8,
};

/// TopicPageResponse model.
pub const TopicPageResponse = struct {
    data: []TopicResponse,
    page: PageInfo,
};

/// CreateTopicBody model.
pub const CreateTopicBody = struct {
    name: []const u8,
    defaultSubscription: []const u8,
    description: ?[]const u8 = null,
    visibility: ?[]const u8 = null,
};

/// UpdateTopicBody model.
pub const UpdateTopicBody = struct {
    name: ?[]const u8 = null,
    description: ?[]const u8 = null,
    visibility: ?[]const u8 = null,
};

/// ContactPropertyResponse model.
pub const ContactPropertyResponse = struct {
    object: ?[]const u8 = null,
    id: []const u8,
    key: []const u8,
    type: []const u8,
    fallbackValue: ?[]const u8 = null,
    projectId: []const u8,
    createdAt: []const u8,
    updatedAt: []const u8,
};

/// ContactPropertyPageResponse model.
pub const ContactPropertyPageResponse = struct {
    data: []ContactPropertyResponse,
    page: PageInfo,
};

/// CreateContactPropertyBody model.
pub const CreateContactPropertyBody = struct {
    key: []const u8,
    type: []const u8,
    fallbackValue: ?[]const u8 = null,
};

/// UpdateContactPropertyBody model.
pub const UpdateContactPropertyBody = struct {
    fallbackValue: ?[]const u8 = null,
};

/// TopicSubscriptionResponse model.
pub const TopicSubscriptionResponse = struct {
    topicId: []const u8,
    subscription: []const u8,
};

/// ContactResponse model.
pub const ContactResponse = struct {
    object: ?[]const u8 = null,
    id: []const u8,
    email: []const u8,
    phone: ?[]const u8 = null,
    firstName: ?[]const u8 = null,
    lastName: ?[]const u8 = null,
    unsubscribed: bool,
    properties: std.json.ArrayHashMap([]const u8),
    profileImageUrl: ?[]const u8 = null,
    projectId: []const u8,
    segments: [][]const u8,
    topics: []TopicSubscriptionResponse,
    createdAt: []const u8,
    updatedAt: []const u8,
};

/// ContactPageResponse model.
pub const ContactPageResponse = struct {
    data: []ContactResponse,
    page: PageInfo,
};

/// SegmentRef model.
pub const SegmentRef = struct {
    id: []const u8,
};

/// TopicSubscriptionBody model.
pub const TopicSubscriptionBody = struct {
    id: []const u8,
    subscription: []const u8,
};

/// CreateContactBody model.
pub const CreateContactBody = struct {
    email: []const u8,
    phone: ?[]const u8 = null,
    firstName: ?[]const u8 = null,
    lastName: ?[]const u8 = null,
    unsubscribed: ?bool = null,
    properties: ?std.json.ArrayHashMap([]const u8) = null,
    segments: ?[]SegmentRef = null,
    topics: ?[]TopicSubscriptionBody = null,
};

/// UpdateContactBody model.
pub const UpdateContactBody = struct {
    firstName: ?[]const u8 = null,
    lastName: ?[]const u8 = null,
    phone: ?[]const u8 = null,
    unsubscribed: ?bool = null,
    properties: ?std.json.ArrayHashMap([]const u8) = null,
};

/// SetImageUrlBody model.
pub const SetImageUrlBody = struct {
    url: []const u8,
};

/// AddToSegmentBody model.
pub const AddToSegmentBody = struct {
    segmentId: []const u8,
};

/// UpdateTopicsBody model.
pub const UpdateTopicsBody = struct {
    topics: []TopicSubscriptionBody,
};

/// ActivityMetadataResponse model.
pub const ActivityMetadataResponse = struct {
    topicId: ?[]const u8 = null,
};

/// ActivityResponse model.
pub const ActivityResponse = struct {
    object: ?[]const u8 = null,
    id: []const u8,
    type: []const u8,
    referenceId: ?[]const u8 = null,
    referenceName: ?[]const u8 = null,
    metadata: ?ActivityMetadataResponse = null,
    occurredAt: []const u8,
};

/// EngagementScoreResponse model.
pub const EngagementScoreResponse = struct {
    object: ?[]const u8 = null,
    score: i64,
    tier: []const u8,
    scoredAt: []const u8,
};

/// EmailValidationStatusResponse model.
pub const EmailValidationStatusResponse = struct {
    object: ?[]const u8 = null,
    status: []const u8,
    reason: ?[]const u8 = null,
    validatedAt: ?[]const u8 = null,
};

/// RecordValidationBody model.
pub const RecordValidationBody = struct {
    status: EmailValidationStatusInput,
    reason: ?[]const u8 = null,
};

/// WebhookFilterSerializable model.
pub const WebhookFilterSerializable = struct {
    field: []const u8,
    operator: []const u8,
    value: ?[]const u8 = null,
};

/// WebhookTransformationSerializable model.
pub const WebhookTransformationSerializable = struct {
    type: []const u8,
    from: ?[]const u8 = null,
    to: ?[]const u8 = null,
    field: ?[]const u8 = null,
    value: ?[]const u8 = null,
    template: ?[]const u8 = null,
};

/// WebhookResponse model.
pub const WebhookResponse = struct {
    id: []const u8,
    projectId: []const u8,
    name: []const u8,
    url: []const u8,
    events: [][]const u8,
    enabled: bool,
    filters: ?[]WebhookFilterSerializable = null,
    transformations: ?[]WebhookTransformationSerializable = null,
    createdAt: []const u8,
    updatedAt: []const u8,
};

/// WebhookPageResponse model.
pub const WebhookPageResponse = struct {
    data: []WebhookResponse,
    page: PageInfo,
};

/// WebhookDeliveryResponse model.
pub const WebhookDeliveryResponse = struct {
    id: []const u8,
    projectId: []const u8,
    webhookEndpointId: []const u8,
    eventType: []const u8,
    status: []const u8,
    attemptCount: i64,
    lastStatusCode: ?i64 = null,
    lastError: ?[]const u8 = null,
    responseBodySnippet: ?[]const u8 = null,
    nextAttemptAt: ?[]const u8 = null,
    createdAt: []const u8,
    updatedAt: []const u8,
};

/// WebhookDeliveryPageResponse model.
pub const WebhookDeliveryPageResponse = struct {
    data: []WebhookDeliveryResponse,
    page: PageInfo,
};

/// CreateWebhookBody model.
pub const CreateWebhookBody = struct {
    url: []const u8,
    events: [][]const u8,
    name: ?[]const u8 = null,
    secret: ?[]const u8 = null,
    filters: ?[]WebhookFilterSerializable = null,
    transformations: ?[]WebhookTransformationSerializable = null,
};

/// WebhookCreateResponse model.
pub const WebhookCreateResponse = struct {
    id: []const u8,
    projectId: []const u8,
    name: []const u8,
    url: []const u8,
    events: [][]const u8,
    enabled: bool,
    filters: ?[]WebhookFilterSerializable = null,
    transformations: ?[]WebhookTransformationSerializable = null,
    createdAt: []const u8,
    updatedAt: []const u8,
    secret: []const u8,
};

/// UpdateWebhookBody model.
pub const UpdateWebhookBody = struct {
    name: ?[]const u8 = null,
    url: ?[]const u8 = null,
    events: ?[][]const u8 = null,
    secret: ?[]const u8 = null,
    enabled: ?bool = null,
    filters: ?[]WebhookFilterSerializable = null,
    transformations: ?[]WebhookTransformationSerializable = null,
};

/// ApiKey model.
pub const ApiKey = struct {
    id: []const u8,
    configId: []const u8,
    name: ?[]const u8 = null,
    start: ?[]const u8 = null,
    prefix: ?[]const u8 = null,
    organizationId: []const u8,
    projectId: ?[]const u8 = null,
    enabled: bool,
    rateLimitEnabled: bool,
    rateLimitTimeWindow: ?i64 = null,
    rateLimitMax: ?i64 = null,
    requestCount: i64,
    remaining: ?i64 = null,
    lastRequest: ?[]const u8 = null,
    expiresAt: ?[]const u8 = null,
    createdAt: []const u8,
    updatedAt: []const u8,
    metadata: ?std.json.ArrayHashMap([]const u8) = null,
    permissions: ?std.json.ArrayHashMap([][]const u8) = null,
};

/// ApiKeyUsageRecord model.
pub const ApiKeyUsageRecord = struct {
    id: []const u8,
    keyId: []const u8,
    orgId: []const u8,
    method: []const u8,
    route: []const u8,
    statusCode: i64,
    durationMs: ?i64 = null,
    ip: ?[]const u8 = null,
    ts: []const u8,
};

/// UsagePage model.
pub const UsagePage = struct {
    size: i64,
    totalPages: i64,
    hasMore: bool,
};

/// ApiKeyUsageResponse model.
pub const ApiKeyUsageResponse = struct {
    data: []ApiKeyUsageRecord,
    page: UsagePage,
};

/// ProjectLimitsModel model.
pub const ProjectLimitsModel = struct {
    dailySends: i64,
    perSecondSends: i64,
    maxRecipientsPerMessage: i64,
    maxDomains: i64,
    maxApiKeys: i64,
    maxWebhooks: i64,
};

/// ProjectTrackingSettingsModel model.
pub const ProjectTrackingSettingsModel = struct {
    openTracking: bool,
    clickTracking: bool,
    unsubscribeTracking: bool,
    readEngagement: bool,
    scrollDepth: ?bool = null,
};

/// ProjectResponse model.
pub const ProjectResponse = struct {
    id: []const u8,
    name: []const u8,
    slug: []const u8,
    status: []const u8,
    suspensionReason: ?[]const u8 = null,
    region: []const u8,
    limits: ProjectLimitsModel,
    trackingSettings: ProjectTrackingSettingsModel,
    createdAt: []const u8,
    updatedAt: []const u8,
};

/// ProjectPageResponse model.
pub const ProjectPageResponse = struct {
    data: []ProjectResponse,
    page: PageInfo,
};

/// UpdateProjectRequest model.
pub const UpdateProjectRequest = struct {
    name: ?[]const u8 = null,
    slug: ?[]const u8 = null,
    limits: ?ProjectLimitsModel = null,
    trackingSettings: ?ProjectTrackingSettingsModel = null,
};

/// EmailPageResponse model.
pub const EmailPageResponse = struct {
    data: []EmailDetailResponse,
    page: PageInfo,
};

/// EmailTimelineItem model.
pub const EmailTimelineItem = struct {
    id: []const u8,
    type: []const u8,
    providerEventId: ?[]const u8 = null,
    payload: ?std.json.ArrayHashMap(?[]const u8) = null,
    occurredAt: []const u8,
    createdAt: []const u8,
};

/// EmailTimelineResponse model.
pub const EmailTimelineResponse = struct {
    items: []EmailTimelineItem,
};

/// DomainListItemResponse model.
pub const DomainListItemResponse = struct {
    id: []const u8,
    domain: []const u8,
    region: []const u8,
    status: []const u8,
    dkimStatus: []const u8,
    bimiStatus: []const u8,
    trackingStatus: []const u8,
    updatedAt: []const u8,
};

/// DomainListPageResponse model.
pub const DomainListPageResponse = struct {
    data: []DomainListItemResponse,
    page: PageInfo,
};

/// DkimRecordResponse model.
pub const DkimRecordResponse = struct {
    name: []const u8,
    type: []const u8,
    value: []const u8,
    status: ?[]const u8 = null,
};

/// DnsRecordResponse model.
pub const DnsRecordResponse = struct {
    name: []const u8,
    type: []const u8,
    value: []const u8,
    priority: ?i64 = null,
    optional: ?bool = null,
    status: ?[]const u8 = null,
};

/// VerificationRecordsResponse model.
pub const VerificationRecordsResponse = struct {
    dkim: []DkimRecordResponse,
    mailFromMx: DnsRecordResponse,
    mailFromSpf: DnsRecordResponse,
    dmarcRecommended: ?DnsRecordResponse = null,
    bimi: ?DnsRecordResponse = null,
    trackingCname: ?DnsRecordResponse = null,
};

/// DomainResponse model.
pub const DomainResponse = struct {
    id: []const u8,
    projectId: []const u8,
    domain: []const u8,
    region: []const u8,
    status: []const u8,
    dkimStatus: []const u8,
    spfStatus: []const u8,
    dmarcStatus: []const u8,
    mailFromStatus: []const u8,
    mailFromDomain: []const u8,
    verificationRecords: VerificationRecordsResponse,
    bimiStatus: []const u8,
    bimiLogoUrl: ?[]const u8 = null,
    createdAt: []const u8,
    updatedAt: []const u8,
    verifiedAt: ?[]const u8 = null,
};

/// RegisterDomainRequest model.
pub const RegisterDomainRequest = struct {
    domain: []const u8,
    region: []const u8,
};

/// UpdateBimiRequest model.
pub const UpdateBimiRequest = struct {
    logoUrl: ?[]const u8 = null,
};

/// EmailValidationStatusInput model.
pub const EmailValidationStatusInput = enum {
    valid,
    risky,
    invalid,
    unknown,

    pub fn jsonParse(
        allocator: std.mem.Allocator,
        source: anytype,
        options: std.json.ParseOptions,
    ) !@This() {
        const value = try std.json.innerParse([]const u8, allocator, source, options);
        if (std.mem.eql(u8, value, "valid")) return .valid;
        if (std.mem.eql(u8, value, "risky")) return .risky;
        if (std.mem.eql(u8, value, "invalid")) return .invalid;
        if (std.mem.eql(u8, value, "unknown")) return .unknown;
        return error.InvalidEnumTag;
    }

    pub fn jsonStringify(self: @This(), writer: anytype) !void {
        switch (self) {
            .valid => try writer.write("valid"),
            .risky => try writer.write("risky"),
            .invalid => try writer.write("invalid"),
            .unknown => try writer.write("unknown"),
        }
    }
};

/// GetTopicPerformanceQuery model.
pub const GetTopicPerformanceQuery = struct {
    window: ?[]const u8 = null,
    projectId: ?[]const u8 = null,
};

/// GetProjectMetricsSummaryQuery model.
pub const GetProjectMetricsSummaryQuery = struct {
    window: ?[]const u8 = null,
    projectId: ?[]const u8 = null,
};

/// GetProjectMetricsTimelineQuery model.
pub const GetProjectMetricsTimelineQuery = struct {
    window: ?[]const u8 = null,
    granularity: ?[]const u8 = null,
    format: ?[]const u8 = null,
    projectId: ?[]const u8 = null,
};

/// GetMetricsAdvisorQuery model.
pub const GetMetricsAdvisorQuery = struct {
    projectId: ?[]const u8 = null,
};

/// Type alias retained as a concrete Zig type.
pub const ListContactSegmentsResponse = [][]const u8;

/// Type alias retained as a concrete Zig type.
pub const GetContactTopicsResponse = []TopicSubscriptionResponse;

/// Type alias retained as a concrete Zig type.
pub const GetContactActivityResponse = []ActivityResponse;

/// Concrete string-keyed map alias.
pub const ListApiKeysResponse = std.json.ArrayHashMap([]ApiKey);

