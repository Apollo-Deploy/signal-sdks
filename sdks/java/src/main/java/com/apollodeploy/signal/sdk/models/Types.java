package com.apollodeploy.signal.sdk.models;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonValue;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Generated wire models for the Apollo Signal API API. */
public final class Types {
    private Types() {
    }

    /** AttachmentRequest schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class AttachmentRequest {
        public AttachmentRequest() {
        }

        @JsonProperty("filename")
        public String filename;

        @JsonProperty("content")
        public String content;

        @JsonProperty("contentType")
        public String contentType;

        @JsonProperty("disposition")
        public String disposition;

        @JsonProperty("contentId")
        public String contentId;

    }

    /** DeliveryWindowRequest schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class DeliveryWindowRequest {
        public DeliveryWindowRequest() {
        }

        @JsonProperty("start")
        public String start;

        @JsonProperty("end")
        public String end;

    }

    /** TrackingSettingsRequest schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class TrackingSettingsRequest {
        public TrackingSettingsRequest() {
        }

        @JsonProperty("openTracking")
        public Boolean openTracking;

        @JsonProperty("clickTracking")
        public Boolean clickTracking;

        @JsonProperty("unsubscribeTracking")
        public Boolean unsubscribeTracking;

        @JsonProperty("readEngagement")
        public Boolean readEngagement;

    }

    /** SendEmailRequest schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SendEmailRequest {
        public SendEmailRequest() {
        }

        @JsonProperty("from")
        public String from;

        @JsonProperty("to")
        public List<String> to;

        @JsonProperty("cc")
        public List<String> cc;

        @JsonProperty("bcc")
        public List<String> bcc;

        @JsonProperty("replyTo")
        public String replyTo;

        @JsonProperty("subject")
        public String subject;

        @JsonProperty("html")
        public String html;

        @JsonProperty("text")
        public String text;

        @JsonProperty("tags")
        public Map<String, String> tags;

        @JsonProperty("metadata")
        public Map<String, String> metadata;

        @JsonProperty("idempotencyKey")
        public String idempotencyKey;

        @JsonProperty("testMode")
        public Boolean testMode;

        @JsonProperty("attachments")
        public List<AttachmentRequest> attachments;

        @JsonProperty("scheduledAt")
        public String scheduledAt;

        @JsonProperty("deliveryWindow")
        public DeliveryWindowRequest deliveryWindow;

        @JsonProperty("sendTimeCategory")
        public String sendTimeCategory;

        @JsonProperty("trackingSettings")
        public TrackingSettingsRequest trackingSettings;

    }

    /** BatchSendItemResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class BatchSendItemResponse {
        public BatchSendItemResponse() {
        }

        @JsonProperty("index")
        public long index;

        @JsonProperty("id")
        public String id;

        @JsonProperty("messageId")
        public String messageId;

        @JsonProperty("status")
        public String status;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("scheduledAt")
        public String scheduledAt;

        @JsonProperty("error")
        public String error;

    }

    /** SendEmailResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SendEmailResponse {
        public SendEmailResponse() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("messageId")
        public String messageId;

        @JsonProperty("status")
        public String status;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("scheduledAt")
        public String scheduledAt;

        @JsonProperty("audienceId")
        public String audienceId;

        @JsonProperty("messages")
        public List<BatchSendItemResponse> messages;

    }

    /** EmailDetailResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class EmailDetailResponse {
        public EmailDetailResponse() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("messageId")
        public String messageId;

        @JsonProperty("from")
        public String from;

        @JsonProperty("to")
        public List<String> to;

        @JsonProperty("cc")
        public List<String> cc;

        @JsonProperty("bcc")
        public List<String> bcc;

        @JsonProperty("replyTo")
        public String replyTo;

        @JsonProperty("subject")
        public String subject;

        @JsonProperty("html")
        public String html;

        @JsonProperty("text")
        public String text;

        @JsonProperty("status")
        public String status;

        @JsonProperty("error")
        public String error;

        @JsonProperty("tags")
        public Map<String, String> tags;

        @JsonProperty("metadata")
        public Map<String, String> metadata;

        @JsonProperty("testMode")
        public boolean testMode;

        @JsonProperty("topicId")
        public String topicId;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("sentAt")
        public String sentAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

    }

    /** BatchSendRequest schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class BatchSendRequest {
        public BatchSendRequest() {
        }

        @JsonProperty("items")
        public List<SendEmailRequest> items;

    }

    /** BatchSendResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class BatchSendResponse {
        public BatchSendResponse() {
        }

        @JsonProperty("results")
        public List<BatchSendItemResponse> results;

    }

    /** CancelResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CancelResponse {
        public CancelResponse() {
        }

        @JsonProperty("cancelled")
        public Boolean cancelled;

    }

    /** BulkCancelResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class BulkCancelResponse {
        public BulkCancelResponse() {
        }

        @JsonProperty("cancelled")
        public long cancelled;

    }

    /** StreamTokenResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class StreamTokenResponse {
        public StreamTokenResponse() {
        }

        @JsonProperty("token")
        public String token;

        @JsonProperty("expiresAt")
        public String expiresAt;

    }

    /** StreamEventResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class StreamEventResponse {
        public StreamEventResponse() {
        }

        @JsonProperty("type")
        public String type;

        @JsonProperty("emailId")
        public String emailId;

        @JsonProperty("occurredAt")
        public String occurredAt;

        @JsonProperty("data")
        public Map<String, String> data;

    }

    /** ValidateLinksRequest schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ValidateLinksRequest {
        public ValidateLinksRequest() {
        }

        @JsonProperty("html")
        public String html;

    }

    /** LinkResultItem schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class LinkResultItem {
        public LinkResultItem() {
        }

        @JsonProperty("url")
        public String url;

        @JsonProperty("status")
        public String status;

        @JsonProperty("statusCode")
        public Long statusCode;

        @JsonProperty("error")
        public String error;

    }

    /** ValidateLinksResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ValidateLinksResponse {
        public ValidateLinksResponse() {
        }

        @JsonProperty("links")
        public List<LinkResultItem> links;

        @JsonProperty("totalLinks")
        public long totalLinks;

        @JsonProperty("brokenLinks")
        public long brokenLinks;

        @JsonProperty("errorLinks")
        public long errorLinks;

    }

    /** MetricsWindowResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class MetricsWindowResponse {
        public MetricsWindowResponse() {
        }

        @JsonProperty("from")
        public String from;

        @JsonProperty("to")
        public String to;

        @JsonProperty("label")
        public String label;

    }

    /** TopicPerformanceResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class TopicPerformanceResponse {
        public TopicPerformanceResponse() {
        }

        @JsonProperty("topicId")
        public String topicId;

        @JsonProperty("topicName")
        public String topicName;

        @JsonProperty("window")
        public MetricsWindowResponse window;

        @JsonProperty("totalEmails")
        public long totalEmails;

        @JsonProperty("delivered")
        public long delivered;

        @JsonProperty("deliveryRate")
        public double deliveryRate;

        @JsonProperty("opened")
        public long opened;

        @JsonProperty("openRate")
        public double openRate;

        @JsonProperty("clicked")
        public long clicked;

        @JsonProperty("clickRate")
        public double clickRate;

        @JsonProperty("bounced")
        public long bounced;

        @JsonProperty("bounceRate")
        public double bounceRate;

        @JsonProperty("complained")
        public long complained;

        @JsonProperty("complaintRate")
        public double complaintRate;

        @JsonProperty("unsubscribed")
        public long unsubscribed;

        @JsonProperty("unsubscribeRate")
        public double unsubscribeRate;

        @JsonProperty("readEngaged")
        public long readEngaged;

        @JsonProperty("readEngagementRate")
        public double readEngagementRate;

        @JsonProperty("avgReadTimeSeconds")
        public Double avgReadTimeSeconds;

        @JsonProperty("optInCount")
        public long optInCount;

        @JsonProperty("optOutCount")
        public long optOutCount;

        @JsonProperty("computedAt")
        public String computedAt;

    }

    /** EmailPerformanceResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class EmailPerformanceResponse {
        public EmailPerformanceResponse() {
        }

        @JsonProperty("emailId")
        public String emailId;

        @JsonProperty("subject")
        public String subject;

        @JsonProperty("fromAddress")
        public String fromAddress;

        @JsonProperty("topicId")
        public String topicId;

        @JsonProperty("status")
        public String status;

        @JsonProperty("delivered")
        public boolean delivered;

        @JsonProperty("opened")
        public boolean opened;

        @JsonProperty("clicked")
        public boolean clicked;

        @JsonProperty("totalClicks")
        public long totalClicks;

        @JsonProperty("bounced")
        public boolean bounced;

        @JsonProperty("complained")
        public boolean complained;

        @JsonProperty("unsubscribed")
        public boolean unsubscribed;

        @JsonProperty("readEngaged")
        public boolean readEngaged;

        @JsonProperty("readTimeSeconds")
        public Double readTimeSeconds;

        @JsonProperty("readCategory")
        public String readCategory;

        @JsonProperty("sentAt")
        public String sentAt;

        @JsonProperty("lastEventAt")
        public String lastEventAt;

        @JsonProperty("computedAt")
        public String computedAt;

    }

    /** EmailReadScrollAnalyticsResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class EmailReadScrollAnalyticsResponse {
        public EmailReadScrollAnalyticsResponse() {
        }

        @JsonProperty("emailId")
        public String emailId;

        @JsonProperty("subject")
        public String subject;

        @JsonProperty("computedAt")
        public String computedAt;

        @JsonProperty("readEngaged")
        public boolean readEngaged;

        @JsonProperty("readTimeSeconds")
        public Double readTimeSeconds;

        @JsonProperty("readCategory")
        public String readCategory;

        @JsonProperty("mailClient")
        public String mailClient;

        @JsonProperty("deviceType")
        public String deviceType;

        @JsonProperty("os")
        public String os;

        @JsonProperty("readEngagedAt")
        public String readEngagedAt;

        @JsonProperty("shortEmail")
        public boolean shortEmail;

        @JsonProperty("depth25Count")
        public long depth25Count;

        @JsonProperty("depth50Count")
        public long depth50Count;

        @JsonProperty("depth75Count")
        public long depth75Count;

        @JsonProperty("depth100Count")
        public long depth100Count;

        @JsonProperty("maxDepthPct")
        public Long maxDepthPct;

        @JsonProperty("depth25Rate")
        public Double depth25Rate;

        @JsonProperty("depth50Rate")
        public Double depth50Rate;

        @JsonProperty("depth75Rate")
        public Double depth75Rate;

        @JsonProperty("depth100Rate")
        public Double depth100Rate;

    }

    /** ProjectMetricsSummaryResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ProjectMetricsSummaryResponse {
        public ProjectMetricsSummaryResponse() {
        }

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("window")
        public MetricsWindowResponse window;

        @JsonProperty("sent")
        public long sent;

        @JsonProperty("delivered")
        public long delivered;

        @JsonProperty("opened")
        public long opened;

        @JsonProperty("clicked")
        public long clicked;

        @JsonProperty("bounced")
        public long bounced;

        @JsonProperty("complained")
        public long complained;

        @JsonProperty("failed")
        public long failed;

        @JsonProperty("unsubscribed")
        public long unsubscribed;

        @JsonProperty("readEngaged")
        public long readEngaged;

        @JsonProperty("deliveryRate")
        public double deliveryRate;

        @JsonProperty("openRate")
        public double openRate;

        @JsonProperty("clickRate")
        public double clickRate;

        @JsonProperty("bounceRate")
        public double bounceRate;

        @JsonProperty("complaintRate")
        public double complaintRate;

        @JsonProperty("readEngagementRate")
        public double readEngagementRate;

    }

    /** ProjectTimelineBucketResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ProjectTimelineBucketResponse {
        public ProjectTimelineBucketResponse() {
        }

        @JsonProperty("bucket")
        public String bucket;

        @JsonProperty("type")
        public String type;

        @JsonProperty("count")
        public long count;

    }

    /** ProjectMetricsTimelineResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ProjectMetricsTimelineResponse {
        public ProjectMetricsTimelineResponse() {
        }

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("window")
        public MetricsWindowResponse window;

        @JsonProperty("granularity")
        public String granularity;

        @JsonProperty("format")
        public String format;

        @JsonProperty("buckets")
        public List<ProjectTimelineBucketResponse> buckets;

    }

    /** AdvisorRecommendationDataResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class AdvisorRecommendationDataResponse {
        public AdvisorRecommendationDataResponse() {
        }

        @JsonProperty("bounceRate")
        public Double bounceRate;

        @JsonProperty("bounced")
        public Long bounced;

        @JsonProperty("accepted")
        public Long accepted;

        @JsonProperty("complaintRate")
        public Double complaintRate;

        @JsonProperty("accepted24h")
        public Long accepted24h;

        @JsonProperty("avgDailyAccepted7d")
        public Long avgDailyAccepted7d;

        @JsonProperty("daysSinceLastSend")
        public Long daysSinceLastSend;

        @JsonProperty("reportedOpenRate")
        public Double reportedOpenRate;

        @JsonProperty("adjustedOpenRate")
        public Double adjustedOpenRate;

        @JsonProperty("proxyRate")
        public Double proxyRate;

        @JsonProperty("proxyOpens")
        public Long proxyOpens;

        @JsonProperty("totalOpens")
        public Long totalOpens;

        @JsonProperty("humanOpenRate")
        public Double humanOpenRate;

        @JsonProperty("delivered")
        public Long delivered;

        @JsonProperty("unsubRate")
        public Double unsubRate;

        @JsonProperty("unsubscribed")
        public Long unsubscribed;

        @JsonProperty("dmarcAlignmentFailureRate7d")
        public Double dmarcAlignmentFailureRate7d;

        @JsonProperty("dmarcDomain")
        public String dmarcDomain;

        @JsonProperty("dmarcCurrentPolicy")
        public String dmarcCurrentPolicy;

        @JsonProperty("dmarcRecommendedPolicy")
        public String dmarcRecommendedPolicy;

        @JsonProperty("dmarcObservedMessages")
        public Long dmarcObservedMessages;

        @JsonProperty("dmarcAlignedMessages")
        public Long dmarcAlignedMessages;

        @JsonProperty("dmarcAccountedRate")
        public Double dmarcAccountedRate;

        @JsonProperty("dmarcUnknownMessages")
        public Long dmarcUnknownMessages;

        @JsonProperty("dmarcUnknownSources")
        public Long dmarcUnknownSources;

        @JsonProperty("dmarcReportingDays")
        public Long dmarcReportingDays;

    }

    /** AdvisorRecommendationResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class AdvisorRecommendationResponse {
        public AdvisorRecommendationResponse() {
        }

        @JsonProperty("code")
        public String code;

        @JsonProperty("severity")
        public String severity;

        @JsonProperty("title")
        public String title;

        @JsonProperty("message")
        public String message;

        @JsonProperty("data")
        public AdvisorRecommendationDataResponse data;

    }

    /** AdvisorReportResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class AdvisorReportResponse {
        public AdvisorReportResponse() {
        }

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("generatedAt")
        public String generatedAt;

        @JsonProperty("score")
        public long score;

        @JsonProperty("recommendations")
        public List<AdvisorRecommendationResponse> recommendations;

    }

    /** SuppressionResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SuppressionResponse {
        public SuppressionResponse() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("email")
        public String email;

        @JsonProperty("reason")
        public String reason;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("contactId")
        public String contactId;

    }

    /** PageInfo schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class PageInfo {
        public PageInfo() {
        }

        @JsonProperty("page")
        public long page;

        @JsonProperty("size")
        public long size;

        @JsonProperty("total")
        public long total;

        @JsonProperty("totalPages")
        public long totalPages;

        @JsonProperty("hasNextPage")
        public boolean hasNextPage;

        @JsonProperty("hasPreviousPage")
        public boolean hasPreviousPage;

    }

    /** SuppressionPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SuppressionPageResponse {
        public SuppressionPageResponse() {
        }

        @JsonProperty("data")
        public List<SuppressionResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** AddSuppressionBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class AddSuppressionBody {
        public AddSuppressionBody() {
        }

        @JsonProperty("email")
        public String email;

    }

    /** SuppressionImportRowSerializable schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SuppressionImportRowSerializable {
        public SuppressionImportRowSerializable() {
        }

        @JsonProperty("email")
        public String email;

        @JsonProperty("reason")
        public String reason;

    }

    /** SuppressionImportBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SuppressionImportBody {
        public SuppressionImportBody() {
        }

        @JsonProperty("suppressions")
        public List<SuppressionImportRowSerializable> suppressions;

    }

    /** SuppressionImportResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SuppressionImportResponse {
        public SuppressionImportResponse() {
        }

        @JsonProperty("imported")
        public long imported;

        @JsonProperty("skipped")
        public long skipped;

    }

    /** SegmentResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SegmentResponse {
        public SegmentResponse() {
        }

        @JsonProperty("object")
        public String object;

        @JsonProperty("id")
        public String id;

        @JsonProperty("name")
        public String name;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("contactCount")
        public Long contactCount;

        @JsonProperty("unsubscribedCount")
        public Long unsubscribedCount;

    }

    /** SegmentPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SegmentPageResponse {
        public SegmentPageResponse() {
        }

        @JsonProperty("data")
        public List<SegmentResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** SegmentContactResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SegmentContactResponse {
        public SegmentContactResponse() {
        }

        @JsonProperty("contactId")
        public String contactId;

        @JsonProperty("email")
        public String email;

        @JsonProperty("firstName")
        public String firstName;

        @JsonProperty("lastName")
        public String lastName;

        @JsonProperty("segments")
        public List<String> segments;

    }

    /** CursorInfo schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CursorInfo {
        public CursorInfo() {
        }

        @JsonProperty("nextCursor")
        public String nextCursor;

        @JsonProperty("previousCursor")
        public String previousCursor;

        @JsonProperty("hasNextPage")
        public boolean hasNextPage;

        @JsonProperty("hasPreviousPage")
        public boolean hasPreviousPage;

    }

    /** CursorPage schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CursorPage {
        public CursorPage() {
        }

        @JsonProperty("data")
        public List<SegmentContactResponse> data;

        @JsonProperty("cursor")
        public CursorInfo cursor;

    }

    /** CreateSegmentBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CreateSegmentBody {
        public CreateSegmentBody() {
        }

        @JsonProperty("name")
        public String name;

    }

    /** TopicResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class TopicResponse {
        public TopicResponse() {
        }

        @JsonProperty("object")
        public String object;

        @JsonProperty("id")
        public String id;

        @JsonProperty("name")
        public String name;

        @JsonProperty("defaultSubscription")
        public String defaultSubscription;

        @JsonProperty("description")
        public String description;

        @JsonProperty("visibility")
        public String visibility;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("optInCount")
        public long optInCount;

        @JsonProperty("optOutCount")
        public long optOutCount;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

    }

    /** TopicPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class TopicPageResponse {
        public TopicPageResponse() {
        }

        @JsonProperty("data")
        public List<TopicResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** CreateTopicBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CreateTopicBody {
        public CreateTopicBody() {
        }

        @JsonProperty("name")
        public String name;

        @JsonProperty("defaultSubscription")
        public String defaultSubscription;

        @JsonProperty("description")
        public String description;

        @JsonProperty("visibility")
        public String visibility;

    }

    /** UpdateTopicBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class UpdateTopicBody {
        public UpdateTopicBody() {
        }

        @JsonProperty("name")
        public String name;

        @JsonProperty("description")
        public String description;

        @JsonProperty("visibility")
        public String visibility;

    }

    /** ContactPropertyResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ContactPropertyResponse {
        public ContactPropertyResponse() {
        }

        @JsonProperty("object")
        public String object;

        @JsonProperty("id")
        public String id;

        @JsonProperty("key")
        public String key;

        @JsonProperty("type")
        public String type;

        @JsonProperty("fallbackValue")
        public String fallbackValue;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

    }

    /** ContactPropertyPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ContactPropertyPageResponse {
        public ContactPropertyPageResponse() {
        }

        @JsonProperty("data")
        public List<ContactPropertyResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** CreateContactPropertyBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CreateContactPropertyBody {
        public CreateContactPropertyBody() {
        }

        @JsonProperty("key")
        public String key;

        @JsonProperty("type")
        public String type;

        @JsonProperty("fallbackValue")
        public String fallbackValue;

    }

    /** UpdateContactPropertyBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class UpdateContactPropertyBody {
        public UpdateContactPropertyBody() {
        }

        @JsonProperty("fallbackValue")
        public String fallbackValue;

    }

    /** TopicSubscriptionResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class TopicSubscriptionResponse {
        public TopicSubscriptionResponse() {
        }

        @JsonProperty("topicId")
        public String topicId;

        @JsonProperty("subscription")
        public String subscription;

    }

    /** ContactResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ContactResponse {
        public ContactResponse() {
        }

        @JsonProperty("object")
        public String object;

        @JsonProperty("id")
        public String id;

        @JsonProperty("email")
        public String email;

        @JsonProperty("phone")
        public String phone;

        @JsonProperty("firstName")
        public String firstName;

        @JsonProperty("lastName")
        public String lastName;

        @JsonProperty("unsubscribed")
        public boolean unsubscribed;

        @JsonProperty("properties")
        public Map<String, String> properties;

        @JsonProperty("profileImageUrl")
        public String profileImageUrl;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("segments")
        public List<String> segments;

        @JsonProperty("topics")
        public List<TopicSubscriptionResponse> topics;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

    }

    /** ContactPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ContactPageResponse {
        public ContactPageResponse() {
        }

        @JsonProperty("data")
        public List<ContactResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** SegmentRef schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SegmentRef {
        public SegmentRef() {
        }

        @JsonProperty("id")
        public String id;

    }

    /** TopicSubscriptionBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class TopicSubscriptionBody {
        public TopicSubscriptionBody() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("subscription")
        public String subscription;

    }

    /** CreateContactBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CreateContactBody {
        public CreateContactBody() {
        }

        @JsonProperty("email")
        public String email;

        @JsonProperty("phone")
        public String phone;

        @JsonProperty("firstName")
        public String firstName;

        @JsonProperty("lastName")
        public String lastName;

        @JsonProperty("unsubscribed")
        public Boolean unsubscribed;

        @JsonProperty("properties")
        public Map<String, String> properties;

        @JsonProperty("segments")
        public List<SegmentRef> segments;

        @JsonProperty("topics")
        public List<TopicSubscriptionBody> topics;

    }

    /** UpdateContactBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class UpdateContactBody {
        public UpdateContactBody() {
        }

        @JsonProperty("firstName")
        public String firstName;

        @JsonProperty("lastName")
        public String lastName;

        @JsonProperty("phone")
        public String phone;

        @JsonProperty("unsubscribed")
        public Boolean unsubscribed;

        @JsonProperty("properties")
        public Map<String, String> properties;

    }

    /** SetImageUrlBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class SetImageUrlBody {
        public SetImageUrlBody() {
        }

        @JsonProperty("url")
        public String url;

    }

    /** AddToSegmentBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class AddToSegmentBody {
        public AddToSegmentBody() {
        }

        @JsonProperty("segmentId")
        public String segmentId;

    }

    /** UpdateTopicsBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class UpdateTopicsBody {
        public UpdateTopicsBody() {
        }

        @JsonProperty("topics")
        public List<TopicSubscriptionBody> topics;

    }

    /** ActivityMetadataResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ActivityMetadataResponse {
        public ActivityMetadataResponse() {
        }

        @JsonProperty("topicId")
        public String topicId;

    }

    /** ActivityResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ActivityResponse {
        public ActivityResponse() {
        }

        @JsonProperty("object")
        public String object;

        @JsonProperty("id")
        public String id;

        @JsonProperty("type")
        public String type;

        @JsonProperty("referenceId")
        public String referenceId;

        @JsonProperty("referenceName")
        public String referenceName;

        @JsonProperty("metadata")
        public ActivityMetadataResponse metadata;

        @JsonProperty("occurredAt")
        public String occurredAt;

    }

    /** EngagementScoreResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class EngagementScoreResponse {
        public EngagementScoreResponse() {
        }

        @JsonProperty("object")
        public String object;

        @JsonProperty("score")
        public long score;

        @JsonProperty("tier")
        public String tier;

        @JsonProperty("scoredAt")
        public String scoredAt;

    }

    /** EmailValidationStatusResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class EmailValidationStatusResponse {
        public EmailValidationStatusResponse() {
        }

        @JsonProperty("object")
        public String object;

        @JsonProperty("status")
        public String status;

        @JsonProperty("reason")
        public String reason;

        @JsonProperty("validatedAt")
        public String validatedAt;

    }

    /** RecordValidationBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class RecordValidationBody {
        public RecordValidationBody() {
        }

        @JsonProperty("status")
        public EmailValidationStatusInput status;

        @JsonProperty("reason")
        public String reason;

    }

    /** WebhookFilterSerializable schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class WebhookFilterSerializable {
        public WebhookFilterSerializable() {
        }

        @JsonProperty("field")
        public String field;

        @JsonProperty("operator")
        public String operator;

        @JsonProperty("value")
        public String value;

    }

    /** WebhookTransformationSerializable schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class WebhookTransformationSerializable {
        public WebhookTransformationSerializable() {
        }

        @JsonProperty("type")
        public String type;

        @JsonProperty("from")
        public String from;

        @JsonProperty("to")
        public String to;

        @JsonProperty("field")
        public String field;

        @JsonProperty("value")
        public String value;

        @JsonProperty("template")
        public String template;

    }

    /** WebhookResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class WebhookResponse {
        public WebhookResponse() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("name")
        public String name;

        @JsonProperty("url")
        public String url;

        @JsonProperty("events")
        public List<String> events;

        @JsonProperty("enabled")
        public boolean enabled;

        @JsonProperty("filters")
        public List<WebhookFilterSerializable> filters;

        @JsonProperty("transformations")
        public List<WebhookTransformationSerializable> transformations;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

    }

    /** WebhookPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class WebhookPageResponse {
        public WebhookPageResponse() {
        }

        @JsonProperty("data")
        public List<WebhookResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** WebhookDeliveryResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class WebhookDeliveryResponse {
        public WebhookDeliveryResponse() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("webhookEndpointId")
        public String webhookEndpointId;

        @JsonProperty("eventType")
        public String eventType;

        @JsonProperty("status")
        public String status;

        @JsonProperty("attemptCount")
        public long attemptCount;

        @JsonProperty("lastStatusCode")
        public Long lastStatusCode;

        @JsonProperty("lastError")
        public String lastError;

        @JsonProperty("responseBodySnippet")
        public String responseBodySnippet;

        @JsonProperty("nextAttemptAt")
        public String nextAttemptAt;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

    }

    /** WebhookDeliveryPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class WebhookDeliveryPageResponse {
        public WebhookDeliveryPageResponse() {
        }

        @JsonProperty("data")
        public List<WebhookDeliveryResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** CreateWebhookBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class CreateWebhookBody {
        public CreateWebhookBody() {
        }

        @JsonProperty("url")
        public String url;

        @JsonProperty("events")
        public List<String> events;

        @JsonProperty("name")
        public String name;

        @JsonProperty("secret")
        public String secret;

        @JsonProperty("filters")
        public List<WebhookFilterSerializable> filters;

        @JsonProperty("transformations")
        public List<WebhookTransformationSerializable> transformations;

    }

    /** WebhookCreateResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class WebhookCreateResponse {
        public WebhookCreateResponse() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("name")
        public String name;

        @JsonProperty("url")
        public String url;

        @JsonProperty("events")
        public List<String> events;

        @JsonProperty("enabled")
        public boolean enabled;

        @JsonProperty("filters")
        public List<WebhookFilterSerializable> filters;

        @JsonProperty("transformations")
        public List<WebhookTransformationSerializable> transformations;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

        @JsonProperty("secret")
        public String secret;

    }

    /** UpdateWebhookBody schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class UpdateWebhookBody {
        public UpdateWebhookBody() {
        }

        @JsonProperty("name")
        public String name;

        @JsonProperty("url")
        public String url;

        @JsonProperty("events")
        public List<String> events;

        @JsonProperty("secret")
        public String secret;

        @JsonProperty("enabled")
        public Boolean enabled;

        @JsonProperty("filters")
        public List<WebhookFilterSerializable> filters;

        @JsonProperty("transformations")
        public List<WebhookTransformationSerializable> transformations;

    }

    /** ApiKey schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ApiKey {
        public ApiKey() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("configId")
        public String configId;

        @JsonProperty("name")
        public String name;

        @JsonProperty("start")
        public String start;

        @JsonProperty("prefix")
        public String prefix;

        @JsonProperty("organizationId")
        public String organizationId;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("enabled")
        public boolean enabled;

        @JsonProperty("rateLimitEnabled")
        public boolean rateLimitEnabled;

        @JsonProperty("rateLimitTimeWindow")
        public Long rateLimitTimeWindow;

        @JsonProperty("rateLimitMax")
        public Long rateLimitMax;

        @JsonProperty("requestCount")
        public long requestCount;

        @JsonProperty("remaining")
        public Long remaining;

        @JsonProperty("lastRequest")
        public String lastRequest;

        @JsonProperty("expiresAt")
        public String expiresAt;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

        @JsonProperty("metadata")
        public Map<String, String> metadata;

        @JsonProperty("permissions")
        public Map<String, List<String>> permissions;

    }

    /** ApiKeyUsageRecord schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ApiKeyUsageRecord {
        public ApiKeyUsageRecord() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("keyId")
        public String keyId;

        @JsonProperty("orgId")
        public String orgId;

        @JsonProperty("method")
        public String method;

        @JsonProperty("route")
        public String route;

        @JsonProperty("statusCode")
        public long statusCode;

        @JsonProperty("durationMs")
        public Long durationMs;

        @JsonProperty("ip")
        public String ip;

        @JsonProperty("ts")
        public String ts;

    }

    /** UsagePage schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class UsagePage {
        public UsagePage() {
        }

        @JsonProperty("size")
        public long size;

        @JsonProperty("totalPages")
        public long totalPages;

        @JsonProperty("hasMore")
        public boolean hasMore;

    }

    /** ApiKeyUsageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ApiKeyUsageResponse {
        public ApiKeyUsageResponse() {
        }

        @JsonProperty("data")
        public List<ApiKeyUsageRecord> data;

        @JsonProperty("page")
        public UsagePage page;

    }

    /** ProjectLimitsModel schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ProjectLimitsModel {
        public ProjectLimitsModel() {
        }

        @JsonProperty("dailySends")
        public long dailySends;

        @JsonProperty("perSecondSends")
        public long perSecondSends;

        @JsonProperty("maxRecipientsPerMessage")
        public long maxRecipientsPerMessage;

        @JsonProperty("maxDomains")
        public long maxDomains;

        @JsonProperty("maxApiKeys")
        public long maxApiKeys;

        @JsonProperty("maxWebhooks")
        public long maxWebhooks;

    }

    /** ProjectTrackingSettingsModel schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ProjectTrackingSettingsModel {
        public ProjectTrackingSettingsModel() {
        }

        @JsonProperty("openTracking")
        public boolean openTracking;

        @JsonProperty("clickTracking")
        public boolean clickTracking;

        @JsonProperty("unsubscribeTracking")
        public boolean unsubscribeTracking;

        @JsonProperty("readEngagement")
        public boolean readEngagement;

        @JsonProperty("scrollDepth")
        public Boolean scrollDepth;

    }

    /** ProjectResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ProjectResponse {
        public ProjectResponse() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("name")
        public String name;

        @JsonProperty("slug")
        public String slug;

        @JsonProperty("status")
        public String status;

        @JsonProperty("suspensionReason")
        public String suspensionReason;

        @JsonProperty("region")
        public String region;

        @JsonProperty("limits")
        public ProjectLimitsModel limits;

        @JsonProperty("trackingSettings")
        public ProjectTrackingSettingsModel trackingSettings;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

    }

    /** ProjectPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ProjectPageResponse {
        public ProjectPageResponse() {
        }

        @JsonProperty("data")
        public List<ProjectResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** UpdateProjectRequest schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class UpdateProjectRequest {
        public UpdateProjectRequest() {
        }

        @JsonProperty("name")
        public String name;

        @JsonProperty("slug")
        public String slug;

        @JsonProperty("limits")
        public ProjectLimitsModel limits;

        @JsonProperty("trackingSettings")
        public ProjectTrackingSettingsModel trackingSettings;

    }

    /** EmailPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class EmailPageResponse {
        public EmailPageResponse() {
        }

        @JsonProperty("data")
        public List<EmailDetailResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** EmailTimelineItem schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class EmailTimelineItem {
        public EmailTimelineItem() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("type")
        public String type;

        @JsonProperty("providerEventId")
        public String providerEventId;

        @JsonProperty("payload")
        public Map<String, String> payload;

        @JsonProperty("occurredAt")
        public String occurredAt;

        @JsonProperty("createdAt")
        public String createdAt;

    }

    /** EmailTimelineResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class EmailTimelineResponse {
        public EmailTimelineResponse() {
        }

        @JsonProperty("items")
        public List<EmailTimelineItem> items;

    }

    /** DomainListItemResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class DomainListItemResponse {
        public DomainListItemResponse() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("domain")
        public String domain;

        @JsonProperty("region")
        public String region;

        @JsonProperty("status")
        public String status;

        @JsonProperty("dkimStatus")
        public String dkimStatus;

        @JsonProperty("bimiStatus")
        public String bimiStatus;

        @JsonProperty("trackingStatus")
        public String trackingStatus;

        @JsonProperty("updatedAt")
        public String updatedAt;

    }

    /** DomainListPageResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class DomainListPageResponse {
        public DomainListPageResponse() {
        }

        @JsonProperty("data")
        public List<DomainListItemResponse> data;

        @JsonProperty("page")
        public PageInfo page;

    }

    /** DkimRecordResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class DkimRecordResponse {
        public DkimRecordResponse() {
        }

        @JsonProperty("name")
        public String name;

        @JsonProperty("type")
        public String type;

        @JsonProperty("value")
        public String value;

        @JsonProperty("status")
        public String status;

    }

    /** DnsRecordResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class DnsRecordResponse {
        public DnsRecordResponse() {
        }

        @JsonProperty("name")
        public String name;

        @JsonProperty("type")
        public String type;

        @JsonProperty("value")
        public String value;

        @JsonProperty("priority")
        public Long priority;

        @JsonProperty("optional")
        public Boolean optional;

        @JsonProperty("status")
        public String status;

    }

    /** VerificationRecordsResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class VerificationRecordsResponse {
        public VerificationRecordsResponse() {
        }

        @JsonProperty("dkim")
        public List<DkimRecordResponse> dkim;

        @JsonProperty("mailFromMx")
        public DnsRecordResponse mailFromMx;

        @JsonProperty("mailFromSpf")
        public DnsRecordResponse mailFromSpf;

        @JsonProperty("dmarcRecommended")
        public DnsRecordResponse dmarcRecommended;

        @JsonProperty("bimi")
        public DnsRecordResponse bimi;

        @JsonProperty("trackingCname")
        public DnsRecordResponse trackingCname;

    }

    /** DomainResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class DomainResponse {
        public DomainResponse() {
        }

        @JsonProperty("id")
        public String id;

        @JsonProperty("projectId")
        public String projectId;

        @JsonProperty("domain")
        public String domain;

        @JsonProperty("region")
        public String region;

        @JsonProperty("status")
        public String status;

        @JsonProperty("dkimStatus")
        public String dkimStatus;

        @JsonProperty("spfStatus")
        public String spfStatus;

        @JsonProperty("dmarcStatus")
        public String dmarcStatus;

        @JsonProperty("mailFromStatus")
        public String mailFromStatus;

        @JsonProperty("mailFromDomain")
        public String mailFromDomain;

        @JsonProperty("verificationRecords")
        public VerificationRecordsResponse verificationRecords;

        @JsonProperty("bimiStatus")
        public String bimiStatus;

        @JsonProperty("bimiLogoUrl")
        public String bimiLogoUrl;

        @JsonProperty("createdAt")
        public String createdAt;

        @JsonProperty("updatedAt")
        public String updatedAt;

        @JsonProperty("verifiedAt")
        public String verifiedAt;

    }

    /** RegisterDomainRequest schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class RegisterDomainRequest {
        public RegisterDomainRequest() {
        }

        @JsonProperty("domain")
        public String domain;

        @JsonProperty("region")
        public String region;

    }

    /** UpdateBimiRequest schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class UpdateBimiRequest {
        public UpdateBimiRequest() {
        }

        @JsonProperty("logoUrl")
        public String logoUrl;

    }

    /** EmailValidationStatusInput enumeration. */
    public enum EmailValidationStatusInput {
        Valid("valid"),
        Risky("risky"),
        Invalid("invalid"),
        Unknown("unknown"),
        ;

