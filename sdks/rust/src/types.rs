use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AttachmentRequest {
    #[serde(rename = "filename")]
    pub filename: String,
    #[serde(rename = "content")]
    pub content: String,
    #[serde(rename = "contentType")]
    pub content_type: String,
    #[serde(rename = "disposition", skip_serializing_if = "Option::is_none")]
    pub disposition: Option<String>,
    #[serde(rename = "contentId", skip_serializing_if = "Option::is_none")]
    pub content_id: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DeliveryWindowRequest {
    #[serde(rename = "start")]
    pub start: String,
    #[serde(rename = "end")]
    pub end: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TrackingSettingsRequest {
    #[serde(rename = "openTracking", skip_serializing_if = "Option::is_none")]
    pub open_tracking: Option<bool>,
    #[serde(rename = "clickTracking", skip_serializing_if = "Option::is_none")]
    pub click_tracking: Option<bool>,
    #[serde(rename = "unsubscribeTracking", skip_serializing_if = "Option::is_none")]
    pub unsubscribe_tracking: Option<bool>,
    #[serde(rename = "readEngagement", skip_serializing_if = "Option::is_none")]
    pub read_engagement: Option<bool>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SendEmailRequest {
    #[serde(rename = "from")]
    pub from: String,
    #[serde(rename = "to")]
    pub to: Vec<String>,
    #[serde(rename = "cc", skip_serializing_if = "Option::is_none")]
    pub cc: Option<Vec<String>>,
    #[serde(rename = "bcc", skip_serializing_if = "Option::is_none")]
    pub bcc: Option<Vec<String>>,
    #[serde(rename = "replyTo", skip_serializing_if = "Option::is_none")]
    pub reply_to: Option<String>,
    #[serde(rename = "subject", skip_serializing_if = "Option::is_none")]
    pub subject: Option<String>,
    #[serde(rename = "html", skip_serializing_if = "Option::is_none")]
    pub html: Option<String>,
    #[serde(rename = "text", skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    #[serde(rename = "tags", skip_serializing_if = "Option::is_none")]
    pub tags: Option<std::collections::HashMap<String, String>>,
    #[serde(rename = "metadata", skip_serializing_if = "Option::is_none")]
    pub metadata: Option<std::collections::HashMap<String, String>>,
    #[serde(rename = "idempotencyKey", skip_serializing_if = "Option::is_none")]
    pub idempotency_key: Option<String>,
    #[serde(rename = "testMode", skip_serializing_if = "Option::is_none")]
    pub test_mode: Option<bool>,
    #[serde(rename = "attachments", skip_serializing_if = "Option::is_none")]
    pub attachments: Option<Vec<AttachmentRequest>>,
    #[serde(rename = "scheduledAt", skip_serializing_if = "Option::is_none")]
    pub scheduled_at: Option<String>,
    #[serde(rename = "deliveryWindow", skip_serializing_if = "Option::is_none")]
    pub delivery_window: Option<DeliveryWindowRequest>,
    #[serde(rename = "sendTimeCategory", skip_serializing_if = "Option::is_none")]
    pub send_time_category: Option<String>,
    #[serde(rename = "trackingSettings", skip_serializing_if = "Option::is_none")]
    pub tracking_settings: Option<TrackingSettingsRequest>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BatchSendItemResponse {
    #[serde(rename = "index")]
    pub index: i64,
    #[serde(rename = "id", skip_serializing_if = "Option::is_none")]
    pub id: Option<String>,
    #[serde(rename = "messageId", skip_serializing_if = "Option::is_none")]
    pub message_id: Option<String>,
    #[serde(rename = "status", skip_serializing_if = "Option::is_none")]
    pub status: Option<String>,
    #[serde(rename = "createdAt", skip_serializing_if = "Option::is_none")]
    pub created_at: Option<String>,
    #[serde(rename = "scheduledAt", skip_serializing_if = "Option::is_none")]
    pub scheduled_at: Option<String>,
    #[serde(rename = "error", skip_serializing_if = "Option::is_none")]
    pub error: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SendEmailResponse {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "messageId", skip_serializing_if = "Option::is_none")]
    pub message_id: Option<String>,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "scheduledAt", skip_serializing_if = "Option::is_none")]
    pub scheduled_at: Option<String>,
    #[serde(rename = "audienceId", skip_serializing_if = "Option::is_none")]
    pub audience_id: Option<String>,
    #[serde(rename = "messages", skip_serializing_if = "Option::is_none")]
    pub messages: Option<Vec<BatchSendItemResponse>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EmailDetailResponse {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "messageId", skip_serializing_if = "Option::is_none")]
    pub message_id: Option<String>,
    #[serde(rename = "from")]
    pub from: String,
    #[serde(rename = "to")]
    pub to: Vec<String>,
    #[serde(rename = "cc", skip_serializing_if = "Option::is_none")]
    pub cc: Option<Vec<String>>,
    #[serde(rename = "bcc", skip_serializing_if = "Option::is_none")]
    pub bcc: Option<Vec<String>>,
    #[serde(rename = "replyTo", skip_serializing_if = "Option::is_none")]
    pub reply_to: Option<String>,
    #[serde(rename = "subject")]
    pub subject: String,
    #[serde(rename = "html", skip_serializing_if = "Option::is_none")]
    pub html: Option<String>,
    #[serde(rename = "text", skip_serializing_if = "Option::is_none")]
    pub text: Option<String>,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "error", skip_serializing_if = "Option::is_none")]
    pub error: Option<String>,
    #[serde(rename = "tags", skip_serializing_if = "Option::is_none")]
    pub tags: Option<std::collections::HashMap<String, String>>,
    #[serde(rename = "metadata", skip_serializing_if = "Option::is_none")]
    pub metadata: Option<std::collections::HashMap<String, String>>,
    #[serde(rename = "testMode")]
    pub test_mode: bool,
    #[serde(rename = "topicId", skip_serializing_if = "Option::is_none")]
    pub topic_id: Option<String>,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "sentAt", skip_serializing_if = "Option::is_none")]
    pub sent_at: Option<String>,
    #[serde(rename = "updatedAt", skip_serializing_if = "Option::is_none")]
    pub updated_at: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BatchSendRequest {
    #[serde(rename = "items")]
    pub items: Vec<SendEmailRequest>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BatchSendResponse {
    #[serde(rename = "results")]
    pub results: Vec<BatchSendItemResponse>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CancelResponse {
    #[serde(rename = "cancelled", skip_serializing_if = "Option::is_none")]
    pub cancelled: Option<bool>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BulkCancelResponse {
    #[serde(rename = "cancelled")]
    pub cancelled: i64,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StreamTokenResponse {
    #[serde(rename = "token")]
    pub token: String,
    #[serde(rename = "expiresAt")]
    pub expires_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct StreamEventResponse {
    #[serde(rename = "type")]
    pub r#type: String,
    #[serde(rename = "emailId")]
    pub email_id: String,
    #[serde(rename = "occurredAt")]
    pub occurred_at: String,
    #[serde(rename = "data", skip_serializing_if = "Option::is_none")]
    pub data: Option<std::collections::HashMap<String, String>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ValidateLinksRequest {
    #[serde(rename = "html", skip_serializing_if = "Option::is_none")]
    pub html: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LinkResultItem {
    #[serde(rename = "url")]
    pub url: String,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "statusCode", skip_serializing_if = "Option::is_none")]
    pub status_code: Option<i64>,
    #[serde(rename = "error", skip_serializing_if = "Option::is_none")]
    pub error: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ValidateLinksResponse {
    #[serde(rename = "links")]
    pub links: Vec<LinkResultItem>,
    #[serde(rename = "totalLinks")]
    pub total_links: i64,
    #[serde(rename = "brokenLinks")]
    pub broken_links: i64,
    #[serde(rename = "errorLinks")]
    pub error_links: i64,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MetricsWindowResponse {
    #[serde(rename = "from")]
    pub from: String,
    #[serde(rename = "to")]
    pub to: String,
    #[serde(rename = "label")]
    pub label: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TopicPerformanceResponse {
    #[serde(rename = "topicId")]
    pub topic_id: String,
    #[serde(rename = "topicName")]
    pub topic_name: String,
    #[serde(rename = "window")]
    pub window: MetricsWindowResponse,
    #[serde(rename = "totalEmails")]
    pub total_emails: i64,
    #[serde(rename = "delivered")]
    pub delivered: i64,
    #[serde(rename = "deliveryRate")]
    pub delivery_rate: f64,
    #[serde(rename = "opened")]
    pub opened: i64,
    #[serde(rename = "openRate")]
    pub open_rate: f64,
    #[serde(rename = "clicked")]
    pub clicked: i64,
    #[serde(rename = "clickRate")]
    pub click_rate: f64,
    #[serde(rename = "bounced")]
    pub bounced: i64,
    #[serde(rename = "bounceRate")]
    pub bounce_rate: f64,
    #[serde(rename = "complained")]
    pub complained: i64,
    #[serde(rename = "complaintRate")]
    pub complaint_rate: f64,
    #[serde(rename = "unsubscribed")]
    pub unsubscribed: i64,
    #[serde(rename = "unsubscribeRate")]
    pub unsubscribe_rate: f64,
    #[serde(rename = "readEngaged")]
    pub read_engaged: i64,
    #[serde(rename = "readEngagementRate")]
    pub read_engagement_rate: f64,
    #[serde(rename = "avgReadTimeSeconds", skip_serializing_if = "Option::is_none")]
    pub avg_read_time_seconds: Option<f64>,
    #[serde(rename = "optInCount")]
    pub opt_in_count: i64,
    #[serde(rename = "optOutCount")]
    pub opt_out_count: i64,
    #[serde(rename = "computedAt")]
    pub computed_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EmailPerformanceResponse {
    #[serde(rename = "emailId")]
    pub email_id: String,
    #[serde(rename = "subject")]
    pub subject: String,
    #[serde(rename = "fromAddress")]
    pub from_address: String,
    #[serde(rename = "topicId", skip_serializing_if = "Option::is_none")]
    pub topic_id: Option<String>,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "delivered")]
    pub delivered: bool,
    #[serde(rename = "opened")]
    pub opened: bool,
    #[serde(rename = "clicked")]
    pub clicked: bool,
    #[serde(rename = "totalClicks")]
    pub total_clicks: i64,
    #[serde(rename = "bounced")]
    pub bounced: bool,
    #[serde(rename = "complained")]
    pub complained: bool,
    #[serde(rename = "unsubscribed")]
    pub unsubscribed: bool,
    #[serde(rename = "readEngaged")]
    pub read_engaged: bool,
    #[serde(rename = "readTimeSeconds", skip_serializing_if = "Option::is_none")]
    pub read_time_seconds: Option<f64>,
    #[serde(rename = "readCategory", skip_serializing_if = "Option::is_none")]
    pub read_category: Option<String>,
    #[serde(rename = "sentAt", skip_serializing_if = "Option::is_none")]
    pub sent_at: Option<String>,
    #[serde(rename = "lastEventAt", skip_serializing_if = "Option::is_none")]
    pub last_event_at: Option<String>,
    #[serde(rename = "computedAt")]
    pub computed_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EmailReadScrollAnalyticsResponse {
    #[serde(rename = "emailId")]
    pub email_id: String,
    #[serde(rename = "subject")]
    pub subject: String,
    #[serde(rename = "computedAt")]
    pub computed_at: String,
    #[serde(rename = "readEngaged")]
    pub read_engaged: bool,
    #[serde(rename = "readTimeSeconds", skip_serializing_if = "Option::is_none")]
    pub read_time_seconds: Option<f64>,
    #[serde(rename = "readCategory", skip_serializing_if = "Option::is_none")]
    pub read_category: Option<String>,
    #[serde(rename = "mailClient", skip_serializing_if = "Option::is_none")]
    pub mail_client: Option<String>,
    #[serde(rename = "deviceType", skip_serializing_if = "Option::is_none")]
    pub device_type: Option<String>,
    #[serde(rename = "os", skip_serializing_if = "Option::is_none")]
    pub os: Option<String>,
    #[serde(rename = "readEngagedAt", skip_serializing_if = "Option::is_none")]
    pub read_engaged_at: Option<String>,
    #[serde(rename = "shortEmail")]
    pub short_email: bool,
    #[serde(rename = "depth25Count")]
    pub depth25_count: i64,
    #[serde(rename = "depth50Count")]
    pub depth50_count: i64,
    #[serde(rename = "depth75Count")]
    pub depth75_count: i64,
    #[serde(rename = "depth100Count")]
    pub depth100_count: i64,
    #[serde(rename = "maxDepthPct", skip_serializing_if = "Option::is_none")]
    pub max_depth_pct: Option<i64>,
    #[serde(rename = "depth25Rate", skip_serializing_if = "Option::is_none")]
    pub depth25_rate: Option<f64>,
    #[serde(rename = "depth50Rate", skip_serializing_if = "Option::is_none")]
    pub depth50_rate: Option<f64>,
    #[serde(rename = "depth75Rate", skip_serializing_if = "Option::is_none")]
    pub depth75_rate: Option<f64>,
    #[serde(rename = "depth100Rate", skip_serializing_if = "Option::is_none")]
    pub depth100_rate: Option<f64>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProjectMetricsSummaryResponse {
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "window")]
    pub window: MetricsWindowResponse,
    #[serde(rename = "sent")]
    pub sent: i64,
    #[serde(rename = "delivered")]
    pub delivered: i64,
    #[serde(rename = "opened")]
    pub opened: i64,
    #[serde(rename = "clicked")]
    pub clicked: i64,
    #[serde(rename = "bounced")]
    pub bounced: i64,
    #[serde(rename = "complained")]
    pub complained: i64,
    #[serde(rename = "failed")]
    pub failed: i64,
    #[serde(rename = "unsubscribed")]
    pub unsubscribed: i64,
    #[serde(rename = "readEngaged")]
    pub read_engaged: i64,
    #[serde(rename = "deliveryRate")]
    pub delivery_rate: f64,
    #[serde(rename = "openRate")]
    pub open_rate: f64,
    #[serde(rename = "clickRate")]
    pub click_rate: f64,
    #[serde(rename = "bounceRate")]
    pub bounce_rate: f64,
    #[serde(rename = "complaintRate")]
    pub complaint_rate: f64,
    #[serde(rename = "readEngagementRate")]
    pub read_engagement_rate: f64,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProjectTimelineBucketResponse {
    #[serde(rename = "bucket")]
    pub bucket: String,
    #[serde(rename = "type")]
    pub r#type: String,
    #[serde(rename = "count")]
    pub count: i64,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProjectMetricsTimelineResponse {
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "window")]
    pub window: MetricsWindowResponse,
    #[serde(rename = "granularity")]
    pub granularity: String,
    #[serde(rename = "format")]
    pub format: String,
    #[serde(rename = "buckets")]
    pub buckets: Vec<ProjectTimelineBucketResponse>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AdvisorRecommendationDataResponse {
    #[serde(rename = "bounceRate", skip_serializing_if = "Option::is_none")]
    pub bounce_rate: Option<f64>,
    #[serde(rename = "bounced", skip_serializing_if = "Option::is_none")]
    pub bounced: Option<i64>,
    #[serde(rename = "accepted", skip_serializing_if = "Option::is_none")]
    pub accepted: Option<i64>,
    #[serde(rename = "complaintRate", skip_serializing_if = "Option::is_none")]
    pub complaint_rate: Option<f64>,
    #[serde(rename = "accepted24h", skip_serializing_if = "Option::is_none")]
    pub accepted24h: Option<i64>,
    #[serde(rename = "avgDailyAccepted7d", skip_serializing_if = "Option::is_none")]
    pub avg_daily_accepted7d: Option<i64>,
    #[serde(rename = "daysSinceLastSend", skip_serializing_if = "Option::is_none")]
    pub days_since_last_send: Option<i64>,
    #[serde(rename = "reportedOpenRate", skip_serializing_if = "Option::is_none")]
    pub reported_open_rate: Option<f64>,
    #[serde(rename = "adjustedOpenRate", skip_serializing_if = "Option::is_none")]
    pub adjusted_open_rate: Option<f64>,
    #[serde(rename = "proxyRate", skip_serializing_if = "Option::is_none")]
    pub proxy_rate: Option<f64>,
    #[serde(rename = "proxyOpens", skip_serializing_if = "Option::is_none")]
    pub proxy_opens: Option<i64>,
    #[serde(rename = "totalOpens", skip_serializing_if = "Option::is_none")]
    pub total_opens: Option<i64>,
    #[serde(rename = "humanOpenRate", skip_serializing_if = "Option::is_none")]
    pub human_open_rate: Option<f64>,
    #[serde(rename = "delivered", skip_serializing_if = "Option::is_none")]
    pub delivered: Option<i64>,
    #[serde(rename = "unsubRate", skip_serializing_if = "Option::is_none")]
    pub unsub_rate: Option<f64>,
    #[serde(rename = "unsubscribed", skip_serializing_if = "Option::is_none")]
    pub unsubscribed: Option<i64>,
    #[serde(rename = "dmarcAlignmentFailureRate7d", skip_serializing_if = "Option::is_none")]
    pub dmarc_alignment_failure_rate7d: Option<f64>,
    #[serde(rename = "dmarcDomain", skip_serializing_if = "Option::is_none")]
    pub dmarc_domain: Option<String>,
    #[serde(rename = "dmarcCurrentPolicy", skip_serializing_if = "Option::is_none")]
    pub dmarc_current_policy: Option<String>,
    #[serde(rename = "dmarcRecommendedPolicy", skip_serializing_if = "Option::is_none")]
    pub dmarc_recommended_policy: Option<String>,
    #[serde(rename = "dmarcObservedMessages", skip_serializing_if = "Option::is_none")]
    pub dmarc_observed_messages: Option<i64>,
    #[serde(rename = "dmarcAlignedMessages", skip_serializing_if = "Option::is_none")]
    pub dmarc_aligned_messages: Option<i64>,
    #[serde(rename = "dmarcAccountedRate", skip_serializing_if = "Option::is_none")]
    pub dmarc_accounted_rate: Option<f64>,
    #[serde(rename = "dmarcUnknownMessages", skip_serializing_if = "Option::is_none")]
    pub dmarc_unknown_messages: Option<i64>,
    #[serde(rename = "dmarcUnknownSources", skip_serializing_if = "Option::is_none")]
    pub dmarc_unknown_sources: Option<i64>,
    #[serde(rename = "dmarcReportingDays", skip_serializing_if = "Option::is_none")]
    pub dmarc_reporting_days: Option<i64>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AdvisorRecommendationResponse {
    #[serde(rename = "code")]
    pub code: String,
    #[serde(rename = "severity")]
    pub severity: String,
    #[serde(rename = "title")]
    pub title: String,
    #[serde(rename = "message")]
    pub message: String,
    #[serde(rename = "data", skip_serializing_if = "Option::is_none")]
    pub data: Option<AdvisorRecommendationDataResponse>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AdvisorReportResponse {
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "generatedAt")]
    pub generated_at: String,
    #[serde(rename = "score")]
    pub score: i64,
    #[serde(rename = "recommendations")]
    pub recommendations: Vec<AdvisorRecommendationResponse>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SuppressionResponse {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "email")]
    pub email: String,
    #[serde(rename = "reason")]
    pub reason: String,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "contactId", skip_serializing_if = "Option::is_none")]
    pub contact_id: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PageInfo {
    #[serde(rename = "page")]
    pub page: i64,
    #[serde(rename = "size")]
    pub size: i64,
    #[serde(rename = "total")]
    pub total: i64,
    #[serde(rename = "totalPages")]
    pub total_pages: i64,
    #[serde(rename = "hasNextPage")]
    pub has_next_page: bool,
    #[serde(rename = "hasPreviousPage")]
    pub has_previous_page: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SuppressionPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<SuppressionResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AddSuppressionBody {
    #[serde(rename = "email")]
    pub email: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SuppressionImportRowSerializable {
    #[serde(rename = "email")]
    pub email: String,
    #[serde(rename = "reason", skip_serializing_if = "Option::is_none")]
    pub reason: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SuppressionImportBody {
    #[serde(rename = "suppressions")]
    pub suppressions: Vec<SuppressionImportRowSerializable>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SuppressionImportResponse {
    #[serde(rename = "imported")]
    pub imported: i64,
    #[serde(rename = "skipped")]
    pub skipped: i64,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SegmentResponse {
    #[serde(rename = "object", skip_serializing_if = "Option::is_none")]
    pub object: Option<String>,
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "contactCount", skip_serializing_if = "Option::is_none")]
    pub contact_count: Option<i64>,
    #[serde(rename = "unsubscribedCount", skip_serializing_if = "Option::is_none")]
    pub unsubscribed_count: Option<i64>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SegmentPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<SegmentResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SegmentContactResponse {
    #[serde(rename = "contactId")]
    pub contact_id: String,
    #[serde(rename = "email")]
    pub email: String,
    #[serde(rename = "firstName", skip_serializing_if = "Option::is_none")]
    pub first_name: Option<String>,
    #[serde(rename = "lastName", skip_serializing_if = "Option::is_none")]
    pub last_name: Option<String>,
    #[serde(rename = "segments")]
    pub segments: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CursorInfo {
    #[serde(rename = "nextCursor", skip_serializing_if = "Option::is_none")]
    pub next_cursor: Option<String>,
    #[serde(rename = "previousCursor", skip_serializing_if = "Option::is_none")]
    pub previous_cursor: Option<String>,
    #[serde(rename = "hasNextPage")]
    pub has_next_page: bool,
    #[serde(rename = "hasPreviousPage")]
    pub has_previous_page: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CursorPage {
    #[serde(rename = "data")]
    pub data: Vec<SegmentContactResponse>,
    #[serde(rename = "cursor")]
    pub cursor: CursorInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CreateSegmentBody {
    #[serde(rename = "name")]
    pub name: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TopicResponse {
    #[serde(rename = "object", skip_serializing_if = "Option::is_none")]
    pub object: Option<String>,
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "defaultSubscription")]
    pub default_subscription: String,
    #[serde(rename = "description", skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
    #[serde(rename = "visibility")]
    pub visibility: String,
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "optInCount")]
    pub opt_in_count: i64,
    #[serde(rename = "optOutCount")]
    pub opt_out_count: i64,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TopicPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<TopicResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CreateTopicBody {
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "defaultSubscription")]
    pub default_subscription: String,
    #[serde(rename = "description", skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
    #[serde(rename = "visibility", skip_serializing_if = "Option::is_none")]
    pub visibility: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UpdateTopicBody {
    #[serde(rename = "name", skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
    #[serde(rename = "description", skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
    #[serde(rename = "visibility", skip_serializing_if = "Option::is_none")]
    pub visibility: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ContactPropertyResponse {
    #[serde(rename = "object", skip_serializing_if = "Option::is_none")]
    pub object: Option<String>,
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "key")]
    pub key: String,
    #[serde(rename = "type")]
    pub r#type: String,
    #[serde(rename = "fallbackValue", skip_serializing_if = "Option::is_none")]
    pub fallback_value: Option<String>,
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ContactPropertyPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<ContactPropertyResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CreateContactPropertyBody {
    #[serde(rename = "key")]
    pub key: String,
    #[serde(rename = "type")]
    pub r#type: String,
    #[serde(rename = "fallbackValue", skip_serializing_if = "Option::is_none")]
    pub fallback_value: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UpdateContactPropertyBody {
    #[serde(rename = "fallbackValue", skip_serializing_if = "Option::is_none")]
    pub fallback_value: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TopicSubscriptionResponse {
    #[serde(rename = "topicId")]
    pub topic_id: String,
    #[serde(rename = "subscription")]
    pub subscription: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ContactResponse {
    #[serde(rename = "object", skip_serializing_if = "Option::is_none")]
    pub object: Option<String>,
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "email")]
    pub email: String,
    #[serde(rename = "phone", skip_serializing_if = "Option::is_none")]
    pub phone: Option<String>,
    #[serde(rename = "firstName", skip_serializing_if = "Option::is_none")]
    pub first_name: Option<String>,
    #[serde(rename = "lastName", skip_serializing_if = "Option::is_none")]
    pub last_name: Option<String>,
    #[serde(rename = "unsubscribed")]
    pub unsubscribed: bool,
    #[serde(rename = "properties")]
    pub properties: std::collections::HashMap<String, String>,
    #[serde(rename = "profileImageUrl", skip_serializing_if = "Option::is_none")]
    pub profile_image_url: Option<String>,
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "segments")]
    pub segments: Vec<String>,
    #[serde(rename = "topics")]
    pub topics: Vec<TopicSubscriptionResponse>,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ContactPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<ContactResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SegmentRef {
    #[serde(rename = "id")]
    pub id: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TopicSubscriptionBody {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "subscription")]
    pub subscription: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CreateContactBody {
    #[serde(rename = "email")]
    pub email: String,
    #[serde(rename = "phone", skip_serializing_if = "Option::is_none")]
    pub phone: Option<String>,
    #[serde(rename = "firstName", skip_serializing_if = "Option::is_none")]
    pub first_name: Option<String>,
    #[serde(rename = "lastName", skip_serializing_if = "Option::is_none")]
    pub last_name: Option<String>,
    #[serde(rename = "unsubscribed", skip_serializing_if = "Option::is_none")]
    pub unsubscribed: Option<bool>,
    #[serde(rename = "properties", skip_serializing_if = "Option::is_none")]
    pub properties: Option<std::collections::HashMap<String, String>>,
    #[serde(rename = "segments", skip_serializing_if = "Option::is_none")]
    pub segments: Option<Vec<SegmentRef>>,
    #[serde(rename = "topics", skip_serializing_if = "Option::is_none")]
    pub topics: Option<Vec<TopicSubscriptionBody>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UpdateContactBody {
    #[serde(rename = "firstName", skip_serializing_if = "Option::is_none")]
    pub first_name: Option<String>,
    #[serde(rename = "lastName", skip_serializing_if = "Option::is_none")]
    pub last_name: Option<String>,
    #[serde(rename = "phone", skip_serializing_if = "Option::is_none")]
    pub phone: Option<String>,
    #[serde(rename = "unsubscribed", skip_serializing_if = "Option::is_none")]
    pub unsubscribed: Option<bool>,
    #[serde(rename = "properties", skip_serializing_if = "Option::is_none")]
    pub properties: Option<std::collections::HashMap<String, String>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SetImageUrlBody {
    #[serde(rename = "url")]
    pub url: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AddToSegmentBody {
    #[serde(rename = "segmentId")]
    pub segment_id: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UpdateTopicsBody {
    #[serde(rename = "topics")]
    pub topics: Vec<TopicSubscriptionBody>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ActivityMetadataResponse {
    #[serde(rename = "topicId", skip_serializing_if = "Option::is_none")]
    pub topic_id: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ActivityResponse {
    #[serde(rename = "object", skip_serializing_if = "Option::is_none")]
    pub object: Option<String>,
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "type")]
    pub r#type: String,
    #[serde(rename = "referenceId", skip_serializing_if = "Option::is_none")]
    pub reference_id: Option<String>,
    #[serde(rename = "referenceName", skip_serializing_if = "Option::is_none")]
    pub reference_name: Option<String>,
    #[serde(rename = "metadata", skip_serializing_if = "Option::is_none")]
    pub metadata: Option<ActivityMetadataResponse>,
    #[serde(rename = "occurredAt")]
    pub occurred_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EngagementScoreResponse {
    #[serde(rename = "object", skip_serializing_if = "Option::is_none")]
    pub object: Option<String>,
    #[serde(rename = "score")]
    pub score: i64,
    #[serde(rename = "tier")]
    pub tier: String,
    #[serde(rename = "scoredAt")]
    pub scored_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EmailValidationStatusResponse {
    #[serde(rename = "object", skip_serializing_if = "Option::is_none")]
    pub object: Option<String>,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "reason", skip_serializing_if = "Option::is_none")]
    pub reason: Option<String>,
    #[serde(rename = "validatedAt", skip_serializing_if = "Option::is_none")]
    pub validated_at: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct RecordValidationBody {
    #[serde(rename = "status")]
    pub status: EmailValidationStatusInput,
    #[serde(rename = "reason", skip_serializing_if = "Option::is_none")]
    pub reason: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WebhookFilterSerializable {
    #[serde(rename = "field")]
    pub field: String,
    #[serde(rename = "operator")]
    pub operator: String,
    #[serde(rename = "value", skip_serializing_if = "Option::is_none")]
    pub value: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WebhookTransformationSerializable {
    #[serde(rename = "type")]
    pub r#type: String,
    #[serde(rename = "from", skip_serializing_if = "Option::is_none")]
    pub from: Option<String>,
    #[serde(rename = "to", skip_serializing_if = "Option::is_none")]
    pub to: Option<String>,
    #[serde(rename = "field", skip_serializing_if = "Option::is_none")]
    pub field: Option<String>,
    #[serde(rename = "value", skip_serializing_if = "Option::is_none")]
    pub value: Option<String>,
    #[serde(rename = "template", skip_serializing_if = "Option::is_none")]
    pub template: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WebhookResponse {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "url")]
    pub url: String,
    #[serde(rename = "events")]
    pub events: Vec<String>,
    #[serde(rename = "enabled")]
    pub enabled: bool,
    #[serde(rename = "filters", skip_serializing_if = "Option::is_none")]
    pub filters: Option<Vec<WebhookFilterSerializable>>,
    #[serde(rename = "transformations", skip_serializing_if = "Option::is_none")]
    pub transformations: Option<Vec<WebhookTransformationSerializable>>,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WebhookPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<WebhookResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WebhookDeliveryResponse {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "webhookEndpointId")]
    pub webhook_endpoint_id: String,
    #[serde(rename = "eventType")]
    pub event_type: String,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "attemptCount")]
    pub attempt_count: i64,
    #[serde(rename = "lastStatusCode", skip_serializing_if = "Option::is_none")]
    pub last_status_code: Option<i64>,
    #[serde(rename = "lastError", skip_serializing_if = "Option::is_none")]
    pub last_error: Option<String>,
    #[serde(rename = "responseBodySnippet", skip_serializing_if = "Option::is_none")]
    pub response_body_snippet: Option<String>,
    #[serde(rename = "nextAttemptAt", skip_serializing_if = "Option::is_none")]
    pub next_attempt_at: Option<String>,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WebhookDeliveryPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<WebhookDeliveryResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CreateWebhookBody {
    #[serde(rename = "url")]
    pub url: String,
    #[serde(rename = "events")]
    pub events: Vec<String>,
    #[serde(rename = "name", skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
    #[serde(rename = "secret", skip_serializing_if = "Option::is_none")]
    pub secret: Option<String>,
    #[serde(rename = "filters", skip_serializing_if = "Option::is_none")]
    pub filters: Option<Vec<WebhookFilterSerializable>>,
    #[serde(rename = "transformations", skip_serializing_if = "Option::is_none")]
    pub transformations: Option<Vec<WebhookTransformationSerializable>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WebhookCreateResponse {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "url")]
    pub url: String,
    #[serde(rename = "events")]
    pub events: Vec<String>,
    #[serde(rename = "enabled")]
    pub enabled: bool,
    #[serde(rename = "filters", skip_serializing_if = "Option::is_none")]
    pub filters: Option<Vec<WebhookFilterSerializable>>,
    #[serde(rename = "transformations", skip_serializing_if = "Option::is_none")]
    pub transformations: Option<Vec<WebhookTransformationSerializable>>,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
    #[serde(rename = "secret")]
    pub secret: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UpdateWebhookBody {
    #[serde(rename = "name", skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
    #[serde(rename = "url", skip_serializing_if = "Option::is_none")]
    pub url: Option<String>,
    #[serde(rename = "events", skip_serializing_if = "Option::is_none")]
    pub events: Option<Vec<String>>,
    #[serde(rename = "secret", skip_serializing_if = "Option::is_none")]
    pub secret: Option<String>,
    #[serde(rename = "enabled", skip_serializing_if = "Option::is_none")]
    pub enabled: Option<bool>,
    #[serde(rename = "filters", skip_serializing_if = "Option::is_none")]
    pub filters: Option<Vec<WebhookFilterSerializable>>,
    #[serde(rename = "transformations", skip_serializing_if = "Option::is_none")]
    pub transformations: Option<Vec<WebhookTransformationSerializable>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ApiKey {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "configId")]
    pub config_id: String,
    #[serde(rename = "name", skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
    #[serde(rename = "start", skip_serializing_if = "Option::is_none")]
    pub start: Option<String>,
    #[serde(rename = "prefix", skip_serializing_if = "Option::is_none")]
    pub prefix: Option<String>,
    #[serde(rename = "organizationId")]
    pub organization_id: String,
    #[serde(rename = "projectId", skip_serializing_if = "Option::is_none")]
    pub project_id: Option<String>,
    #[serde(rename = "enabled")]
    pub enabled: bool,
    #[serde(rename = "rateLimitEnabled")]
    pub rate_limit_enabled: bool,
    #[serde(rename = "rateLimitTimeWindow", skip_serializing_if = "Option::is_none")]
    pub rate_limit_time_window: Option<i64>,
    #[serde(rename = "rateLimitMax", skip_serializing_if = "Option::is_none")]
    pub rate_limit_max: Option<i64>,
    #[serde(rename = "requestCount")]
    pub request_count: i64,
    #[serde(rename = "remaining", skip_serializing_if = "Option::is_none")]
    pub remaining: Option<i64>,
    #[serde(rename = "lastRequest", skip_serializing_if = "Option::is_none")]
    pub last_request: Option<String>,
    #[serde(rename = "expiresAt", skip_serializing_if = "Option::is_none")]
    pub expires_at: Option<String>,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
    #[serde(rename = "metadata", skip_serializing_if = "Option::is_none")]
    pub metadata: Option<std::collections::HashMap<String, String>>,
    #[serde(rename = "permissions", skip_serializing_if = "Option::is_none")]
    pub permissions: Option<std::collections::HashMap<String, Vec<String>>>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ApiKeyUsageRecord {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "keyId")]
    pub key_id: String,
    #[serde(rename = "orgId")]
    pub org_id: String,
    #[serde(rename = "method")]
    pub method: String,
    #[serde(rename = "route")]
    pub route: String,
    #[serde(rename = "statusCode")]
    pub status_code: i64,
    #[serde(rename = "durationMs", skip_serializing_if = "Option::is_none")]
    pub duration_ms: Option<i64>,
    #[serde(rename = "ip", skip_serializing_if = "Option::is_none")]
    pub ip: Option<String>,
    #[serde(rename = "ts")]
    pub ts: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UsagePage {
    #[serde(rename = "size")]
    pub size: i64,
    #[serde(rename = "totalPages")]
    pub total_pages: i64,
    #[serde(rename = "hasMore")]
    pub has_more: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ApiKeyUsageResponse {
    #[serde(rename = "data")]
    pub data: Vec<ApiKeyUsageRecord>,
    #[serde(rename = "page")]
    pub page: UsagePage,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProjectLimitsModel {
    #[serde(rename = "dailySends")]
    pub daily_sends: i64,
    #[serde(rename = "perSecondSends")]
    pub per_second_sends: i64,
    #[serde(rename = "maxRecipientsPerMessage")]
    pub max_recipients_per_message: i64,
    #[serde(rename = "maxDomains")]
    pub max_domains: i64,
    #[serde(rename = "maxApiKeys")]
    pub max_api_keys: i64,
    #[serde(rename = "maxWebhooks")]
    pub max_webhooks: i64,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProjectTrackingSettingsModel {
    #[serde(rename = "openTracking")]
    pub open_tracking: bool,
    #[serde(rename = "clickTracking")]
    pub click_tracking: bool,
    #[serde(rename = "unsubscribeTracking")]
    pub unsubscribe_tracking: bool,
    #[serde(rename = "readEngagement")]
    pub read_engagement: bool,
    #[serde(rename = "scrollDepth", skip_serializing_if = "Option::is_none")]
    pub scroll_depth: Option<bool>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProjectResponse {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "slug")]
    pub slug: String,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "suspensionReason", skip_serializing_if = "Option::is_none")]
    pub suspension_reason: Option<String>,
    #[serde(rename = "region")]
    pub region: String,
    #[serde(rename = "limits")]
    pub limits: ProjectLimitsModel,
    #[serde(rename = "trackingSettings")]
    pub tracking_settings: ProjectTrackingSettingsModel,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ProjectPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<ProjectResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UpdateProjectRequest {
    #[serde(rename = "name", skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
    #[serde(rename = "slug", skip_serializing_if = "Option::is_none")]
    pub slug: Option<String>,
    #[serde(rename = "limits", skip_serializing_if = "Option::is_none")]
    pub limits: Option<ProjectLimitsModel>,
    #[serde(rename = "trackingSettings", skip_serializing_if = "Option::is_none")]
    pub tracking_settings: Option<ProjectTrackingSettingsModel>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EmailPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<EmailDetailResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EmailTimelineItem {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "type")]
    pub r#type: String,
    #[serde(rename = "providerEventId", skip_serializing_if = "Option::is_none")]
    pub provider_event_id: Option<String>,
    #[serde(rename = "payload", skip_serializing_if = "Option::is_none")]
    pub payload: Option<std::collections::HashMap<String, String>>,
    #[serde(rename = "occurredAt")]
    pub occurred_at: String,
    #[serde(rename = "createdAt")]
    pub created_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EmailTimelineResponse {
    #[serde(rename = "items")]
    pub items: Vec<EmailTimelineItem>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DomainListItemResponse {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "domain")]
    pub domain: String,
    #[serde(rename = "region")]
    pub region: String,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "dkimStatus")]
    pub dkim_status: String,
    #[serde(rename = "bimiStatus")]
    pub bimi_status: String,
    #[serde(rename = "trackingStatus")]
    pub tracking_status: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DomainListPageResponse {
    #[serde(rename = "data")]
    pub data: Vec<DomainListItemResponse>,
    #[serde(rename = "page")]
    pub page: PageInfo,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DkimRecordResponse {
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "type")]
    pub r#type: String,
    #[serde(rename = "value")]
    pub value: String,
    #[serde(rename = "status", skip_serializing_if = "Option::is_none")]
    pub status: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DnsRecordResponse {
    #[serde(rename = "name")]
    pub name: String,
    #[serde(rename = "type")]
    pub r#type: String,
    #[serde(rename = "value")]
    pub value: String,
    #[serde(rename = "priority", skip_serializing_if = "Option::is_none")]
    pub priority: Option<i64>,
    #[serde(rename = "optional", skip_serializing_if = "Option::is_none")]
    pub optional: Option<bool>,
    #[serde(rename = "status", skip_serializing_if = "Option::is_none")]
    pub status: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VerificationRecordsResponse {
    #[serde(rename = "dkim")]
    pub dkim: Vec<DkimRecordResponse>,
    #[serde(rename = "mailFromMx")]
    pub mail_from_mx: DnsRecordResponse,
    #[serde(rename = "mailFromSpf")]
    pub mail_from_spf: DnsRecordResponse,
    #[serde(rename = "dmarcRecommended", skip_serializing_if = "Option::is_none")]
    pub dmarc_recommended: Option<DnsRecordResponse>,
    #[serde(rename = "bimi", skip_serializing_if = "Option::is_none")]
    pub bimi: Option<DnsRecordResponse>,
    #[serde(rename = "trackingCname", skip_serializing_if = "Option::is_none")]
    pub tracking_cname: Option<DnsRecordResponse>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DomainResponse {
    #[serde(rename = "id")]
    pub id: String,
    #[serde(rename = "projectId")]
    pub project_id: String,
    #[serde(rename = "domain")]
    pub domain: String,
    #[serde(rename = "region")]
    pub region: String,
    #[serde(rename = "status")]
    pub status: String,
    #[serde(rename = "dkimStatus")]
    pub dkim_status: String,
    #[serde(rename = "spfStatus")]
    pub spf_status: String,
    #[serde(rename = "dmarcStatus")]
    pub dmarc_status: String,
    #[serde(rename = "mailFromStatus")]
    pub mail_from_status: String,
    #[serde(rename = "mailFromDomain")]
    pub mail_from_domain: String,
    #[serde(rename = "verificationRecords")]
    pub verification_records: VerificationRecordsResponse,
    #[serde(rename = "bimiStatus")]
    pub bimi_status: String,
    #[serde(rename = "bimiLogoUrl", skip_serializing_if = "Option::is_none")]
    pub bimi_logo_url: Option<String>,
    #[serde(rename = "createdAt")]
    pub created_at: String,
    #[serde(rename = "updatedAt")]
    pub updated_at: String,
    #[serde(rename = "verifiedAt", skip_serializing_if = "Option::is_none")]
    pub verified_at: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct RegisterDomainRequest {
    #[serde(rename = "domain")]
    pub domain: String,
    #[serde(rename = "region")]
    pub region: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct UpdateBimiRequest {
    #[serde(rename = "logoUrl", skip_serializing_if = "Option::is_none")]
    pub logo_url: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq)]
pub enum EmailValidationStatusInput {
    #[serde(rename = "valid")] Valid,
    #[serde(rename = "risky")] Risky,
    #[serde(rename = "invalid")] Invalid,
    #[serde(rename = "unknown")] Unknown,
}


#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GetTopicPerformanceQuery {
    /// Time window.
    #[serde(rename = "window", skip_serializing_if = "Option::is_none")]
    pub window: Option<String>,
    /// Required for session auth; ignored for API key auth.
    #[serde(rename = "projectId", skip_serializing_if = "Option::is_none")]
    pub project_id: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GetProjectMetricsSummaryQuery {
    /// Metrics time window.
    #[serde(rename = "window", skip_serializing_if = "Option::is_none")]
    pub window: Option<String>,
    /// Required for session auth; ignored for API key auth.
    #[serde(rename = "projectId", skip_serializing_if = "Option::is_none")]
    pub project_id: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GetProjectMetricsTimelineQuery {
    /// Metrics time window.
    #[serde(rename = "window", skip_serializing_if = "Option::is_none")]
    pub window: Option<String>,
    /// `hour` or `day`.
    #[serde(rename = "granularity", skip_serializing_if = "Option::is_none")]
    pub granularity: Option<String>,
    /// `compact` or `detailed`.
    #[serde(rename = "format", skip_serializing_if = "Option::is_none")]
    pub format: Option<String>,
    /// Required for session auth; ignored for API key auth.
    #[serde(rename = "projectId", skip_serializing_if = "Option::is_none")]
    pub project_id: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GetMetricsAdvisorQuery {
    /// Required for session auth; ignored for API key auth.
    #[serde(rename = "projectId", skip_serializing_if = "Option::is_none")]
    pub project_id: Option<String>,
}

pub type ListContactSegmentsResponse = Vec<String>;


pub type GetContactTopicsResponse = Vec<TopicSubscriptionResponse>;


pub type GetContactActivityResponse = Vec<ActivityResponse>;


#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ListApiKeysResponse {
    #[serde(flatten)]
    pub additional_properties: std::collections::HashMap<String, Vec<ApiKey>>,
}

