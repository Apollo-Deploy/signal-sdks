"""Generated type definitions for apollo_deploy_signal_sdk."""

from __future__ import annotations

from datetime import datetime
from enum import Enum
from typing import Any, Dict, List, Literal, Optional, Union
from pydantic import BaseModel, ConfigDict, Field

class AttachmentRequest(BaseModel):
    "Schema for AttachmentRequest"
    model_config = ConfigDict(populate_by_name=True)
    filename: str = Field(alias="filename")
    content: str = Field(alias="content")
    content_type: str = Field(alias="contentType")
    disposition: Optional[str] = Field(default=None, alias="disposition")
    content_id: Optional[str] = Field(default=None, alias="contentId")

class DeliveryWindowRequest(BaseModel):
    "Schema for DeliveryWindowRequest"
    model_config = ConfigDict(populate_by_name=True)
    start: str = Field(alias="start")
    end: str = Field(alias="end")

class TrackingSettingsRequest(BaseModel):
    "Schema for TrackingSettingsRequest"
    model_config = ConfigDict(populate_by_name=True)
    open_tracking: Optional[bool] = Field(default=None, alias="openTracking")
    click_tracking: Optional[bool] = Field(default=None, alias="clickTracking")
    unsubscribe_tracking: Optional[bool] = Field(default=None, alias="unsubscribeTracking")
    read_engagement: Optional[bool] = Field(default=None, alias="readEngagement")

class SendEmailRequest(BaseModel):
    "Schema for SendEmailRequest"
    model_config = ConfigDict(populate_by_name=True)
    from_: str = Field(alias="from")
    to: List[str] = Field(alias="to")
    cc: Optional[List[str]] = Field(default=None, alias="cc")
    bcc: Optional[List[str]] = Field(default=None, alias="bcc")
    reply_to: Optional[str] = Field(default=None, alias="replyTo")
    subject: Optional[str] = Field(default=None, alias="subject")
    html: Optional[str] = Field(default=None, alias="html")
    text: Optional[str] = Field(default=None, alias="text")
    tags: Optional[Dict[str, str]] = Field(default=None, alias="tags")
    metadata: Optional[Dict[str, str]] = Field(default=None, alias="metadata")
    idempotency_key: Optional[str] = Field(default=None, alias="idempotencyKey")
    test_mode: Optional[bool] = Field(default=None, alias="testMode")
    attachments: Optional[List[AttachmentRequest]] = Field(default=None, alias="attachments")
    scheduled_at: Optional[str] = Field(default=None, alias="scheduledAt")
    delivery_window: Optional[DeliveryWindowRequest] = Field(default=None, alias="deliveryWindow")
    send_time_category: Optional[str] = Field(default=None, alias="sendTimeCategory")
    tracking_settings: Optional[TrackingSettingsRequest] = Field(default=None, alias="trackingSettings")

class BatchSendItemResponse(BaseModel):
    "Schema for BatchSendItemResponse"
    model_config = ConfigDict(populate_by_name=True)
    index: int = Field(alias="index")
    id: Optional[str] = Field(default=None, alias="id")
    message_id: Optional[str] = Field(default=None, alias="messageId")
    status: Optional[str] = Field(default=None, alias="status")
    created_at: Optional[str] = Field(default=None, alias="createdAt")
    scheduled_at: Optional[str] = Field(default=None, alias="scheduledAt")
    error: Optional[str] = Field(default=None, alias="error")

class SendEmailResponse(BaseModel):
    "Schema for SendEmailResponse"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    message_id: Optional[str] = Field(alias="messageId")
    status: str = Field(alias="status")
    created_at: str = Field(alias="createdAt")
    scheduled_at: Optional[str] = Field(default=None, alias="scheduledAt")
    audience_id: Optional[str] = Field(default=None, alias="audienceId")
    messages: Optional[List[BatchSendItemResponse]] = Field(default=None, alias="messages")

class EmailDetailResponse(BaseModel):
    "Schema for EmailDetailResponse"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    message_id: Optional[str] = Field(alias="messageId")
    from_: str = Field(alias="from")
    to: List[str] = Field(alias="to")
    cc: Optional[List[str]] = Field(alias="cc")
    bcc: Optional[List[str]] = Field(alias="bcc")
    reply_to: Optional[str] = Field(alias="replyTo")
    subject: str = Field(alias="subject")
    html: Optional[str] = Field(default=None, alias="html")
    text: Optional[str] = Field(default=None, alias="text")
    status: str = Field(alias="status")
    error: Optional[str] = Field(alias="error")
    tags: Optional[Dict[str, str]] = Field(alias="tags")
    metadata: Optional[Dict[str, str]] = Field(alias="metadata")
    test_mode: bool = Field(alias="testMode")
    topic_id: Optional[str] = Field(default=None, alias="topicId")
    created_at: str = Field(alias="createdAt")
    sent_at: Optional[str] = Field(alias="sentAt")
    updated_at: Optional[str] = Field(alias="updatedAt")

class BatchSendRequest(BaseModel):
    "Schema for BatchSendRequest"
    model_config = ConfigDict(populate_by_name=True)
    items: List[SendEmailRequest] = Field(alias="items")

