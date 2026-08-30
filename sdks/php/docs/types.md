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
| `contentId` | `string|null | null` | No | — |


## DeliveryWindowRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `start` | `string` | Yes | — |
| `end` | `string` | Yes | — |


## TrackingSettingsRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `bool|null | null` | No | — |
| `clickTracking` | `bool|null | null` | No | — |
| `unsubscribeTracking` | `bool|null | null` | No | — |
| `readEngagement` | `bool|null | null` | No | — |


## SendEmailRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `string` | Yes | — |
| `to` | `list<string>` | Yes | — |
| `cc` | `list<string> | null` | No | — |
| `bcc` | `list<string> | null` | No | — |
| `replyTo` | `string|null | null` | No | — |
| `subject` | `string|null | null` | No | — |
| `html` | `string|null | null` | No | — |
| `text` | `string|null | null` | No | — |
| `tags` | `array<string, string> | null` | No | — |
| `metadata` | `array<string, string> | null` | No | — |
| `idempotencyKey` | `string|null | null` | No | — |
| `testMode` | `bool` | No | — |
| `attachments` | `list<AttachmentRequest> | null` | No | — |
| `scheduledAt` | `string|null | null` | No | — |
| `deliveryWindow` | `DeliveryWindowRequest|null | null` | No | — |
| `sendTimeCategory` | `string` | No | — |
| `trackingSettings` | `TrackingSettingsRequest|null | null` | No | — |


## BatchSendItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `index` | `int` | Yes | — |
| `id` | `string|null | null` | No | — |
| `messageId` | `string|null | null` | No | — |
| `status` | `string|null | null` | No | — |
| `createdAt` | `string|null | null` | No | — |
| `scheduledAt` | `string|null | null` | No | — |
| `error` | `string|null | null` | No | — |


## SendEmailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `messageId` | `string|null | null` | Yes | — |
| `status` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `scheduledAt` | `string|null | null` | No | — |
| `audienceId` | `string|null | null` | No | — |
| `messages` | `list<BatchSendItemResponse> | null` | No | — |


## EmailDetailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `messageId` | `string|null | null` | Yes | — |
| `from` | `string` | Yes | — |
| `to` | `list<string>` | Yes | — |
| `cc` | `list<string> | null` | Yes | — |
| `bcc` | `list<string> | null` | Yes | — |
| `replyTo` | `string|null | null` | Yes | — |
| `subject` | `string` | Yes | — |
| `html` | `string|null | null` | No | — |
| `text` | `string|null | null` | No | — |
| `status` | `string` | Yes | — |
| `error` | `string|null | null` | Yes | — |
| `tags` | `array<string, string> | null` | Yes | — |
| `metadata` | `array<string, string> | null` | Yes | — |
| `testMode` | `bool` | Yes | — |
| `topicId` | `string|null | null` | No | — |
| `createdAt` | `string` | Yes | — |
| `sentAt` | `string|null | null` | Yes | — |
| `updatedAt` | `string|null | null` | Yes | — |


## BatchSendRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `list<SendEmailRequest>` | Yes | — |


## BatchSendResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `results` | `list<BatchSendItemResponse>` | Yes | — |


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
| `data` | `array<string, string>` | No | — |


## ValidateLinksRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `html` | `string|null | null` | No | — |


## LinkResultItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `string` | Yes | — |
| `status` | `string` | Yes | — |
| `statusCode` | `int|null | null` | No | — |
| `error` | `string|null | null` | No | — |


## ValidateLinksResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `links` | `list<LinkResultItem>` | Yes | — |
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
| `deliveryRate` | `float` | Yes | — |
| `opened` | `int` | Yes | — |
| `openRate` | `float` | Yes | — |
| `clicked` | `int` | Yes | — |
| `clickRate` | `float` | Yes | — |
| `bounced` | `int` | Yes | — |
| `bounceRate` | `float` | Yes | — |
| `complained` | `int` | Yes | — |
| `complaintRate` | `float` | Yes | — |
| `unsubscribed` | `int` | Yes | — |
| `unsubscribeRate` | `float` | Yes | — |
| `readEngaged` | `int` | Yes | — |
| `readEngagementRate` | `float` | Yes | — |
| `avgReadTimeSeconds` | `float|null | null` | Yes | — |
| `optInCount` | `int` | Yes | — |
| `optOutCount` | `int` | Yes | — |
| `computedAt` | `string` | Yes | — |


## EmailPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `string` | Yes | — |
| `subject` | `string` | Yes | — |
| `fromAddress` | `string` | Yes | — |
| `topicId` | `string|null | null` | Yes | — |
| `status` | `string` | Yes | — |
| `delivered` | `bool` | Yes | — |
| `opened` | `bool` | Yes | — |
| `clicked` | `bool` | Yes | — |
| `totalClicks` | `int` | Yes | — |
| `bounced` | `bool` | Yes | — |
| `complained` | `bool` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `float|null | null` | Yes | — |
| `readCategory` | `string|null | null` | Yes | — |
| `sentAt` | `string|null | null` | Yes | — |
| `lastEventAt` | `string|null | null` | Yes | — |
| `computedAt` | `string` | Yes | — |


## EmailReadScrollAnalyticsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `string` | Yes | — |
| `subject` | `string` | Yes | — |
| `computedAt` | `string` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `float|null | null` | Yes | — |
| `readCategory` | `string|null | null` | Yes | — |
| `mailClient` | `string|null | null` | Yes | — |
| `deviceType` | `string|null | null` | Yes | — |
| `os` | `string|null | null` | Yes | — |
| `readEngagedAt` | `string|null | null` | Yes | — |
| `shortEmail` | `bool` | Yes | — |
| `depth25Count` | `int` | Yes | — |
| `depth50Count` | `int` | Yes | — |
| `depth75Count` | `int` | Yes | — |
| `depth100Count` | `int` | Yes | — |
| `maxDepthPct` | `int|null | null` | Yes | — |
| `depth25Rate` | `float|null | null` | Yes | — |
| `depth50Rate` | `float|null | null` | Yes | — |
| `depth75Rate` | `float|null | null` | Yes | — |
| `depth100Rate` | `float|null | null` | Yes | — |


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
| `deliveryRate` | `float` | Yes | — |
| `openRate` | `float` | Yes | — |
| `clickRate` | `float` | Yes | — |
| `bounceRate` | `float` | Yes | — |
| `complaintRate` | `float` | Yes | — |
| `readEngagementRate` | `float` | Yes | — |


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
| `buckets` | `list<ProjectTimelineBucketResponse>` | Yes | — |


## AdvisorRecommendationDataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bounceRate` | `float|null | null` | No | — |
| `bounced` | `int|null | null` | No | — |
| `accepted` | `int|null | null` | No | — |
| `complaintRate` | `float|null | null` | No | — |
| `accepted24h` | `int|null | null` | No | — |
| `avgDailyAccepted7d` | `int|null | null` | No | — |
| `daysSinceLastSend` | `int|null | null` | No | — |
| `reportedOpenRate` | `float|null | null` | No | — |
| `adjustedOpenRate` | `float|null | null` | No | — |
| `proxyRate` | `float|null | null` | No | — |
| `proxyOpens` | `int|null | null` | No | — |
| `totalOpens` | `int|null | null` | No | — |
| `humanOpenRate` | `float|null | null` | No | — |
| `delivered` | `int|null | null` | No | — |
| `unsubRate` | `float|null | null` | No | — |
| `unsubscribed` | `int|null | null` | No | — |
| `dmarcAlignmentFailureRate7d` | `float|null | null` | No | — |
| `dmarcDomain` | `string|null | null` | No | — |
| `dmarcCurrentPolicy` | `string|null | null` | No | — |
| `dmarcRecommendedPolicy` | `string|null | null` | No | — |
| `dmarcObservedMessages` | `int|null | null` | No | — |
| `dmarcAlignedMessages` | `int|null | null` | No | — |
| `dmarcAccountedRate` | `float|null | null` | No | — |
| `dmarcUnknownMessages` | `int|null | null` | No | — |
| `dmarcUnknownSources` | `int|null | null` | No | — |
| `dmarcReportingDays` | `int|null | null` | No | — |


## AdvisorRecommendationResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `code` | `string` | Yes | — |
| `severity` | `string` | Yes | — |
| `title` | `string` | Yes | — |
| `message` | `string` | Yes | — |
| `data` | `AdvisorRecommendationDataResponse|null | null` | No | — |


## AdvisorReportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `string` | Yes | — |
| `generatedAt` | `string` | Yes | — |
| `score` | `int` | Yes | — |
| `recommendations` | `list<AdvisorRecommendationResponse>` | Yes | — |


## SuppressionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `email` | `string` | Yes | — |
| `reason` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `contactId` | `string|null | null` | No | — |


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
| `data` | `list<SuppressionResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## AddSuppressionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `string` | Yes | — |


## SuppressionImportRowSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `string` | Yes | — |
| `reason` | `string|null | null` | No | — |


## SuppressionImportBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `suppressions` | `list<SuppressionImportRowSerializable>` | Yes | — |


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
| `data` | `list<SegmentResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `contactId` | `string` | Yes | — |
| `email` | `string` | Yes | — |
| `firstName` | `string|null | null` | Yes | — |
| `lastName` | `string|null | null` | Yes | — |
| `segments` | `list<string>` | Yes | — |


## CursorInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `nextCursor` | `string|null | null` | Yes | — |
| `previousCursor` | `string|null | null` | Yes | — |
| `hasNextPage` | `bool` | Yes | — |
| `hasPreviousPage` | `bool` | Yes | — |


## CursorPage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list<SegmentContactResponse>` | Yes | — |
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
| `description` | `string|null | null` | Yes | — |
| `visibility` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `optInCount` | `int` | Yes | — |
| `optOutCount` | `int` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## TopicPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list<TopicResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string` | Yes | — |
| `defaultSubscription` | `string` | Yes | — |
| `description` | `string|null | null` | No | — |
| `visibility` | `string|null | null` | No | — |


## UpdateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string|null | null` | No | — |
| `description` | `string|null | null` | No | — |
| `visibility` | `string|null | null` | No | — |


## ContactPropertyResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `key` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `fallbackValue` | `string|null | null` | Yes | — |
| `projectId` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## ContactPropertyPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list<ContactPropertyResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `key` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `fallbackValue` | `string|null | null` | No | — |


## UpdateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `fallbackValue` | `string|null | null` | No | — |


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
| `phone` | `string|null | null` | No | — |
| `firstName` | `string|null | null` | Yes | — |
| `lastName` | `string|null | null` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `properties` | `array<string, string>` | Yes | — |
| `profileImageUrl` | `string|null | null` | Yes | — |
| `projectId` | `string` | Yes | — |
| `segments` | `list<string>` | Yes | — |
| `topics` | `list<TopicSubscriptionResponse>` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## ContactPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list<ContactResponse>` | Yes | — |
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
| `phone` | `string|null | null` | No | — |
| `firstName` | `string|null | null` | No | — |
| `lastName` | `string|null | null` | No | — |
| `unsubscribed` | `bool` | No | — |
| `properties` | `array<string, string>` | No | — |
| `segments` | `list<SegmentRef>` | No | — |
| `topics` | `list<TopicSubscriptionBody>` | No | — |


## UpdateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `firstName` | `string|null | null` | No | — |
| `lastName` | `string|null | null` | No | — |
| `phone` | `string|null | null` | No | — |
| `unsubscribed` | `bool|null | null` | No | — |
| `properties` | `array<string, string> | null` | No | — |


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
| `topics` | `list<TopicSubscriptionBody>` | Yes | — |


## ActivityMetadataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `string|null | null` | No | — |


## ActivityResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `referenceId` | `string|null | null` | No | — |
| `referenceName` | `string|null | null` | No | — |
| `metadata` | `ActivityMetadataResponse|null | null` | No | — |
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
| `reason` | `string|null | null` | Yes | — |
| `validatedAt` | `string|null | null` | Yes | — |


## RecordValidationBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `status` | `EmailValidationStatusInput` | Yes | — |
| `reason` | `string|null | null` | No | — |


## WebhookFilterSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `field` | `string` | Yes | — |
| `operator` | `string` | Yes | — |
| `value` | `string|null | null` | No | — |


## WebhookTransformationSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `string` | Yes | — |
| `from` | `string|null | null` | No | — |
| `to` | `string|null | null` | No | — |
| `field` | `string|null | null` | No | — |
| `value` | `string|null | null` | No | — |
| `template` | `string|null | null` | No | — |


## WebhookResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `url` | `string` | Yes | — |
| `events` | `list<string>` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `list<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `list<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## WebhookPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list<WebhookResponse>` | Yes | — |
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
| `lastStatusCode` | `int|null | null` | Yes | — |
| `lastError` | `string|null | null` | Yes | — |
| `responseBodySnippet` | `string|null | null` | Yes | — |
| `nextAttemptAt` | `string|null | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## WebhookDeliveryPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list<WebhookDeliveryResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `string` | Yes | — |
| `events` | `list<string>` | Yes | — |
| `name` | `string|null | null` | No | — |
| `secret` | `string|null | null` | No | — |
| `filters` | `list<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `list<WebhookTransformationSerializable> | null` | No | — |


## WebhookCreateResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `url` | `string` | Yes | — |
| `events` | `list<string>` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `list<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `list<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |
| `secret` | `string` | Yes | — |


## UpdateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string|null | null` | No | — |
| `url` | `string|null | null` | No | — |
| `events` | `list<string> | null` | No | — |
| `secret` | `string|null | null` | No | — |
| `enabled` | `bool|null | null` | No | — |
| `filters` | `list<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `list<WebhookTransformationSerializable> | null` | No | — |


## ApiKey

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `configId` | `string` | Yes | — |
| `name` | `string|null | null` | Yes | — |
| `start` | `string|null | null` | Yes | — |
| `prefix` | `string|null | null` | Yes | — |
| `organizationId` | `string` | Yes | — |
| `projectId` | `string|null | null` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `rateLimitEnabled` | `bool` | Yes | — |
| `rateLimitTimeWindow` | `int|null | null` | Yes | — |
| `rateLimitMax` | `int|null | null` | Yes | — |
| `requestCount` | `int` | Yes | — |
| `remaining` | `int|null | null` | Yes | — |
| `lastRequest` | `string|null | null` | Yes | — |
| `expiresAt` | `string|null | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |
| `metadata` | `array<string, string> | null` | Yes | — |
| `permissions` | `array<string, list<string>> | null` | Yes | — |


## ApiKeyUsageRecord

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `keyId` | `string` | Yes | — |
| `orgId` | `string` | Yes | — |
| `method` | `string` | Yes | — |
| `route` | `string` | Yes | — |
| `statusCode` | `int` | Yes | — |
| `durationMs` | `int|null | null` | Yes | — |
| `ip` | `string|null | null` | Yes | — |
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
| `data` | `list<ApiKeyUsageRecord>` | Yes | — |
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
| `suspensionReason` | `string|null | null` | Yes | — |
| `region` | `string` | Yes | — |
| `limits` | `ProjectLimitsModel` | Yes | — |
| `trackingSettings` | `ProjectTrackingSettingsModel` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## ProjectPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list<ProjectResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## UpdateProjectRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string|null | null` | No | — |
| `slug` | `string|null | null` | No | — |
| `limits` | `ProjectLimitsModel|null | null` | No | — |
| `trackingSettings` | `ProjectTrackingSettingsModel|null | null` | No | — |


## EmailPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list<EmailDetailResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## EmailTimelineItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `providerEventId` | `string|null | null` | Yes | — |
| `payload` | `array<string, string|null> | null` | Yes | — |
| `occurredAt` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |


## EmailTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `list<EmailTimelineItem>` | Yes | — |


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
| `data` | `list<DomainListItemResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## DkimRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `value` | `string` | Yes | — |
| `status` | `string|null | null` | No | — |


## DnsRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `value` | `string` | Yes | — |
| `priority` | `int|null | null` | No | — |
| `optional` | `bool|null | null` | No | — |
| `status` | `string|null | null` | No | — |


## VerificationRecordsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dkim` | `list<DkimRecordResponse>` | Yes | — |
| `mailFromMx` | `DnsRecordResponse` | Yes | — |
| `mailFromSpf` | `DnsRecordResponse` | Yes | — |
| `dmarcRecommended` | `DnsRecordResponse|null | null` | No | — |
| `bimi` | `DnsRecordResponse|null | null` | No | — |
| `trackingCname` | `DnsRecordResponse|null | null` | No | — |


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
| `bimiLogoUrl` | `string|null | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |
| `verifiedAt` | `string|null | null` | Yes | — |


## RegisterDomainRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `domain` | `string` | Yes | — |
| `region` | `string` | Yes | — |


## UpdateBimiRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `logoUrl` | `string|null | null` | No | — |


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

Alias of `list<string>`.


## GetContactTopicsResponse

Alias of `list<TopicSubscriptionResponse>`.


## GetContactActivityResponse

Alias of `list<ActivityResponse>`.


## ListApiKeysResponse

This model has no declared properties.

Additional properties use `list<ApiKey>`.

