# Apollo Signal API generated types

[Documentation index](./README.md) · [SDK overview](../README.md)

## Index

| Type | Kind | Description |
|---|---|---|
| [`AttachmentRequest`](#attachmentrequest) | Model | — |
| [`DeliveryWindowRequest`](#deliverywindowrequest) | Model | — |
| [`TrackingSettingsRequest`](#trackingsettingsrequest) | Model | — |
| [`SendEmailRequest`](#sendemailrequest) | Model | — |
| [`BatchSendItemResponse`](#batchsenditemresponse) | Model | — |
| [`SendEmailResponse`](#sendemailresponse) | Model | — |
| [`EmailDetailResponse`](#emaildetailresponse) | Model | — |
| [`BatchSendRequest`](#batchsendrequest) | Model | — |
| [`BatchSendResponse`](#batchsendresponse) | Model | — |
| [`CancelResponse`](#cancelresponse) | Model | — |
| [`BulkCancelResponse`](#bulkcancelresponse) | Model | — |
| [`StreamTokenResponse`](#streamtokenresponse) | Model | — |
| [`StreamEventResponse`](#streameventresponse) | Model | — |
| [`ValidateLinksRequest`](#validatelinksrequest) | Model | — |
| [`LinkResultItem`](#linkresultitem) | Model | — |
| [`ValidateLinksResponse`](#validatelinksresponse) | Model | — |
| [`MetricsWindowResponse`](#metricswindowresponse) | Model | — |
| [`TopicPerformanceResponse`](#topicperformanceresponse) | Model | — |
| [`EmailPerformanceResponse`](#emailperformanceresponse) | Model | — |
| [`EmailReadScrollAnalyticsResponse`](#emailreadscrollanalyticsresponse) | Model | — |
| [`ProjectMetricsSummaryResponse`](#projectmetricssummaryresponse) | Model | — |
| [`ProjectTimelineBucketResponse`](#projecttimelinebucketresponse) | Model | — |
| [`ProjectMetricsTimelineResponse`](#projectmetricstimelineresponse) | Model | — |
| [`AdvisorRecommendationDataResponse`](#advisorrecommendationdataresponse) | Model | — |
| [`AdvisorRecommendationResponse`](#advisorrecommendationresponse) | Model | — |
| [`AdvisorReportResponse`](#advisorreportresponse) | Model | — |
| [`SuppressionResponse`](#suppressionresponse) | Model | — |
| [`PageInfo`](#pageinfo) | Model | — |
| [`SuppressionPageResponse`](#suppressionpageresponse) | Model | — |
| [`AddSuppressionBody`](#addsuppressionbody) | Model | — |
| [`SuppressionImportRowSerializable`](#suppressionimportrowserializable) | Model | — |
| [`SuppressionImportBody`](#suppressionimportbody) | Model | — |
| [`SuppressionImportResponse`](#suppressionimportresponse) | Model | — |
| [`SegmentResponse`](#segmentresponse) | Model | — |
| [`SegmentPageResponse`](#segmentpageresponse) | Model | — |
| [`SegmentContactResponse`](#segmentcontactresponse) | Model | — |
| [`CursorInfo`](#cursorinfo) | Model | — |
| [`CursorPage`](#cursorpage) | Model | — |
| [`CreateSegmentBody`](#createsegmentbody) | Model | — |
| [`TopicResponse`](#topicresponse) | Model | — |
| [`TopicPageResponse`](#topicpageresponse) | Model | — |
| [`CreateTopicBody`](#createtopicbody) | Model | — |
| [`UpdateTopicBody`](#updatetopicbody) | Model | — |
| [`ContactPropertyResponse`](#contactpropertyresponse) | Model | — |
| [`ContactPropertyPageResponse`](#contactpropertypageresponse) | Model | — |
| [`CreateContactPropertyBody`](#createcontactpropertybody) | Model | — |
| [`UpdateContactPropertyBody`](#updatecontactpropertybody) | Model | — |
| [`TopicSubscriptionResponse`](#topicsubscriptionresponse) | Model | — |
| [`ContactResponse`](#contactresponse) | Model | — |
| [`ContactPageResponse`](#contactpageresponse) | Model | — |
| [`SegmentRef`](#segmentref) | Model | — |
| [`TopicSubscriptionBody`](#topicsubscriptionbody) | Model | — |
| [`CreateContactBody`](#createcontactbody) | Model | — |
| [`UpdateContactBody`](#updatecontactbody) | Model | — |
| [`SetImageUrlBody`](#setimageurlbody) | Model | — |
| [`AddToSegmentBody`](#addtosegmentbody) | Model | — |
| [`UpdateTopicsBody`](#updatetopicsbody) | Model | — |
| [`ActivityMetadataResponse`](#activitymetadataresponse) | Model | — |
| [`ActivityResponse`](#activityresponse) | Model | — |
| [`EngagementScoreResponse`](#engagementscoreresponse) | Model | — |
| [`EmailValidationStatusResponse`](#emailvalidationstatusresponse) | Model | — |
| [`RecordValidationBody`](#recordvalidationbody) | Model | — |
| [`WebhookFilterSerializable`](#webhookfilterserializable) | Model | — |
| [`WebhookTransformationSerializable`](#webhooktransformationserializable) | Model | — |
| [`WebhookResponse`](#webhookresponse) | Model | — |
| [`WebhookPageResponse`](#webhookpageresponse) | Model | — |
| [`WebhookDeliveryResponse`](#webhookdeliveryresponse) | Model | — |
| [`WebhookDeliveryPageResponse`](#webhookdeliverypageresponse) | Model | — |
| [`CreateWebhookBody`](#createwebhookbody) | Model | — |
| [`WebhookCreateResponse`](#webhookcreateresponse) | Model | — |
| [`UpdateWebhookBody`](#updatewebhookbody) | Model | — |
| [`ApiKey`](#apikey) | Model | — |
| [`ApiKeyUsageRecord`](#apikeyusagerecord) | Model | — |
| [`UsagePage`](#usagepage) | Model | — |
| [`ApiKeyUsageResponse`](#apikeyusageresponse) | Model | — |
| [`ProjectLimitsModel`](#projectlimitsmodel) | Model | — |
| [`ProjectTrackingSettingsModel`](#projecttrackingsettingsmodel) | Model | — |
| [`ProjectResponse`](#projectresponse) | Model | — |
| [`ProjectPageResponse`](#projectpageresponse) | Model | — |
| [`UpdateProjectRequest`](#updateprojectrequest) | Model | — |
| [`EmailPageResponse`](#emailpageresponse) | Model | — |
| [`EmailTimelineItem`](#emailtimelineitem) | Model | — |
| [`EmailTimelineResponse`](#emailtimelineresponse) | Model | — |
| [`DomainListItemResponse`](#domainlistitemresponse) | Model | — |
| [`DomainListPageResponse`](#domainlistpageresponse) | Model | — |
| [`DkimRecordResponse`](#dkimrecordresponse) | Model | — |
| [`DnsRecordResponse`](#dnsrecordresponse) | Model | — |
| [`VerificationRecordsResponse`](#verificationrecordsresponse) | Model | — |
| [`DomainResponse`](#domainresponse) | Model | — |
| [`RegisterDomainRequest`](#registerdomainrequest) | Model | — |
| [`UpdateBimiRequest`](#updatebimirequest) | Model | — |
| [`EmailValidationStatusInput`](#emailvalidationstatusinput) | Enum | — |
| [`GetTopicPerformanceQuery`](#gettopicperformancequery) | Model | — |
| [`GetProjectMetricsSummaryQuery`](#getprojectmetricssummaryquery) | Model | — |
| [`GetProjectMetricsTimelineQuery`](#getprojectmetricstimelinequery) | Model | — |
| [`GetMetricsAdvisorQuery`](#getmetricsadvisorquery) | Model | — |
| [`ListContactSegmentsResponse`](#listcontactsegmentsresponse) | Alias | — |
| [`GetContactTopicsResponse`](#getcontacttopicsresponse) | Alias | — |
| [`GetContactActivityResponse`](#getcontactactivityresponse) | Alias | — |
| [`ListApiKeysResponse`](#listapikeysresponse) | Model | — |

## AttachmentRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `filename` | `String` | Yes | — |
| `content` | `String` | Yes | — |
| `contentType` | `String` | Yes | — |
| `disposition` | `String` | No | — |
| `contentId` | `String? | null` | No | — |


## DeliveryWindowRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `start` | `String` | Yes | — |
| `end` | `String` | Yes | — |


## TrackingSettingsRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `Boolean? | null` | No | — |
| `clickTracking` | `Boolean? | null` | No | — |
| `unsubscribeTracking` | `Boolean? | null` | No | — |
| `readEngagement` | `Boolean? | null` | No | — |


## SendEmailRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `String` | Yes | — |
| `to` | `List<String>` | Yes | — |
| `cc` | `List<String> | null` | No | — |
| `bcc` | `List<String> | null` | No | — |
| `replyTo` | `String? | null` | No | — |
| `subject` | `String? | null` | No | — |
| `html` | `String? | null` | No | — |
| `text` | `String? | null` | No | — |
| `tags` | `Map<String, String> | null` | No | — |
| `metadata` | `Map<String, String> | null` | No | — |
| `idempotencyKey` | `String? | null` | No | — |
| `testMode` | `Boolean` | No | — |
| `attachments` | `List<AttachmentRequest> | null` | No | — |
| `scheduledAt` | `String? | null` | No | — |
| `deliveryWindow` | `DeliveryWindowRequest? | null` | No | — |
| `sendTimeCategory` | `String` | No | — |
| `trackingSettings` | `TrackingSettingsRequest? | null` | No | — |


## BatchSendItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `index` | `Long` | Yes | — |
| `id` | `String? | null` | No | — |
| `messageId` | `String? | null` | No | — |
| `status` | `String? | null` | No | — |
| `createdAt` | `String? | null` | No | — |
| `scheduledAt` | `String? | null` | No | — |
| `error` | `String? | null` | No | — |


## SendEmailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `messageId` | `String? | null` | Yes | — |
| `status` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `scheduledAt` | `String? | null` | No | — |
| `audienceId` | `String? | null` | No | — |
| `messages` | `List<BatchSendItemResponse> | null` | No | — |


## EmailDetailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `messageId` | `String? | null` | Yes | — |
| `from` | `String` | Yes | — |
| `to` | `List<String>` | Yes | — |
| `cc` | `List<String> | null` | Yes | — |
| `bcc` | `List<String> | null` | Yes | — |
| `replyTo` | `String? | null` | Yes | — |
| `subject` | `String` | Yes | — |
| `html` | `String? | null` | No | — |
| `text` | `String? | null` | No | — |
| `status` | `String` | Yes | — |
| `error` | `String? | null` | Yes | — |
| `tags` | `Map<String, String> | null` | Yes | — |
| `metadata` | `Map<String, String> | null` | Yes | — |
| `testMode` | `Boolean` | Yes | — |
| `topicId` | `String? | null` | No | — |
| `createdAt` | `String` | Yes | — |
| `sentAt` | `String? | null` | Yes | — |
| `updatedAt` | `String? | null` | Yes | — |


## BatchSendRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `List<SendEmailRequest>` | Yes | — |


## BatchSendResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `results` | `List<BatchSendItemResponse>` | Yes | — |


## CancelResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `cancelled` | `Boolean` | No | — |


## BulkCancelResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `cancelled` | `Long` | Yes | — |


## StreamTokenResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `token` | `String` | Yes | — |
| `expiresAt` | `String` | Yes | — |


## StreamEventResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `String` | Yes | — |
| `emailId` | `String` | Yes | — |
| `occurredAt` | `String` | Yes | — |
| `data` | `Map<String, String>` | No | — |


## ValidateLinksRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `html` | `String? | null` | No | — |


## LinkResultItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `statusCode` | `Long? | null` | No | — |
| `error` | `String? | null` | No | — |


## ValidateLinksResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `links` | `List<LinkResultItem>` | Yes | — |
| `totalLinks` | `Long` | Yes | — |
| `brokenLinks` | `Long` | Yes | — |
| `errorLinks` | `Long` | Yes | — |


## MetricsWindowResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `String` | Yes | — |
| `to` | `String` | Yes | — |
| `label` | `String` | Yes | — |


## TopicPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `String` | Yes | — |
| `topicName` | `String` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `totalEmails` | `Long` | Yes | — |
| `delivered` | `Long` | Yes | — |
| `deliveryRate` | `Double` | Yes | — |
| `opened` | `Long` | Yes | — |
| `openRate` | `Double` | Yes | — |
| `clicked` | `Long` | Yes | — |
| `clickRate` | `Double` | Yes | — |
| `bounced` | `Long` | Yes | — |
| `bounceRate` | `Double` | Yes | — |
| `complained` | `Long` | Yes | — |
| `complaintRate` | `Double` | Yes | — |
| `unsubscribed` | `Long` | Yes | — |
| `unsubscribeRate` | `Double` | Yes | — |
| `readEngaged` | `Long` | Yes | — |
| `readEngagementRate` | `Double` | Yes | — |
| `avgReadTimeSeconds` | `Double? | null` | Yes | — |
| `optInCount` | `Long` | Yes | — |
| `optOutCount` | `Long` | Yes | — |
| `computedAt` | `String` | Yes | — |


## EmailPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `String` | Yes | — |
| `subject` | `String` | Yes | — |
| `fromAddress` | `String` | Yes | — |
| `topicId` | `String? | null` | Yes | — |
| `status` | `String` | Yes | — |
| `delivered` | `Boolean` | Yes | — |
| `opened` | `Boolean` | Yes | — |
| `clicked` | `Boolean` | Yes | — |
| `totalClicks` | `Long` | Yes | — |
| `bounced` | `Boolean` | Yes | — |
| `complained` | `Boolean` | Yes | — |
| `unsubscribed` | `Boolean` | Yes | — |
| `readEngaged` | `Boolean` | Yes | — |
| `readTimeSeconds` | `Double? | null` | Yes | — |
| `readCategory` | `String? | null` | Yes | — |
| `sentAt` | `String? | null` | Yes | — |
| `lastEventAt` | `String? | null` | Yes | — |
| `computedAt` | `String` | Yes | — |


## EmailReadScrollAnalyticsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `String` | Yes | — |
| `subject` | `String` | Yes | — |
| `computedAt` | `String` | Yes | — |
| `readEngaged` | `Boolean` | Yes | — |
| `readTimeSeconds` | `Double? | null` | Yes | — |
| `readCategory` | `String? | null` | Yes | — |
| `mailClient` | `String? | null` | Yes | — |
| `deviceType` | `String? | null` | Yes | — |
| `os` | `String? | null` | Yes | — |
| `readEngagedAt` | `String? | null` | Yes | — |
| `shortEmail` | `Boolean` | Yes | — |
| `depth25Count` | `Long` | Yes | — |
| `depth50Count` | `Long` | Yes | — |
| `depth75Count` | `Long` | Yes | — |
| `depth100Count` | `Long` | Yes | — |
| `maxDepthPct` | `Long? | null` | Yes | — |
| `depth25Rate` | `Double? | null` | Yes | — |
| `depth50Rate` | `Double? | null` | Yes | — |
| `depth75Rate` | `Double? | null` | Yes | — |
| `depth100Rate` | `Double? | null` | Yes | — |


## ProjectMetricsSummaryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `sent` | `Long` | Yes | — |
| `delivered` | `Long` | Yes | — |
| `opened` | `Long` | Yes | — |
| `clicked` | `Long` | Yes | — |
| `bounced` | `Long` | Yes | — |
| `complained` | `Long` | Yes | — |
| `failed` | `Long` | Yes | — |
| `unsubscribed` | `Long` | Yes | — |
| `readEngaged` | `Long` | Yes | — |
| `deliveryRate` | `Double` | Yes | — |
| `openRate` | `Double` | Yes | — |
| `clickRate` | `Double` | Yes | — |
| `bounceRate` | `Double` | Yes | — |
| `complaintRate` | `Double` | Yes | — |
| `readEngagementRate` | `Double` | Yes | — |


## ProjectTimelineBucketResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bucket` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `count` | `Long` | Yes | — |


## ProjectMetricsTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `granularity` | `String` | Yes | — |
| `format` | `String` | Yes | — |
| `buckets` | `List<ProjectTimelineBucketResponse>` | Yes | — |


## AdvisorRecommendationDataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bounceRate` | `Double? | null` | No | — |
| `bounced` | `Long? | null` | No | — |
| `accepted` | `Long? | null` | No | — |
| `complaintRate` | `Double? | null` | No | — |
| `accepted24h` | `Long? | null` | No | — |
| `avgDailyAccepted7d` | `Long? | null` | No | — |
| `daysSinceLastSend` | `Long? | null` | No | — |
| `reportedOpenRate` | `Double? | null` | No | — |
| `adjustedOpenRate` | `Double? | null` | No | — |
| `proxyRate` | `Double? | null` | No | — |
| `proxyOpens` | `Long? | null` | No | — |
| `totalOpens` | `Long? | null` | No | — |
| `humanOpenRate` | `Double? | null` | No | — |
| `delivered` | `Long? | null` | No | — |
| `unsubRate` | `Double? | null` | No | — |
| `unsubscribed` | `Long? | null` | No | — |
| `dmarcAlignmentFailureRate7d` | `Double? | null` | No | — |
| `dmarcDomain` | `String? | null` | No | — |
| `dmarcCurrentPolicy` | `String? | null` | No | — |
| `dmarcRecommendedPolicy` | `String? | null` | No | — |
| `dmarcObservedMessages` | `Long? | null` | No | — |
| `dmarcAlignedMessages` | `Long? | null` | No | — |
| `dmarcAccountedRate` | `Double? | null` | No | — |
| `dmarcUnknownMessages` | `Long? | null` | No | — |
| `dmarcUnknownSources` | `Long? | null` | No | — |
| `dmarcReportingDays` | `Long? | null` | No | — |


## AdvisorRecommendationResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `code` | `String` | Yes | — |
| `severity` | `String` | Yes | — |
| `title` | `String` | Yes | — |
| `message` | `String` | Yes | — |
| `data` | `AdvisorRecommendationDataResponse? | null` | No | — |


## AdvisorReportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | Yes | — |
| `generatedAt` | `String` | Yes | — |
| `score` | `Long` | Yes | — |
| `recommendations` | `List<AdvisorRecommendationResponse>` | Yes | — |


## SuppressionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `email` | `String` | Yes | — |
| `reason` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `contactId` | `String? | null` | No | — |


## PageInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `page` | `Long` | Yes | — |
| `size` | `Long` | Yes | — |
| `total` | `Long` | Yes | — |
| `totalPages` | `Long` | Yes | — |
| `hasNextPage` | `Boolean` | Yes | — |
| `hasPreviousPage` | `Boolean` | Yes | — |


## SuppressionPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<SuppressionResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## AddSuppressionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String` | Yes | — |


## SuppressionImportRowSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String` | Yes | — |
| `reason` | `String? | null` | No | — |


## SuppressionImportBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `suppressions` | `List<SuppressionImportRowSerializable>` | Yes | — |


## SuppressionImportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `imported` | `Long` | Yes | — |
| `skipped` | `Long` | Yes | — |


## SegmentResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `contactCount` | `Long` | No | — |
| `unsubscribedCount` | `Long` | No | — |


## SegmentPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<SegmentResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `contactId` | `String` | Yes | — |
| `email` | `String` | Yes | — |
| `firstName` | `String? | null` | Yes | — |
| `lastName` | `String? | null` | Yes | — |
| `segments` | `List<String>` | Yes | — |


## CursorInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `nextCursor` | `String? | null` | Yes | — |
| `previousCursor` | `String? | null` | Yes | — |
| `hasNextPage` | `Boolean` | Yes | — |
| `hasPreviousPage` | `Boolean` | Yes | — |


## CursorPage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<SegmentContactResponse>` | Yes | — |
| `cursor` | `CursorInfo` | Yes | — |


## CreateSegmentBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |


## TopicResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `defaultSubscription` | `String` | Yes | — |
| `description` | `String? | null` | Yes | — |
| `visibility` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `optInCount` | `Long` | Yes | — |
| `optOutCount` | `Long` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## TopicPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<TopicResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |
| `defaultSubscription` | `String` | Yes | — |
| `description` | `String? | null` | No | — |
| `visibility` | `String? | null` | No | — |


## UpdateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String? | null` | No | — |
| `description` | `String? | null` | No | — |
| `visibility` | `String? | null` | No | — |


## ContactPropertyResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `key` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `fallbackValue` | `String? | null` | Yes | — |
| `projectId` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## ContactPropertyPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<ContactPropertyResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `key` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `fallbackValue` | `String? | null` | No | — |


## UpdateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `fallbackValue` | `String? | null` | No | — |


## TopicSubscriptionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `String` | Yes | — |
| `subscription` | `String` | Yes | — |


## ContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `email` | `String` | Yes | — |
| `phone` | `String? | null` | No | — |
| `firstName` | `String? | null` | Yes | — |
| `lastName` | `String? | null` | Yes | — |
| `unsubscribed` | `Boolean` | Yes | — |
| `properties` | `Map<String, String>` | Yes | — |
| `profileImageUrl` | `String? | null` | Yes | — |
| `projectId` | `String` | Yes | — |
| `segments` | `List<String>` | Yes | — |
| `topics` | `List<TopicSubscriptionResponse>` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## ContactPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<ContactResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentRef

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |


## TopicSubscriptionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `subscription` | `String` | Yes | — |


## CreateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String` | Yes | — |
| `phone` | `String? | null` | No | — |
| `firstName` | `String? | null` | No | — |
| `lastName` | `String? | null` | No | — |
| `unsubscribed` | `Boolean` | No | — |
| `properties` | `Map<String, String>` | No | — |
| `segments` | `List<SegmentRef>` | No | — |
| `topics` | `List<TopicSubscriptionBody>` | No | — |


## UpdateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `firstName` | `String? | null` | No | — |
| `lastName` | `String? | null` | No | — |
| `phone` | `String? | null` | No | — |
| `unsubscribed` | `Boolean? | null` | No | — |
| `properties` | `Map<String, String> | null` | No | — |


## SetImageUrlBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String` | Yes | — |


## AddToSegmentBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `segmentId` | `String` | Yes | — |


## UpdateTopicsBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topics` | `List<TopicSubscriptionBody>` | Yes | — |


## ActivityMetadataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `String? | null` | No | — |


## ActivityResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `referenceId` | `String? | null` | No | — |
| `referenceName` | `String? | null` | No | — |
| `metadata` | `ActivityMetadataResponse? | null` | No | — |
| `occurredAt` | `String` | Yes | — |


## EngagementScoreResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `score` | `Long` | Yes | — |
| `tier` | `String` | Yes | — |
| `scoredAt` | `String` | Yes | — |


## EmailValidationStatusResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `status` | `String` | Yes | — |
| `reason` | `String? | null` | Yes | — |
| `validatedAt` | `String? | null` | Yes | — |


## RecordValidationBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `status` | `EmailValidationStatusInput` | Yes | — |
| `reason` | `String? | null` | No | — |


## WebhookFilterSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `field` | `String` | Yes | — |
| `operator` | `String` | Yes | — |
| `value` | `String? | null` | No | — |


## WebhookTransformationSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `String` | Yes | — |
| `from` | `String? | null` | No | — |
| `to` | `String? | null` | No | — |
| `field` | `String? | null` | No | — |
| `value` | `String? | null` | No | — |
| `template` | `String? | null` | No | — |


## WebhookResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `url` | `String` | Yes | — |
| `events` | `List<String>` | Yes | — |
| `enabled` | `Boolean` | Yes | — |
| `filters` | `List<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `List<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## WebhookPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<WebhookResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## WebhookDeliveryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `webhookEndpointId` | `String` | Yes | — |
| `eventType` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `attemptCount` | `Long` | Yes | — |
| `lastStatusCode` | `Long? | null` | Yes | — |
| `lastError` | `String? | null` | Yes | — |
| `responseBodySnippet` | `String? | null` | Yes | — |
| `nextAttemptAt` | `String? | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## WebhookDeliveryPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<WebhookDeliveryResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String` | Yes | — |
| `events` | `List<String>` | Yes | — |
| `name` | `String? | null` | No | — |
| `secret` | `String? | null` | No | — |
| `filters` | `List<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `List<WebhookTransformationSerializable> | null` | No | — |


## WebhookCreateResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `url` | `String` | Yes | — |
| `events` | `List<String>` | Yes | — |
| `enabled` | `Boolean` | Yes | — |
| `filters` | `List<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `List<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |
| `secret` | `String` | Yes | — |


## UpdateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String? | null` | No | — |
| `url` | `String? | null` | No | — |
| `events` | `List<String> | null` | No | — |
| `secret` | `String? | null` | No | — |
| `enabled` | `Boolean? | null` | No | — |
| `filters` | `List<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `List<WebhookTransformationSerializable> | null` | No | — |


## ApiKey

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `configId` | `String` | Yes | — |
| `name` | `String? | null` | Yes | — |
| `start` | `String? | null` | Yes | — |
| `prefix` | `String? | null` | Yes | — |
| `organizationId` | `String` | Yes | — |
| `projectId` | `String? | null` | Yes | — |
| `enabled` | `Boolean` | Yes | — |
| `rateLimitEnabled` | `Boolean` | Yes | — |
| `rateLimitTimeWindow` | `Long? | null` | Yes | — |
| `rateLimitMax` | `Long? | null` | Yes | — |
| `requestCount` | `Long` | Yes | — |
| `remaining` | `Long? | null` | Yes | — |
| `lastRequest` | `String? | null` | Yes | — |
| `expiresAt` | `String? | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |
| `metadata` | `Map<String, String> | null` | Yes | — |
| `permissions` | `Map<String, List<String>> | null` | Yes | — |


## ApiKeyUsageRecord

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `keyId` | `String` | Yes | — |
| `orgId` | `String` | Yes | — |
| `method` | `String` | Yes | — |
| `route` | `String` | Yes | — |
| `statusCode` | `Long` | Yes | — |
| `durationMs` | `Long? | null` | Yes | — |
| `ip` | `String? | null` | Yes | — |
| `ts` | `String` | Yes | — |


## UsagePage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `size` | `Long` | Yes | — |
| `totalPages` | `Long` | Yes | — |
| `hasMore` | `Boolean` | Yes | — |


## ApiKeyUsageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<ApiKeyUsageRecord>` | Yes | — |
| `page` | `UsagePage` | Yes | — |


## ProjectLimitsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dailySends` | `Long` | Yes | — |
| `perSecondSends` | `Long` | Yes | — |
| `maxRecipientsPerMessage` | `Long` | Yes | — |
| `maxDomains` | `Long` | Yes | — |
| `maxApiKeys` | `Long` | Yes | — |
| `maxWebhooks` | `Long` | Yes | — |


## ProjectTrackingSettingsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `Boolean` | Yes | — |
| `clickTracking` | `Boolean` | Yes | — |
| `unsubscribeTracking` | `Boolean` | Yes | — |
| `readEngagement` | `Boolean` | Yes | — |
| `scrollDepth` | `Boolean` | No | — |


## ProjectResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `slug` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `suspensionReason` | `String? | null` | Yes | — |
| `region` | `String` | Yes | — |
| `limits` | `ProjectLimitsModel` | Yes | — |
| `trackingSettings` | `ProjectTrackingSettingsModel` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## ProjectPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<ProjectResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## UpdateProjectRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String? | null` | No | — |
| `slug` | `String? | null` | No | — |
| `limits` | `ProjectLimitsModel? | null` | No | — |
| `trackingSettings` | `ProjectTrackingSettingsModel? | null` | No | — |


## EmailPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<EmailDetailResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## EmailTimelineItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `providerEventId` | `String? | null` | Yes | — |
| `payload` | `Map<String, String?> | null` | Yes | — |
| `occurredAt` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |


## EmailTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `List<EmailTimelineItem>` | Yes | — |


## DomainListItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `domain` | `String` | Yes | — |
| `region` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `dkimStatus` | `String` | Yes | — |
| `bimiStatus` | `String` | Yes | — |
| `trackingStatus` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## DomainListPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List<DomainListItemResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## DkimRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `value` | `String` | Yes | — |
| `status` | `String? | null` | No | — |


## DnsRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `value` | `String` | Yes | — |
| `priority` | `Long? | null` | No | — |
| `optional` | `Boolean? | null` | No | — |
| `status` | `String? | null` | No | — |


## VerificationRecordsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dkim` | `List<DkimRecordResponse>` | Yes | — |
| `mailFromMx` | `DnsRecordResponse` | Yes | — |
| `mailFromSpf` | `DnsRecordResponse` | Yes | — |
| `dmarcRecommended` | `DnsRecordResponse? | null` | No | — |
| `bimi` | `DnsRecordResponse? | null` | No | — |
| `trackingCname` | `DnsRecordResponse? | null` | No | — |


## DomainResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `domain` | `String` | Yes | — |
| `region` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `dkimStatus` | `String` | Yes | — |
| `spfStatus` | `String` | Yes | — |
| `dmarcStatus` | `String` | Yes | — |
| `mailFromStatus` | `String` | Yes | — |
| `mailFromDomain` | `String` | Yes | — |
| `verificationRecords` | `VerificationRecordsResponse` | Yes | — |
| `bimiStatus` | `String` | Yes | — |
| `bimiLogoUrl` | `String? | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |
| `verifiedAt` | `String? | null` | Yes | — |


## RegisterDomainRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `domain` | `String` | Yes | — |
| `region` | `String` | Yes | — |


## UpdateBimiRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `logoUrl` | `String? | null` | No | — |


## EmailValidationStatusInput

Allowed values:

- `"valid"`
- `"risky"`
- `"invalid"`
- `"unknown"`


## GetTopicPerformanceQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `String` | No | Time window. |
| `projectId` | `String` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsSummaryQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `String` | No | Metrics time window. |
| `projectId` | `String` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsTimelineQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `String` | No | Metrics time window. |
| `granularity` | `String` | No | `hour` or `day`. |
| `format` | `String` | No | `compact` or `detailed`. |
| `projectId` | `String` | No | Required for session auth; ignored for API key auth. |


## GetMetricsAdvisorQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | No | Required for session auth; ignored for API key auth. |


## ListContactSegmentsResponse

Alias of `List<String>`.


## GetContactTopicsResponse

Alias of `List<TopicSubscriptionResponse>`.


## GetContactActivityResponse

Alias of `List<ActivityResponse>`.


## ListApiKeysResponse

This model has no declared properties.

Additional properties use `List<ApiKey>`.