class BatchSendResponse(BaseModel):
    "Schema for BatchSendResponse"
    model_config = ConfigDict(populate_by_name=True)
    results: List[BatchSendItemResponse] = Field(alias="results")

class CancelResponse(BaseModel):
    "Schema for CancelResponse"
    model_config = ConfigDict(populate_by_name=True)
    cancelled: Optional[bool] = Field(default=None, alias="cancelled")

class BulkCancelResponse(BaseModel):
    "Schema for BulkCancelResponse"
    model_config = ConfigDict(populate_by_name=True)
    cancelled: int = Field(alias="cancelled")

class StreamTokenResponse(BaseModel):
    "Schema for StreamTokenResponse"
    model_config = ConfigDict(populate_by_name=True)
    token: str = Field(alias="token")
    expires_at: str = Field(alias="expiresAt")

class StreamEventResponse(BaseModel):
    "Schema for StreamEventResponse"
    model_config = ConfigDict(populate_by_name=True)
    type: str = Field(alias="type")
    email_id: str = Field(alias="emailId")
    occurred_at: str = Field(alias="occurredAt")
    data: Optional[Dict[str, str]] = Field(default=None, alias="data")

class ValidateLinksRequest(BaseModel):
    "Schema for ValidateLinksRequest"
    model_config = ConfigDict(populate_by_name=True)
    html: Optional[str] = Field(default=None, alias="html")

class LinkResultItem(BaseModel):
    "Schema for LinkResultItem"
    model_config = ConfigDict(populate_by_name=True)
    url: str = Field(alias="url")
    status: str = Field(alias="status")
    status_code: Optional[int] = Field(default=None, alias="statusCode")
    error: Optional[str] = Field(default=None, alias="error")

class ValidateLinksResponse(BaseModel):
    "Schema for ValidateLinksResponse"
    model_config = ConfigDict(populate_by_name=True)
    links: List[LinkResultItem] = Field(alias="links")
    total_links: int = Field(alias="totalLinks")
    broken_links: int = Field(alias="brokenLinks")
    error_links: int = Field(alias="errorLinks")

class MetricsWindowResponse(BaseModel):
    "Schema for MetricsWindowResponse"
    model_config = ConfigDict(populate_by_name=True)
    from_: str = Field(alias="from")
    to: str = Field(alias="to")
    label: str = Field(alias="label")

class TopicPerformanceResponse(BaseModel):
    "Schema for TopicPerformanceResponse"
    model_config = ConfigDict(populate_by_name=True)
    topic_id: str = Field(alias="topicId")
    topic_name: str = Field(alias="topicName")
    window: MetricsWindowResponse = Field(alias="window")
    total_emails: int = Field(alias="totalEmails")
    delivered: int = Field(alias="delivered")
    delivery_rate: float = Field(alias="deliveryRate")
    opened: int = Field(alias="opened")
    open_rate: float = Field(alias="openRate")
    clicked: int = Field(alias="clicked")
    click_rate: float = Field(alias="clickRate")
    bounced: int = Field(alias="bounced")
    bounce_rate: float = Field(alias="bounceRate")
    complained: int = Field(alias="complained")
    complaint_rate: float = Field(alias="complaintRate")
    unsubscribed: int = Field(alias="unsubscribed")
    unsubscribe_rate: float = Field(alias="unsubscribeRate")
    read_engaged: int = Field(alias="readEngaged")
    read_engagement_rate: float = Field(alias="readEngagementRate")
    avg_read_time_seconds: Optional[float] = Field(alias="avgReadTimeSeconds")
    opt_in_count: int = Field(alias="optInCount")
    opt_out_count: int = Field(alias="optOutCount")
    computed_at: str = Field(alias="computedAt")

class EmailPerformanceResponse(BaseModel):
    "Schema for EmailPerformanceResponse"
    model_config = ConfigDict(populate_by_name=True)
    email_id: str = Field(alias="emailId")
    subject: str = Field(alias="subject")
    from_address: str = Field(alias="fromAddress")
    topic_id: Optional[str] = Field(alias="topicId")
    status: str = Field(alias="status")
    delivered: bool = Field(alias="delivered")
    opened: bool = Field(alias="opened")
    clicked: bool = Field(alias="clicked")
    total_clicks: int = Field(alias="totalClicks")
    bounced: bool = Field(alias="bounced")
    complained: bool = Field(alias="complained")
    unsubscribed: bool = Field(alias="unsubscribed")
    read_engaged: bool = Field(alias="readEngaged")
    read_time_seconds: Optional[float] = Field(alias="readTimeSeconds")
    read_category: Optional[str] = Field(alias="readCategory")
    sent_at: Optional[str] = Field(alias="sentAt")
    last_event_at: Optional[str] = Field(alias="lastEventAt")
    computed_at: str = Field(alias="computedAt")

