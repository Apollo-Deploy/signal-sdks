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
| `contentId` | `string | null | null` | No | — |


## DeliveryWindowRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `start` | `string` | Yes | — |
| `end` | `string` | Yes | — |


## TrackingSettingsRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `boolean | null | null` | No | — |
| `clickTracking` | `boolean | null | null` | No | — |
| `unsubscribeTracking` | `boolean | null | null` | No | — |
| `readEngagement` | `boolean | null | null` | No | — |


## SendEmailRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `string` | Yes | — |
| `to` | `Array<string>` | Yes | — |
| `cc` | `Array<string> | null` | No | — |
| `bcc` | `Array<string> | null` | No | — |
| `replyTo` | `string | null | null` | No | — |
| `subject` | `string | null | null` | No | — |
| `html` | `string | null | null` | No | — |
| `text` | `string | null | null` | No | — |
| `tags` | `Record<string, string> | null` | No | — |
| `metadata` | `Record<string, string> | null` | No | — |
| `idempotencyKey` | `string | null | null` | No | — |
| `testMode` | `boolean` | No | — |
| `attachments` | `Array<AttachmentRequest> | null` | No | — |
| `scheduledAt` | `string | null | null` | No | — |
| `deliveryWindow` | `DeliveryWindowRequest | null | null` | No | — |
| `sendTimeCategory` | `string` | No | — |
| `trackingSettings` | `TrackingSettingsRequest | null | null` | No | — |


## BatchSendItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `index` | `number` | Yes | — |
| `id` | `string | null | null` | No | — |
| `messageId` | `string | null | null` | No | — |
| `status` | `string | null | null` | No | — |
| `createdAt` | `string | null | null` | No | — |
| `scheduledAt` | `string | null | null` | No | — |
| `error` | `string | null | null` | No | — |


## SendEmailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `messageId` | `string | null | null` | Yes | — |
| `status` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `scheduledAt` | `string | null | null` | No | — |
| `audienceId` | `string | null | null` | No | — |
| `messages` | `Array<BatchSendItemResponse> | null` | No | — |


## EmailDetailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `messageId` | `string | null | null` | Yes | — |
| `from` | `string` | Yes | — |
| `to` | `Array<string>` | Yes | — |
| `cc` | `Array<string> | null` | Yes | — |
| `bcc` | `Array<string> | null` | Yes | — |
| `replyTo` | `string | null | null` | Yes | — |
| `subject` | `string` | Yes | — |
| `html` | `string | null | null` | No | — |
| `text` | `string | null | null` | No | — |
| `status` | `string` | Yes | — |
| `error` | `string | null | null` | Yes | — |
| `tags` | `Record<string, string> | null` | Yes | — |
| `metadata` | `Record<string, string> | null` | Yes | — |
| `testMode` | `boolean` | Yes | — |
| `topicId` | `string | null | null` | No | — |
| `createdAt` | `string` | Yes | — |
| `sentAt` | `string | null | null` | Yes | — |
| `updatedAt` | `string | null | null` | Yes | — |


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
| `cancelled` | `boolean` | No | — |


## BulkCancelResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `cancelled` | `number` | Yes | — |


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
| `data` | `Record<string, string>` | No | — |


## ValidateLinksRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `html` | `string | null | null` | No | — |


## LinkResultItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `string` | Yes | — |
| `status` | `string` | Yes | — |
| `statusCode` | `number | null | null` | No | — |
| `error` | `string | null | null` | No | — |


## ValidateLinksResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `links` | `Array<LinkResultItem>` | Yes | — |
| `totalLinks` | `number` | Yes | — |
| `brokenLinks` | `number` | Yes | — |
| `errorLinks` | `number` | Yes | — |


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
| `totalEmails` | `number` | Yes | — |
| `delivered` | `number` | Yes | — |
| `deliveryRate` | `number` | Yes | — |
| `opened` | `number` | Yes | — |
| `openRate` | `number` | Yes | — |
| `clicked` | `number` | Yes | — |
| `clickRate` | `number` | Yes | — |
| `bounced` | `number` | Yes | — |
| `bounceRate` | `number` | Yes | — |
| `complained` | `number` | Yes | — |
| `complaintRate` | `number` | Yes | — |
| `unsubscribed` | `number` | Yes | — |
| `unsubscribeRate` | `number` | Yes | — |
| `readEngaged` | `number` | Yes | — |
| `readEngagementRate` | `number` | Yes | — |
| `avgReadTimeSeconds` | `number | null | null` | Yes | — |
| `optInCount` | `number` | Yes | — |
| `optOutCount` | `number` | Yes | — |
| `computedAt` | `string` | Yes | — |


## EmailPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `string` | Yes | — |
| `subject` | `string` | Yes | — |
| `fromAddress` | `string` | Yes | — |
| `topicId` | `string | null | null` | Yes | — |
| `status` | `string` | Yes | — |
| `delivered` | `boolean` | Yes | — |
| `opened` | `boolean` | Yes | — |
| `clicked` | `boolean` | Yes | — |
| `totalClicks` | `number` | Yes | — |
| `bounced` | `boolean` | Yes | — |
| `complained` | `boolean` | Yes | — |
| `unsubscribed` | `boolean` | Yes | — |
| `readEngaged` | `boolean` | Yes | — |
| `readTimeSeconds` | `number | null | null` | Yes | — |
| `readCategory` | `string | null | null` | Yes | — |
| `sentAt` | `string | null | null` | Yes | — |
| `lastEventAt` | `string | null | null` | Yes | — |
| `computedAt` | `string` | Yes | — |


## EmailReadScrollAnalyticsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `string` | Yes | — |
| `subject` | `string` | Yes | — |
| `computedAt` | `string` | Yes | — |
| `readEngaged` | `boolean` | Yes | — |
| `readTimeSeconds` | `number | null | null` | Yes | — |
| `readCategory` | `string | null | null` | Yes | — |
| `mailClient` | `string | null | null` | Yes | — |
| `deviceType` | `string | null | null` | Yes | — |
| `os` | `string | null | null` | Yes | — |
| `readEngagedAt` | `string | null | null` | Yes | — |
| `shortEmail` | `boolean` | Yes | — |
| `depth25Count` | `number` | Yes | — |
| `depth50Count` | `number` | Yes | — |
| `depth75Count` | `number` | Yes | — |
| `depth100Count` | `number` | Yes | — |
| `maxDepthPct` | `number | null | null` | Yes | — |
| `depth25Rate` | `number | null | null` | Yes | — |
| `depth50Rate` | `number | null | null` | Yes | — |
| `depth75Rate` | `number | null | null` | Yes | — |
| `depth100Rate` | `number | null | null` | Yes | — |


## ProjectMetricsSummaryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `string` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `sent` | `number` | Yes | — |
| `delivered` | `number` | Yes | — |
| `opened` | `number` | Yes | — |
| `clicked` | `number` | Yes | — |
| `bounced` | `number` | Yes | — |
| `complained` | `number` | Yes | — |
| `failed` | `number` | Yes | — |
| `unsubscribed` | `number` | Yes | — |
| `readEngaged` | `number` | Yes | — |
| `deliveryRate` | `number` | Yes | — |
| `openRate` | `number` | Yes | — |
| `clickRate` | `number` | Yes | — |
| `bounceRate` | `number` | Yes | — |
| `complaintRate` | `number` | Yes | — |
| `readEngagementRate` | `number` | Yes | — |


## ProjectTimelineBucketResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bucket` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `count` | `number` | Yes | — |


## ProjectMetricsTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `string` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `granularity` | `string` | Yes | — |
| `format` | `string` | Yes | — |
| `buckets` | `Array<ProjectTimelineBucketResponse>` | Yes | — |


## AdvisorRecommendationDataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bounceRate` | `number | null | null` | No | — |
| `bounced` | `number | null | null` | No | — |
| `accepted` | `number | null | null` | No | — |
| `complaintRate` | `number | null | null` | No | — |
| `accepted24h` | `number | null | null` | No | — |
| `avgDailyAccepted7d` | `number | null | null` | No | — |
| `daysSinceLastSend` | `number | null | null` | No | — |
| `reportedOpenRate` | `number | null | null` | No | — |
| `adjustedOpenRate` | `number | null | null` | No | — |
| `proxyRate` | `number | null | null` | No | — |
| `proxyOpens` | `number | null | null` | No | — |
| `totalOpens` | `number | null | null` | No | — |
| `humanOpenRate` | `number | null | null` | No | — |
| `delivered` | `number | null | null` | No | — |
| `unsubRate` | `number | null | null` | No | — |
| `unsubscribed` | `number | null | null` | No | — |
| `dmarcAlignmentFailureRate7d` | `number | null | null` | No | — |
| `dmarcDomain` | `string | null | null` | No | — |
| `dmarcCurrentPolicy` | `string | null | null` | No | — |
| `dmarcRecommendedPolicy` | `string | null | null` | No | — |
| `dmarcObservedMessages` | `number | null | null` | No | — |
| `dmarcAlignedMessages` | `number | null | null` | No | — |
| `dmarcAccountedRate` | `number | null | null` | No | — |
| `dmarcUnknownMessages` | `number | null | null` | No | — |
| `dmarcUnknownSources` | `number | null | null` | No | — |
| `dmarcReportingDays` | `number | null | null` | No | — |


## AdvisorRecommendationResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `code` | `string` | Yes | — |
| `severity` | `string` | Yes | — |
| `title` | `string` | Yes | — |
| `message` | `string` | Yes | — |
| `data` | `AdvisorRecommendationDataResponse | null | null` | No | — |


## AdvisorReportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `string` | Yes | — |
| `generatedAt` | `string` | Yes | — |
| `score` | `number` | Yes | — |
| `recommendations` | `Array<AdvisorRecommendationResponse>` | Yes | — |


## SuppressionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `email` | `string` | Yes | — |
| `reason` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `contactId` | `string | null | null` | No | — |


## PageInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `page` | `number` | Yes | — |
| `size` | `number` | Yes | — |
| `total` | `number` | Yes | — |
| `totalPages` | `number` | Yes | — |
| `hasNextPage` | `boolean` | Yes | — |
| `hasPreviousPage` | `boolean` | Yes | — |


## SuppressionPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<SuppressionResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## AddSuppressionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `string` | Yes | — |


## SuppressionImportRowSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `string` | Yes | — |
| `reason` | `string | null | null` | No | — |


## SuppressionImportBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `suppressions` | `Array<SuppressionImportRowSerializable>` | Yes | — |


## SuppressionImportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `imported` | `number` | Yes | — |
| `skipped` | `number` | Yes | — |


## SegmentResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `contactCount` | `number` | No | — |
| `unsubscribedCount` | `number` | No | — |


## SegmentPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<SegmentResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `contactId` | `string` | Yes | — |
| `email` | `string` | Yes | — |
| `firstName` | `string | null | null` | Yes | — |
| `lastName` | `string | null | null` | Yes | — |
| `segments` | `Array<string>` | Yes | — |


## CursorInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `nextCursor` | `string | null | null` | Yes | — |
| `previousCursor` | `string | null | null` | Yes | — |
| `hasNextPage` | `boolean` | Yes | — |
| `hasPreviousPage` | `boolean` | Yes | — |


## CursorPage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<SegmentContactResponse>` | Yes | — |
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
| `description` | `string | null | null` | Yes | — |
| `visibility` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `optInCount` | `number` | Yes | — |
| `optOutCount` | `number` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## TopicPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<TopicResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string` | Yes | — |
| `defaultSubscription` | `string` | Yes | — |
| `description` | `string | null | null` | No | — |
| `visibility` | `string | null | null` | No | — |


## UpdateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string | null | null` | No | — |
| `description` | `string | null | null` | No | — |
| `visibility` | `string | null | null` | No | — |


## ContactPropertyResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `key` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `fallbackValue` | `string | null | null` | Yes | — |
| `projectId` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## ContactPropertyPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<ContactPropertyResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `key` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `fallbackValue` | `string | null | null` | No | — |


## UpdateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `fallbackValue` | `string | null | null` | No | — |


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
| `phone` | `string | null | null` | No | — |
| `firstName` | `string | null | null` | Yes | — |
| `lastName` | `string | null | null` | Yes | — |
| `unsubscribed` | `boolean` | Yes | — |
| `properties` | `Record<string, string>` | Yes | — |
| `profileImageUrl` | `string | null | null` | Yes | — |
| `projectId` | `string` | Yes | — |
| `segments` | `Array<string>` | Yes | — |
| `topics` | `Array<TopicSubscriptionResponse>` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## ContactPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<ContactResponse>` | Yes | — |
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
| `phone` | `string | null | null` | No | — |
| `firstName` | `string | null | null` | No | — |
| `lastName` | `string | null | null` | No | — |
| `unsubscribed` | `boolean` | No | — |
| `properties` | `Record<string, string>` | No | — |
| `segments` | `Array<SegmentRef>` | No | — |
| `topics` | `Array<TopicSubscriptionBody>` | No | — |


## UpdateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `firstName` | `string | null | null` | No | — |
| `lastName` | `string | null | null` | No | — |
| `phone` | `string | null | null` | No | — |
| `unsubscribed` | `boolean | null | null` | No | — |
| `properties` | `Record<string, string> | null` | No | — |


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
| `topics` | `Array<TopicSubscriptionBody>` | Yes | — |


## ActivityMetadataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `string | null | null` | No | — |


## ActivityResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `id` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `referenceId` | `string | null | null` | No | — |
| `referenceName` | `string | null | null` | No | — |
| `metadata` | `ActivityMetadataResponse | null | null` | No | — |
| `occurredAt` | `string` | Yes | — |


## EngagementScoreResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `score` | `number` | Yes | — |
| `tier` | `string` | Yes | — |
| `scoredAt` | `string` | Yes | — |


## EmailValidationStatusResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `string` | No | — |
| `status` | `string` | Yes | — |
| `reason` | `string | null | null` | Yes | — |
| `validatedAt` | `string | null | null` | Yes | — |


## RecordValidationBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `status` | `EmailValidationStatusInput` | Yes | — |
| `reason` | `string | null | null` | No | — |


## WebhookFilterSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `field` | `string` | Yes | — |
| `operator` | `string` | Yes | — |
| `value` | `string | null | null` | No | — |


## WebhookTransformationSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `string` | Yes | — |
| `from` | `string | null | null` | No | — |
| `to` | `string | null | null` | No | — |
| `field` | `string | null | null` | No | — |
| `value` | `string | null | null` | No | — |
| `template` | `string | null | null` | No | — |


## WebhookResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `url` | `string` | Yes | — |
| `events` | `Array<string>` | Yes | — |
| `enabled` | `boolean` | Yes | — |
| `filters` | `Array<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `Array<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## WebhookPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<WebhookResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## WebhookDeliveryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `webhookEndpointId` | `string` | Yes | — |
| `eventType` | `string` | Yes | — |
| `status` | `string` | Yes | — |
| `attemptCount` | `number` | Yes | — |
| `lastStatusCode` | `number | null | null` | Yes | — |
| `lastError` | `string | null | null` | Yes | — |
| `responseBodySnippet` | `string | null | null` | Yes | — |
| `nextAttemptAt` | `string | null | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## WebhookDeliveryPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<WebhookDeliveryResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `string` | Yes | — |
| `events` | `Array<string>` | Yes | — |
| `name` | `string | null | null` | No | — |
| `secret` | `string | null | null` | No | — |
| `filters` | `Array<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `Array<WebhookTransformationSerializable> | null` | No | — |


## WebhookCreateResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `projectId` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `url` | `string` | Yes | — |
| `events` | `Array<string>` | Yes | — |
| `enabled` | `boolean` | Yes | — |
| `filters` | `Array<WebhookFilterSerializable> | null` | Yes | — |
| `transformations` | `Array<WebhookTransformationSerializable> | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |
| `secret` | `string` | Yes | — |


## UpdateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string | null | null` | No | — |
| `url` | `string | null | null` | No | — |
| `events` | `Array<string> | null` | No | — |
| `secret` | `string | null | null` | No | — |
| `enabled` | `boolean | null | null` | No | — |
| `filters` | `Array<WebhookFilterSerializable> | null` | No | — |
| `transformations` | `Array<WebhookTransformationSerializable> | null` | No | — |


