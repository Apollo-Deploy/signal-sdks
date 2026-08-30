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
| `filename` | `string` | Yes | — |
| `content` | `string` | Yes | — |
| `contentType` | `string` | Yes | — |
| `disposition` | `string` | No | — |
| `contentId` | `string | null` | No | — |


## DeliveryWindowRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `start` | `string` | Yes | — |
| `end` | `string` | Yes | — |


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
| `from` | `string` | Yes | — |
| `to` | `[]string` | Yes | — |
| `cc` | `[]string | null` | No | — |
| `bcc` | `[]string | null` | No | — |
| `replyTo` | `string | null` | No | — |
| `subject` | `string | null` | No | — |
| `html` | `string | null` | No | — |
| `text` | `string | null` | No | — |
| `tags` | `map[string]string | null` | No | — |
| `metadata` | `map[string]string | null` | No | — |
| `idempotencyKey` | `string | null` | No | — |
| `testMode` | `bool` | No | — |
| `attachments` | `[]AttachmentRequest | null` | No | — |
| `scheduledAt` | `string | null` | No | — |
| `deliveryWindow` | `DeliveryWindowRequest | null` | No | — |
| `sendTimeCategory` | `string` | No | — |
| `trackingSettings` | `TrackingSettingsRequest | null` | No | — |


## BatchSendItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `index` | `int` | Yes | — |
| `id` | `string | null` | No | — |
| `messageId` | `string | null` | No | — |
| `status` | `string | null` | No | — |
| `createdAt` | `string | null` | No | — |
| `scheduledAt` | `string | null` | No | — |
| `error` | `string | null` | No | — |


## SendEmailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `messageId` | `string | null` | Yes | — |
| `status` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `scheduledAt` | `string | null` | No | — |
| `audienceId` | `string | null` | No | — |
| `messages` | `[]BatchSendItemResponse | null` | No | — |


## EmailDetailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `messageId` | `string | null` | Yes | — |
| `from` | `string` | Yes | — |
| `to` | `[]string` | Yes | — |
| `cc` | `[]string | null` | Yes | — |
| `bcc` | `[]string | null` | Yes | — |
| `replyTo` | `string | null` | Yes | — |
| `subject` | `string` | Yes | — |
| `html` | `string | null` | No | — |
| `text` | `string | null` | No | — |
| `status` | `string` | Yes | — |
| `error` | `string | null` | Yes | — |
| `tags` | `map[string]string | null` | Yes | — |
| `metadata` | `map[string]string | null` | Yes | — |
| `testMode` | `bool` | Yes | — |
| `topicId` | `string | null` | No | — |
| `createdAt` | `string` | Yes | — |
| `sentAt` | `string | null` | Yes | — |
| `updatedAt` | `string | null` | Yes | — |


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
| `cancelled` | `int` | Yes | — |


## StreamTokenResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `token` | `string` | Yes | — |
| `expiresAt` | `string` | Yes | — |


## StreamEventResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `string` | Yes | — |
| `emailId` | `string` | Yes | — |
| `occurredAt` | `string` | Yes | — |
| `data` | `map[string]string` | No | — |


## ValidateLinksRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `html` | `string | null` | No | — |


## LinkResultItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `string` | Yes | — |
| `status` | `string` | Yes | — |
| `statusCode` | `int | null` | No | — |
| `error` | `string | null` | No | — |


## ValidateLinksResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `links` | `[]LinkResultItem` | Yes | — |
| `totalLinks` | `int` | Yes | — |
| `brokenLinks` | `int` | Yes | — |
| `errorLinks` | `int` | Yes | — |


## MetricsWindowResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `string` | Yes | — |
| `to` | `string` | Yes | — |
| `label` | `string` | Yes | — |


## TopicPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `string` | Yes | — |
| `topicName` | `string` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `totalEmails` | `int` | Yes | — |
| `delivered` | `int` | Yes | — |
| `deliveryRate` | `float64` | Yes | — |
| `opened` | `int` | Yes | — |
| `openRate` | `float64` | Yes | — |
| `clicked` | `int` | Yes | — |
| `clickRate` | `float64` | Yes | — |
| `bounced` | `int` | Yes | — |
| `bounceRate` | `float64` | Yes | — |
| `complained` | `int` | Yes | — |
| `complaintRate` | `float64` | Yes | — |
| `unsubscribed` | `int` | Yes | — |
| `unsubscribeRate` | `float64` | Yes | — |
| `readEngaged` | `int` | Yes | — |
| `readEngagementRate` | `float64` | Yes | — |
| `avgReadTimeSeconds` | `float64 | null` | Yes | — |
| `optInCount` | `int` | Yes | — |
| `optOutCount` | `int` | Yes | — |
| `computedAt` | `string` | Yes | — |


## EmailPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `string` | Yes | — |
| `subject` | `string` | Yes | — |
| `fromAddress` | `string` | Yes | — |
| `topicId` | `string | null` | Yes | — |
| `status` | `string` | Yes | — |
| `delivered` | `bool` | Yes | — |
| `opened` | `bool` | Yes | — |
| `clicked` | `bool` | Yes | — |
| `totalClicks` | `int` | Yes | — |
| `bounced` | `bool` | Yes | — |
| `complained` | `bool` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `float64 | null` | Yes | — |
| `readCategory` | `string | null` | Yes | — |
| `sentAt` | `string | null` | Yes | — |
| `lastEventAt` | `string | null` | Yes | — |
| `computedAt` | `string` | Yes | — |


## EmailReadScrollAnalyticsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `string` | Yes | — |
| `subject` | `string` | Yes | — |
| `computedAt` | `string` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `float64 | null` | Yes | — |
| `readCategory` | `string | null` | Yes | — |
| `mailClient` | `string | null` | Yes | — |
| `deviceType` | `string | null` | Yes | — |
| `os` | `string | null` | Yes | — |
| `readEngagedAt` | `string | null` | Yes | — |
| `shortEmail` | `bool` | Yes | — |
| `depth25Count` | `int` | Yes | — |
| `depth50Count` | `int` | Yes | — |
| `depth75Count` | `int` | Yes | — |
| `depth100Count` | `int` | Yes | — |
| `maxDepthPct` | `int | null` | Yes | — |
| `depth25Rate` | `float64 | null` | Yes | — |
| `depth50Rate` | `float64 | null` | Yes | — |
| `depth75Rate` | `float64 | null` | Yes | — |
| `depth100Rate` | `float64 | null` | Yes | — |


## ProjectMetricsSummaryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `string` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `sent` | `int` | Yes | — |
| `delivered` | `int` | Yes | — |
| `opened` | `int` | Yes | — |
| `clicked` | `int` | Yes | — |
| `bounced` | `int` | Yes | — |
| `complained` | `int` | Yes | — |
| `failed` | `int` | Yes | — |
| `unsubscribed` | `int` | Yes | — |
| `readEngaged` | `int` | Yes | — |
| `deliveryRate` | `float64` | Yes | — |
| `openRate` | `float64` | Yes | — |
| `clickRate` | `float64` | Yes | — |
| `bounceRate` | `float64` | Yes | — |
| `complaintRate` | `float64` | Yes | — |
| `readEngagementRate` | `float64` | Yes | — |


## ProjectTimelineBucketResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bucket` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `count` | `int` | Yes | — |


## ProjectMetricsTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `string` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `granularity` | `string` | Yes | — |
| `format` | `string` | Yes | — |
| `buckets` | `[]ProjectTimelineBucketResponse` | Yes | — |


## AdvisorRecommendationDataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bounceRate` | `float64 | null` | No | — |
| `bounced` | `int | null` | No | — |
| `accepted` | `int | null` | No | — |
| `complaintRate` | `float64 | null` | No | — |
| `accepted24h` | `int | null` | No | — |
| `avgDailyAccepted7d` | `int | null` | No | — |
| `daysSinceLastSend` | `int | null` | No | — |
| `reportedOpenRate` | `float64 | null` | No | — |
| `adjustedOpenRate` | `float64 | null` | No | — |
| `proxyRate` | `float64 | null` | No | — |
| `proxyOpens` | `int | null` | No | — |
| `totalOpens` | `int | null` | No | — |
| `humanOpenRate` | `float64 | null` | No | — |
| `delivered` | `int | null` | No | — |
| `unsubRate` | `float64 | null` | No | — |
| `unsubscribed` | `int | null` | No | — |
| `dmarcAlignmentFailureRate7d` | `float64 | null` | No | — |
| `dmarcDomain` | `string | null` | No | — |
| `dmarcCurrentPolicy` | `string | null` | No | — |
| `dmarcRecommendedPolicy` | `string | null` | No | — |
| `dmarcObservedMessages` | `int | null` | No | — |
| `dmarcAlignedMessages` | `int | null` | No | — |
| `dmarcAccountedRate` | `float64 | null` | No | — |
| `dmarcUnknownMessages` | `int | null` | No | — |
| `dmarcUnknownSources` | `int | null` | No | — |
| `dmarcReportingDays` | `int | null` | No | — |


## AdvisorRecommendationResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `code` | `string` | Yes | — |
| `severity` | `string` | Yes | — |
| `title` | `string` | Yes | — |
| `message` | `string` | Yes | — |
| `data` | `AdvisorRecommendationDataResponse | null` | No | — |


## AdvisorReportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `string` | Yes | — |
| `generatedAt` | `string` | Yes | — |
| `score` | `int` | Yes | — |
| `recommendations` | `[]AdvisorRecommendationResponse` | Yes | — |


## SuppressionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `email` | `string` | Yes | — |
| `reason` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `contactId` | `string | null` | No | — |


## PageInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `page` | `int` | Yes | — |
| `size` | `int` | Yes | — |
| `total` | `int` | Yes | — |
| `totalPages` | `int` | Yes | — |
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
| `email` | `string` | Yes | — |


## SuppressionImportRowSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `string` | Yes | — |
| `reason` | `string | null` | No | — |


## SuppressionImportBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `suppressions` | `[]SuppressionImportRowSerializable` | Yes | — |


## SuppressionImportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `imported` | `int` | Yes | — |
| `skipped` | `int` | Yes | — |


## SegmentResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `contactCount` | `int` | No | — |
| `unsubscribedCount` | `int` | No | — |


## SegmentPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]SegmentResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `contactId` | `string` | Yes | — |
| `email` | `string` | Yes | — |
| `firstName` | `string | null` | Yes | — |
| `lastName` | `string | null` | Yes | — |
| `segments` | `[]string` | Yes | — |


## CursorInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `nextCursor` | `string | null` | Yes | — |
| `previousCursor` | `string | null` | Yes | — |
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
| `name` | `string` | Yes | — |


## TopicResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `defaultSubscription` | `string` | Yes | — |
| `description` | `string | null` | Yes | — |
| `visibility` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `optInCount` | `int` | Yes | — |
| `optOutCount` | `int` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## TopicPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]TopicResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string` | Yes | — |
| `defaultSubscription` | `string` | Yes | — |
| `description` | `string | null` | No | — |
| `visibility` | `string | null` | No | — |


## UpdateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string | null` | No | — |
| `description` | `string | null` | No | — |
| `visibility` | `string | null` | No | — |


## ContactPropertyResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `key` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `fallbackValue` | `string | null` | Yes | — |
| `projectId` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## ContactPropertyPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]ContactPropertyResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `key` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `fallbackValue` | `string | null` | No | — |


## UpdateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `fallbackValue` | `string | null` | No | — |


## TopicSubscriptionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `string` | Yes | — |
| `subscription` | `string` | Yes | — |


## ContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `email` | `string` | Yes | — |
| `phone` | `string | null` | No | — |
| `firstName` | `string | null` | Yes | — |
| `lastName` | `string | null` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `properties` | `map[string]string` | Yes | — |
| `profileImageUrl` | `string | null` | Yes | — |
| `projectId` | `string` | Yes | — |
| `segments` | `[]string` | Yes | — |
| `topics` | `[]TopicSubscriptionResponse` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## ContactPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]ContactResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentRef

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |


## TopicSubscriptionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `subscription` | `string` | Yes | — |


## CreateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `string` | Yes | — |
| `phone` | `string | null` | No | — |
| `firstName` | `string | null` | No | — |
| `lastName` | `string | null` | No | — |
| `unsubscribed` | `bool` | No | — |
| `properties` | `map[string]string` | No | — |
| `segments` | `[]SegmentRef` | No | — |
| `topics` | `[]TopicSubscriptionBody` | No | — |


## UpdateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `firstName` | `string | null` | No | — |
| `lastName` | `string | null` | No | — |
| `phone` | `string | null` | No | — |
| `unsubscribed` | `bool | null` | No | — |
| `properties` | `map[string]string | null` | No | — |


## SetImageUrlBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `string` | Yes | — |


## AddToSegmentBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `segmentId` | `string` | Yes | — |


## UpdateTopicsBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topics` | `[]TopicSubscriptionBody` | Yes | — |


## ActivityMetadataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `string | null` | No | — |


## ActivityResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `referenceId` | `string | null` | No | — |
| `referenceName` | `string | null` | No | — |
| `metadata` | `ActivityMetadataResponse | null` | No | — |
| `occurredAt` | `string` | Yes | — |


## EngagementScoreResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `score` | `int` | Yes | — |
| `tier` | `string` | Yes | — |
| `scoredAt` | `string` | Yes | — |


## EmailValidationStatusResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `status` | `string` | Yes | — |
| `reason` | `string | null` | Yes | — |
| `validatedAt` | `string | null` | Yes | — |


## RecordValidationBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `status` | `EmailValidationStatusInput` | Yes | — |
| `reason` | `string | null` | No | — |


## WebhookFilterSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `field` | `string` | Yes | — |
| `operator` | `string` | Yes | — |
| `value` | `string | null` | No | — |


## WebhookTransformationSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `string` | Yes | — |
| `from` | `string | null` | No | — |
| `to` | `string | null` | No | — |
| `field` | `string | null` | No | — |
| `value` | `string | null` | No | — |
| `template` | `string | null` | No | — |


## WebhookResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `url` | `string` | Yes | — |
| `events` | `[]string` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `[]WebhookFilterSerializable | null` | Yes | — |
| `transformations` | `[]WebhookTransformationSerializable | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## WebhookPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]WebhookResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## WebhookDeliveryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `webhookEndpointId` | `string` | Yes | — |
| `eventType` | `string` | Yes | — |
| `status` | `string` | Yes | — |
| `attemptCount` | `int` | Yes | — |
| `lastStatusCode` | `int | null` | Yes | — |
| `lastError` | `string | null` | Yes | — |
| `responseBodySnippet` | `string | null` | Yes | — |
| `nextAttemptAt` | `string | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## WebhookDeliveryPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]WebhookDeliveryResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `string` | Yes | — |
| `events` | `[]string` | Yes | — |
| `name` | `string | null` | No | — |
| `secret` | `string | null` | No | — |
| `filters` | `[]WebhookFilterSerializable | null` | No | — |
| `transformations` | `[]WebhookTransformationSerializable | null` | No | — |


## WebhookCreateResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `url` | `string` | Yes | — |
| `events` | `[]string` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `[]WebhookFilterSerializable | null` | Yes | — |
| `transformations` | `[]WebhookTransformationSerializable | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |
| `secret` | `string` | Yes | — |


## UpdateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string | null` | No | — |
| `url` | `string | null` | No | — |
| `events` | `[]string | null` | No | — |
| `secret` | `string | null` | No | — |
| `enabled` | `bool | null` | No | — |
| `filters` | `[]WebhookFilterSerializable | null` | No | — |
| `transformations` | `[]WebhookTransformationSerializable | null` | No | — |


## ApiKey

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `configId` | `string` | Yes | — |
| `name` | `string | null` | Yes | — |
| `start` | `string | null` | Yes | — |
| `prefix` | `string | null` | Yes | — |
| `organizationId` | `string` | Yes | — |
| `projectId` | `string | null` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `rateLimitEnabled` | `bool` | Yes | — |
| `rateLimitTimeWindow` | `int | null` | Yes | — |
| `rateLimitMax` | `int | null` | Yes | — |
| `requestCount` | `int` | Yes | — |
| `remaining` | `int | null` | Yes | — |
| `lastRequest` | `string | null` | Yes | — |
| `expiresAt` | `string | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |
| `metadata` | `map[string]string | null` | Yes | — |
| `permissions` | `map[string][]string | null` | Yes | — |


## ApiKeyUsageRecord

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `keyId` | `string` | Yes | — |
| `orgId` | `string` | Yes | — |
| `method` | `string` | Yes | — |
| `route` | `string` | Yes | — |
| `statusCode` | `int` | Yes | — |
| `durationMs` | `int | null` | Yes | — |
| `ip` | `string | null` | Yes | — |
| `ts` | `string` | Yes | — |


## UsagePage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `size` | `int` | Yes | — |
| `totalPages` | `int` | Yes | — |
| `hasMore` | `bool` | Yes | — |


## ApiKeyUsageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]ApiKeyUsageRecord` | Yes | — |
| `page` | `UsagePage` | Yes | — |


## ProjectLimitsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dailySends` | `int` | Yes | — |
| `perSecondSends` | `int` | Yes | — |
| `maxRecipientsPerMessage` | `int` | Yes | — |
| `maxDomains` | `int` | Yes | — |
| `maxApiKeys` | `int` | Yes | — |
| `maxWebhooks` | `int` | Yes | — |


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
| `id` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `slug` | `string` | Yes | — |
| `status` | `string` | Yes | — |
| `suspensionReason` | `string | null` | Yes | — |
| `region` | `string` | Yes | — |
| `limits` | `ProjectLimitsModel` | Yes | — |
| `trackingSettings` | `ProjectTrackingSettingsModel` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## ProjectPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]ProjectResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## UpdateProjectRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string | null` | No | — |
| `slug` | `string | null` | No | — |
| `limits` | `ProjectLimitsModel | null` | No | — |
| `trackingSettings` | `ProjectTrackingSettingsModel | null` | No | — |


## EmailPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]EmailDetailResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## EmailTimelineItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `providerEventId` | `string | null` | Yes | — |
| `payload` | `map[string]string | null` | Yes | — |
| `occurredAt` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |


## EmailTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `[]EmailTimelineItem` | Yes | — |


## DomainListItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `domain` | `string` | Yes | — |
| `region` | `string` | Yes | — |
| `status` | `string` | Yes | — |
| `dkimStatus` | `string` | Yes | — |
| `bimiStatus` | `string` | Yes | — |
| `trackingStatus` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## DomainListPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `[]DomainListItemResponse` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## DkimRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `value` | `string` | Yes | — |
| `status` | `string | null` | No | — |


## DnsRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `value` | `string` | Yes | — |
| `priority` | `int | null` | No | — |
| `optional` | `bool | null` | No | — |
| `status` | `string | null` | No | — |


## VerificationRecordsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dkim` | `[]DkimRecordResponse` | Yes | — |
| `mailFromMx` | `DnsRecordResponse` | Yes | — |
| `mailFromSpf` | `DnsRecordResponse` | Yes | — |
| `dmarcRecommended` | `DnsRecordResponse | null` | No | — |
| `bimi` | `DnsRecordResponse | null` | No | — |
| `trackingCname` | `DnsRecordResponse | null` | No | — |


## DomainResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `domain` | `string` | Yes | — |
| `region` | `string` | Yes | — |
| `status` | `string` | Yes | — |
| `dkimStatus` | `string` | Yes | — |
| `spfStatus` | `string` | Yes | — |
| `dmarcStatus` | `string` | Yes | — |
| `mailFromStatus` | `string` | Yes | — |
| `mailFromDomain` | `string` | Yes | — |
| `verificationRecords` | `VerificationRecordsResponse` | Yes | — |
| `bimiStatus` | `string` | Yes | — |
| `bimiLogoUrl` | `string | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |
| `verifiedAt` | `string | null` | Yes | — |


## RegisterDomainRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `domain` | `string` | Yes | — |
| `region` | `string` | Yes | — |


## UpdateBimiRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `logoUrl` | `string | null` | No | — |


## EmailValidationStatusInput

Allowed values:

- `"valid"`
- `"risky"`
- `"invalid"`
- `"unknown"`


## GetTopicPerformanceQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `string` | No | Time window. |
| `projectId` | `string` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsSummaryQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `string` | No | Metrics time window. |
| `projectId` | `string` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsTimelineQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `string` | No | Metrics time window. |
| `granularity` | `string` | No | `hour` or `day`. |
| `format` | `string` | No | `compact` or `detailed`. |
| `projectId` | `string` | No | Required for session auth; ignored for API key auth. |


## GetMetricsAdvisorQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `string` | No | Required for session auth; ignored for API key auth. |


## ListContactSegmentsResponse

Alias of `[]string`.


## GetContactTopicsResponse

Alias of `[]TopicSubscriptionResponse`.


## GetContactActivityResponse

Alias of `[]ActivityResponse`.


## ListApiKeysResponse

This model has no declared properties.

Additional properties use `[]ApiKey`.