class EmailReadScrollAnalyticsResponse(BaseModel):
    "Schema for EmailReadScrollAnalyticsResponse"
    model_config = ConfigDict(populate_by_name=True)
    email_id: str = Field(alias="emailId")
    subject: str = Field(alias="subject")
    computed_at: str = Field(alias="computedAt")
    read_engaged: bool = Field(alias="readEngaged")
    read_time_seconds: Optional[float] = Field(alias="readTimeSeconds")
    read_category: Optional[str] = Field(alias="readCategory")
    mail_client: Optional[str] = Field(alias="mailClient")
    device_type: Optional[str] = Field(alias="deviceType")
    os: Optional[str] = Field(alias="os")
    read_engaged_at: Optional[str] = Field(alias="readEngagedAt")
    short_email: bool = Field(alias="shortEmail")
    depth25_count: int = Field(alias="depth25Count")
    depth50_count: int = Field(alias="depth50Count")
    depth75_count: int = Field(alias="depth75Count")
    depth100_count: int = Field(alias="depth100Count")
    max_depth_pct: Optional[int] = Field(alias="maxDepthPct")
    depth25_rate: Optional[float] = Field(alias="depth25Rate")
    depth50_rate: Optional[float] = Field(alias="depth50Rate")
    depth75_rate: Optional[float] = Field(alias="depth75Rate")
    depth100_rate: Optional[float] = Field(alias="depth100Rate")

class ProjectMetricsSummaryResponse(BaseModel):
    "Schema for ProjectMetricsSummaryResponse"
    model_config = ConfigDict(populate_by_name=True)
    project_id: str = Field(alias="projectId")
    window: MetricsWindowResponse = Field(alias="window")
    sent: int = Field(alias="sent")
    delivered: int = Field(alias="delivered")
    opened: int = Field(alias="opened")
    clicked: int = Field(alias="clicked")
    bounced: int = Field(alias="bounced")
    complained: int = Field(alias="complained")
    failed: int = Field(alias="failed")
    unsubscribed: int = Field(alias="unsubscribed")
    read_engaged: int = Field(alias="readEngaged")
    delivery_rate: float = Field(alias="deliveryRate")
    open_rate: float = Field(alias="openRate")
    click_rate: float = Field(alias="clickRate")
    bounce_rate: float = Field(alias="bounceRate")
    complaint_rate: float = Field(alias="complaintRate")
    read_engagement_rate: float = Field(alias="readEngagementRate")

class ProjectTimelineBucketResponse(BaseModel):
    "Schema for ProjectTimelineBucketResponse"
    model_config = ConfigDict(populate_by_name=True)
    bucket: str = Field(alias="bucket")
    type: str = Field(alias="type")
    count: int = Field(alias="count")

class ProjectMetricsTimelineResponse(BaseModel):
    "Schema for ProjectMetricsTimelineResponse"
    model_config = ConfigDict(populate_by_name=True)
    project_id: str = Field(alias="projectId")
    window: MetricsWindowResponse = Field(alias="window")
    granularity: str = Field(alias="granularity")
    format: str = Field(alias="format")
    buckets: List[ProjectTimelineBucketResponse] = Field(alias="buckets")

class AdvisorRecommendationDataResponse(BaseModel):
    "Schema for AdvisorRecommendationDataResponse"
    model_config = ConfigDict(populate_by_name=True)
    bounce_rate: Optional[float] = Field(default=None, alias="bounceRate")
    bounced: Optional[int] = Field(default=None, alias="bounced")
    accepted: Optional[int] = Field(default=None, alias="accepted")
    complaint_rate: Optional[float] = Field(default=None, alias="complaintRate")
    accepted24h: Optional[int] = Field(default=None, alias="accepted24h")
    avg_daily_accepted7d: Optional[int] = Field(default=None, alias="avgDailyAccepted7d")
    days_since_last_send: Optional[int] = Field(default=None, alias="daysSinceLastSend")
    reported_open_rate: Optional[float] = Field(default=None, alias="reportedOpenRate")
    adjusted_open_rate: Optional[float] = Field(default=None, alias="adjustedOpenRate")
    proxy_rate: Optional[float] = Field(default=None, alias="proxyRate")
    proxy_opens: Optional[int] = Field(default=None, alias="proxyOpens")
    total_opens: Optional[int] = Field(default=None, alias="totalOpens")
    human_open_rate: Optional[float] = Field(default=None, alias="humanOpenRate")
    delivered: Optional[int] = Field(default=None, alias="delivered")
    unsub_rate: Optional[float] = Field(default=None, alias="unsubRate")
    unsubscribed: Optional[int] = Field(default=None, alias="unsubscribed")
    dmarc_alignment_failure_rate7d: Optional[float] = Field(default=None, alias="dmarcAlignmentFailureRate7d")
    dmarc_domain: Optional[str] = Field(default=None, alias="dmarcDomain")
    dmarc_current_policy: Optional[str] = Field(default=None, alias="dmarcCurrentPolicy")
    dmarc_recommended_policy: Optional[str] = Field(default=None, alias="dmarcRecommendedPolicy")
    dmarc_observed_messages: Optional[int] = Field(default=None, alias="dmarcObservedMessages")
    dmarc_aligned_messages: Optional[int] = Field(default=None, alias="dmarcAlignedMessages")
    dmarc_accounted_rate: Optional[float] = Field(default=None, alias="dmarcAccountedRate")
    dmarc_unknown_messages: Optional[int] = Field(default=None, alias="dmarcUnknownMessages")
    dmarc_unknown_sources: Optional[int] = Field(default=None, alias="dmarcUnknownSources")
    dmarc_reporting_days: Optional[int] = Field(default=None, alias="dmarcReportingDays")

