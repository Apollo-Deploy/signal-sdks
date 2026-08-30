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
| `contentId` | `String, nil | null` | No | — |


## DeliveryWindowRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `start` | `String` | Yes | — |
| `end` | `String` | Yes | — |


## TrackingSettingsRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `Boolean, nil | null` | No | — |
| `clickTracking` | `Boolean, nil | null` | No | — |
| `unsubscribeTracking` | `Boolean, nil | null` | No | — |
| `readEngagement` | `Boolean, nil | null` | No | — |


## SendEmailRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `String` | Yes | — |
| `to` | `Array<String>` | Yes | — |
| `cc` | `Array<String> | null` | No | — |
| `bcc` | `Array<String> | null` | No | — |
| `replyTo` | `String, nil | null` | No | — |
| `subject` | `String, nil | null` | No | — |
| `html` | `String, nil | null` | No | — |
| `text` | `String, nil | null` | No | — |
| `tags` | `Hash{String => String} | null` | No | — |
| `metadata` | `Hash{String => String} | null` | No | — |
| `idempotencyKey` | `String, nil | null` | No | — |
| `testMode` | `Boolean` | No | — |
| `attachments` | `Array<AttachmentRequest> | null` | No | — |
| `scheduledAt` | `String, nil | null` | No | — |
| `deliveryWindow` | `DeliveryWindowRequest, nil | null` | No | — |
| `sendTimeCategory` | `String` | No | — |
| `trackingSettings` | `TrackingSettingsRequest, nil | null` | No | — |


## BatchSendItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `index` | `Integer` | Yes | — |
| `id` | `String, nil | null` | No | — |
| `messageId` | `String, nil | null` | No | — |
| `status` | `String, nil | null` | No | — |
| `createdAt` | `String, nil | null` | No | — |
| `scheduledAt` | `String, nil | null` | No | — |
| `error` | `String, nil | null` | No | — |


## SendEmailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `messageId` | `String, nil | null` | Yes | — |
| `status` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `scheduledAt` | `String, nil | null` | No | — |
| `audienceId` | `String, nil | null` | No | — |
| `messages` | `Array<BatchSendItemResponse> | null` | No | — |


## EmailDetailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `messageId` | `String, nil | null` | Yes | — |
| `from` | `String` | Yes | — |
| `to` | `Array<String>` | Yes | — |
| `cc` | `Array<String> | null` | Yes | — |
| `bcc` | `Array<String> | null` | Yes | — |
| `replyTo` | `String, nil | null` | Yes | — |
| `subject` | `String` | Yes | — |
| `html` | `String, nil | null` | No | — |
| `text` | `String, nil | null` | No | — |
| `status` | `String` | Yes | — |
| `error` | `String, nil | null` | Yes | — |
| `tags` | `Hash{String => String} | null` | Yes | — |
| `metadata` | `Hash{String => String} | null` | Yes | — |
| `testMode` | `Boolean` | Yes | — |
| `topicId` | `String, nil | null` | No | — |
| `createdAt` | `String` | Yes | — |
| `sentAt` | `String, nil | null` | Yes | — |
| `updatedAt` | `String, nil | null` | Yes | — |


## BatchSendRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `Array<SendEmailRequest>` | Yes | — |


## BatchSendResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `results` | `Array<BatchSendItemResponse>` | Yes | — |


## CancelResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `cancelled` | `Boolean` | No | — |


## BulkCancelResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `cancelled` | `Integer` | Yes | — |


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
| `data` | `Hash{String => String}` | No | — |


## ValidateLinksRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `html` | `String, nil | null` | No | — |


## LinkResultItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `statusCode` | `Integer, nil | null` | No | — |
| `error` | `String, nil | null` | No | — |


## ValidateLinksResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `links` | `Array<LinkResultItem>` | Yes | — |
| `totalLinks` | `Integer` | Yes | — |
| `brokenLinks` | `Integer` | Yes | — |
| `errorLinks` | `Integer` | Yes | — |


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
| `totalEmails` | `Integer` | Yes | — |
| `delivered` | `Integer` | Yes | — |
| `deliveryRate` | `Float` | Yes | — |
| `opened` | `Integer` | Yes | — |
| `openRate` | `Float` | Yes | — |
| `clicked` | `Integer` | Yes | — |
| `clickRate` | `Float` | Yes | — |
| `bounced` | `Integer` | Yes | — |
| `bounceRate` | `Float` | Yes | — |
| `complained` | `Integer` | Yes | — |
| `complaintRate` | `Float` | Yes | — |
| `unsubscribed` | `Integer` | Yes | — |
| `unsubscribeRate` | `Float` | Yes | — |
| `readEngaged` | `Integer` | Yes | — |
| `readEngagementRate` | `Float` | Yes | — |
| `avgReadTimeSeconds` | `Float, nil | null` | Yes | — |
| `optInCount` | `Integer` | Yes | — |
| `optOutCount` | `Integer` | Yes | — |
| `computedAt` | `String` | Yes | — |


## EmailPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `String` | Yes | — |
| `subject` | `String` | Yes | — |
| `fromAddress` | `String` | Yes | — |
| `topicId` | `String, nil | null` | Yes | — |
| `status` | `String` | Yes | — |
| `delivered` | `Boolean` | Yes | — |
| `opened` | `Boolean` | Yes | — |
| `clicked` | `Boolean` | Yes | — |
| `totalClicks` | `Integer` | Yes | — |
| `bounced` | `Boolean` | Yes | — |
| `complained` | `Boolean` | Yes | — |
| `unsubscribed` | `Boolean` | Yes | — |
| `readEngaged` | `Boolean` | Yes | — |
| `readTimeSeconds` | `Float, nil | null` | Yes | — |
| `readCategory` | `String, nil | null` | Yes | — |
| `sentAt` | `String, nil | null` | Yes | — |
| `lastEventAt` | `String, nil | null` | Yes | — |
| `computedAt` | `String` | Yes | — |


## EmailReadScrollAnalyticsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `String` | Yes | — |
| `subject` | `String` | Yes | — |
| `computedAt` | `String` | Yes | — |
| `readEngaged` | `Boolean` | Yes | — |
| `readTimeSeconds` | `Float, nil | null` | Yes | — |
| `readCategory` | `String, nil | null` | Yes | — |
| `mailClient` | `String, nil | null` | Yes | — |
| `deviceType` | `String, nil | null` | Yes | — |
| `os` | `String, nil | null` | Yes | — |
| `readEngagedAt` | `String, nil | null` | Yes | — |
| `shortEmail` | `Boolean` | Yes | — |
| `depth25Count` | `Integer` | Yes | — |
| `depth50Count` | `Integer` | Yes | — |
| `depth75Count` | `Integer` | Yes | — |
| `depth100Count` | `Integer` | Yes | — |
| `maxDepthPct` | `Integer, nil | null` | Yes | — |
| `depth25Rate` | `Float, nil | null` | Yes | — |
| `depth50Rate` | `Float, nil | null` | Yes | — |
| `depth75Rate` | `Float, nil | null` | Yes | — |
| `depth100Rate` | `Float, nil | null` | Yes | — |


## ProjectMetricsSummaryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `sent` | `Integer` | Yes | — |
| `delivered` | `Integer` | Yes | — |
| `opened` | `Integer` | Yes | — |
| `clicked` | `Integer` | Yes | — |
| `bounced` | `Integer` | Yes | — |
| `complained` | `Integer` | Yes | — |
| `failed` | `Integer` | Yes | — |
| `unsubscribed` | `Integer` | Yes | — |
| `readEngaged` | `Integer` | Yes | — |
| `deliveryRate` | `Float` | Yes | — |
| `openRate` | `Float` | Yes | — |
| `clickRate` | `Float` | Yes | — |
| `bounceRate` | `Float` | Yes | — |
| `complaintRate` | `Float` | Yes | — |
| `readEngagementRate` | `Float` | Yes | — |


## ProjectTimelineBucketResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bucket` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `count` | `Integer` | Yes | — |


## ProjectMetricsTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `granularity` | `String` | Yes | — |
| `format` | `String` | Yes | — |
| `buckets` | `Array<ProjectTimelineBucketResponse>` | Yes | — |


## AdvisorRecommendationDataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bounceRate` | `Float, nil | null` | No | — |
| `bounced` | `Integer, nil | null` | No | — |
| `accepted` | `Integer, nil | null` | No | — |
| `complaintRate` | `Float, nil | null` | No | — |
| `accepted24h` | `Integer, nil | null` | No | — |
| `avgDailyAccepted7d` | `Integer, nil | null` | No | — |
| `daysSinceLastSend` | `Integer, nil | null` | No | — |
| `reportedOpenRate` | `Float, nil | null` | No | — |
| `adjustedOpenRate` | `Float, nil | null` | No | — |
| `proxyRate` | `Float, nil | null` | No | — |
| `proxyOpens` | `Integer, nil | null` | No | — |
| `totalOpens` | `Integer, nil | null` | No | — |
| `humanOpenRate` | `Float, nil | null` | No | — |
| `delivered` | `Integer, nil | null` | No | — |
| `unsubRate` | `Float, nil | null` | No | — |
| `unsubscribed` | `Integer, nil | null` | No | — |
| `dmarcAlignmentFailureRate7d` | `Float, nil | null` | No | — |
| `dmarcDomain` | `String, nil | null` | No | — |
| `dmarcCurrentPolicy` | `String, nil | null` | No | — |
| `dmarcRecommendedPolicy` | `String, nil | null` | No | — |
| `dmarcObservedMessages` | `Integer, nil | null` | No | — |
| `dmarcAlignedMessages` | `Integer, nil | null` | No | — |
| `dmarcAccountedRate` | `Float, nil | null` | No | — |
| `dmarcUnknownMessages` | `Integer, nil | null` | No | — |
| `dmarcUnknownSources` | `Integer, nil | null` | No | — |
| `dmarcReportingDays` | `Integer, nil | null` | No | — |


## AdvisorRecommendationResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `code` | `String` | Yes | — |
| `severity` | `String` | Yes | — |
| `title` | `String` | Yes | — |
| `message` | `String` | Yes | — |
| `data` | `AdvisorRecommendationDataResponse, nil | null` | No | — |


## AdvisorReportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String` | Yes | — |
| `generatedAt` | `String` | Yes | — |
| `score` | `Integer` | Yes | — |
| `recommendations` | `Array<AdvisorRecommendationResponse>` | Yes | — |


## SuppressionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `email` | `String` | Yes | — |
| `reason` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `contactId` | `String, nil | null` | No | — |


## PageInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `page` | `Integer` | Yes | — |
| `size` | `Integer` | Yes | — |
| `total` | `Integer` | Yes | — |
| `totalPages` | `Integer` | Yes | — |
| `hasNextPage` | `Boolean` | Yes | — |
| `hasPreviousPage` | `Boolean` | Yes | — |


## SuppressionPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<SuppressionResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## AddSuppressionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String` | Yes | — |


## SuppressionImportRowSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String` | Yes | — |
| `reason` | `String, nil | null` | No | — |


## SuppressionImportBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `suppressions` | `Array<SuppressionImportRowSerializable>` | Yes | — |


## SuppressionImportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `imported` | `Integer` | Yes | — |
| `skipped` | `Integer` | Yes | — |


## SegmentResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `contactCount` | `Integer` | No | — |
| `unsubscribedCount` | `Integer` | No | — |


## SegmentPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<SegmentResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `contactId` | `String` | Yes | — |
| `email` | `String` | Yes | — |
| `firstName` | `String, nil | null` | Yes | — |
| `lastName` | `String, nil | null` | Yes | — |
| `segments` | `Array<String>` | Yes | — |


## CursorInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `nextCursor` | `String, nil | null` | Yes | — |
| `previousCursor` | `String, nil | null` | Yes | — |
| `hasNextPage` | `Boolean` | Yes | — |
| `hasPreviousPage` | `Boolean` | Yes | — |


## CursorPage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<SegmentContactResponse>` | Yes | — |
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
| `description` | `String, nil | null` | Yes | — |
| `visibility` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `optInCount` | `Integer` | Yes | — |
| `optOutCount` | `Integer` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## TopicPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<TopicResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |
| `defaultSubscription` | `String` | Yes | — |
| `description` | `String, nil | null` | No | — |
| `visibility` | `String, nil | null` | No | — |


## UpdateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String, nil | null` | No | — |
| `description` | `String, nil | null` | No | — |
| `visibility` | `String, nil | null` | No | — |


## ContactPropertyResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `key` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `fallbackValue` | `String, nil | null` | Yes | — |
| `projectId` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## ContactPropertyPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<ContactPropertyResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `key` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `fallbackValue` | `String, nil | null` | No | — |


## UpdateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `fallbackValue` | `String, nil | null` | No | — |


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
| `phone` | `String, nil | null` | No | — |
| `firstName` | `String, nil | null` | Yes | — |
| `lastName` | `String, nil | null` | Yes | — |
| `unsubscribed` | `Boolean` | Yes | — |
| `properties` | `Hash{String => String}` | Yes | — |
| `profileImageUrl` | `String, nil | null` | Yes | — |
| `projectId` | `String` | Yes | — |
| `segments` | `Array<String>` | Yes | — |
| `topics` | `Array<TopicSubscriptionResponse>` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## ContactPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<ContactResponse>` | Yes | — |
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
| `phone` | `String, nil | null` | No | — |
| `firstName` | `String, nil | null` | No | — |
| `lastName` | `String, nil | null` | No | — |
| `unsubscribed` | `Boolean` | No | — |
| `properties` | `Hash{String => String}` | No | — |
| `segments` | `Array<SegmentRef>` | No | — |
| `topics` | `Array<TopicSubscriptionBody>` | No | — |


## UpdateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `firstName` | `String, nil | null` | No | — |
| `lastName` | `String, nil | null` | No | — |
| `phone` | `String, nil | null` | No | — |
| `unsubscribed` | `Boolean, nil | null` | No | — |
| `properties` | `Hash{String => String} | null` | No | — |


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
| `topics` | `Array<TopicSubscriptionBody>` | Yes | — |


## ActivityMetadataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `String, nil | null` | No | — |


## ActivityResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `id` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `referenceId` | `String, nil | null` | No | — |
| `referenceName` | `String, nil | null` | No | — |
| `metadata` | `ActivityMetadataResponse, nil | null` | No | — |
| `occurredAt` | `String` | Yes | — |


## EngagementScoreResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `score` | `Integer` | Yes | — |
| `tier` | `String` | Yes | — |
| `scoredAt` | `String` | Yes | — |


## EmailValidationStatusResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String` | No | — |
| `status` | `String` | Yes | — |
| `reason` | `String, nil | null` | Yes | — |
| `validatedAt` | `String, nil | null` | Yes | — |


## RecordValidationBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `status` | `EmailValidationStatusInput` | Yes | — |
| `reason` | `String, nil | null` | No | — |


## WebhookFilterSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `field` | `String` | Yes | — |
| `operator` | `String` | Yes | — |
| `value` | `String, nil | null` | No | — |


## WebhookTransformationSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `String` | Yes | — |
| `from` | `String, nil | null` | No | — |
| `to` | `String, nil | null` | No | — |
| `field` | `String, nil | null` | No | — |
| `value` | `String, nil | null` | No | — |
| `template` | `String, nil | null` | No | — |


## WebhookResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `url` | `String` | Yes | — |
| `events` | `Array<String>` | Yes | — |
| `enabled` | `Boolean` | Yes | — |
| `filters` | `Array<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `Array<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## WebhookPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<WebhookResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## WebhookDeliveryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `webhookEndpointId` | `String` | Yes | — |
| `eventType` | `String` | Yes | — |
| `status` | `String` | Yes | — |
| `attemptCount` | `Integer` | Yes | — |
| `lastStatusCode` | `Integer, nil | null` | Yes | — |
| `lastError` | `String, nil | null` | Yes | — |
| `responseBodySnippet` | `String, nil | null` | Yes | — |
| `nextAttemptAt` | `String, nil | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## WebhookDeliveryPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<WebhookDeliveryResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String` | Yes | — |
| `events` | `Array<String>` | Yes | — |
| `name` | `String, nil | null` | No | — |
| `secret` | `String, nil | null` | No | — |
| `filters` | `Array<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `Array<WebhookTransformationSerializable> | null` | No | — |


## WebhookCreateResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `projectId` | `String` | Yes | — |
| `name` | `String` | Yes | — |
| `url` | `String` | Yes | — |
| `events` | `Array<String>` | Yes | — |
| `enabled` | `Boolean` | Yes | — |
| `filters` | `Array<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `Array<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |
| `secret` | `String` | Yes | — |


## UpdateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String, nil | null` | No | — |
| `url` | `String, nil | null` | No | — |
| `events` | `Array<String> | null` | No | — |
| `secret` | `String, nil | null` | No | — |
| `enabled` | `Boolean, nil | null` | No | — |
| `filters` | `Array<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `Array<WebhookTransformationSerializable> | null` | No | — |


## ApiKey

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `configId` | `String` | Yes | — |
| `name` | `String, nil | null` | Yes | — |
| `start` | `String, nil | null` | Yes | — |
| `prefix` | `String, nil | null` | Yes | — |
| `organizationId` | `String` | Yes | — |
| `projectId` | `String, nil | null` | Yes | — |
| `enabled` | `Boolean` | Yes | — |
| `rateLimitEnabled` | `Boolean` | Yes | — |
| `rateLimitTimeWindow` | `Integer, nil | null` | Yes | — |
| `rateLimitMax` | `Integer, nil | null` | Yes | — |
| `requestCount` | `Integer` | Yes | — |
| `remaining` | `Integer, nil | null` | Yes | — |
| `lastRequest` | `String, nil | null` | Yes | — |
| `expiresAt` | `String, nil | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |
| `metadata` | `Hash{String => String} | null` | Yes | — |
| `permissions` | `Hash{String => Array<String>} | null` | Yes | — |