        private final String wireValue;

        EmailValidationStatusInput(String wireValue) {
            this.wireValue = wireValue;
        }

        @JsonValue
        public String wireValue() {
            return wireValue;
        }

        @JsonCreator
        public static EmailValidationStatusInput fromWireValue(String value) {
            for (EmailValidationStatusInput candidate : values()) {
                if (candidate.wireValue.equals(value)) return candidate;
            }
            throw new IllegalArgumentException("Unknown EmailValidationStatusInput value: " + value);
        }

        @Override
        public String toString() {
            return wireValue;
        }
    }

    /** GetTopicPerformanceQuery schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class GetTopicPerformanceQuery {
        public GetTopicPerformanceQuery() {
        }

        @JsonProperty("window")
        public String window;

        @JsonProperty("projectId")
        public String projectId;

    }

    /** GetProjectMetricsSummaryQuery schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class GetProjectMetricsSummaryQuery {
        public GetProjectMetricsSummaryQuery() {
        }

        @JsonProperty("window")
        public String window;

        @JsonProperty("projectId")
        public String projectId;

    }

    /** GetProjectMetricsTimelineQuery schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class GetProjectMetricsTimelineQuery {
        public GetProjectMetricsTimelineQuery() {
        }

        @JsonProperty("window")
        public String window;

        @JsonProperty("granularity")
        public String granularity;

        @JsonProperty("format")
        public String format;

        @JsonProperty("projectId")
        public String projectId;

    }

    /** GetMetricsAdvisorQuery schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class GetMetricsAdvisorQuery {
        public GetMetricsAdvisorQuery() {
        }

        @JsonProperty("projectId")
        public String projectId;

    }

    /** ListContactSegmentsResponse typed alias. */
    public record ListContactSegmentsResponse(List<String> value) {
        @JsonCreator(mode = JsonCreator.Mode.DELEGATING)
        public ListContactSegmentsResponse {
        }

        @JsonValue
        public List<String> value() {
            return value;
        }
    }

    /** GetContactTopicsResponse typed alias. */
    public record GetContactTopicsResponse(List<TopicSubscriptionResponse> value) {
        @JsonCreator(mode = JsonCreator.Mode.DELEGATING)
        public GetContactTopicsResponse {
        }

        @JsonValue
        public List<TopicSubscriptionResponse> value() {
            return value;
        }
    }

    /** GetContactActivityResponse typed alias. */
    public record GetContactActivityResponse(List<ActivityResponse> value) {
        @JsonCreator(mode = JsonCreator.Mode.DELEGATING)
        public GetContactActivityResponse {
        }

        @JsonValue
        public List<ActivityResponse> value() {
            return value;
        }
    }

    /** ListApiKeysResponse schema model. */
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ListApiKeysResponse {
        public ListApiKeysResponse() {
        }

        @JsonIgnore
        private final Map<String, List<ApiKey>> additionalProperties = new LinkedHashMap<>();

        @JsonAnyGetter
        public Map<String, List<ApiKey>> additionalProperties() {
            return additionalProperties;
        }

        @JsonAnySetter
        public void additionalProperty(String name, List<ApiKey> value) {
            additionalProperties.put(name, value);
        }
    }

}