class AdvisorRecommendationResponse(BaseModel):
    "Schema for AdvisorRecommendationResponse"
    model_config = ConfigDict(populate_by_name=True)
    code: str = Field(alias="code")
    severity: str = Field(alias="severity")
    title: str = Field(alias="title")
    message: str = Field(alias="message")
    data: Optional[AdvisorRecommendationDataResponse] = Field(default=None, alias="data")

class AdvisorReportResponse(BaseModel):
    "Schema for AdvisorReportResponse"
    model_config = ConfigDict(populate_by_name=True)
    project_id: str = Field(alias="projectId")
    generated_at: str = Field(alias="generatedAt")
    score: int = Field(alias="score")
    recommendations: List[AdvisorRecommendationResponse] = Field(alias="recommendations")

class SuppressionResponse(BaseModel):
    "Schema for SuppressionResponse"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    project_id: str = Field(alias="projectId")
    email: str = Field(alias="email")
    reason: str = Field(alias="reason")
    created_at: str = Field(alias="createdAt")
    contact_id: Optional[str] = Field(default=None, alias="contactId")

class PageInfo(BaseModel):
    "Schema for PageInfo"
    model_config = ConfigDict(populate_by_name=True)
    page: int = Field(alias="page")
    size: int = Field(alias="size")
    total: int = Field(alias="total")
    total_pages: int = Field(alias="totalPages")
    has_next_page: bool = Field(alias="hasNextPage")
    has_previous_page: bool = Field(alias="hasPreviousPage")

class SuppressionPageResponse(BaseModel):
    "Schema for SuppressionPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[SuppressionResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class AddSuppressionBody(BaseModel):
    "Schema for AddSuppressionBody"
    model_config = ConfigDict(populate_by_name=True)
    email: str = Field(alias="email")

class SuppressionImportRowSerializable(BaseModel):
    "Schema for SuppressionImportRowSerializable"
    model_config = ConfigDict(populate_by_name=True)
    email: str = Field(alias="email")
    reason: Optional[str] = Field(default=None, alias="reason")

class SuppressionImportBody(BaseModel):
    "Schema for SuppressionImportBody"
    model_config = ConfigDict(populate_by_name=True)
    suppressions: List[SuppressionImportRowSerializable] = Field(alias="suppressions")

class SuppressionImportResponse(BaseModel):
    "Schema for SuppressionImportResponse"
    model_config = ConfigDict(populate_by_name=True)
    imported: int = Field(alias="imported")
    skipped: int = Field(alias="skipped")

class SegmentResponse(BaseModel):
    "Schema for SegmentResponse"
    model_config = ConfigDict(populate_by_name=True)
    object: Optional[str] = Field(default=None, alias="object")
    id: str = Field(alias="id")
    name: str = Field(alias="name")
    project_id: str = Field(alias="projectId")
    created_at: str = Field(alias="createdAt")
    contact_count: Optional[int] = Field(default=None, alias="contactCount")
    unsubscribed_count: Optional[int] = Field(default=None, alias="unsubscribedCount")

class SegmentPageResponse(BaseModel):
    "Schema for SegmentPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[SegmentResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class SegmentContactResponse(BaseModel):
    "Schema for SegmentContactResponse"
    model_config = ConfigDict(populate_by_name=True)
    contact_id: str = Field(alias="contactId")
    email: str = Field(alias="email")
    first_name: Optional[str] = Field(alias="firstName")
    last_name: Optional[str] = Field(alias="lastName")
    segments: List[str] = Field(alias="segments")

class CursorInfo(BaseModel):
    "Schema for CursorInfo"
    model_config = ConfigDict(populate_by_name=True)
    next_cursor: Optional[str] = Field(alias="nextCursor")
    previous_cursor: Optional[str] = Field(alias="previousCursor")
    has_next_page: bool = Field(alias="hasNextPage")
    has_previous_page: bool = Field(alias="hasPreviousPage")

class CursorPage(BaseModel):
    "Schema for CursorPage"
    model_config = ConfigDict(populate_by_name=True)
    data: List[SegmentContactResponse] = Field(alias="data")
    cursor: CursorInfo = Field(alias="cursor")

class CreateSegmentBody(BaseModel):
    "Schema for CreateSegmentBody"
    model_config = ConfigDict(populate_by_name=True)
    name: str = Field(alias="name")

class TopicResponse(BaseModel):
    "Schema for TopicResponse"
    model_config = ConfigDict(populate_by_name=True)
    object: Optional[str] = Field(default=None, alias="object")
    id: str = Field(alias="id")
    name: str = Field(alias="name")
    default_subscription: str = Field(alias="defaultSubscription")
    description: Optional[str] = Field(alias="description")
    visibility: str = Field(alias="visibility")
    project_id: str = Field(alias="projectId")
    opt_in_count: int = Field(alias="optInCount")
    opt_out_count: int = Field(alias="optOutCount")
    created_at: str = Field(alias="createdAt")
    updated_at: str = Field(alias="updatedAt")

class TopicPageResponse(BaseModel):
    "Schema for TopicPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[TopicResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class CreateTopicBody(BaseModel):
    "Schema for CreateTopicBody"
    model_config = ConfigDict(populate_by_name=True)
    name: str = Field(alias="name")
    default_subscription: str = Field(alias="defaultSubscription")
    description: Optional[str] = Field(default=None, alias="description")
    visibility: Optional[str] = Field(default=None, alias="visibility")

