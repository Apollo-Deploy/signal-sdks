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
| `filename` | `[]const u8` | Yes | — |
| `content` | `[]const u8` | Yes | — |
| `contentType` | `[]const u8` | Yes | — |
| `disposition` | `[]const u8` | No | — |
| `contentId` | `?[]const u8 | null` | No | — |


## DeliveryWindowRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `start` | `[]const u8` | Yes | — |
| `end` | `[]const u8` | Yes | — |


## TrackingSettingsRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `?bool | null` | No | — |
| `clickTracking` | `?bool | null` | No | — |
| `unsubscribeTracking` | `?bool | null` | No | — |
| `readEngagement` | `?bool | null` | No | — |


## SendEmailRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `[]const u8` | Yes | — |
| `to` | `[][]const u8` | Yes | — |
| `cc` | `[][]const u8 | null` | No | — |
| `bcc` | `[][]const u8 | null` | No | — |
| `replyTo` | `?[]const u8 | null` | No | — |
| `subject` | `?[]const u8 | null` | No | — |
| `html` | `?[]const u8 | null` | No | — |
| `text` | `?[]const u8 | null` | No | — |
| `tags` | `std.json.ArrayHashMap([]const u8) | null` | No | — |
| `metadata` | `std.json.ArrayHashMap([]const u8) | null` | No | — |
| `idempotencyKey` | `?[]const u8 | null` | No | — |
| `testMode` | `bool` | No | — |
| `attachments` | `[]AttachmentRequest | null` | No | — |
| `scheduledAt` | `?[]const u8 | null` | No | — |
| `deliveryWindow` | `?DeliveryWindowRequest | null` | No | — |
| `sendTimeCategory` | `[]const u8` | No | — |
| `trackingSettings` | `?TrackingSettingsRequest | null` | No | — |


## BatchSendItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `index` | `i64` | Yes | — |
| `id` | `?[]const u8 | null` | No | — |
| `messageId` | `?[]const u8 | null` | No | — |
| `status` | `?[]const u8 | null` | No | — |
| `createdAt` | `?[]const u8 | null` | No | — |
| `scheduledAt` | `?[]const u8 | null` | No | — |
| `error` | `?[]const u8 | null` | No | — |


## SendEmailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `messageId` | `?[]const u8 | null` | Yes | — |
| `status` | `[]const u8` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `scheduledAt` | `?[]const u8 | null` | No | — |
| `audienceId` | `?[]const u8 | null` | No | — |
| `messages` | `[]BatchSendItemResponse | null` | No | — |


## EmailDetailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `messageId` | `?[]const u8 | null` | Yes | — |
| `from` | `[]const u8` | Yes | — |
| `to` | `[][]const u8` | Yes | — |
| `cc` | `[][]const u8 | null` | Yes | — |
| `bcc` | `[][]const u8 | null` | Yes | — |
| `replyTo` | `?[]const u8 | null` | Yes | — |
| `subject` | `[]const u8` | Yes | — |
| `html` | `?[]const u8 | null` | No | — |
| `text` | `?[]const u8 | null` | No | — |
| `status` | `[]const u8` | Yes | — |
| `error` | `?[]const u8 | null` | Yes | — |
| `tags` | `std.json.ArrayHashMap([]const u8) | null` | Yes | — |
| `metadata` | `std.json.ArrayHashMap([]const u8) | null` | Yes | — |
| `testMode` | `bool` | Yes | — |
| `topicId` | `?[]const u8 | null` | No | — |
| `createdAt` | `[]const u8` | Yes | — |
| `sentAt` | `?[]const u8 | null` | Yes | — |
| `updatedAt` | `?[]const u8 | null` | Yes | — |


## BatchSendRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `[]SendEmailRequest` | Yes | — |


## BatchSendResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `results` | `[]BatchSendItemResponse` | Yes | — |


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
| `token` | `[]const u8` | Yes | — |
| `expiresAt` | `[]const u8` | Yes | — |


## StreamEventResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `[]const u8` | Yes | — |
| `emailId` | `[]const u8` | Yes | — |
| `occurredAt` | `[]const u8` | Yes | — |
| `data` | `std.json.ArrayHashMap([]const u8)` | No | — |


## ValidateLinksRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `html` | `?[]const u8 | null` | No | — |


## LinkResultItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `[]const u8` | Yes | — |
| `status` | `[]const u8` | Yes | — |
| `statusCode` | `?i64 | null` | No | — |
| `error` | `?[]const u8 | null` | No | — |


## ValidateLinksResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `links` | `[]LinkResultItem` | Yes | — |
| `totalLinks` | `i64` | Yes | — |
| `brokenLinks` | `i64` | Yes | — |
| `errorLinks` | `i64` | Yes | — |


## MetricsWindowResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `[]const u8` | Yes | — |
| `to` | `[]const u8` | Yes | — |
| `label` | `[]const u8` | Yes | — |


## TopicPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `[]const u8` | Yes | — |
| `topicName` | `[]const u8` | Yes | — |
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
| `avgReadTimeSeconds` | `?f64 | null` | Yes | — |
| `optInCount` | `i64` | Yes | — |
| `optOutCount` | `i64` | Yes | — |
| `computedAt` | `[]const u8` | Yes | — |


## EmailPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `[]const u8` | Yes | — |
| `subject` | `[]const u8` | Yes | — |
| `fromAddress` | `[]const u8` | Yes | — |
| `topicId` | `?[]const u8 | null` | Yes | — |
| `status` | `[]const u8` | Yes | — |
| `delivered` | `bool` | Yes | — |
| `opened` | `bool` | Yes | — |
| `clicked` | `bool` | Yes | — |
| `totalClicks` | `i64` | Yes | — |
| `bounced` | `bool` | Yes | — |
| `complained` | `bool` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `?f64 | null` | Yes | — |
| `readCategory` | `?[]const u8 | null` | Yes | — |
| `sentAt` | `?[]const u8 | null` | Yes | — |
| `lastEventAt` | `?[]const u8 | null` | Yes | — |
| `computedAt` | `[]const u8` | Yes | — |


## EmailReadScrollAnalyticsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `[]const u8` | Yes | — |
| `subject` | `[]const u8` | Yes | — |
| `computedAt` | `[]const u8` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `?f64 | null` | Yes | — |
| `readCategory` | `?[]const u8 | null` | Yes | — |
| `mailClient` | `?[]const u8 | null` | Yes | — |
| `deviceType` | `?[]const u8 | null` | Yes | — |
| `os` | `?[]const u8 | null` | Yes | — |
| `readEngagedAt` | `?[]const u8 | null` | Yes | — |
| `shortEmail` | `bool` | Yes | — |
| `depth25Count` | `i64` | Yes | — |
| `depth50Count` | `i64` | Yes | — |
| `depth75Count` | `i64` | Yes | — |
| `depth100Count` | `i64` | Yes | — |
| `maxDepthPct` | `?i64 | null` | Yes | — |
| `depth25Rate` | `?f64 | null` | Yes | — |
| `depth50Rate` | `?f64 | null` | Yes | — |
| `depth75Rate` | `?f64 | null` | Yes | — |
| `depth100Rate` | `?f64 | null` | Yes | — |


## ProjectMetricsSummaryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `[]const u8` | Yes | — |
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
| `bucket` | `[]const u8` | Yes | — |
| `type` | `[]const u8` | Yes | — |
| `count` | `i64` | Yes | — |


## ProjectMetricsTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `[]const u8` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `granularity` | `[]const u8` | Yes | — |
| `format` | `[]const u8` | Yes | — |
| `buckets` | `[]ProjectTimelineBucketResponse` | Yes | — |


## AdvisorRecommendationDataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bounceRate` | `?f64 | null` | No | — |
| `bounced` | `?i64 | null` | No | — |
| `accepted` | `?i64 | null` | No | — |
| `complaintRate` | `?f64 | null` | No | — |
| `accepted24h` | `?i64 | null` | No | — |
| `avgDailyAccepted7d` | `?i64 | null` | No | — |
| `daysSinceLastSend` | `?i64 | null` | No | — |
| `reportedOpenRate` | `?f64 | null` | No | — |
| `adjustedOpenRate` | `?f64 | null` | No | — |
| `proxyRate` | `?f64 | null` | No | — |
| `proxyOpens` | `?i64 | null` | No | — |
| `totalOpens` | `?i64 | null` | No | — |
| `humanOpenRate` | `?f64 | null` | No | — |
| `delivered` | `?i64 | null` | No | — |
| `unsubRate` | `?f64 | null` | No | — |
| `unsubscribed` | `?i64 | null` | No | — |
| `dmarcAlignmentFailureRate7d` | `?f64 | null` | No | — |
| `dmarcDomain` | `?[]const u8 | null` | No | — |
| `dmarcCurrentPolicy` | `?[]const u8 | null` | No | — |
| `dmarcRecommendedPolicy` | `?[]const u8 | null` | No | — |
| `dmarcObservedMessages` | `?i64 | null` | No | — |
| `dmarcAlignedMessages` | `?i64 | null` | No | — |
| `dmarcAccountedRate` | `?f64 | null` | No | — |
| `dmarcUnknownMessages` | `?i64 | null` | No | — |
| `dmarcUnknownSources` | `?i64 | null` | No | — |
| `dmarcReportingDays` | `?i64 | null` | No | — |


## AdvisorRecommendationResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `code` | `[]const u8` | Yes | — |
| `severity` | `[]const u8` | Yes | — |
| `title` | `[]const u8` | Yes | — |
| `message` | `[]const u8` | Yes | — |
| `data` | `?AdvisorRecommendationDataResponse | null` | No | — |


## AdvisorReportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `[]const u8` | Yes | — |
| `generatedAt` | `[]const u8` | Yes | — |
| `score` | `i64` | Yes | — |
| `recommendations` | `[]AdvisorRecommendationResponse` | Yes | — |


## SuppressionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `projectId` | `[]const u8` | Yes | — |
| `email` | `[]const u8` | Yes | — |
| `reason` | `[]const u8` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `contactId` | `?[]const u8 | null` | No | — |


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
| `data` | `[]SuppressionResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## AddSuppressionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `[]const u8` | Yes | — |


## SuppressionImportRowSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `[]const u8` | Yes | — |
| `reason` | `?[]const u8 | null` | No | — |


## SuppressionImportBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `suppressions` | `[]SuppressionImportRowSerializable` | Yes | — |


## SuppressionImportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `imported` | `i64` | Yes | — |
| `skipped` | `i64` | Yes | — |


## SegmentResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `[]const u8` | No | — |
| `id` | `[]const u8` | Yes | — |
| `name` | `[]const u8` | Yes | — |
| `projectId` | `[]const u8` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `contactCount` | `i64` | No | — |
| `unsubscribedCount` | `i64` | No | — |


## SegmentPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]SegmentResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `contactId` | `[]const u8` | Yes | — |
| `email` | `[]const u8` | Yes | — |
| `firstName` | `?[]const u8 | null` | Yes | — |
| `lastName` | `?[]const u8 | null` | Yes | — |
| `segments` | `[][]const u8` | Yes | — |


## CursorInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `nextCursor` | `?[]const u8 | null` | Yes | — |
| `previousCursor` | `?[]const u8 | null` | Yes | — |
| `hasNextPage` | `bool` | Yes | — |
| `hasPreviousPage` | `bool` | Yes | — |


## CursorPage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]SegmentContactResponse` | Yes | — |
| `cursor` | `CursorInfo` | Yes | — |


## CreateSegmentBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `[]const u8` | Yes | — |


## TopicResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `[]const u8` | No | — |
| `id` | `[]const u8` | Yes | — |
| `name` | `[]const u8` | Yes | — |
| `defaultSubscription` | `[]const u8` | Yes | — |
| `description` | `?[]const u8 | null` | Yes | — |
| `visibility` | `[]const u8` | Yes | — |
| `projectId` | `[]const u8` | Yes | — |
| `optInCount` | `i64` | Yes | — |
| `optOutCount` | `i64` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |


## TopicPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]TopicResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `[]const u8` | Yes | — |
| `defaultSubscription` | `[]const u8` | Yes | — |
| `description` | `?[]const u8 | null` | No | — |
| `visibility` | `?[]const u8 | null` | No | — |


## UpdateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `?[]const u8 | null` | No | — |
| `description` | `?[]const u8 | null` | No | — |
| `visibility` | `?[]const u8 | null` | No | — |


## ContactPropertyResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `[]const u8` | No | — |
| `id` | `[]const u8` | Yes | — |
| `key` | `[]const u8` | Yes | — |
| `type` | `[]const u8` | Yes | — |
| `fallbackValue` | `?[]const u8 | null` | Yes | — |
| `projectId` | `[]const u8` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |


## ContactPropertyPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]ContactPropertyResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `key` | `[]const u8` | Yes | — |
| `type` | `[]const u8` | Yes | — |
| `fallbackValue` | `?[]const u8 | null` | No | — |


## UpdateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `fallbackValue` | `?[]const u8 | null` | No | — |


## TopicSubscriptionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `[]const u8` | Yes | — |
| `subscription` | `[]const u8` | Yes | — |


## ContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `[]const u8` | No | — |
| `id` | `[]const u8` | Yes | — |
| `email` | `[]const u8` | Yes | — |
| `phone` | `?[]const u8 | null` | No | — |
| `firstName` | `?[]const u8 | null` | Yes | — |
| `lastName` | `?[]const u8 | null` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `properties` | `std.json.ArrayHashMap([]const u8)` | Yes | — |
| `profileImageUrl` | `?[]const u8 | null` | Yes | — |
| `projectId` | `[]const u8` | Yes | — |
| `segments` | `[][]const u8` | Yes | — |
| `topics` | `[]TopicSubscriptionResponse` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |


## ContactPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]ContactResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentRef

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |


## TopicSubscriptionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `subscription` | `[]const u8` | Yes | — |


## CreateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `[]const u8` | Yes | — |
| `phone` | `?[]const u8 | null` | No | — |
| `firstName` | `?[]const u8 | null` | No | — |
| `lastName` | `?[]const u8 | null` | No | — |
| `unsubscribed` | `bool` | No | — |
| `properties` | `std.json.ArrayHashMap([]const u8)` | No | — |
| `segments` | `[]SegmentRef` | No | — |
| `topics` | `[]TopicSubscriptionBody` | No | — |


## UpdateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `firstName` | `?[]const u8 | null` | No | — |
| `lastName` | `?[]const u8 | null` | No | — |
| `phone` | `?[]const u8 | null` | No | — |
| `unsubscribed` | `?bool | null` | No | — |
| `properties` | `std.json.ArrayHashMap([]const u8) | null` | No | — |


## SetImageUrlBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `[]const u8` | Yes | — |


## AddToSegmentBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `segmentId` | `[]const u8` | Yes | — |


## UpdateTopicsBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topics` | `[]TopicSubscriptionBody` | Yes | — |


## ActivityMetadataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `?[]const u8 | null` | No | — |


## ActivityResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `[]const u8` | No | — |
| `id` | `[]const u8` | Yes | — |
| `type` | `[]const u8` | Yes | — |
| `referenceId` | `?[]const u8 | null` | No | — |
| `referenceName` | `?[]const u8 | null` | No | — |
| `metadata` | `?ActivityMetadataResponse | null` | No | — |
| `occurredAt` | `[]const u8` | Yes | — |


## EngagementScoreResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `[]const u8` | No | — |
| `score` | `i64` | Yes | — |
| `tier` | `[]const u8` | Yes | — |
| `scoredAt` | `[]const u8` | Yes | — |


## EmailValidationStatusResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `[]const u8` | No | — |
| `status` | `[]const u8` | Yes | — |
| `reason` | `?[]const u8 | null` | Yes | — |
| `validatedAt` | `?[]const u8 | null` | Yes | — |


## RecordValidationBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `status` | `EmailValidationStatusInput` | Yes | — |
| `reason` | `?[]const u8 | null` | No | — |


## WebhookFilterSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `field` | `[]const u8` | Yes | — |
| `operator` | `[]const u8` | Yes | — |
| `value` | `?[]const u8 | null` | No | — |


## WebhookTransformationSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `[]const u8` | Yes | — |
| `from` | `?[]const u8 | null` | No | — |
| `to` | `?[]const u8 | null` | No | — |
| `field` | `?[]const u8 | null` | No | — |
| `value` | `?[]const u8 | null` | No | — |
| `template` | `?[]const u8 | null` | No | — |


## WebhookResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `projectId` | `[]const u8` | Yes | — |
| `name` | `[]const u8` | Yes | — |
| `url` | `[]const u8` | Yes | — |
| `events` | `[][]const u8` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `[]WebhookFilterSerializable | null` | Yes | — |
| `transformations` | `[]WebhookTransformationSerializable | null` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |


## WebhookPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]WebhookResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## WebhookDeliveryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `projectId` | `[]const u8` | Yes | — |
| `webhookEndpointId` | `[]const u8` | Yes | — |
| `eventType` | `[]const u8` | Yes | — |
| `status` | `[]const u8` | Yes | — |
| `attemptCount` | `i64` | Yes | — |
| `lastStatusCode` | `?i64 | null` | Yes | — |
| `lastError` | `?[]const u8 | null` | Yes | — |
| `responseBodySnippet` | `?[]const u8 | null` | Yes | — |
| `nextAttemptAt` | `?[]const u8 | null` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |


## WebhookDeliveryPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]WebhookDeliveryResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `[]const u8` | Yes | — |
| `events` | `[][]const u8` | Yes | — |
| `name` | `?[]const u8 | null` | No | — |
| `secret` | `?[]const u8 | null` | No | — |
| `filters` | `[]WebhookFilterSerializable | null` | No | — |
| `transformations` | `[]WebhookTransformationSerializable | null` | No | — |


## WebhookCreateResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `projectId` | `[]const u8` | Yes | — |
| `name` | `[]const u8` | Yes | — |
| `url` | `[]const u8` | Yes | — |
| `events` | `[][]const u8` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `[]WebhookFilterSerializable | null` | Yes | — |
| `transformations` | `[]WebhookTransformationSerializable | null` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |
| `secret` | `[]const u8` | Yes | — |


## UpdateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `?[]const u8 | null` | No | — |
| `url` | `?[]const u8 | null` | No | — |
| `events` | `[][]const u8 | null` | No | — |
| `secret` | `?[]const u8 | null` | No | — |
| `enabled` | `?bool | null` | No | — |
| `filters` | `[]WebhookFilterSerializable | null` | No | — |
| `transformations` | `[]WebhookTransformationSerializable | null` | No | — |


## ApiKey

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `configId` | `[]const u8` | Yes | — |
| `name` | `?[]const u8 | null` | Yes | — |
| `start` | `?[]const u8 | null` | Yes | — |
| `prefix` | `?[]const u8 | null` | Yes | — |
| `organizationId` | `[]const u8` | Yes | — |
| `projectId` | `?[]const u8 | null` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `rateLimitEnabled` | `bool` | Yes | — |
| `rateLimitTimeWindow` | `?i64 | null` | Yes | — |
| `rateLimitMax` | `?i64 | null` | Yes | — |
| `requestCount` | `i64` | Yes | — |
| `remaining` | `?i64 | null` | Yes | — |
| `lastRequest` | `?[]const u8 | null` | Yes | — |
| `expiresAt` | `?[]const u8 | null` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |
| `metadata` | `std.json.ArrayHashMap([]const u8) | null` | Yes | — |
| `permissions` | `std.json.ArrayHashMap([][]const u8) | null` | Yes | — |


## ApiKeyUsageRecord

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `keyId` | `[]const u8` | Yes | — |
| `orgId` | `[]const u8` | Yes | — |
| `method` | `[]const u8` | Yes | — |
| `route` | `[]const u8` | Yes | — |
| `statusCode` | `i64` | Yes | — |
| `durationMs` | `?i64 | null` | Yes | — |
| `ip` | `?[]const u8 | null` | Yes | — |
| `ts` | `[]const u8` | Yes | — |


## UsagePage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `size` | `i64` | Yes | — |
| `totalPages` | `i64` | Yes | — |
| `hasMore` | `bool` | Yes | — |


## ApiKeyUsageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]ApiKeyUsageRecord` | Yes | — |
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
| `id` | `[]const u8` | Yes | — |
| `name` | `[]const u8` | Yes | — |
| `slug` | `[]const u8` | Yes | — |
| `status` | `[]const u8` | Yes | — |
| `suspensionReason` | `?[]const u8 | null` | Yes | — |
| `region` | `[]const u8` | Yes | — |
| `limits` | `ProjectLimitsModel` | Yes | — |
| `trackingSettings` | `ProjectTrackingSettingsModel` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |


## ProjectPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]ProjectResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## UpdateProjectRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `?[]const u8 | null` | No | — |
| `slug` | `?[]const u8 | null` | No | — |
| `limits` | `?ProjectLimitsModel | null` | No | — |
| `trackingSettings` | `?ProjectTrackingSettingsModel | null` | No | — |


## EmailPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]EmailDetailResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## EmailTimelineItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `type` | `[]const u8` | Yes | — |
| `providerEventId` | `?[]const u8 | null` | Yes | — |
| `payload` | `std.json.ArrayHashMap(?[]const u8) | null` | Yes | — |
| `occurredAt` | `[]const u8` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |


## EmailTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `[]EmailTimelineItem` | Yes | — |


## DomainListItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `domain` | `[]const u8` | Yes | — |
| `region` | `[]const u8` | Yes | — |
| `status` | `[]const u8` | Yes | — |
| `dkimStatus` | `[]const u8` | Yes | — |
| `bimiStatus` | `[]const u8` | Yes | — |
| `trackingStatus` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |


## DomainListPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]DomainListItemResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## DkimRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `[]const u8` | Yes | — |
| `type` | `[]const u8` | Yes | — |
| `value` | `[]const u8` | Yes | — |
| `status` | `?[]const u8 | null` | No | — |


## DnsRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `[]const u8` | Yes | — |
| `type` | `[]const u8` | Yes | — |
| `value` | `[]const u8` | Yes | — |
| `priority` | `?i64 | null` | No | — |
| `optional` | `?bool | null` | No | — |
| `status` | `?[]const u8 | null` | No | — |


## VerificationRecordsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dkim` | `[]DkimRecordResponse` | Yes | — |
| `mailFromMx` | `DnsRecordResponse` | Yes | — |
| `mailFromSpf` | `DnsRecordResponse` | Yes | — |
| `dmarcRecommended` | `?DnsRecordResponse | null` | No | — |
| `bimi` | `?DnsRecordResponse | null` | No | — |
| `trackingCname` | `?DnsRecordResponse | null` | No | — |


## DomainResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `[]const u8` | Yes | — |
| `projectId` | `[]const u8` | Yes | — |
| `domain` | `[]const u8` | Yes | — |
| `region` | `[]const u8` | Yes | — |
| `status` | `[]const u8` | Yes | — |
| `dkimStatus` | `[]const u8` | Yes | — |
| `spfStatus` | `[]const u8` | Yes | — |
| `dmarcStatus` | `[]const u8` | Yes | — |
| `mailFromStatus` | `[]const u8` | Yes | — |
| `mailFromDomain` | `[]const u8` | Yes | — |
| `verificationRecords` | `VerificationRecordsResponse` | Yes | — |
| `bimiStatus` | `[]const u8` | Yes | — |
| `bimiLogoUrl` | `?[]const u8 | null` | Yes | — |
| `createdAt` | `[]const u8` | Yes | — |
| `updatedAt` | `[]const u8` | Yes | — |
| `verifiedAt` | `?[]const u8 | null` | Yes | — |


## RegisterDomainRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `domain` | `[]const u8` | Yes | — |
| `region` | `[]const u8` | Yes | — |


## UpdateBimiRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `logoUrl` | `?[]const u8 | null` | No | — |


## EmailValidationStatusInput

Allowed values:

- `"valid"`
- `"risky"`
- `"invalid"`
- `"unknown"`


## GetTopicPerformanceQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `[]const u8` | No | Time window. |
| `projectId` | `[]const u8` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsSummaryQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `[]const u8` | No | Metrics time window. |
| `projectId` | `[]const u8` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsTimelineQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `[]const u8` | No | Metrics time window. |
| `granularity` | `[]const u8` | No | `hour` or `day`. |
| `format` | `[]const u8` | No | `compact` or `detailed`. |
| `projectId` | `[]const u8` | No | Required for session auth; ignored for API key auth. |


## GetMetricsAdvisorQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `[]const u8` | No | Required for session auth; ignored for API key auth. |


## ListContactSegmentsResponse

Alias of `[][]const u8`.


## GetContactTopicsResponse

Alias of `[]TopicSubscriptionResponse`.


## GetContactActivityResponse

Alias of `[]ActivityResponse`.


## ListApiKeysResponse

This model has no declared properties.

Additional properties use `[]ApiKey`.

