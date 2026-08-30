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
| `contentId` | `String | null` | No | — |


## DeliveryWindowRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `start` | `String` | Yes | — |
| `end` | `String` | Yes | — |


## TrackingSettingsRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `bool | null` | No | — |
| `clickTracking` | `bool | null` | No | — |
| `unsubscribeTracking` | `bool | null` | No | — |
| `readEngagement` | `bool | null` | No | — |


## SendEmailRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `String` | Yes | — |
| `to` | `Vec<String>` | Yes | — |
| `cc` | `Vec<String> | null` | No | — |
| `bcc` | `Vec<String> | null` | No | — |
| `replyTo` | `String | null` | No | — |
| `subject` | `String | null` | No | — |
| `html` | `String | null` | No | — |
| `text` | `String | null` | No | — |
| `tags` | `std::collections::HashMap<String, String> | null` | No | — |
| `metadata` | `std::collections::HashMap<String, String> | null` | No | — |
| `idempotencyKey` | `String | null` | No | — |
| `testMode` | `bool` | No | — |
| `attachments` | `Vec<AttachmentRequest> | null` | No | — |
| `scheduledAt` | `String | null` | No | — |
| `deliveryWindow` | `DeliveryWindowRequest | null` | No | — |
| `sendTimeCategory` | `String` | No | — |
| `trackingSettings` | `TrackingSettingsRequest | null` | No | — |


## BatchSendItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `index` | `i64` | Yes | — |
| `id` | `String | null` | No | — |
| `messageId` | `String | null` | No | — |
| `status` | `String | null` | No | — |
| `createdAt` | `String | null` | No | — |
| `scheduledAt` | `String | null` | No | — |
| `error` | `String | null` | No | — |


## SendEmailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `messageId` | `String | null` | Yes | — |
| `status` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `scheduledAt` | `String | null` | No | — |
| `audienceId` | `String | null` | No | — |
| `messages` | `Vec<BatchSendItemResponse> | null` | No | — |


## EmailDetailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `messageId` | `String | null` | Yes | — |
| `from` | `String` | Yes | — |
| `to` | `Vec<String>` | Yes | — |
| `cc` | `Vec<String> | null` | Yes | — |
| `bcc` | `Vec<String> | null` | Yes | — |
| `replyTo` | `String | null` | Yes | — |
| `subject` | `String` | Yes | — |
| `html` | `String | null` | No | — |
| `text` | `String | null` | No | — |
| `status` | `String` | Yes | — |
| `error` | `String | null` | Yes | — |
| `tags` | `std::collections::HashMap<String, String> | null` | Yes | — |
| `metadata` | `std::collections::HashMap<String, String> | null` | Yes | — |
| `testMode` | `bool` | Yes | — |
| `topicId` | `String | null` | No | — |
| `createdAt` | `String` | Yes | — |
| `sentAt` | `String | null` | Yes | — |
| `updatedAt` | `String | null` | Yes | — |


## BatchSendRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `Vec<SendEmailRequest>` | Yes | — |


## BatchSendResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `results` | `Vec<BatchSendItemResponse>` | Yes | — |


## CancelResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `cancelled` | `bool` | No | — |


## BulkCancelResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `cancelled` | `i64` | Yes | — |


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
| `data` | `std::collections::HashMap<String, String>` | No | — |


## ValidateLinksRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `html` | `String | null` | No | — |


## LinkResultItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `statusCode` | `i64 | null` | No | — |
| `error` | `String | null` | No | — |


## ValidateLinksResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `links` | `Vec<LinkResultItem>` | Yes | — |
| `totalLinks` | `i64` | Yes | — |
| `brokenLinks` | `i64` | Yes | — |
| `errorLinks` | `i64` | Yes | — |


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
| `totalEmails` | `i64` | Yes | — |
| `delivered` | `i64` | Yes | — |
| `deliveryRate` | `f64` | Yes | — |
| `opened` | `i64` | Yes | — |
| `openRate` | `f64` | Yes | — |
| `clicked` | `i64` | Yes | — |
| `clickRate` | `f64` | Yes | — |
| `bounced` | `i64` | Yes | — |
| `bounceRate` | `f64` | Yes | — |
| `complained` | `i64` | Yes | — |
| `complaintRate` | `f64` | Yes | — |
| `unsubscribed` | `i64` | Yes | — |
| `unsubscribeRate` | `f64` | Yes | — |
| `readEngaged` | `i64` | Yes | — |
| `readEngagementRate` | `f64` | Yes | — |
| `avgReadTimeSeconds` | `f64 | null` | Yes | — |
| `optInCount` | `i64` | Yes | — |
| `optOutCount` | `i64` | Yes | — |
| `computedAt` | `String` | Yes | — |


## EmailPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `String` | Yes | — |
| `subject` | `String` | Yes | — |
| `fromAddress` | `String` | Yes | — |
| `topicId` | `String | null` | Yes | — |
| `status` | `String` | Yes | — |
| `delivered` | `bool` | Yes | — |
| `opened` | `bool` | Yes | — |
| `clicked` | `bool` | Yes | — |
| `totalClicks` | `i64` | Yes | — |
| `bounced` | `bool` | Yes | — |
| `complained` | `bool` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `f64 | null` | Yes | — |
| `readCategory` | `String | null` | Yes | — |
| `sentAt` | `String | null` | Yes | — |
| `lastEventAt` | `String | null` | Yes | — |
| `computedAt` | `String` | Yes | — |


## EmailReadScrollAnalyticsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `String` | Yes | — |
| `subject` | `String` | Yes | — |
| `computedAt` | `String` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `f64 | null` | Yes | — |
| `readCategory` | `String | null` | Yes | — |
| `mailClient` | `String | null` | Yes | — |
| `deviceType` | `String | null` | Yes | — |
| `os` | `String | null` | Yes | — |
| `readEngagedAt` | `String | null` | Yes | — |
| `shortEmail` | `bool` | Yes | — |
| `depth25Count` | `i64` | Yes | — |
| `depth50Count` | `i64` | Yes | — |
| `depth75Count` | `i64` | Yes | — |
| `depth100Count` | `i64` | Yes | — |
| `maxDepthPct` | `i64 | null` | Yes | — |
| `depth25Rate` | `f64 | null` | Yes | — |
| `depth50Rate` | `f64 | null` | Yes | — |
| `depth75Rate` | `f64 | null` | Yes | — |
| `depth100Rate` | `f64 | null` | Yes | — |


## ProjectMetricsSummaryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `sent` | `i64` | Yes | — |
| `delivered` | `i64` | Yes | — |
| `opened` | `i64` | Yes | — |
| `clicked` | `i64` | Yes | — |
| `bounced` | `i64` | Yes | — |
| `complained` | `i64` | Yes | — |
| `failed` | `i64` | Yes | — |
| `unsubscribed` | `i64` | Yes | — |
| `readEngaged` | `i64` | Yes | — |
| `deliveryRate` | `f64` | Yes | — |
| `openRate` | `f64` | Yes | — |
| `clickRate` | `f64` | Yes | — |
| `bounceRate` | `f64` | Yes | — |
| `complaintRate` | `f64` | Yes | — |
| `readEngagementRate` | `f64` | Yes | — |


## ProjectTimelineBucketResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bucket` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `count` | `i64` | Yes | — |


## ProjectMetricsTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `granularity` | `String` | Yes | — |
| `format` | `String` | Yes | — |
| `buckets` | `Vec<ProjectTimelineBucketResponse>` | Yes | — |


## AdvisorRecommendationDataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bounceRate` | `f64 | null` | No | — |
| `bounced` | `i64 | null` | No | — |
| `accepted` | `i64 | null` | No | — |
| `complaintRate` | `f64 | null` | No | — |
| `accepted24h` | `i64 | null` | No | — |
| `avgDailyAccepted7d` | `i64 | null` | No | — |
| `daysSinceLastSend` | `i64 | null` | No | — |
| `reportedOpenRate` | `f64 | null` | No | — |
| `adjustedOpenRate` | `f64 | null` | No | — |
| `proxyRate` | `f64 | null` | No | — |
| `proxyOpens` | `i64 | null` | No | — |
| `totalOpens` | `i64 | null` | No | — |
| `humanOpenRate` | `f64 | null` | No | — |
| `delivered` | `i64 | null` | No | — |
| `unsubRate` | `f64 | null` | No | — |
| `unsubscribed` | `i64 | null` | No | — |
| `dmarcAlignmentFailureRate7d` | `f64 | null` | No | — |
| `dmarcDomain` | `String | null` | No | — |
| `dmarcCurrentPolicy` | `String | null` | No | — |
| `dmarcRecommendedPolicy` | `String | null` | No | — |
| `dmarcObservedMessages` | `i64 | null` | No | — |
| `dmarcAlignedMessages` | `i64 | null` | No | — |
| `dmarcAccountedRate` | `f64 | null` | No | — |
| `dmarcUnknownMessages` | `i64 | null` | No | — |
| `dmarcUnknownSources` | `i64 | null` | No | — |
| `dmarcReportingDays` | `i64 | null` | No | — |


## AdvisorRecommendationResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `code` | `String` | Yes | — |
| `severity` | `String` | Yes | — |
| `title` | `String` | Yes | — |
| `message` | `String` | Yes | — |
| `data` | `AdvisorRecommendationDataResponse | null` | No | — |


## AdvisorReportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | Yes | — |
| `generatedAt` | `String` | Yes | — |
| `score` | `i64` | Yes | — |
| `recommendations` | `Vec<AdvisorRecommendationResponse>` | Yes | — |


## SuppressionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `email` | `String` | Yes | — |
| `reason` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `contactId` | `String | null` | No | — |


## PageInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `page` | `i64` | Yes | — |
| `size` | `i64` | Yes | — |
| `total` | `i64` | Yes | — |
| `totalPages` | `i64` | Yes | — |
| `hasNextPage` | `bool` | Yes | — |
| `hasPreviousPage` | `bool` | Yes | — |


## SuppressionPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<SuppressionResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## AddSuppressionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String` | Yes | — |


## SuppressionImportRowSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String` | Yes | — |
| `reason` | `String | null` | No | — |


## SuppressionImportBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `suppressions` | `Vec<SuppressionImportRowSerializable>` | Yes | — |


## SuppressionImportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `imported` | `i64` | Yes | — |
| `skipped` | `i64` | Yes | — |


## SegmentResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `contactCount` | `i64` | No | — |
| `unsubscribedCount` | `i64` | No | — |


## SegmentPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<SegmentResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `contactId` | `String` | Yes | — |
| `email` | `String` | Yes | — |
| `firstName` | `String | null` | Yes | — |
| `lastName` | `String | null` | Yes | — |
| `segments` | `Vec<String>` | Yes | — |


## CursorInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `nextCursor` | `String | null` | Yes | — |
| `previousCursor` | `String | null` | Yes | — |
| `hasNextPage` | `bool` | Yes | — |
| `hasPreviousPage` | `bool` | Yes | — |


## CursorPage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<SegmentContactResponse>` | Yes | — |
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
| `description` | `String | null` | Yes | — |
| `visibility` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `optInCount` | `i64` | Yes | — |
| `optOutCount` | `i64` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## TopicPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<TopicResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |
| `defaultSubscription` | `String` | Yes | — |
| `description` | `String | null` | No | — |
| `visibility` | `String | null` | No | — |


## UpdateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String | null` | No | — |
| `description` | `String | null` | No | — |
| `visibility` | `String | null` | No | — |


## ContactPropertyResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `key` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `fallbackValue` | `String | null` | Yes | — |
| `projectId` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## ContactPropertyPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<ContactPropertyResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `key` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `fallbackValue` | `String | null` | No | — |


## UpdateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `fallbackValue` | `String | null` | No | — |


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
| `phone` | `String | null` | No | — |
| `firstName` | `String | null` | Yes | — |
| `lastName` | `String | null` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `properties` | `std::collections::HashMap<String, String>` | Yes | — |
| `profileImageUrl` | `String | null` | Yes | — |
| `projectId` | `String` | Yes | — |
| `segments` | `Vec<String>` | Yes | — |
| `topics` | `Vec<TopicSubscriptionResponse>` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## ContactPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<ContactResponse>` | Yes | — |
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
| `phone` | `String | null` | No | — |
| `firstName` | `String | null` | No | — |
| `lastName` | `String | null` | No | — |
| `unsubscribed` | `bool` | No | — |
| `properties` | `std::collections::HashMap<String, String>` | No | — |
| `segments` | `Vec<SegmentRef>` | No | — |
| `topics` | `Vec<TopicSubscriptionBody>` | No | — |


## UpdateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `firstName` | `String | null` | No | — |
| `lastName` | `String | null` | No | — |
| `phone` | `String | null` | No | — |
| `unsubscribed` | `bool | null` | No | — |
| `properties` | `std::collections::HashMap<String, String> | null` | No | — |


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
| `topics` | `Vec<TopicSubscriptionBody>` | Yes | — |


## ActivityMetadataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `String | null` | No | — |


## ActivityResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `referenceId` | `String | null` | No | — |
| `referenceName` | `String | null` | No | — |
| `metadata` | `ActivityMetadataResponse | null` | No | — |
| `occurredAt` | `String` | Yes | — |


## EngagementScoreResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `score` | `i64` | Yes | — |
| `tier` | `String` | Yes | — |
| `scoredAt` | `String` | Yes | — |


## EmailValidationStatusResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `status` | `String` | Yes | — |
| `reason` | `String | null` | Yes | — |
| `validatedAt` | `String | null` | Yes | — |


## RecordValidationBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `status` | `EmailValidationStatusInput` | Yes | — |
| `reason` | `String | null` | No | — |


## WebhookFilterSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `field` | `String` | Yes | — |
| `operator` | `String` | Yes | — |
| `value` | `String | null` | No | — |


## WebhookTransformationSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `String` | Yes | — |
| `from` | `String | null` | No | — |
| `to` | `String | null` | No | — |
| `field` | `String | null` | No | — |
| `value` | `String | null` | No | — |
| `template` | `String | null` | No | — |


## WebhookResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `url` | `String` | Yes | — |
| `events` | `Vec<String>` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `Vec<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `Vec<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## WebhookPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<WebhookResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## WebhookDeliveryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `webhookEndpointId` | `String` | Yes | — |
| `eventType` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `attemptCount` | `i64` | Yes | — |
| `lastStatusCode` | `i64 | null` | Yes | — |
| `lastError` | `String | null` | Yes | — |
| `responseBodySnippet` | `String | null` | Yes | — |
| `nextAttemptAt` | `String | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## WebhookDeliveryPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<WebhookDeliveryResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String` | Yes | — |
| `events` | `Vec<String>` | Yes | — |
| `name` | `String | null` | No | — |
| `secret` | `String | null` | No | — |
| `filters` | `Vec<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `Vec<WebhookTransformationSerializable> | null` | No | — |


## WebhookCreateResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `url` | `String` | Yes | — |
| `events` | `Vec<String>` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `Vec<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `Vec<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |
| `secret` | `String` | Yes | — |


## UpdateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String | null` | No | — |
| `url` | `String | null` | No | — |
| `events` | `Vec<String> | null` | No | — |
| `secret` | `String | null` | No | — |
| `enabled` | `bool | null` | No | — |
| `filters` | `Vec<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `Vec<WebhookTransformationSerializable> | null` | No | — |


## ApiKey

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `configId` | `String` | Yes | — |
| `name` | `String | null` | Yes | — |
| `start` | `String | null` | Yes | — |
| `prefix` | `String | null` | Yes | — |
| `organizationId` | `String` | Yes | — |
| `projectId` | `String | null` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `rateLimitEnabled` | `bool` | Yes | — |
| `rateLimitTimeWindow` | `i64 | null` | Yes | — |
| `rateLimitMax` | `i64 | null` | Yes | — |
| `requestCount` | `i64` | Yes | — |
| `remaining` | `i64 | null` | Yes | — |
| `lastRequest` | `String | null` | Yes | — |
| `expiresAt` | `String | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |
| `metadata` | `std::collections::HashMap<String, String> | null` | Yes | — |
| `permissions` | `std::collections::HashMap<String, Vec<String>> | null` | Yes | — |