class UpdateTopicBody(BaseModel):
    "Schema for UpdateTopicBody"
    model_config = ConfigDict(populate_by_name=True)
    name: Optional[str] = Field(default=None, alias="name")
    description: Optional[str] = Field(default=None, alias="description")
    visibility: Optional[str] = Field(default=None, alias="visibility")

class ContactPropertyResponse(BaseModel):
    "Schema for ContactPropertyResponse"
    model_config = ConfigDict(populate_by_name=True)
    object: Optional[str] = Field(default=None, alias="object")
    id: str = Field(alias="id")
    key: str = Field(alias="key")
    type: str = Field(alias="type")
    fallback_value: Optional[str] = Field(alias="fallbackValue")
    project_id: str = Field(alias="projectId")
    created_at: str = Field(alias="createdAt")
    updated_at: str = Field(alias="updatedAt")

class ContactPropertyPageResponse(BaseModel):
    "Schema for ContactPropertyPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[ContactPropertyResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class CreateContactPropertyBody(BaseModel):
    "Schema for CreateContactPropertyBody"
    model_config = ConfigDict(populate_by_name=True)
    key: str = Field(alias="key")
    type: str = Field(alias="type")
    fallback_value: Optional[str] = Field(default=None, alias="fallbackValue")

class UpdateContactPropertyBody(BaseModel):
    "Schema for UpdateContactPropertyBody"
    model_config = ConfigDict(populate_by_name=True)
    fallback_value: Optional[str] = Field(default=None, alias="fallbackValue")

class TopicSubscriptionResponse(BaseModel):
    "Schema for TopicSubscriptionResponse"
    model_config = ConfigDict(populate_by_name=True)
    topic_id: str = Field(alias="topicId")
    subscription: str = Field(alias="subscription")

class ContactResponse(BaseModel):
    "Schema for ContactResponse"
    model_config = ConfigDict(populate_by_name=True)
    object: Optional[str] = Field(default=None, alias="object")
    id: str = Field(alias="id")
    email: str = Field(alias="email")
    phone: Optional[str] = Field(default=None, alias="phone")
    first_name: Optional[str] = Field(alias="firstName")
    last_name: Optional[str] = Field(alias="lastName")
    unsubscribed: bool = Field(alias="unsubscribed")
    properties: Dict[str, str] = Field(alias="properties")
    profile_image_url: Optional[str] = Field(alias="profileImageUrl")
    project_id: str = Field(alias="projectId")
    segments: List[str] = Field(alias="segments")
    topics: List[TopicSubscriptionResponse] = Field(alias="topics")
    created_at: str = Field(alias="createdAt")
    updated_at: str = Field(alias="updatedAt")

class ContactPageResponse(BaseModel):
    "Schema for ContactPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[ContactResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class SegmentRef(BaseModel):
    "Schema for SegmentRef"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")

class TopicSubscriptionBody(BaseModel):
    "Schema for TopicSubscriptionBody"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    subscription: str = Field(alias="subscription")

class CreateContactBody(BaseModel):
    "Schema for CreateContactBody"
    model_config = ConfigDict(populate_by_name=True)
    email: str = Field(alias="email")
    phone: Optional[str] = Field(default=None, alias="phone")
    first_name: Optional[str] = Field(default=None, alias="firstName")
    last_name: Optional[str] = Field(default=None, alias="lastName")
    unsubscribed: Optional[bool] = Field(default=None, alias="unsubscribed")
    properties: Optional[Dict[str, str]] = Field(default=None, alias="properties")
    segments: Optional[List[SegmentRef]] = Field(default=None, alias="segments")
    topics: Optional[List[TopicSubscriptionBody]] = Field(default=None, alias="topics")

class UpdateContactBody(BaseModel):
    "Schema for UpdateContactBody"
    model_config = ConfigDict(populate_by_name=True)
    first_name: Optional[str] = Field(default=None, alias="firstName")
    last_name: Optional[str] = Field(default=None, alias="lastName")
    phone: Optional[str] = Field(default=None, alias="phone")
    unsubscribed: Optional[bool] = Field(default=None, alias="unsubscribed")
    properties: Optional[Dict[str, str]] = Field(default=None, alias="properties")

class SetImageUrlBody(BaseModel):
    "Schema for SetImageUrlBody"
    model_config = ConfigDict(populate_by_name=True)
    url: str = Field(alias="url")

class AddToSegmentBody(BaseModel):
    "Schema for AddToSegmentBody"
    model_config = ConfigDict(populate_by_name=True)
    segment_id: str = Field(alias="segmentId")

class UpdateTopicsBody(BaseModel):
    "Schema for UpdateTopicsBody"
    model_config = ConfigDict(populate_by_name=True)
    topics: List[TopicSubscriptionBody] = Field(alias="topics")

class ActivityMetadataResponse(BaseModel):
    "Schema for ActivityMetadataResponse"
    model_config = ConfigDict(populate_by_name=True)
    topic_id: Optional[str] = Field(default=None, alias="topicId")