## ApiKey

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `configId` | `string` | Yes | — |
| `name` | `string | null | null` | Yes | — |
| `start` | `string | null | null` | Yes | — |
| `prefix` | `string | null | null` | Yes | — |
| `organizationId` | `string` | Yes | — |
| `projectId` | `string | null | null` | Yes | — |
| `enabled` | `boolean` | Yes | — |
| `rateLimitEnabled` | `boolean` | Yes | — |
| `rateLimitTimeWindow` | `number | null | null` | Yes | — |
| `rateLimitMax` | `number | null | null` | Yes | — |
| `requestCount` | `number` | Yes | — |
| `remaining` | `number | null | null` | Yes | — |
| `lastRequest` | `string | null | null` | Yes | — |
| `expiresAt` | `string | null | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |
| `metadata` | `Record<string, string> | null` | Yes | — |
| `permissions` | `Record<string, Array<string>> | null` | Yes | — |


## ApiKeyUsageRecord

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `keyId` | `string` | Yes | — |
| `orgId` | `string` | Yes | — |
| `method` | `string` | Yes | — |
| `route` | `string` | Yes | — |
| `statusCode` | `number` | Yes | — |
| `durationMs` | `number | null | null` | Yes | — |
| `ip` | `string | null | null` | Yes | — |
| `ts` | `string` | Yes | — |


## UsagePage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `size` | `number` | Yes | — |
| `totalPages` | `number` | Yes | — |
| `hasMore` | `boolean` | Yes | — |


## ApiKeyUsageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<ApiKeyUsageRecord>` | Yes | — |
| `page` | `UsagePage` | Yes | — |


## ProjectLimitsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dailySends` | `number` | Yes | — |
| `perSecondSends` | `number` | Yes | — |
| `maxRecipientsPerMessage` | `number` | Yes | — |
| `maxDomains` | `number` | Yes | — |
| `maxApiKeys` | `number` | Yes | — |
| `maxWebhooks` | `number` | Yes | — |


## ProjectTrackingSettingsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `boolean` | Yes | — |
| `clickTracking` | `boolean` | Yes | — |
| `unsubscribeTracking` | `boolean` | Yes | — |
| `readEngagement` | `boolean` | Yes | — |
| `scrollDepth` | `boolean` | No | — |


## ProjectResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `name` | `string` | Yes | — |
| `slug` | `string` | Yes | — |
| `status` | `string` | Yes | — |
| `suspensionReason` | `string | null | null` | Yes | — |
| `region` | `string` | Yes | — |
| `limits` | `ProjectLimitsModel` | Yes | — |
| `trackingSettings` | `ProjectTrackingSettingsModel` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |


## ProjectPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<ProjectResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## UpdateProjectRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string | null | null` | No | — |
| `slug` | `string | null | null` | No | — |
| `limits` | `ProjectLimitsModel | null | null` | No | — |
| `trackingSettings` | `ProjectTrackingSettingsModel | null | null` | No | — |


## EmailPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `Array<EmailDetailResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## EmailTimelineItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `providerEventId` | `string | null | null` | Yes | — |
| `payload` | `Record<string, string | null> | null` | Yes | — |
| `occurredAt` | `string` | Yes | — |
| `createdAt` | `string` | Yes | — |


## EmailTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `Array<EmailTimelineItem>` | Yes | — |


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
| `data` | `Array<DomainListItemResponse>` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## DkimRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `value` | `string` | Yes | — |
| `status` | `string | null | null` | No | — |


## DnsRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `string` | Yes | — |
| `type` | `string` | Yes | — |
| `value` | `string` | Yes | — |
| `priority` | `number | null | null` | No | — |
| `optional` | `boolean | null | null` | No | — |
| `status` | `string | null | null` | No | — |


## VerificationRecordsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dkim` | `Array<DkimRecordResponse>` | Yes | — |
| `mailFromMx` | `DnsRecordResponse` | Yes | — |
| `mailFromSpf` | `DnsRecordResponse` | Yes | — |
| `dmarcRecommended` | `DnsRecordResponse | null | null` | No | — |
| `bimi` | `DnsRecordResponse | null | null` | No | — |
| `trackingCname` | `DnsRecordResponse | null | null` | No | — |


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
| `bimiLogoUrl` | `string | null | null` | Yes | — |
| `createdAt` | `string` | Yes | — |
| `updatedAt` | `string` | Yes | — |
| `verifiedAt` | `string | null | null` | Yes | — |


## RegisterDomainRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `domain` | `string` | Yes | — |
| `region` | `string` | Yes | — |


## UpdateBimiRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `logoUrl` | `string | null | null` | No | — |


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

Alias of `Array<string>`.


## GetContactTopicsResponse

Alias of `Array<TopicSubscriptionResponse>`.


## GetContactActivityResponse

Alias of `Array<ActivityResponse>`.


## ListApiKeysResponse

This model has no declared properties.

Additional properties use `Array<ApiKey>`.

