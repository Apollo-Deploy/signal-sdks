package com.apollodeploy.signal.sdk.models

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class AttachmentRequest(
    @SerialName("filename")
    val filename: String,
    @SerialName("content")
    val content: String,
    @SerialName("contentType")
    val contentType: String,
    @SerialName("disposition")
    val disposition: String? = null,
    @SerialName("contentId")
    val contentId: String? = null,
)

@Serializable
data class DeliveryWindowRequest(
    @SerialName("start")
    val start: String,
    @SerialName("end")
    val end: String,
)

@Serializable
data class TrackingSettingsRequest(
    @SerialName("openTracking")
    val openTracking: Boolean? = null,
    @SerialName("clickTracking")
    val clickTracking: Boolean? = null,
    @SerialName("unsubscribeTracking")
    val unsubscribeTracking: Boolean? = null,
    @SerialName("readEngagement")
    val readEngagement: Boolean? = null,
)

@Serializable
data class SendEmailRequest(
    @SerialName("from")
    val from: String,
    @SerialName("to")
    val to: List<String>,
    @SerialName("cc")
    val cc: List<String>? = null,
    @SerialName("bcc")
    val bcc: List<String>? = null,
    @SerialName("replyTo")
    val replyTo: String? = null,
    @SerialName("subject")
    val subject: String? = null,
    @SerialName("html")
    val html: String? = null,
    @SerialName("text")
    val text: String? = null,
    @SerialName("tags")
    val tags: Map<String, String>? = null,
    @SerialName("metadata")
    val metadata: Map<String, String>? = null,
    @SerialName("idempotencyKey")
    val idempotencyKey: String? = null,
    @SerialName("testMode")
    val testMode: Boolean? = null,
    @SerialName("attachments")
    val attachments: List<AttachmentRequest>? = null,
    @SerialName("scheduledAt")
    val scheduledAt: String? = null,
    @SerialName("deliveryWindow")
    val deliveryWindow: DeliveryWindowRequest? = null,
    @SerialName("sendTimeCategory")
    val sendTimeCategory: String? = null,
    @SerialName("trackingSettings")
    val trackingSettings: TrackingSettingsRequest? = null,
)

@Serializable
data class BatchSendItemResponse(
    @SerialName("index")
    val index: Long,
    @SerialName("id")
    val id: String? = null,
    @SerialName("messageId")
    val messageId: String? = null,
    @SerialName("status")
    val status: String? = null,
    @SerialName("createdAt")
    val createdAt: String? = null,
    @SerialName("scheduledAt")
    val scheduledAt: String? = null,
    @SerialName("error")
    val error: String? = null,
)

@Serializable
data class SendEmailResponse(
    @SerialName("id")
    val id: String,
    @SerialName("messageId")
    val messageId: String?,
    @SerialName("status")
    val status: String,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("scheduledAt")
    val scheduledAt: String? = null,
    @SerialName("audienceId")
    val audienceId: String? = null,
    @SerialName("messages")
    val messages: List<BatchSendItemResponse>? = null,
)

@Serializable
data class EmailDetailResponse(
    @SerialName("id")
    val id: String,
    @SerialName("messageId")
    val messageId: String?,
    @SerialName("from")
    val from: String,
    @SerialName("to")
    val to: List<String>,
    @SerialName("cc")
    val cc: List<String>?,
    @SerialName("bcc")
    val bcc: List<String>?,
    @SerialName("replyTo")
    val replyTo: String?,
    @SerialName("subject")
    val subject: String,
    @SerialName("html")
    val html: String? = null,
    @SerialName("text")
    val text: String? = null,
    @SerialName("status")
    val status: String,
    @SerialName("error")
    val error: String?,
    @SerialName("tags")
    val tags: Map<String, String>?,
    @SerialName("metadata")
    val metadata: Map<String, String>?,
    @SerialName("testMode")
    val testMode: Boolean,
    @SerialName("topicId")
    val topicId: String? = null,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("sentAt")
    val sentAt: String?,
    @SerialName("updatedAt")
    val updatedAt: String?,
)

@Serializable
data class BatchSendRequest(
    @SerialName("items")
    val items: List<SendEmailRequest>,
)

@Serializable
data class BatchSendResponse(
    @SerialName("results")
    val results: List<BatchSendItemResponse>,
)

@Serializable
data class CancelResponse(
    @SerialName("cancelled")
    val cancelled: Boolean? = null,
)

@Serializable
data class BulkCancelResponse(
    @SerialName("cancelled")
    val cancelled: Long,
)