class ActivityResponse(BaseModel):
    "Schema for ActivityResponse"
    model_config = ConfigDict(populate_by_name=True)
    object: Optional[str] = Field(default=None, alias="object")
    id: str = Field(alias="id")
    type: str = Field(alias="type")
    reference_id: Optional[str] = Field(default=None, alias="referenceId")
    reference_name: Optional[str] = Field(default=None, alias="referenceName")
    metadata: Optional[ActivityMetadataResponse] = Field(default=None, alias="metadata")
    occurred_at: str = Field(alias="occurredAt")

class EngagementScoreResponse(BaseModel):
    "Schema for EngagementScoreResponse"
    model_config = ConfigDict(populate_by_name=True)
    object: Optional[str] = Field(default=None, alias="object")
    score: int = Field(alias="score")
    tier: str = Field(alias="tier")
    scored_at: str = Field(alias="scoredAt")

class EmailValidationStatusResponse(BaseModel):
    "Schema for EmailValidationStatusResponse"
    model_config = ConfigDict(populate_by_name=True)
    object: Optional[str] = Field(default=None, alias="object")
    status: str = Field(alias="status")
    reason: Optional[str] = Field(alias="reason")
    validated_at: Optional[str] = Field(alias="validatedAt")

class RecordValidationBody(BaseModel):
    "Schema for RecordValidationBody"
    model_config = ConfigDict(populate_by_name=True)
    status: EmailValidationStatusInput = Field(alias="status")
    reason: Optional[str] = Field(default=None, alias="reason")

class WebhookFilterSerializable(BaseModel):
    "Schema for WebhookFilterSerializable"
    model_config = ConfigDict(populate_by_name=True)
    field: str = Field(alias="field")
    operator: str = Field(alias="operator")
    value: Optional[str] = Field(default=None, alias="value")

class WebhookTransformationSerializable(BaseModel):
    "Schema for WebhookTransformationSerializable"
    model_config = ConfigDict(populate_by_name=True)
    type: str = Field(alias="type")
    from_: Optional[str] = Field(default=None, alias="from")
    to: Optional[str] = Field(default=None, alias="to")
    field: Optional[str] = Field(default=None, alias="field")
    value: Optional[str] = Field(default=None, alias="value")
    template: Optional[str] = Field(default=None, alias="template")

class WebhookResponse(BaseModel):
    "Schema for WebhookResponse"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    project_id: str = Field(alias="projectId")
    name: str = Field(alias="name")
    url: str = Field(alias="url")
    events: List[str] = Field(alias="events")
    enabled: bool = Field(alias="enabled")
    filters: Optional[List[WebhookFilterSerializable]] = Field(alias="filters")
    transformations: Optional[List[WebhookTransformationSerializable]] = Field(alias="transformations")
    created_at: str = Field(alias="createdAt")
    updated_at: str = Field(alias="updatedAt")

class WebhookPageResponse(BaseModel):
    "Schema for WebhookPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[WebhookResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class WebhookDeliveryResponse(BaseModel):
    "Schema for WebhookDeliveryResponse"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    project_id: str = Field(alias="projectId")
    webhook_endpoint_id: str = Field(alias="webhookEndpointId")
    event_type: str = Field(alias="eventType")
    status: str = Field(alias="status")
    attempt_count: int = Field(alias="attemptCount")
    last_status_code: Optional[int] = Field(alias="lastStatusCode")
    last_error: Optional[str] = Field(alias="lastError")
    response_body_snippet: Optional[str] = Field(alias="responseBodySnippet")
    next_attempt_at: Optional[str] = Field(alias="nextAttemptAt")
    created_at: str = Field(alias="createdAt")
    updated_at: str = Field(alias="updatedAt")

class WebhookDeliveryPageResponse(BaseModel):
    "Schema for WebhookDeliveryPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[WebhookDeliveryResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class CreateWebhookBody(BaseModel):
    "Schema for CreateWebhookBody"
    model_config = ConfigDict(populate_by_name=True)
    url: str = Field(alias="url")
    events: List[str] = Field(alias="events")
    name: Optional[str] = Field(default=None, alias="name")
    secret: Optional[str] = Field(default=None, alias="secret")
    filters: Optional[List[WebhookFilterSerializable]] = Field(default=None, alias="filters")
    transformations: Optional[List[WebhookTransformationSerializable]] = Field(default=None, alias="transformations")

class WebhookCreateResponse(BaseModel):
    "Schema for WebhookCreateResponse"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    project_id: str = Field(alias="projectId")
    name: str = Field(alias="name")
    url: str = Field(alias="url")
    events: List[str] = Field(alias="events")
    enabled: bool = Field(alias="enabled")
    filters: Optional[List[WebhookFilterSerializable]] = Field(alias="filters")
    transformations: Optional[List[WebhookTransformationSerializable]] = Field(alias="transformations")
    created_at: str = Field(alias="createdAt")
    updated_at: str = Field(alias="updatedAt")
    secret: str = Field(alias="secret")

class UpdateWebhookBody(BaseModel):
    "Schema for UpdateWebhookBody"
    model_config = ConfigDict(populate_by_name=True)
    name: Optional[str] = Field(default=None, alias="name")
    url: Optional[str] = Field(default=None, alias="url")
    events: Optional[List[str]] = Field(default=None, alias="events")
    secret: Optional[str] = Field(default=None, alias="secret")
    enabled: Optional[bool] = Field(default=None, alias="enabled")
    filters: Optional[List[WebhookFilterSerializable]] = Field(default=None, alias="filters")
    transformations: Optional[List[WebhookTransformationSerializable]] = Field(default=None, alias="transformations")

