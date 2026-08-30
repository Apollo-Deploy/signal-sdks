namespace ApolloDeploySignal;

using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text.Json;
using System.Text.Json.Serialization;

/// <summary>AttachmentRequest schema type.</summary>
public class AttachmentRequest
{
    [JsonPropertyName("filename")]
    public string Filename { get; set; } = default!;
    [JsonPropertyName("content")]
    public string Content { get; set; } = default!;
    [JsonPropertyName("contentType")]
    public string ContentType { get; set; } = default!;
    [JsonPropertyName("disposition")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Disposition { get; set; }
    [JsonPropertyName("contentId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ContentId { get; set; }
}

/// <summary>DeliveryWindowRequest schema type.</summary>
public class DeliveryWindowRequest
{
    [JsonPropertyName("start")]
    public string Start { get; set; } = default!;
    [JsonPropertyName("end")]
    public string End { get; set; } = default!;
}

/// <summary>TrackingSettingsRequest schema type.</summary>
public class TrackingSettingsRequest
{
    [JsonPropertyName("openTracking")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? OpenTracking { get; set; }
    [JsonPropertyName("clickTracking")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? ClickTracking { get; set; }
    [JsonPropertyName("unsubscribeTracking")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? UnsubscribeTracking { get; set; }
    [JsonPropertyName("readEngagement")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? ReadEngagement { get; set; }
}

/// <summary>SendEmailRequest schema type.</summary>
public class SendEmailRequest
{
    [JsonPropertyName("from")]
    public string From { get; set; } = default!;
    [JsonPropertyName("to")]
    public List<string> To { get; set; } = default!;
    [JsonPropertyName("cc")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<string>? Cc { get; set; }
    [JsonPropertyName("bcc")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<string>? Bcc { get; set; }
    [JsonPropertyName("replyTo")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ReplyTo { get; set; }
    [JsonPropertyName("subject")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Subject { get; set; }
    [JsonPropertyName("html")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Html { get; set; }
    [JsonPropertyName("text")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Text { get; set; }
    [JsonPropertyName("tags")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, string>? Tags { get; set; }
    [JsonPropertyName("metadata")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, string>? Metadata { get; set; }
    [JsonPropertyName("idempotencyKey")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? IdempotencyKey { get; set; }
    [JsonPropertyName("testMode")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? TestMode { get; set; }
    [JsonPropertyName("attachments")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<AttachmentRequest>? Attachments { get; set; }
    [JsonPropertyName("scheduledAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ScheduledAt { get; set; }
    [JsonPropertyName("deliveryWindow")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public DeliveryWindowRequest? DeliveryWindow { get; set; }
    [JsonPropertyName("sendTimeCategory")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? SendTimeCategory { get; set; }
    [JsonPropertyName("trackingSettings")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public TrackingSettingsRequest? TrackingSettings { get; set; }
}

/// <summary>BatchSendItemResponse schema type.</summary>
public class BatchSendItemResponse
{
    [JsonPropertyName("index")]
    public long Index { get; set; }
    [JsonPropertyName("id")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Id { get; set; }
    [JsonPropertyName("messageId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? MessageId { get; set; }
    [JsonPropertyName("status")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Status { get; set; }
    [JsonPropertyName("createdAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? CreatedAt { get; set; }
    [JsonPropertyName("scheduledAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ScheduledAt { get; set; }
    [JsonPropertyName("error")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Error { get; set; }
}

/// <summary>SendEmailResponse schema type.</summary>
public class SendEmailResponse
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("messageId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? MessageId { get; set; }
    [JsonPropertyName("status")]
    public string Status { get; set; } = default!;
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("scheduledAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ScheduledAt { get; set; }
    [JsonPropertyName("audienceId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? AudienceId { get; set; }
    [JsonPropertyName("messages")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<BatchSendItemResponse>? Messages { get; set; }
}

/// <summary>EmailDetailResponse schema type.</summary>
public class EmailDetailResponse
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("messageId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? MessageId { get; set; }
    [JsonPropertyName("from")]
    public string From { get; set; } = default!;
    [JsonPropertyName("to")]
    public List<string> To { get; set; } = default!;
    [JsonPropertyName("cc")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<string>? Cc { get; set; }
    [JsonPropertyName("bcc")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<string>? Bcc { get; set; }
    [JsonPropertyName("replyTo")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ReplyTo { get; set; }
    [JsonPropertyName("subject")]
    public string Subject { get; set; } = default!;
    [JsonPropertyName("html")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Html { get; set; }
    [JsonPropertyName("text")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Text { get; set; }
    [JsonPropertyName("status")]
    public string Status { get; set; } = default!;
    [JsonPropertyName("error")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Error { get; set; }
    [JsonPropertyName("tags")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, string>? Tags { get; set; }
    [JsonPropertyName("metadata")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, string>? Metadata { get; set; }
    [JsonPropertyName("testMode")]
    public bool TestMode { get; set; }
    [JsonPropertyName("topicId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? TopicId { get; set; }
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("sentAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? SentAt { get; set; }
    [JsonPropertyName("updatedAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? UpdatedAt { get; set; }
}

/// <summary>BatchSendRequest schema type.</summary>
public class BatchSendRequest
{
    [JsonPropertyName("items")]
    public List<SendEmailRequest> Items { get; set; } = default!;
}

/// <summary>BatchSendResponse schema type.</summary>
public class BatchSendResponse
{
    [JsonPropertyName("results")]
    public List<BatchSendItemResponse> Results { get; set; } = default!;
}

/// <summary>CancelResponse schema type.</summary>
public class CancelResponse
{
    [JsonPropertyName("cancelled")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? Cancelled { get; set; }
}

/// <summary>BulkCancelResponse schema type.</summary>
public class BulkCancelResponse
{
    [JsonPropertyName("cancelled")]
    public long Cancelled { get; set; }
}

/// <summary>StreamTokenResponse schema type.</summary>
public class StreamTokenResponse
{
    [JsonPropertyName("token")]
    public string Token { get; set; } = default!;
    [JsonPropertyName("expiresAt")]
    public string ExpiresAt { get; set; } = default!;
}

/// <summary>StreamEventResponse schema type.</summary>
public class StreamEventResponse
{
    [JsonPropertyName("type")]
    public string Type { get; set; } = default!;
    [JsonPropertyName("emailId")]
    public string EmailId { get; set; } = default!;
    [JsonPropertyName("occurredAt")]
    public string OccurredAt { get; set; } = default!;
    [JsonPropertyName("data")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, string>? Data { get; set; }
}

/// <summary>ValidateLinksRequest schema type.</summary>
public class ValidateLinksRequest
{
    [JsonPropertyName("html")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Html { get; set; }
}

/// <summary>LinkResultItem schema type.</summary>
public class LinkResultItem
{
    [JsonPropertyName("url")]
    public string Url { get; set; } = default!;
    [JsonPropertyName("status")]
    public string Status { get; set; } = default!;
    [JsonPropertyName("statusCode")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? StatusCode { get; set; }
    [JsonPropertyName("error")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Error { get; set; }
}

/// <summary>ValidateLinksResponse schema type.</summary>
public class ValidateLinksResponse
{
    [JsonPropertyName("links")]
    public List<LinkResultItem> Links { get; set; } = default!;
    [JsonPropertyName("totalLinks")]
    public long TotalLinks { get; set; }
    [JsonPropertyName("brokenLinks")]
    public long BrokenLinks { get; set; }
    [JsonPropertyName("errorLinks")]
    public long ErrorLinks { get; set; }
}

/// <summary>MetricsWindowResponse schema type.</summary>
public class MetricsWindowResponse
{
    [JsonPropertyName("from")]
    public string From { get; set; } = default!;
    [JsonPropertyName("to")]
    public string To { get; set; } = default!;
    [JsonPropertyName("label")]
    public string Label { get; set; } = default!;
}

/// <summary>TopicPerformanceResponse schema type.</summary>
public class TopicPerformanceResponse
{
    [JsonPropertyName("topicId")]
    public string TopicId { get; set; } = default!;
    [JsonPropertyName("topicName")]
    public string TopicName { get; set; } = default!;
    [JsonPropertyName("window")]
    public MetricsWindowResponse Window { get; set; } = default!;
    [JsonPropertyName("totalEmails")]
    public long TotalEmails { get; set; }
    [JsonPropertyName("delivered")]
    public long Delivered { get; set; }
    [JsonPropertyName("deliveryRate")]
    public double DeliveryRate { get; set; }
    [JsonPropertyName("opened")]
    public long Opened { get; set; }
    [JsonPropertyName("openRate")]
    public double OpenRate { get; set; }
    [JsonPropertyName("clicked")]
    public long Clicked { get; set; }
    [JsonPropertyName("clickRate")]
    public double ClickRate { get; set; }
    [JsonPropertyName("bounced")]
    public long Bounced { get; set; }
    [JsonPropertyName("bounceRate")]
    public double BounceRate { get; set; }
    [JsonPropertyName("complained")]
    public long Complained { get; set; }
    [JsonPropertyName("complaintRate")]
    public double ComplaintRate { get; set; }
    [JsonPropertyName("unsubscribed")]
    public long Unsubscribed { get; set; }
    [JsonPropertyName("unsubscribeRate")]
    public double UnsubscribeRate { get; set; }
    [JsonPropertyName("readEngaged")]
    public long ReadEngaged { get; set; }
    [JsonPropertyName("readEngagementRate")]
    public double ReadEngagementRate { get; set; }
    [JsonPropertyName("avgReadTimeSeconds")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? AvgReadTimeSeconds { get; set; }
    [JsonPropertyName("optInCount")]
    public long OptInCount { get; set; }
    [JsonPropertyName("optOutCount")]
    public long OptOutCount { get; set; }
    [JsonPropertyName("computedAt")]
    public string ComputedAt { get; set; } = default!;
}

/// <summary>EmailPerformanceResponse schema type.</summary>
public class EmailPerformanceResponse
{
    [JsonPropertyName("emailId")]
    public string EmailId { get; set; } = default!;
    [JsonPropertyName("subject")]
    public string Subject { get; set; } = default!;
    [JsonPropertyName("fromAddress")]
    public string FromAddress { get; set; } = default!;
    [JsonPropertyName("topicId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? TopicId { get; set; }
    [JsonPropertyName("status")]
    public string Status { get; set; } = default!;
    [JsonPropertyName("delivered")]
    public bool Delivered { get; set; }
    [JsonPropertyName("opened")]
    public bool Opened { get; set; }
    [JsonPropertyName("clicked")]
    public bool Clicked { get; set; }
    [JsonPropertyName("totalClicks")]
    public long TotalClicks { get; set; }
    [JsonPropertyName("bounced")]
    public bool Bounced { get; set; }
    [JsonPropertyName("complained")]
    public bool Complained { get; set; }
    [JsonPropertyName("unsubscribed")]
    public bool Unsubscribed { get; set; }
    [JsonPropertyName("readEngaged")]
    public bool ReadEngaged { get; set; }
    [JsonPropertyName("readTimeSeconds")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? ReadTimeSeconds { get; set; }
    [JsonPropertyName("readCategory")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ReadCategory { get; set; }
    [JsonPropertyName("sentAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? SentAt { get; set; }
    [JsonPropertyName("lastEventAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? LastEventAt { get; set; }
    [JsonPropertyName("computedAt")]
    public string ComputedAt { get; set; } = default!;
}

/// <summary>EmailReadScrollAnalyticsResponse schema type.</summary>
public class EmailReadScrollAnalyticsResponse
{
    [JsonPropertyName("emailId")]
    public string EmailId { get; set; } = default!;
    [JsonPropertyName("subject")]
    public string Subject { get; set; } = default!;
    [JsonPropertyName("computedAt")]
    public string ComputedAt { get; set; } = default!;
    [JsonPropertyName("readEngaged")]
    public bool ReadEngaged { get; set; }
    [JsonPropertyName("readTimeSeconds")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? ReadTimeSeconds { get; set; }
    [JsonPropertyName("readCategory")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ReadCategory { get; set; }
    [JsonPropertyName("mailClient")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? MailClient { get; set; }
    [JsonPropertyName("deviceType")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? DeviceType { get; set; }
    [JsonPropertyName("os")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Os { get; set; }
    [JsonPropertyName("readEngagedAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ReadEngagedAt { get; set; }
    [JsonPropertyName("shortEmail")]
    public bool ShortEmail { get; set; }
    [JsonPropertyName("depth25Count")]
    public long Depth25Count { get; set; }
    [JsonPropertyName("depth50Count")]
    public long Depth50Count { get; set; }
    [JsonPropertyName("depth75Count")]
    public long Depth75Count { get; set; }
    [JsonPropertyName("depth100Count")]
    public long Depth100Count { get; set; }
    [JsonPropertyName("maxDepthPct")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? MaxDepthPct { get; set; }
    [JsonPropertyName("depth25Rate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? Depth25Rate { get; set; }
    [JsonPropertyName("depth50Rate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? Depth50Rate { get; set; }
    [JsonPropertyName("depth75Rate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? Depth75Rate { get; set; }
    [JsonPropertyName("depth100Rate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? Depth100Rate { get; set; }
}

/// <summary>ProjectMetricsSummaryResponse schema type.</summary>
public class ProjectMetricsSummaryResponse
{
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("window")]
    public MetricsWindowResponse Window { get; set; } = default!;
    [JsonPropertyName("sent")]
    public long Sent { get; set; }
    [JsonPropertyName("delivered")]
    public long Delivered { get; set; }
    [JsonPropertyName("opened")]
    public long Opened { get; set; }
    [JsonPropertyName("clicked")]
    public long Clicked { get; set; }
    [JsonPropertyName("bounced")]
    public long Bounced { get; set; }
    [JsonPropertyName("complained")]
    public long Complained { get; set; }
    [JsonPropertyName("failed")]
    public long Failed { get; set; }
    [JsonPropertyName("unsubscribed")]
    public long Unsubscribed { get; set; }
    [JsonPropertyName("readEngaged")]
    public long ReadEngaged { get; set; }
    [JsonPropertyName("deliveryRate")]
    public double DeliveryRate { get; set; }
    [JsonPropertyName("openRate")]
    public double OpenRate { get; set; }
    [JsonPropertyName("clickRate")]
    public double ClickRate { get; set; }
    [JsonPropertyName("bounceRate")]
    public double BounceRate { get; set; }
    [JsonPropertyName("complaintRate")]
    public double ComplaintRate { get; set; }
    [JsonPropertyName("readEngagementRate")]
    public double ReadEngagementRate { get; set; }
}

/// <summary>ProjectTimelineBucketResponse schema type.</summary>
public class ProjectTimelineBucketResponse
{
    [JsonPropertyName("bucket")]
    public string Bucket { get; set; } = default!;
    [JsonPropertyName("type")]
    public string Type { get; set; } = default!;
    [JsonPropertyName("count")]
    public long Count { get; set; }
}

/// <summary>ProjectMetricsTimelineResponse schema type.</summary>
public class ProjectMetricsTimelineResponse
{
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("window")]
    public MetricsWindowResponse Window { get; set; } = default!;
    [JsonPropertyName("granularity")]
    public string Granularity { get; set; } = default!;
    [JsonPropertyName("format")]
    public string Format { get; set; } = default!;
    [JsonPropertyName("buckets")]
    public List<ProjectTimelineBucketResponse> Buckets { get; set; } = default!;
}

/// <summary>AdvisorRecommendationDataResponse schema type.</summary>
public class AdvisorRecommendationDataResponse
{
    [JsonPropertyName("bounceRate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? BounceRate { get; set; }
    [JsonPropertyName("bounced")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? Bounced { get; set; }
    [JsonPropertyName("accepted")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? Accepted { get; set; }
    [JsonPropertyName("complaintRate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? ComplaintRate { get; set; }
    [JsonPropertyName("accepted24h")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? Accepted24h { get; set; }
    [JsonPropertyName("avgDailyAccepted7d")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? AvgDailyAccepted7d { get; set; }
    [JsonPropertyName("daysSinceLastSend")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? DaysSinceLastSend { get; set; }
    [JsonPropertyName("reportedOpenRate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? ReportedOpenRate { get; set; }
    [JsonPropertyName("adjustedOpenRate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? AdjustedOpenRate { get; set; }
    [JsonPropertyName("proxyRate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? ProxyRate { get; set; }
    [JsonPropertyName("proxyOpens")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? ProxyOpens { get; set; }
    [JsonPropertyName("totalOpens")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? TotalOpens { get; set; }
    [JsonPropertyName("humanOpenRate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? HumanOpenRate { get; set; }
    [JsonPropertyName("delivered")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? Delivered { get; set; }
    [JsonPropertyName("unsubRate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? UnsubRate { get; set; }
    [JsonPropertyName("unsubscribed")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? Unsubscribed { get; set; }
    [JsonPropertyName("dmarcAlignmentFailureRate7d")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? DmarcAlignmentFailureRate7d { get; set; }
    [JsonPropertyName("dmarcDomain")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? DmarcDomain { get; set; }
    [JsonPropertyName("dmarcCurrentPolicy")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? DmarcCurrentPolicy { get; set; }
    [JsonPropertyName("dmarcRecommendedPolicy")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? DmarcRecommendedPolicy { get; set; }
    [JsonPropertyName("dmarcObservedMessages")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? DmarcObservedMessages { get; set; }
    [JsonPropertyName("dmarcAlignedMessages")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? DmarcAlignedMessages { get; set; }
    [JsonPropertyName("dmarcAccountedRate")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public double? DmarcAccountedRate { get; set; }
    [JsonPropertyName("dmarcUnknownMessages")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? DmarcUnknownMessages { get; set; }
    [JsonPropertyName("dmarcUnknownSources")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? DmarcUnknownSources { get; set; }
    [JsonPropertyName("dmarcReportingDays")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? DmarcReportingDays { get; set; }
}

/// <summary>AdvisorRecommendationResponse schema type.</summary>
public class AdvisorRecommendationResponse
{
    [JsonPropertyName("code")]
    public string Code { get; set; } = default!;
    [JsonPropertyName("severity")]
    public string Severity { get; set; } = default!;
    [JsonPropertyName("title")]
    public string Title { get; set; } = default!;
    [JsonPropertyName("message")]
    public string Message { get; set; } = default!;
    [JsonPropertyName("data")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public AdvisorRecommendationDataResponse? Data { get; set; }
}

/// <summary>AdvisorReportResponse schema type.</summary>
public class AdvisorReportResponse
{
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("generatedAt")]
    public string GeneratedAt { get; set; } = default!;
    [JsonPropertyName("score")]
    public long Score { get; set; }
    [JsonPropertyName("recommendations")]
    public List<AdvisorRecommendationResponse> Recommendations { get; set; } = default!;
}

/// <summary>SuppressionResponse schema type.</summary>
public class SuppressionResponse
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("email")]
    public string Email { get; set; } = default!;
    [JsonPropertyName("reason")]
    public string Reason { get; set; } = default!;
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("contactId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ContactId { get; set; }
}

/// <summary>PageInfo schema type.</summary>
public class PageInfo
{
    [JsonPropertyName("page")]
    public long Page { get; set; }
    [JsonPropertyName("size")]
    public long Size { get; set; }
    [JsonPropertyName("total")]
    public long Total { get; set; }
    [JsonPropertyName("totalPages")]
    public long TotalPages { get; set; }
    [JsonPropertyName("hasNextPage")]
    public bool HasNextPage { get; set; }
    [JsonPropertyName("hasPreviousPage")]
    public bool HasPreviousPage { get; set; }
}

/// <summary>SuppressionPageResponse schema type.</summary>
public class SuppressionPageResponse
{
    [JsonPropertyName("data")]
    public List<SuppressionResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>AddSuppressionBody schema type.</summary>
public class AddSuppressionBody
{
    [JsonPropertyName("email")]
    public string Email { get; set; } = default!;
}

/// <summary>SuppressionImportRowSerializable schema type.</summary>
public class SuppressionImportRowSerializable
{
    [JsonPropertyName("email")]
    public string Email { get; set; } = default!;
    [JsonPropertyName("reason")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Reason { get; set; }
}

/// <summary>SuppressionImportBody schema type.</summary>
public class SuppressionImportBody
{
    [JsonPropertyName("suppressions")]
    public List<SuppressionImportRowSerializable> Suppressions { get; set; } = default!;
}

/// <summary>SuppressionImportResponse schema type.</summary>
public class SuppressionImportResponse
{
    [JsonPropertyName("imported")]
    public long Imported { get; set; }
    [JsonPropertyName("skipped")]
    public long Skipped { get; set; }
}

/// <summary>SegmentResponse schema type.</summary>
public class SegmentResponse
{
    [JsonPropertyName("object")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ObjectProperty { get; set; }
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("name")]
    public string Name { get; set; } = default!;
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("contactCount")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? ContactCount { get; set; }
    [JsonPropertyName("unsubscribedCount")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? UnsubscribedCount { get; set; }
}

/// <summary>SegmentPageResponse schema type.</summary>
public class SegmentPageResponse
{
    [JsonPropertyName("data")]
    public List<SegmentResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>SegmentContactResponse schema type.</summary>
public class SegmentContactResponse
{
    [JsonPropertyName("contactId")]
    public string ContactId { get; set; } = default!;
    [JsonPropertyName("email")]
    public string Email { get; set; } = default!;
    [JsonPropertyName("firstName")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? FirstName { get; set; }
    [JsonPropertyName("lastName")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? LastName { get; set; }
    [JsonPropertyName("segments")]
    public List<string> Segments { get; set; } = default!;
}

/// <summary>CursorInfo schema type.</summary>
public class CursorInfo
{
    [JsonPropertyName("nextCursor")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? NextCursor { get; set; }
    [JsonPropertyName("previousCursor")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? PreviousCursor { get; set; }
    [JsonPropertyName("hasNextPage")]
    public bool HasNextPage { get; set; }
    [JsonPropertyName("hasPreviousPage")]
    public bool HasPreviousPage { get; set; }
}

/// <summary>CursorPage schema type.</summary>
public class CursorPage
{
    [JsonPropertyName("data")]
    public List<SegmentContactResponse> Data { get; set; } = default!;
    [JsonPropertyName("cursor")]
    public CursorInfo Cursor { get; set; } = default!;
}

/// <summary>CreateSegmentBody schema type.</summary>
public class CreateSegmentBody
{
    [JsonPropertyName("name")]
    public string Name { get; set; } = default!;
}

/// <summary>TopicResponse schema type.</summary>
public class TopicResponse
{
    [JsonPropertyName("object")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ObjectProperty { get; set; }
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("name")]
    public string Name { get; set; } = default!;
    [JsonPropertyName("defaultSubscription")]
    public string DefaultSubscription { get; set; } = default!;
    [JsonPropertyName("description")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Description { get; set; }
    [JsonPropertyName("visibility")]
    public string Visibility { get; set; } = default!;
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("optInCount")]
    public long OptInCount { get; set; }
    [JsonPropertyName("optOutCount")]
    public long OptOutCount { get; set; }
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
}

/// <summary>TopicPageResponse schema type.</summary>
public class TopicPageResponse
{
    [JsonPropertyName("data")]
    public List<TopicResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>CreateTopicBody schema type.</summary>
public class CreateTopicBody
{
    [JsonPropertyName("name")]
    public string Name { get; set; } = default!;
    [JsonPropertyName("defaultSubscription")]
    public string DefaultSubscription { get; set; } = default!;
    [JsonPropertyName("description")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Description { get; set; }
    [JsonPropertyName("visibility")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Visibility { get; set; }
}

/// <summary>UpdateTopicBody schema type.</summary>
public class UpdateTopicBody
{
    [JsonPropertyName("name")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Name { get; set; }
    [JsonPropertyName("description")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Description { get; set; }
    [JsonPropertyName("visibility")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Visibility { get; set; }
}

/// <summary>ContactPropertyResponse schema type.</summary>
public class ContactPropertyResponse
{
    [JsonPropertyName("object")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ObjectProperty { get; set; }
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("key")]
    public string Key { get; set; } = default!;
    [JsonPropertyName("type")]
    public string Type { get; set; } = default!;
    [JsonPropertyName("fallbackValue")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? FallbackValue { get; set; }
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
}

/// <summary>ContactPropertyPageResponse schema type.</summary>
public class ContactPropertyPageResponse
{
    [JsonPropertyName("data")]
    public List<ContactPropertyResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>CreateContactPropertyBody schema type.</summary>
public class CreateContactPropertyBody
{
    [JsonPropertyName("key")]
    public string Key { get; set; } = default!;
    [JsonPropertyName("type")]
    public string Type { get; set; } = default!;
    [JsonPropertyName("fallbackValue")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? FallbackValue { get; set; }
}

/// <summary>UpdateContactPropertyBody schema type.</summary>
public class UpdateContactPropertyBody
{
    [JsonPropertyName("fallbackValue")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? FallbackValue { get; set; }
}

/// <summary>TopicSubscriptionResponse schema type.</summary>
public class TopicSubscriptionResponse
{
    [JsonPropertyName("topicId")]
    public string TopicId { get; set; } = default!;
    [JsonPropertyName("subscription")]
    public string Subscription { get; set; } = default!;
}

/// <summary>ContactResponse schema type.</summary>
public class ContactResponse
{
    [JsonPropertyName("object")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ObjectProperty { get; set; }
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("email")]
    public string Email { get; set; } = default!;
    [JsonPropertyName("phone")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Phone { get; set; }
    [JsonPropertyName("firstName")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? FirstName { get; set; }
    [JsonPropertyName("lastName")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? LastName { get; set; }
    [JsonPropertyName("unsubscribed")]
    public bool Unsubscribed { get; set; }
    [JsonPropertyName("properties")]
    public Dictionary<string, string> Properties { get; set; } = default!;
    [JsonPropertyName("profileImageUrl")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ProfileImageUrl { get; set; }
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("segments")]
    public List<string> Segments { get; set; } = default!;
    [JsonPropertyName("topics")]
    public List<TopicSubscriptionResponse> Topics { get; set; } = default!;
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
}

/// <summary>ContactPageResponse schema type.</summary>
public class ContactPageResponse
{
    [JsonPropertyName("data")]
    public List<ContactResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>SegmentRef schema type.</summary>
public class SegmentRef
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
}

/// <summary>TopicSubscriptionBody schema type.</summary>
public class TopicSubscriptionBody
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("subscription")]
    public string Subscription { get; set; } = default!;
}

/// <summary>CreateContactBody schema type.</summary>
public class CreateContactBody
{
    [JsonPropertyName("email")]
    public string Email { get; set; } = default!;
    [JsonPropertyName("phone")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Phone { get; set; }
    [JsonPropertyName("firstName")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? FirstName { get; set; }
    [JsonPropertyName("lastName")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? LastName { get; set; }
    [JsonPropertyName("unsubscribed")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? Unsubscribed { get; set; }
    [JsonPropertyName("properties")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, string>? Properties { get; set; }
    [JsonPropertyName("segments")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<SegmentRef>? Segments { get; set; }
    [JsonPropertyName("topics")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<TopicSubscriptionBody>? Topics { get; set; }
}

/// <summary>UpdateContactBody schema type.</summary>
public class UpdateContactBody
{
    [JsonPropertyName("firstName")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? FirstName { get; set; }
    [JsonPropertyName("lastName")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? LastName { get; set; }
    [JsonPropertyName("phone")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Phone { get; set; }
    [JsonPropertyName("unsubscribed")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? Unsubscribed { get; set; }
    [JsonPropertyName("properties")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, string>? Properties { get; set; }
}

/// <summary>SetImageUrlBody schema type.</summary>
public class SetImageUrlBody
{
    [JsonPropertyName("url")]
    public string Url { get; set; } = default!;
}

/// <summary>AddToSegmentBody schema type.</summary>
public class AddToSegmentBody
{
    [JsonPropertyName("segmentId")]
    public string SegmentId { get; set; } = default!;
}

/// <summary>UpdateTopicsBody schema type.</summary>
public class UpdateTopicsBody
{
    [JsonPropertyName("topics")]
    public List<TopicSubscriptionBody> Topics { get; set; } = default!;
}

/// <summary>ActivityMetadataResponse schema type.</summary>
public class ActivityMetadataResponse
{
    [JsonPropertyName("topicId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? TopicId { get; set; }
}

/// <summary>ActivityResponse schema type.</summary>
public class ActivityResponse
{
    [JsonPropertyName("object")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ObjectProperty { get; set; }
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("type")]
    public string Type { get; set; } = default!;
    [JsonPropertyName("referenceId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ReferenceId { get; set; }
    [JsonPropertyName("referenceName")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ReferenceName { get; set; }
    [JsonPropertyName("metadata")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public ActivityMetadataResponse? Metadata { get; set; }
    [JsonPropertyName("occurredAt")]
    public string OccurredAt { get; set; } = default!;
}

/// <summary>EngagementScoreResponse schema type.</summary>
public class EngagementScoreResponse
{
    [JsonPropertyName("object")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ObjectProperty { get; set; }
    [JsonPropertyName("score")]
    public long Score { get; set; }
    [JsonPropertyName("tier")]
    public string Tier { get; set; } = default!;
    [JsonPropertyName("scoredAt")]
    public string ScoredAt { get; set; } = default!;
}

/// <summary>EmailValidationStatusResponse schema type.</summary>
public class EmailValidationStatusResponse
{
    [JsonPropertyName("object")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ObjectProperty { get; set; }
    [JsonPropertyName("status")]
    public string Status { get; set; } = default!;
    [JsonPropertyName("reason")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Reason { get; set; }
    [JsonPropertyName("validatedAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ValidatedAt { get; set; }
}

/// <summary>RecordValidationBody schema type.</summary>
public class RecordValidationBody
{
    [JsonPropertyName("status")]
    public EmailValidationStatusInput Status { get; set; } = default!;
    [JsonPropertyName("reason")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Reason { get; set; }
}

/// <summary>WebhookFilterSerializable schema type.</summary>
public class WebhookFilterSerializable
{
    [JsonPropertyName("field")]
    public string Field { get; set; } = default!;
    [JsonPropertyName("operator")]
    public string OperatorProperty { get; set; } = default!;
    [JsonPropertyName("value")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Value { get; set; }
}

/// <summary>WebhookTransformationSerializable schema type.</summary>
public class WebhookTransformationSerializable
{
    [JsonPropertyName("type")]
    public string Type { get; set; } = default!;
    [JsonPropertyName("from")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? From { get; set; }
    [JsonPropertyName("to")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? To { get; set; }
    [JsonPropertyName("field")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Field { get; set; }
    [JsonPropertyName("value")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Value { get; set; }
    [JsonPropertyName("template")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Template { get; set; }
}

/// <summary>WebhookResponse schema type.</summary>
public class WebhookResponse
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("name")]
    public string Name { get; set; } = default!;
    [JsonPropertyName("url")]
    public string Url { get; set; } = default!;
    [JsonPropertyName("events")]
    public List<string> Events { get; set; } = default!;
    [JsonPropertyName("enabled")]
    public bool Enabled { get; set; }
    [JsonPropertyName("filters")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<WebhookFilterSerializable>? Filters { get; set; }
    [JsonPropertyName("transformations")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<WebhookTransformationSerializable>? Transformations { get; set; }
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
}

/// <summary>WebhookPageResponse schema type.</summary>
public class WebhookPageResponse
{
    [JsonPropertyName("data")]
    public List<WebhookResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>WebhookDeliveryResponse schema type.</summary>
public class WebhookDeliveryResponse
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("webhookEndpointId")]
    public string WebhookEndpointId { get; set; } = default!;
    [JsonPropertyName("eventType")]
    public string EventType { get; set; } = default!;
    [JsonPropertyName("status")]
    public string Status { get; set; } = default!;
    [JsonPropertyName("attemptCount")]
    public long AttemptCount { get; set; }
    [JsonPropertyName("lastStatusCode")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? LastStatusCode { get; set; }
    [JsonPropertyName("lastError")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? LastError { get; set; }
    [JsonPropertyName("responseBodySnippet")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ResponseBodySnippet { get; set; }
    [JsonPropertyName("nextAttemptAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? NextAttemptAt { get; set; }
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
}

/// <summary>WebhookDeliveryPageResponse schema type.</summary>
public class WebhookDeliveryPageResponse
{
    [JsonPropertyName("data")]
    public List<WebhookDeliveryResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>CreateWebhookBody schema type.</summary>
public class CreateWebhookBody
{
    [JsonPropertyName("url")]
    public string Url { get; set; } = default!;
    [JsonPropertyName("events")]
    public List<string> Events { get; set; } = default!;
    [JsonPropertyName("name")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Name { get; set; }
    [JsonPropertyName("secret")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Secret { get; set; }
    [JsonPropertyName("filters")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<WebhookFilterSerializable>? Filters { get; set; }
    [JsonPropertyName("transformations")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<WebhookTransformationSerializable>? Transformations { get; set; }
}

/// <summary>WebhookCreateResponse schema type.</summary>
public class WebhookCreateResponse
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("name")]
    public string Name { get; set; } = default!;
    [JsonPropertyName("url")]
    public string Url { get; set; } = default!;
    [JsonPropertyName("events")]
    public List<string> Events { get; set; } = default!;
    [JsonPropertyName("enabled")]
    public bool Enabled { get; set; }
    [JsonPropertyName("filters")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<WebhookFilterSerializable>? Filters { get; set; }
    [JsonPropertyName("transformations")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<WebhookTransformationSerializable>? Transformations { get; set; }
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
    [JsonPropertyName("secret")]
    public string Secret { get; set; } = default!;
}

/// <summary>UpdateWebhookBody schema type.</summary>
public class UpdateWebhookBody
{
    [JsonPropertyName("name")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Name { get; set; }
    [JsonPropertyName("url")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Url { get; set; }
    [JsonPropertyName("events")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<string>? Events { get; set; }
    [JsonPropertyName("secret")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Secret { get; set; }
    [JsonPropertyName("enabled")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? Enabled { get; set; }
    [JsonPropertyName("filters")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<WebhookFilterSerializable>? Filters { get; set; }
    [JsonPropertyName("transformations")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public List<WebhookTransformationSerializable>? Transformations { get; set; }
}

/// <summary>ApiKey schema type.</summary>
public class ApiKey
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("configId")]
    public string ConfigId { get; set; } = default!;
    [JsonPropertyName("name")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Name { get; set; }
    [JsonPropertyName("start")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Start { get; set; }
    [JsonPropertyName("prefix")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Prefix { get; set; }
    [JsonPropertyName("organizationId")]
    public string OrganizationId { get; set; } = default!;
    [JsonPropertyName("projectId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ProjectId { get; set; }
    [JsonPropertyName("enabled")]
    public bool Enabled { get; set; }
    [JsonPropertyName("rateLimitEnabled")]
    public bool RateLimitEnabled { get; set; }
    [JsonPropertyName("rateLimitTimeWindow")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? RateLimitTimeWindow { get; set; }
    [JsonPropertyName("rateLimitMax")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? RateLimitMax { get; set; }
    [JsonPropertyName("requestCount")]
    public long RequestCount { get; set; }
    [JsonPropertyName("remaining")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? Remaining { get; set; }
    [JsonPropertyName("lastRequest")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? LastRequest { get; set; }
    [JsonPropertyName("expiresAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ExpiresAt { get; set; }
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
    [JsonPropertyName("metadata")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, string>? Metadata { get; set; }
    [JsonPropertyName("permissions")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, List<string>>? Permissions { get; set; }
}

/// <summary>ApiKeyUsageRecord schema type.</summary>
public class ApiKeyUsageRecord
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("keyId")]
    public string KeyId { get; set; } = default!;
    [JsonPropertyName("orgId")]
    public string OrgId { get; set; } = default!;
    [JsonPropertyName("method")]
    public string Method { get; set; } = default!;
    [JsonPropertyName("route")]
    public string Route { get; set; } = default!;
    [JsonPropertyName("statusCode")]
    public long StatusCode { get; set; }
    [JsonPropertyName("durationMs")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? DurationMs { get; set; }
    [JsonPropertyName("ip")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Ip { get; set; }
    [JsonPropertyName("ts")]
    public string Ts { get; set; } = default!;
}

/// <summary>UsagePage schema type.</summary>
public class UsagePage
{
    [JsonPropertyName("size")]
    public long Size { get; set; }
    [JsonPropertyName("totalPages")]
    public long TotalPages { get; set; }
    [JsonPropertyName("hasMore")]
    public bool HasMore { get; set; }
}

/// <summary>ApiKeyUsageResponse schema type.</summary>
public class ApiKeyUsageResponse
{
    [JsonPropertyName("data")]
    public List<ApiKeyUsageRecord> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public UsagePage Page { get; set; } = default!;
}

/// <summary>ProjectLimitsModel schema type.</summary>
public class ProjectLimitsModel
{
    [JsonPropertyName("dailySends")]
    public long DailySends { get; set; }
    [JsonPropertyName("perSecondSends")]
    public long PerSecondSends { get; set; }
    [JsonPropertyName("maxRecipientsPerMessage")]
    public long MaxRecipientsPerMessage { get; set; }
    [JsonPropertyName("maxDomains")]
    public long MaxDomains { get; set; }
    [JsonPropertyName("maxApiKeys")]
    public long MaxApiKeys { get; set; }
    [JsonPropertyName("maxWebhooks")]
    public long MaxWebhooks { get; set; }
}

/// <summary>ProjectTrackingSettingsModel schema type.</summary>
public class ProjectTrackingSettingsModel
{
    [JsonPropertyName("openTracking")]
    public bool OpenTracking { get; set; }
    [JsonPropertyName("clickTracking")]
    public bool ClickTracking { get; set; }
    [JsonPropertyName("unsubscribeTracking")]
    public bool UnsubscribeTracking { get; set; }
    [JsonPropertyName("readEngagement")]
    public bool ReadEngagement { get; set; }
    [JsonPropertyName("scrollDepth")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? ScrollDepth { get; set; }
}

/// <summary>ProjectResponse schema type.</summary>
public class ProjectResponse
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("name")]
    public string Name { get; set; } = default!;
    [JsonPropertyName("slug")]
    public string Slug { get; set; } = default!;
    [JsonPropertyName("status")]
    public string Status { get; set; } = default!;
    [JsonPropertyName("suspensionReason")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? SuspensionReason { get; set; }
    [JsonPropertyName("region")]
    public string Region { get; set; } = default!;
    [JsonPropertyName("limits")]
    public ProjectLimitsModel Limits { get; set; } = default!;
    [JsonPropertyName("trackingSettings")]
    public ProjectTrackingSettingsModel TrackingSettings { get; set; } = default!;
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
}

/// <summary>ProjectPageResponse schema type.</summary>
public class ProjectPageResponse
{
    [JsonPropertyName("data")]
    public List<ProjectResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>UpdateProjectRequest schema type.</summary>
public class UpdateProjectRequest
{
    [JsonPropertyName("name")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Name { get; set; }
    [JsonPropertyName("slug")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Slug { get; set; }
    [JsonPropertyName("limits")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public ProjectLimitsModel? Limits { get; set; }
    [JsonPropertyName("trackingSettings")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public ProjectTrackingSettingsModel? TrackingSettings { get; set; }
}

/// <summary>EmailPageResponse schema type.</summary>
public class EmailPageResponse
{
    [JsonPropertyName("data")]
    public List<EmailDetailResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>EmailTimelineItem schema type.</summary>
public class EmailTimelineItem
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("type")]
    public string Type { get; set; } = default!;
    [JsonPropertyName("providerEventId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ProviderEventId { get; set; }
    [JsonPropertyName("payload")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public Dictionary<string, string>? Payload { get; set; }
    [JsonPropertyName("occurredAt")]
    public string OccurredAt { get; set; } = default!;
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
}

/// <summary>EmailTimelineResponse schema type.</summary>
public class EmailTimelineResponse
{
    [JsonPropertyName("items")]
    public List<EmailTimelineItem> Items { get; set; } = default!;
}

/// <summary>DomainListItemResponse schema type.</summary>
public class DomainListItemResponse
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("domain")]
    public string Domain { get; set; } = default!;
    [JsonPropertyName("region")]
    public string Region { get; set; } = default!;
    [JsonPropertyName("status")]
    public string Status { get; set; } = default!;
    [JsonPropertyName("dkimStatus")]
    public string DkimStatus { get; set; } = default!;
    [JsonPropertyName("bimiStatus")]
    public string BimiStatus { get; set; } = default!;
    [JsonPropertyName("trackingStatus")]
    public string TrackingStatus { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
}

/// <summary>DomainListPageResponse schema type.</summary>
public class DomainListPageResponse
{
    [JsonPropertyName("data")]
    public List<DomainListItemResponse> Data { get; set; } = default!;
    [JsonPropertyName("page")]
    public PageInfo Page { get; set; } = default!;
}

/// <summary>DkimRecordResponse schema type.</summary>
public class DkimRecordResponse
{
    [JsonPropertyName("name")]
    public string Name { get; set; } = default!;
    [JsonPropertyName("type")]
    public string Type { get; set; } = default!;
    [JsonPropertyName("value")]
    public string Value { get; set; } = default!;
    [JsonPropertyName("status")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Status { get; set; }
}

/// <summary>DnsRecordResponse schema type.</summary>
public class DnsRecordResponse
{
    [JsonPropertyName("name")]
    public string Name { get; set; } = default!;
    [JsonPropertyName("type")]
    public string Type { get; set; } = default!;
    [JsonPropertyName("value")]
    public string Value { get; set; } = default!;
    [JsonPropertyName("priority")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public long? Priority { get; set; }
    [JsonPropertyName("optional")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public bool? Optional { get; set; }
    [JsonPropertyName("status")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Status { get; set; }
}

/// <summary>VerificationRecordsResponse schema type.</summary>
public class VerificationRecordsResponse
{
    [JsonPropertyName("dkim")]
    public List<DkimRecordResponse> Dkim { get; set; } = default!;
    [JsonPropertyName("mailFromMx")]
    public DnsRecordResponse MailFromMx { get; set; } = default!;
    [JsonPropertyName("mailFromSpf")]
    public DnsRecordResponse MailFromSpf { get; set; } = default!;
    [JsonPropertyName("dmarcRecommended")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public DnsRecordResponse? DmarcRecommended { get; set; }
    [JsonPropertyName("bimi")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public DnsRecordResponse? Bimi { get; set; }
    [JsonPropertyName("trackingCname")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public DnsRecordResponse? TrackingCname { get; set; }
}

/// <summary>DomainResponse schema type.</summary>
public class DomainResponse
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = default!;
    [JsonPropertyName("projectId")]
    public string ProjectId { get; set; } = default!;
    [JsonPropertyName("domain")]
    public string Domain { get; set; } = default!;
    [JsonPropertyName("region")]
    public string Region { get; set; } = default!;
    [JsonPropertyName("status")]
    public string Status { get; set; } = default!;
    [JsonPropertyName("dkimStatus")]
    public string DkimStatus { get; set; } = default!;
    [JsonPropertyName("spfStatus")]
    public string SpfStatus { get; set; } = default!;
    [JsonPropertyName("dmarcStatus")]
    public string DmarcStatus { get; set; } = default!;
    [JsonPropertyName("mailFromStatus")]
    public string MailFromStatus { get; set; } = default!;
    [JsonPropertyName("mailFromDomain")]
    public string MailFromDomain { get; set; } = default!;
    [JsonPropertyName("verificationRecords")]
    public VerificationRecordsResponse VerificationRecords { get; set; } = default!;
    [JsonPropertyName("bimiStatus")]
    public string BimiStatus { get; set; } = default!;
    [JsonPropertyName("bimiLogoUrl")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? BimiLogoUrl { get; set; }
    [JsonPropertyName("createdAt")]
    public string CreatedAt { get; set; } = default!;
    [JsonPropertyName("updatedAt")]
    public string UpdatedAt { get; set; } = default!;
    [JsonPropertyName("verifiedAt")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? VerifiedAt { get; set; }
}

/// <summary>RegisterDomainRequest schema type.</summary>
public class RegisterDomainRequest
{
    [JsonPropertyName("domain")]
    public string Domain { get; set; } = default!;
    [JsonPropertyName("region")]
    public string Region { get; set; } = default!;
}

/// <summary>UpdateBimiRequest schema type.</summary>
public class UpdateBimiRequest
{
    [JsonPropertyName("logoUrl")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? LogoUrl { get; set; }
}

/// <summary>EmailValidationStatusInput enumeration.</summary>
[JsonConverter(typeof(Transport.EmailValidationStatusInputJsonConverter))]
public enum EmailValidationStatusInput
{
    [EnumMember(Value = "valid")] Valid,
    [EnumMember(Value = "risky")] Risky,
    [EnumMember(Value = "invalid")] Invalid,
    [EnumMember(Value = "unknown")] Unknown,
}

/// <summary>GetTopicPerformanceQuery schema type.</summary>
public class GetTopicPerformanceQuery
{
    /// <summary>Time window.</summary>
    [JsonPropertyName("window")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Window { get; set; }
    /// <summary>Required for session auth; ignored for API key auth.</summary>
    [JsonPropertyName("projectId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ProjectId { get; set; }
}

/// <summary>GetProjectMetricsSummaryQuery schema type.</summary>
public class GetProjectMetricsSummaryQuery
{
    /// <summary>Metrics time window.</summary>
    [JsonPropertyName("window")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Window { get; set; }
    /// <summary>Required for session auth; ignored for API key auth.</summary>
    [JsonPropertyName("projectId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ProjectId { get; set; }
}

/// <summary>GetProjectMetricsTimelineQuery schema type.</summary>
public class GetProjectMetricsTimelineQuery
{
    /// <summary>Metrics time window.</summary>
    [JsonPropertyName("window")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Window { get; set; }
    /// <summary>`hour` or `day`.</summary>
    [JsonPropertyName("granularity")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Granularity { get; set; }
    /// <summary>`compact` or `detailed`.</summary>
    [JsonPropertyName("format")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? Format { get; set; }
    /// <summary>Required for session auth; ignored for API key auth.</summary>
    [JsonPropertyName("projectId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ProjectId { get; set; }
}

/// <summary>GetMetricsAdvisorQuery schema type.</summary>
public class GetMetricsAdvisorQuery
{
    /// <summary>Required for session auth; ignored for API key auth.</summary>
    [JsonPropertyName("projectId")]
    [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
    public string? ProjectId { get; set; }
}

// ListContactSegmentsResponse is emitted inline as List<string>.

// GetContactTopicsResponse is emitted inline as List<TopicSubscriptionResponse>.

// GetContactActivityResponse is emitted inline as List<ActivityResponse>.

/// <summary>ListApiKeysResponse schema type.</summary>
public class ListApiKeysResponse
{
}