@Serializable
data class StreamTokenResponse(
    @SerialName("token")
    val token: String,
    @SerialName("expiresAt")
    val expiresAt: String,
)

@Serializable
data class StreamEventResponse(
    @SerialName("type")
    val type: String,
    @SerialName("emailId")
    val emailId: String,
    @SerialName("occurredAt")
    val occurredAt: String,
    @SerialName("data")
    val `data`: Map<String, String>? = null,
)

@Serializable
data class ValidateLinksRequest(
    @SerialName("html")
    val html: String? = null,
)

@Serializable
data class LinkResultItem(
    @SerialName("url")
    val url: String,
    @SerialName("status")
    val status: String,
    @SerialName("statusCode")
    val statusCode: Long? = null,
    @SerialName("error")
    val error: String? = null,
)

@Serializable
data class ValidateLinksResponse(
    @SerialName("links")
    val links: List<LinkResultItem>,
    @SerialName("totalLinks")
    val totalLinks: Long,
    @SerialName("brokenLinks")
    val brokenLinks: Long,
    @SerialName("errorLinks")
    val errorLinks: Long,
)

@Serializable
data class MetricsWindowResponse(
    @SerialName("from")
    val from: String,
    @SerialName("to")
    val to: String,
    @SerialName("label")
    val label: String,
)

@Serializable
data class TopicPerformanceResponse(
    @SerialName("topicId")
    val topicId: String,
    @SerialName("topicName")
    val topicName: String,
    @SerialName("window")
    val window: MetricsWindowResponse,
    @SerialName("totalEmails")
    val totalEmails: Long,
    @SerialName("delivered")
    val delivered: Long,
    @SerialName("deliveryRate")
    val deliveryRate: Double,
    @SerialName("opened")
    val opened: Long,
    @SerialName("openRate")
    val openRate: Double,
    @SerialName("clicked")
    val clicked: Long,
    @SerialName("clickRate")
    val clickRate: Double,
    @SerialName("bounced")
    val bounced: Long,
    @SerialName("bounceRate")
    val bounceRate: Double,
    @SerialName("complained")
    val complained: Long,
    @SerialName("complaintRate")
    val complaintRate: Double,
    @SerialName("unsubscribed")
    val unsubscribed: Long,
    @SerialName("unsubscribeRate")
    val unsubscribeRate: Double,
    @SerialName("readEngaged")
    val readEngaged: Long,
    @SerialName("readEngagementRate")
    val readEngagementRate: Double,
    @SerialName("avgReadTimeSeconds")
    val avgReadTimeSeconds: Double?,
    @SerialName("optInCount")
    val optInCount: Long,
    @SerialName("optOutCount")
    val optOutCount: Long,
    @SerialName("computedAt")
    val computedAt: String,
)

@Serializable
data class EmailPerformanceResponse(
    @SerialName("emailId")
    val emailId: String,
    @SerialName("subject")
    val subject: String,
    @SerialName("fromAddress")
    val fromAddress: String,
    @SerialName("topicId")
    val topicId: String?,
    @SerialName("status")
    val status: String,
    @SerialName("delivered")
    val delivered: Boolean,
    @SerialName("opened")
    val opened: Boolean,
    @SerialName("clicked")
    val clicked: Boolean,
    @SerialName("totalClicks")
    val totalClicks: Long,
    @SerialName("bounced")
    val bounced: Boolean,
    @SerialName("complained")
    val complained: Boolean,
    @SerialName("unsubscribed")
    val unsubscribed: Boolean,
    @SerialName("readEngaged")
    val readEngaged: Boolean,
    @SerialName("readTimeSeconds")
    val readTimeSeconds: Double?,
    @SerialName("readCategory")
    val readCategory: String?,
    @SerialName("sentAt")
    val sentAt: String?,
    @SerialName("lastEventAt")
    val lastEventAt: String?,
    @SerialName("computedAt")
    val computedAt: String,
)