class ApiKey(BaseModel):
    "Schema for ApiKey"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    config_id: str = Field(alias="configId")
    name: Optional[str] = Field(alias="name")
    start: Optional[str] = Field(alias="start")
    prefix: Optional[str] = Field(alias="prefix")
    organization_id: str = Field(alias="organizationId")
    project_id: Optional[str] = Field(alias="projectId")
    enabled: bool = Field(alias="enabled")
    rate_limit_enabled: bool = Field(alias="rateLimitEnabled")
    rate_limit_time_window: Optional[int] = Field(alias="rateLimitTimeWindow")
    rate_limit_max: Optional[int] = Field(alias="rateLimitMax")
    request_count: int = Field(alias="requestCount")
    remaining: Optional[int] = Field(alias="remaining")
    last_request: Optional[str] = Field(alias="lastRequest")
    expires_at: Optional[str] = Field(alias="expiresAt")
    created_at: str = Field(alias="createdAt")
    updated_at: str = Field(alias="updatedAt")
    metadata: Optional[Dict[str, str]] = Field(alias="metadata")
    permissions: Optional[Dict[str, List[str]]] = Field(alias="permissions")

class ApiKeyUsageRecord(BaseModel):
    "Schema for ApiKeyUsageRecord"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    key_id: str = Field(alias="keyId")
    org_id: str = Field(alias="orgId")
    method: str = Field(alias="method")
    route: str = Field(alias="route")
    status_code: int = Field(alias="statusCode")
    duration_ms: Optional[int] = Field(alias="durationMs")
    ip: Optional[str] = Field(alias="ip")
    ts: str = Field(alias="ts")

class UsagePage(BaseModel):
    "Schema for UsagePage"
    model_config = ConfigDict(populate_by_name=True)
    size: int = Field(alias="size")
    total_pages: int = Field(alias="totalPages")
    has_more: bool = Field(alias="hasMore")

class ApiKeyUsageResponse(BaseModel):
    "Schema for ApiKeyUsageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[ApiKeyUsageRecord] = Field(alias="data")
    page: UsagePage = Field(alias="page")

class ProjectLimitsModel(BaseModel):
    "Schema for ProjectLimitsModel"
    model_config = ConfigDict(populate_by_name=True)
    daily_sends: int = Field(alias="dailySends")
    per_second_sends: int = Field(alias="perSecondSends")
    max_recipients_per_message: int = Field(alias="maxRecipientsPerMessage")
    max_domains: int = Field(alias="maxDomains")
    max_api_keys: int = Field(alias="maxApiKeys")
    max_webhooks: int = Field(alias="maxWebhooks")

class ProjectTrackingSettingsModel(BaseModel):
    "Schema for ProjectTrackingSettingsModel"
    model_config = ConfigDict(populate_by_name=True)
    open_tracking: bool = Field(alias="openTracking")
    click_tracking: bool = Field(alias="clickTracking")
    unsubscribe_tracking: bool = Field(alias="unsubscribeTracking")
    read_engagement: bool = Field(alias="readEngagement")
    scroll_depth: Optional[bool] = Field(default=None, alias="scrollDepth")

class ProjectResponse(BaseModel):
    "Schema for ProjectResponse"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    name: str = Field(alias="name")
    slug: str = Field(alias="slug")
    status: str = Field(alias="status")
    suspension_reason: Optional[str] = Field(alias="suspensionReason")
    region: str = Field(alias="region")
    limits: ProjectLimitsModel = Field(alias="limits")
    tracking_settings: ProjectTrackingSettingsModel = Field(alias="trackingSettings")
    created_at: str = Field(alias="createdAt")
    updated_at: str = Field(alias="updatedAt")

class ProjectPageResponse(BaseModel):
    "Schema for ProjectPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[ProjectResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class UpdateProjectRequest(BaseModel):
    "Schema for UpdateProjectRequest"
    model_config = ConfigDict(populate_by_name=True)
    name: Optional[str] = Field(default=None, alias="name")
    slug: Optional[str] = Field(default=None, alias="slug")
    limits: Optional[ProjectLimitsModel] = Field(default=None, alias="limits")
    tracking_settings: Optional[ProjectTrackingSettingsModel] = Field(default=None, alias="trackingSettings")

class EmailPageResponse(BaseModel):
    "Schema for EmailPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[EmailDetailResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class EmailTimelineItem(BaseModel):
    "Schema for EmailTimelineItem"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    type: str = Field(alias="type")
    provider_event_id: Optional[str] = Field(alias="providerEventId")
    payload: Optional[Dict[str, Optional[str]]] = Field(alias="payload")
    occurred_at: str = Field(alias="occurredAt")
    created_at: str = Field(alias="createdAt")

class EmailTimelineResponse(BaseModel):
    "Schema for EmailTimelineResponse"
    model_config = ConfigDict(populate_by_name=True)
    items: List[EmailTimelineItem] = Field(alias="items")