## ApiKeyUsageRecord

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `keyId` | `String` | Yes | — |
| `orgId` | `String` | Yes | — |
| `method` | `String` | Yes | — |
| `route` | `String` | Yes | — |
| `statusCode` | `Integer` | Yes | — |
| `durationMs` | `Integer, nil | null` | Yes | — |
| `ip` | `String, nil | null` | Yes | — |
| `ts` | `String` | Yes | — |


## UsagePage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `size` | `Integer` | Yes | — |
| `totalPages` | `Integer` | Yes | — |
| `hasMore` | `Boolean` | Yes | — |


## ApiKeyUsageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<ApiKeyUsageRecord>` | Yes | — |
| `page` | `UsagePage` | Yes | — |


## ProjectLimitsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dailySends` | `Integer` | Yes | — |
| `perSecondSends` | `Integer` | Yes | — |
| `maxRecipientsPerMessage` | `Integer` | Yes | — |
| `maxDomains` | `Integer` | Yes | — |
| `maxApiKeys` | `Integer` | Yes | — |
| `maxWebhooks` | `Integer` | Yes | — |


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
| `suspensionReason` | `String, nil | null` | Yes | — |
| `region` | `String` | Yes | — |
| `limits` | `ProjectLimitsModel` | Yes | — |
| `trackingSettings` | `ProjectTrackingSettingsModel` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |


## ProjectPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<ProjectResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## UpdateProjectRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String, nil | null` | No | — |
| `slug` | `String, nil | null` | No | — |
| `limits` | `ProjectLimitsModel, nil | null` | No | — |
| `trackingSettings` | `ProjectTrackingSettingsModel, nil | null` | No | — |


## EmailPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<EmailDetailResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## EmailTimelineItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `providerEventId` | `String, nil | null` | Yes | — |
| `payload` | `Hash{String => String, nil} | null` | Yes | — |
| `occurredAt` | `String` | Yes | — |
| `createdAt` | `String` | Yes | — |


## EmailTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `Array<EmailTimelineItem>` | Yes | — |


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
| `data` | `Array<DomainListItemResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## DkimRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `value` | `String` | Yes | — |
| `status` | `String, nil | null` | No | — |


## DnsRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String` | Yes | — |
| `type` | `String` | Yes | — |
| `value` | `String` | Yes | — |
| `priority` | `Integer, nil | null` | No | — |
| `optional` | `Boolean, nil | null` | No | — |
| `status` | `String, nil | null` | No | — |


## VerificationRecordsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dkim` | `Array<DkimRecordResponse>` | Yes | — |
| `mailFromMx` | `DnsRecordResponse` | Yes | — |
| `mailFromSpf` | `DnsRecordResponse` | Yes | — |
| `dmarcRecommended` | `DnsRecordResponse, nil | null` | No | — |
| `bimi` | `DnsRecordResponse, nil | null` | No | — |
| `trackingCname` | `DnsRecordResponse, nil | null` | No | — |


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
| `bimiLogoUrl` | `String, nil | null` | Yes | — |
| `createdAt` | `String` | Yes | — |
| `updatedAt` | `String` | Yes | — |
| `verifiedAt` | `String, nil | null` | Yes | — |


## RegisterDomainRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `domain` | `String` | Yes | — |
| `region` | `String` | Yes | — |


## UpdateBimiRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `logoUrl` | `String, nil | null` | No | — |


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

Alias of `Array<String>`.


## GetContactTopicsResponse

Alias of `Array<TopicSubscriptionResponse>`.


## GetContactActivityResponse

Alias of `Array<ActivityResponse>`.


## ListApiKeysResponse

This model has no declared properties.

Additional properties use `Array<ApiKey>`.