@Serializable
data class EmailReadScrollAnalyticsResponse(
    @SerialName("emailId")
    val emailId: String,
    @SerialName("subject")
    val subject: String,
    @SerialName("computedAt")
    val computedAt: String,
    @SerialName("readEngaged")
    val readEngaged: Boolean,
    @SerialName("readTimeSeconds")
    val readTimeSeconds: Double?,
    @SerialName("readCategory")
    val readCategory: String?,
    @SerialName("mailClient")
    val mailClient: String?,
    @SerialName("deviceType")
    val deviceType: String?,
    @SerialName("os")
    val os: String?,
    @SerialName("readEngagedAt")
    val readEngagedAt: String?,
    @SerialName("shortEmail")
    val shortEmail: Boolean,
    @SerialName("depth25Count")
    val depth25Count: Long,
    @SerialName("depth50Count")
    val depth50Count: Long,
    @SerialName("depth75Count")
    val depth75Count: Long,
    @SerialName("depth100Count")
    val depth100Count: Long,
    @SerialName("maxDepthPct")
    val maxDepthPct: Long?,
    @SerialName("depth25Rate")
    val depth25Rate: Double?,
    @SerialName("depth50Rate")
    val depth50Rate: Double?,
    @SerialName("depth75Rate")
    val depth75Rate: Double?,
    @SerialName("depth100Rate")
    val depth100Rate: Double?,
)

@Serializable
data class ProjectMetricsSummaryResponse(
    @SerialName("projectId")
    val projectId: String,
    @SerialName("window")
    val window: MetricsWindowResponse,
    @SerialName("sent")
    val sent: Long,
    @SerialName("delivered")
    val delivered: Long,
    @SerialName("opened")
    val opened: Long,
    @SerialName("clicked")
    val clicked: Long,
    @SerialName("bounced")
    val bounced: Long,
    @SerialName("complained")
    val complained: Long,
    @SerialName("failed")
    val failed: Long,
    @SerialName("unsubscribed")
    val unsubscribed: Long,
    @SerialName("readEngaged")
    val readEngaged: Long,
    @SerialName("deliveryRate")
    val deliveryRate: Double,
    @SerialName("openRate")
    val openRate: Double,
    @SerialName("clickRate")
    val clickRate: Double,
    @SerialName("bounceRate")
    val bounceRate: Double,
    @SerialName("complaintRate")
    val complaintRate: Double,
    @SerialName("readEngagementRate")
    val readEngagementRate: Double,
)

@Serializable
data class ProjectTimelineBucketResponse(
    @SerialName("bucket")
    val bucket: String,
    @SerialName("type")
    val type: String,
    @SerialName("count")
    val count: Long,
)

@Serializable
data class ProjectMetricsTimelineResponse(
    @SerialName("projectId")
    val projectId: String,
    @SerialName("window")
    val window: MetricsWindowResponse,
    @SerialName("granularity")
    val granularity: String,
    @SerialName("format")
    val format: String,
    @SerialName("buckets")
    val buckets: List<ProjectTimelineBucketResponse>,
)

@Serializable
data class AdvisorRecommendationDataResponse(
    @SerialName("bounceRate")
    val bounceRate: Double? = null,
    @SerialName("bounced")
    val bounced: Long? = null,
    @SerialName("accepted")
    val accepted: Long? = null,
    @SerialName("complaintRate")
    val complaintRate: Double? = null,
    @SerialName("accepted24h")
    val accepted24h: Long? = null,
    @SerialName("avgDailyAccepted7d")
    val avgDailyAccepted7d: Long? = null,
    @SerialName("daysSinceLastSend")
    val daysSinceLastSend: Long? = null,
    @SerialName("reportedOpenRate")
    val reportedOpenRate: Double? = null,
    @SerialName("adjustedOpenRate")
    val adjustedOpenRate: Double? = null,
    @SerialName("proxyRate")
    val proxyRate: Double? = null,
    @SerialName("proxyOpens")
    val proxyOpens: Long? = null,
    @SerialName("totalOpens")
    val totalOpens: Long? = null,
    @SerialName("humanOpenRate")
    val humanOpenRate: Double? = null,
    @SerialName("delivered")
    val delivered: Long? = null,
    @SerialName("unsubRate")
    val unsubRate: Double? = null,
    @SerialName("unsubscribed")
    val unsubscribed: Long? = null,
    @SerialName("dmarcAlignmentFailureRate7d")
    val dmarcAlignmentFailureRate7d: Double? = null,
    @SerialName("dmarcDomain")
    val dmarcDomain: String? = null,
    @SerialName("dmarcCurrentPolicy")
    val dmarcCurrentPolicy: String? = null,
    @SerialName("dmarcRecommendedPolicy")
    val dmarcRecommendedPolicy: String? = null,
    @SerialName("dmarcObservedMessages")
    val dmarcObservedMessages: Long? = null,
    @SerialName("dmarcAlignedMessages")
    val dmarcAlignedMessages: Long? = null,
    @SerialName("dmarcAccountedRate")
    val dmarcAccountedRate: Double? = null,
    @SerialName("dmarcUnknownMessages")
    val dmarcUnknownMessages: Long? = null,
    @SerialName("dmarcUnknownSources")
    val dmarcUnknownSources: Long? = null,
    @SerialName("dmarcReportingDays")
    val dmarcReportingDays: Long? = null,
)