class DomainListItemResponse(BaseModel):
    "Schema for DomainListItemResponse"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    domain: str = Field(alias="domain")
    region: str = Field(alias="region")
    status: str = Field(alias="status")
    dkim_status: str = Field(alias="dkimStatus")
    bimi_status: str = Field(alias="bimiStatus")
    tracking_status: str = Field(alias="trackingStatus")
    updated_at: str = Field(alias="updatedAt")

class DomainListPageResponse(BaseModel):
    "Schema for DomainListPageResponse"
    model_config = ConfigDict(populate_by_name=True)
    data: List[DomainListItemResponse] = Field(alias="data")
    page: PageInfo = Field(alias="page")

class DkimRecordResponse(BaseModel):
    "Schema for DkimRecordResponse"
    model_config = ConfigDict(populate_by_name=True)
    name: str = Field(alias="name")
    type: str = Field(alias="type")
    value: str = Field(alias="value")
    status: Optional[str] = Field(default=None, alias="status")

class DnsRecordResponse(BaseModel):
    "Schema for DnsRecordResponse"
    model_config = ConfigDict(populate_by_name=True)
    name: str = Field(alias="name")
    type: str = Field(alias="type")
    value: str = Field(alias="value")
    priority: Optional[int] = Field(default=None, alias="priority")
    optional: Optional[bool] = Field(default=None, alias="optional")
    status: Optional[str] = Field(default=None, alias="status")

class VerificationRecordsResponse(BaseModel):
    "Schema for VerificationRecordsResponse"
    model_config = ConfigDict(populate_by_name=True)
    dkim: List[DkimRecordResponse] = Field(alias="dkim")
    mail_from_mx: DnsRecordResponse = Field(alias="mailFromMx")
    mail_from_spf: DnsRecordResponse = Field(alias="mailFromSpf")
    dmarc_recommended: Optional[DnsRecordResponse] = Field(default=None, alias="dmarcRecommended")
    bimi: Optional[DnsRecordResponse] = Field(default=None, alias="bimi")
    tracking_cname: Optional[DnsRecordResponse] = Field(default=None, alias="trackingCname")

class DomainResponse(BaseModel):
    "Schema for DomainResponse"
    model_config = ConfigDict(populate_by_name=True)
    id: str = Field(alias="id")
    project_id: str = Field(alias="projectId")
    domain: str = Field(alias="domain")
    region: str = Field(alias="region")
    status: str = Field(alias="status")
    dkim_status: str = Field(alias="dkimStatus")
    spf_status: str = Field(alias="spfStatus")
    dmarc_status: str = Field(alias="dmarcStatus")
    mail_from_status: str = Field(alias="mailFromStatus")
    mail_from_domain: str = Field(alias="mailFromDomain")
    verification_records: VerificationRecordsResponse = Field(alias="verificationRecords")
    bimi_status: str = Field(alias="bimiStatus")
    bimi_logo_url: Optional[str] = Field(alias="bimiLogoUrl")
    created_at: str = Field(alias="createdAt")
    updated_at: str = Field(alias="updatedAt")
    verified_at: Optional[str] = Field(alias="verifiedAt")

class RegisterDomainRequest(BaseModel):
    "Schema for RegisterDomainRequest"
    model_config = ConfigDict(populate_by_name=True)
    domain: str = Field(alias="domain")
    region: str = Field(alias="region")

class UpdateBimiRequest(BaseModel):
    "Schema for UpdateBimiRequest"
    model_config = ConfigDict(populate_by_name=True)
    logo_url: Optional[str] = Field(default=None, alias="logoUrl")

class EmailValidationStatusInput(str, Enum):
    "Schema for EmailValidationStatusInput"
    Valid = "valid"
    Risky = "risky"
    Invalid = "invalid"
    Unknown = "unknown"

class GetTopicPerformanceQuery(BaseModel):
    "Schema for GetTopicPerformanceQuery"
    model_config = ConfigDict(populate_by_name=True)
    window: Optional[str] = Field(default=None, alias="window")
    project_id: Optional[str] = Field(default=None, alias="projectId")

class GetProjectMetricsSummaryQuery(BaseModel):
    "Schema for GetProjectMetricsSummaryQuery"
    model_config = ConfigDict(populate_by_name=True)
    window: Optional[str] = Field(default=None, alias="window")
    project_id: Optional[str] = Field(default=None, alias="projectId")

class GetProjectMetricsTimelineQuery(BaseModel):
    "Schema for GetProjectMetricsTimelineQuery"
    model_config = ConfigDict(populate_by_name=True)
    window: Optional[str] = Field(default=None, alias="window")
    granularity: Optional[str] = Field(default=None, alias="granularity")
    format: Optional[str] = Field(default=None, alias="format")
    project_id: Optional[str] = Field(default=None, alias="projectId")

class GetMetricsAdvisorQuery(BaseModel):
    "Schema for GetMetricsAdvisorQuery"
    model_config = ConfigDict(populate_by_name=True)
    project_id: Optional[str] = Field(default=None, alias="projectId")

ListContactSegmentsResponse = List[str]

GetContactTopicsResponse = List[TopicSubscriptionResponse]

GetContactActivityResponse = List[ActivityResponse]

class ListApiKeysResponse(BaseModel):
    "Schema for ListApiKeysResponse"
    model_config = ConfigDict(populate_by_name=True)
    pass