## ApiKeyUsageRecord

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `keyId` | `String` | Yes | — |
| `orgId` | `String` | Yes | — |
| `method` | `String` | Yes | — |
| `route` | `String` | Yes | — |
| `statusCode` | `i64` | Yes | — |
| `durationMs` | `i64 | null` | Yes | — |
| `ip` | `String | null` | Yes | — |
| `ts` | `String` | Yes | — |


## UsagePage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `size` | `i64` | Yes | — |
| `totalPages` | `i64` | Yes | — |
| `hasMore` | `bool` | Yes | — |


## ApiKeyUsageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<ApiKeyUsageRecord>` | Yes | — |
| `page` | `UsagePage` | Yes | — |


## ProjectLimitsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dailySends` | `i64` | Yes | — |
| `perSecondSends` | `i64` | Yes | — |
| `maxRecipientsPerMessage` | `i64` | Yes | — |
| `maxDomains` | `i64` | Yes | — |
| `maxApiKeys` | `i64` | Yes | — |
| `maxWebhooks` | `i64` | Yes | — |


## ProjectTrackingSettingsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `bool` | Yes | — |
| `clickTracking` | `bool` | Yes | — |
| `unsubscribeTracking` | `bool` | Yes | — |
| `readEngagement` | `bool` | Yes | — |
| `scrollDepth` | `bool` | No | — |


## ProjectResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `slug` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `suspensionReason` | `String | null` | Yes | — |
| `region` | `String` | Yes | — |
| `limits` | `ProjectLimitsModel` | Yes | — |
| `trackingSettings` | `ProjectTrackingSettingsModel` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## ProjectPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<ProjectResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## UpdateProjectRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String | null` | No | — |
| `slug` | `String | null` | No | — |
| `limits` | `ProjectLimitsModel | null` | No | — |
| `trackingSettings` | `ProjectTrackingSettingsModel | null` | No | — |


## EmailPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Vec<EmailDetailResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## EmailTimelineItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `providerEventId` | `String | null` | Yes | — |
| `payload` | `std::collections::HashMap<String, String> | null` | Yes | — |
| `occurredAt` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |


## EmailTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `Vec<EmailTimelineItem>` | Yes | — |


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
| `data` | `Vec<DomainListItemResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## DkimRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `value` | `String` | Yes | — |
| `status` | `String | null` | No | — |


## DnsRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `value` | `String` | Yes | — |
| `priority` | `i64 | null` | No | — |
| `optional` | `bool | null` | No | — |
| `status` | `String | null` | No | — |


## VerificationRecordsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dkim` | `Vec<DkimRecordResponse>` | Yes | — |
| `mailFromMx` | `DnsRecordResponse` | Yes | — |
| `mailFromSpf` | `DnsRecordResponse` | Yes | — |
| `dmarcRecommended` | `DnsRecordResponse | null` | No | — |
| `bimi` | `DnsRecordResponse | null` | No | — |
| `trackingCname` | `DnsRecordResponse | null` | No | — |


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
| `bimiLogoUrl` | `String | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |
| `verifiedAt` | `String | null` | Yes | — |


## RegisterDomainRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `domain` | `String` | Yes | — |
| `region` | `String` | Yes | — |


## UpdateBimiRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `logoUrl` | `String | null` | No | — |


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

Alias of `Vec<String>`.


## GetContactTopicsResponse

Alias of `Vec<TopicSubscriptionResponse>`.


## GetContactActivityResponse

Alias of `Vec<ActivityResponse>`.


## ListApiKeysResponse

This model has no declared properties.

Additional properties use `Vec<ApiKey>`.