@Serializable
data class AdvisorRecommendationResponse(
    @SerialName("code")
    val code: String,
    @SerialName("severity")
    val severity: String,
    @SerialName("title")
    val title: String,
    @SerialName("message")
    val message: String,
    @SerialName("data")
    val `data`: AdvisorRecommendationDataResponse? = null,
)

@Serializable
data class AdvisorReportResponse(
    @SerialName("projectId")
    val projectId: String,
    @SerialName("generatedAt")
    val generatedAt: String,
    @SerialName("score")
    val score: Long,
    @SerialName("recommendations")
    val recommendations: List<AdvisorRecommendationResponse>,
)

@Serializable
data class SuppressionResponse(
    @SerialName("id")
    val id: String,
    @SerialName("projectId")
    val projectId: String,
    @SerialName("email")
    val email: String,
    @SerialName("reason")
    val reason: String,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("contactId")
    val contactId: String? = null,
)

@Serializable
data class PageInfo(
    @SerialName("page")
    val page: Long,
    @SerialName("size")
    val size: Long,
    @SerialName("total")
    val total: Long,
    @SerialName("totalPages")
    val totalPages: Long,
    @SerialName("hasNextPage")
    val hasNextPage: Boolean,
    @SerialName("hasPreviousPage")
    val hasPreviousPage: Boolean,
)

@Serializable
data class SuppressionPageResponse(
    @SerialName("data")
    val `data`: List<SuppressionResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class AddSuppressionBody(
    @SerialName("email")
    val email: String,
)

@Serializable
data class SuppressionImportRowSerializable(
    @SerialName("email")
    val email: String,
    @SerialName("reason")
    val reason: String? = null,
)

@Serializable
data class SuppressionImportBody(
    @SerialName("suppressions")
    val suppressions: List<SuppressionImportRowSerializable>,
)

@Serializable
data class SuppressionImportResponse(
    @SerialName("imported")
    val imported: Long,
    @SerialName("skipped")
    val skipped: Long,
)

@Serializable
data class SegmentResponse(
    @SerialName("object")
    val `object`: String? = null,
    @SerialName("id")
    val id: String,
    @SerialName("name")
    val name: String,
    @SerialName("projectId")
    val projectId: String,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("contactCount")
    val contactCount: Long? = null,
    @SerialName("unsubscribedCount")
    val unsubscribedCount: Long? = null,
)

@Serializable
data class SegmentPageResponse(
    @SerialName("data")
    val `data`: List<SegmentResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class SegmentContactResponse(
    @SerialName("contactId")
    val contactId: String,
    @SerialName("email")
    val email: String,
    @SerialName("firstName")
    val firstName: String?,
    @SerialName("lastName")
    val lastName: String?,
    @SerialName("segments")
    val segments: List<String>,
)

@Serializable
data class CursorInfo(
    @SerialName("nextCursor")
    val nextCursor: String?,
    @SerialName("previousCursor")
    val previousCursor: String?,
    @SerialName("hasNextPage")
    val hasNextPage: Boolean,
    @SerialName("hasPreviousPage")
    val hasPreviousPage: Boolean,
)

@Serializable
data class CursorPage(
    @SerialName("data")
    val `data`: List<SegmentContactResponse>,
    @SerialName("cursor")
    val cursor: CursorInfo,
)

@Serializable
data class CreateSegmentBody(
    @SerialName("name")
    val name: String,
)

@Serializable
data class TopicResponse(
    @SerialName("object")
    val `object`: String? = null,
    @SerialName("id")
    val id: String,
    @SerialName("name")
    val name: String,
    @SerialName("defaultSubscription")
    val defaultSubscription: String,
    @SerialName("description")
    val description: String?,
    @SerialName("visibility")
    val visibility: String,
    @SerialName("projectId")
    val projectId: String,
    @SerialName("optInCount")
    val optInCount: Long,
    @SerialName("optOutCount")
    val optOutCount: Long,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("updatedAt")
    val updatedAt: String,
)

@Serializable
data class TopicPageResponse(
    @SerialName("data")
    val `data`: List<TopicResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class CreateTopicBody(
    @SerialName("name")
    val name: String,
    @SerialName("defaultSubscription")
    val defaultSubscription: String,
    @SerialName("description")
    val description: String? = null,
    @SerialName("visibility")
    val visibility: String? = null,
)

@Serializable
data class UpdateTopicBody(
    @SerialName("name")
    val name: String? = null,
    @SerialName("description")
    val description: String? = null,
    @SerialName("visibility")
    val visibility: String? = null,
)

@Serializable
data class ContactPropertyResponse(
    @SerialName("object")
    val `object`: String? = null,
    @SerialName("id")
    val id: String,
    @SerialName("key")
    val key: String,
    @SerialName("type")
    val type: String,
    @SerialName("fallbackValue")
    val fallbackValue: String?,
    @SerialName("projectId")
    val projectId: String,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("updatedAt")
    val updatedAt: String,
)

@Serializable
data class ContactPropertyPageResponse(
    @SerialName("data")
    val `data`: List<ContactPropertyResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class CreateContactPropertyBody(
    @SerialName("key")
    val key: String,
    @SerialName("type")
    val type: String,
    @SerialName("fallbackValue")
    val fallbackValue: String? = null,
)

@Serializable
data class UpdateContactPropertyBody(
    @SerialName("fallbackValue")
    val fallbackValue: String? = null,
)

@Serializable
data class TopicSubscriptionResponse(
    @SerialName("topicId")
    val topicId: String,
    @SerialName("subscription")
    val subscription: String,
)

@Serializable
data class ContactResponse(
    @SerialName("object")
    val `object`: String? = null,
    @SerialName("id")
    val id: String,
    @SerialName("email")
    val email: String,
    @SerialName("phone")
    val phone: String? = null,
    @SerialName("firstName")
    val firstName: String?,
    @SerialName("lastName")
    val lastName: String?,
    @SerialName("unsubscribed")
    val unsubscribed: Boolean,
    @SerialName("properties")
    val properties: Map<String, String>,
    @SerialName("profileImageUrl")
    val profileImageUrl: String?,
    @SerialName("projectId")
    val projectId: String,
    @SerialName("segments")
    val segments: List<String>,
    @SerialName("topics")
    val topics: List<TopicSubscriptionResponse>,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("updatedAt")
    val updatedAt: String,
)

@Serializable
data class ContactPageResponse(
    @SerialName("data")
    val `data`: List<ContactResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class SegmentRef(
    @SerialName("id")
    val id: String,
)

@Serializable
data class TopicSubscriptionBody(
    @SerialName("id")
    val id: String,
    @SerialName("subscription")
    val subscription: String,
)

@Serializable
data class CreateContactBody(
    @SerialName("email")
    val email: String,
    @SerialName("phone")
    val phone: String? = null,
    @SerialName("firstName")
    val firstName: String? = null,
    @SerialName("lastName")
    val lastName: String? = null,
    @SerialName("unsubscribed")
    val unsubscribed: Boolean? = null,
    @SerialName("properties")
    val properties: Map<String, String>? = null,
    @SerialName("segments")
    val segments: List<SegmentRef>? = null,
    @SerialName("topics")
    val topics: List<TopicSubscriptionBody>? = null,
)

@Serializable
data class UpdateContactBody(
    @SerialName("firstName")
    val firstName: String? = null,
    @SerialName("lastName")
    val lastName: String? = null,
    @SerialName("phone")
    val phone: String? = null,
    @SerialName("unsubscribed")
    val unsubscribed: Boolean? = null,
    @SerialName("properties")
    val properties: Map<String, String>? = null,
)

@Serializable
data class SetImageUrlBody(
    @SerialName("url")
    val url: String,
)

@Serializable
data class AddToSegmentBody(
    @SerialName("segmentId")
    val segmentId: String,
)

@Serializable
data class UpdateTopicsBody(
    @SerialName("topics")
    val topics: List<TopicSubscriptionBody>,
)

@Serializable
data class ActivityMetadataResponse(
    @SerialName("topicId")
    val topicId: String? = null,
)

@Serializable
data class ActivityResponse(
    @SerialName("object")
    val `object`: String? = null,
    @SerialName("id")
    val id: String,
    @SerialName("type")
    val type: String,
    @SerialName("referenceId")
    val referenceId: String? = null,
    @SerialName("referenceName")
    val referenceName: String? = null,
    @SerialName("metadata")
    val metadata: ActivityMetadataResponse? = null,
    @SerialName("occurredAt")
    val occurredAt: String,
)

@Serializable
data class EngagementScoreResponse(
    @SerialName("object")
    val `object`: String? = null,
    @SerialName("score")
    val score: Long,
    @SerialName("tier")
    val tier: String,
    @SerialName("scoredAt")
    val scoredAt: String,
)

@Serializable
data class EmailValidationStatusResponse(
    @SerialName("object")
    val `object`: String? = null,
    @SerialName("status")
    val status: String,
    @SerialName("reason")
    val reason: String?,
    @SerialName("validatedAt")
    val validatedAt: String?,
)

@Serializable
data class RecordValidationBody(
    @SerialName("status")
    val status: EmailValidationStatusInput,
    @SerialName("reason")
    val reason: String? = null,
)

@Serializable
data class WebhookFilterSerializable(
    @SerialName("field")
    val `field`: String,
    @SerialName("operator")
    val `operator`: String,
    @SerialName("value")
    val value: String? = null,
)

@Serializable
data class WebhookTransformationSerializable(
    @SerialName("type")
    val type: String,
    @SerialName("from")
    val from: String? = null,
    @SerialName("to")
    val to: String? = null,
    @SerialName("field")
    val `field`: String? = null,
    @SerialName("value")
    val value: String? = null,
    @SerialName("template")
    val template: String? = null,
)

@Serializable
data class WebhookResponse(
    @SerialName("id")
    val id: String,
    @SerialName("projectId")
    val projectId: String,
    @SerialName("name")
    val name: String,
    @SerialName("url")
    val url: String,
    @SerialName("events")
    val events: List<String>,
    @SerialName("enabled")
    val enabled: Boolean,
    @SerialName("filters")
    val filters: List<WebhookFilterSerializable>?,
    @SerialName("transformations")
    val transformations: List<WebhookTransformationSerializable>?,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("updatedAt")
    val updatedAt: String,
)

@Serializable
data class WebhookPageResponse(
    @SerialName("data")
    val `data`: List<WebhookResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class WebhookDeliveryResponse(
    @SerialName("id")
    val id: String,
    @SerialName("projectId")
    val projectId: String,
    @SerialName("webhookEndpointId")
    val webhookEndpointId: String,
    @SerialName("eventType")
    val eventType: String,
    @SerialName("status")
    val status: String,
    @SerialName("attemptCount")
    val attemptCount: Long,
    @SerialName("lastStatusCode")
    val lastStatusCode: Long?,
    @SerialName("lastError")
    val lastError: String?,
    @SerialName("responseBodySnippet")
    val responseBodySnippet: String?,
    @SerialName("nextAttemptAt")
    val nextAttemptAt: String?,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("updatedAt")
    val updatedAt: String,
)

@Serializable
data class WebhookDeliveryPageResponse(
    @SerialName("data")
    val `data`: List<WebhookDeliveryResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class CreateWebhookBody(
    @SerialName("url")
    val url: String,
    @SerialName("events")
    val events: List<String>,
    @SerialName("name")
    val name: String? = null,
    @SerialName("secret")
    val secret: String? = null,
    @SerialName("filters")
    val filters: List<WebhookFilterSerializable>? = null,
    @SerialName("transformations")
    val transformations: List<WebhookTransformationSerializable>? = null,
)

@Serializable
data class WebhookCreateResponse(
    @SerialName("id")
    val id: String,
    @SerialName("projectId")
    val projectId: String,
    @SerialName("name")
    val name: String,
    @SerialName("url")
    val url: String,
    @SerialName("events")
    val events: List<String>,
    @SerialName("enabled")
    val enabled: Boolean,
    @SerialName("filters")
    val filters: List<WebhookFilterSerializable>?,
    @SerialName("transformations")
    val transformations: List<WebhookTransformationSerializable>?,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("updatedAt")
    val updatedAt: String,
    @SerialName("secret")
    val secret: String,
)

@Serializable
data class UpdateWebhookBody(
    @SerialName("name")
    val name: String? = null,
    @SerialName("url")
    val url: String? = null,
    @SerialName("events")
    val events: List<String>? = null,
    @SerialName("secret")
    val secret: String? = null,
    @SerialName("enabled")
    val enabled: Boolean? = null,
    @SerialName("filters")
    val filters: List<WebhookFilterSerializable>? = null,
    @SerialName("transformations")
    val transformations: List<WebhookTransformationSerializable>? = null,
)

@Serializable
data class ApiKey(
    @SerialName("id")
    val id: String,
    @SerialName("configId")
    val configId: String,
    @SerialName("name")
    val name: String?,
    @SerialName("start")
    val start: String?,
    @SerialName("prefix")
    val prefix: String?,
    @SerialName("organizationId")
    val organizationId: String,
    @SerialName("projectId")
    val projectId: String?,
    @SerialName("enabled")
    val enabled: Boolean,
    @SerialName("rateLimitEnabled")
    val rateLimitEnabled: Boolean,
    @SerialName("rateLimitTimeWindow")
    val rateLimitTimeWindow: Long?,
    @SerialName("rateLimitMax")
    val rateLimitMax: Long?,
    @SerialName("requestCount")
    val requestCount: Long,
    @SerialName("remaining")
    val remaining: Long?,
    @SerialName("lastRequest")
    val lastRequest: String?,
    @SerialName("expiresAt")
    val expiresAt: String?,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("updatedAt")
    val updatedAt: String,
    @SerialName("metadata")
    val metadata: Map<String, String>?,
    @SerialName("permissions")
    val permissions: Map<String, List<String>>?,
)

@Serializable
data class ApiKeyUsageRecord(
    @SerialName("id")
    val id: String,
    @SerialName("keyId")
    val keyId: String,
    @SerialName("orgId")
    val orgId: String,
    @SerialName("method")
    val method: String,
    @SerialName("route")
    val route: String,
    @SerialName("statusCode")
    val statusCode: Long,
    @SerialName("durationMs")
    val durationMs: Long?,
    @SerialName("ip")
    val ip: String?,
    @SerialName("ts")
    val ts: String,
)

@Serializable
data class UsagePage(
    @SerialName("size")
    val size: Long,
    @SerialName("totalPages")
    val totalPages: Long,
    @SerialName("hasMore")
    val hasMore: Boolean,
)

@Serializable
data class ApiKeyUsageResponse(
    @SerialName("data")
    val `data`: List<ApiKeyUsageRecord>,
    @SerialName("page")
    val page: UsagePage,
)

@Serializable
data class ProjectLimitsModel(
    @SerialName("dailySends")
    val dailySends: Long,
    @SerialName("perSecondSends")
    val perSecondSends: Long,
    @SerialName("maxRecipientsPerMessage")
    val maxRecipientsPerMessage: Long,
    @SerialName("maxDomains")
    val maxDomains: Long,
    @SerialName("maxApiKeys")
    val maxApiKeys: Long,
    @SerialName("maxWebhooks")
    val maxWebhooks: Long,
)

@Serializable
data class ProjectTrackingSettingsModel(
    @SerialName("openTracking")
    val openTracking: Boolean,
    @SerialName("clickTracking")
    val clickTracking: Boolean,
    @SerialName("unsubscribeTracking")
    val unsubscribeTracking: Boolean,
    @SerialName("readEngagement")
    val readEngagement: Boolean,
    @SerialName("scrollDepth")
    val scrollDepth: Boolean? = null,
)

@Serializable
data class ProjectResponse(
    @SerialName("id")
    val id: String,
    @SerialName("name")
    val name: String,
    @SerialName("slug")
    val slug: String,
    @SerialName("status")
    val status: String,
    @SerialName("suspensionReason")
    val suspensionReason: String?,
    @SerialName("region")
    val region: String,
    @SerialName("limits")
    val limits: ProjectLimitsModel,
    @SerialName("trackingSettings")
    val trackingSettings: ProjectTrackingSettingsModel,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("updatedAt")
    val updatedAt: String,
)

@Serializable
data class ProjectPageResponse(
    @SerialName("data")
    val `data`: List<ProjectResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class UpdateProjectRequest(
    @SerialName("name")
    val name: String? = null,
    @SerialName("slug")
    val slug: String? = null,
    @SerialName("limits")
    val limits: ProjectLimitsModel? = null,
    @SerialName("trackingSettings")
    val trackingSettings: ProjectTrackingSettingsModel? = null,
)

@Serializable
data class EmailPageResponse(
    @SerialName("data")
    val `data`: List<EmailDetailResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class EmailTimelineItem(
    @SerialName("id")
    val id: String,
    @SerialName("type")
    val type: String,
    @SerialName("providerEventId")
    val providerEventId: String?,
    @SerialName("payload")
    val payload: Map<String, String?>?,
    @SerialName("occurredAt")
    val occurredAt: String,
    @SerialName("createdAt")
    val createdAt: String,
)

@Serializable
data class EmailTimelineResponse(
    @SerialName("items")
    val items: List<EmailTimelineItem>,
)

@Serializable
data class DomainListItemResponse(
    @SerialName("id")
    val id: String,
    @SerialName("domain")
    val domain: String,
    @SerialName("region")
    val region: String,
    @SerialName("status")
    val status: String,
    @SerialName("dkimStatus")
    val dkimStatus: String,
    @SerialName("bimiStatus")
    val bimiStatus: String,
    @SerialName("trackingStatus")
    val trackingStatus: String,
    @SerialName("updatedAt")
    val updatedAt: String,
)

@Serializable
data class DomainListPageResponse(
    @SerialName("data")
    val `data`: List<DomainListItemResponse>,
    @SerialName("page")
    val page: PageInfo,
)

@Serializable
data class DkimRecordResponse(
    @SerialName("name")
    val name: String,
    @SerialName("type")
    val type: String,
    @SerialName("value")
    val value: String,
    @SerialName("status")
    val status: String? = null,
)

@Serializable
data class DnsRecordResponse(
    @SerialName("name")
    val name: String,
    @SerialName("type")
    val type: String,
    @SerialName("value")
    val value: String,
    @SerialName("priority")
    val priority: Long? = null,
    @SerialName("optional")
    val optional: Boolean? = null,
    @SerialName("status")
    val status: String? = null,
)

@Serializable
data class VerificationRecordsResponse(
    @SerialName("dkim")
    val dkim: List<DkimRecordResponse>,
    @SerialName("mailFromMx")
    val mailFromMx: DnsRecordResponse,
    @SerialName("mailFromSpf")
    val mailFromSpf: DnsRecordResponse,
    @SerialName("dmarcRecommended")
    val dmarcRecommended: DnsRecordResponse? = null,
    @SerialName("bimi")
    val bimi: DnsRecordResponse? = null,
    @SerialName("trackingCname")
    val trackingCname: DnsRecordResponse? = null,
)

@Serializable
data class DomainResponse(
    @SerialName("id")
    val id: String,
    @SerialName("projectId")
    val projectId: String,
    @SerialName("domain")
    val domain: String,
    @SerialName("region")
    val region: String,
    @SerialName("status")
    val status: String,
    @SerialName("dkimStatus")
    val dkimStatus: String,
    @SerialName("spfStatus")
    val spfStatus: String,
    @SerialName("dmarcStatus")
    val dmarcStatus: String,
    @SerialName("mailFromStatus")
    val mailFromStatus: String,
    @SerialName("mailFromDomain")
    val mailFromDomain: String,
    @SerialName("verificationRecords")
    val verificationRecords: VerificationRecordsResponse,
    @SerialName("bimiStatus")
    val bimiStatus: String,
    @SerialName("bimiLogoUrl")
    val bimiLogoUrl: String?,
    @SerialName("createdAt")
    val createdAt: String,
    @SerialName("updatedAt")
    val updatedAt: String,
    @SerialName("verifiedAt")
    val verifiedAt: String?,
)

@Serializable
data class RegisterDomainRequest(
    @SerialName("domain")
    val domain: String,
    @SerialName("region")
    val region: String,
)

@Serializable
data class UpdateBimiRequest(
    @SerialName("logoUrl")
    val logoUrl: String? = null,
)

@Serializable
enum class EmailValidationStatusInput(val wireValue: String) {
    @SerialName("valid") Valid("valid"),
    @SerialName("risky") Risky("risky"),
    @SerialName("invalid") Invalid("invalid"),
    @SerialName("unknown") Unknown("unknown"),
    ;

    override fun toString(): String = wireValue
}

@Serializable
data class GetTopicPerformanceQuery(
    /** Time window. */
    @SerialName("window")
    val window: String? = null,
    /** Required for session auth; ignored for API key auth. */
    @SerialName("projectId")
    val projectId: String? = null,
)

@Serializable
data class GetProjectMetricsSummaryQuery(
    /** Metrics time window. */
    @SerialName("window")
    val window: String? = null,
    /** Required for session auth; ignored for API key auth. */
    @SerialName("projectId")
    val projectId: String? = null,
)

@Serializable
data class GetProjectMetricsTimelineQuery(
    /** Metrics time window. */
    @SerialName("window")
    val window: String? = null,
    /** `hour` or `day`. */
    @SerialName("granularity")
    val granularity: String? = null,
    /** `compact` or `detailed`. */
    @SerialName("format")
    val format: String? = null,
    /** Required for session auth; ignored for API key auth. */
    @SerialName("projectId")
    val projectId: String? = null,
)

@Serializable
data class GetMetricsAdvisorQuery(
    /** Required for session auth; ignored for API key auth. */
    @SerialName("projectId")
    val projectId: String? = null,
)

typealias ListContactSegmentsResponse = List<String>

typealias GetContactTopicsResponse = List<TopicSubscriptionResponse>

typealias GetContactActivityResponse = List<ActivityResponse>

@Serializable
class ListApiKeysResponse

