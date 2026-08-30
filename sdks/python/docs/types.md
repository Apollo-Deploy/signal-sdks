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
| `filename` | `str` | Yes | — |
| `content` | `str` | Yes | — |
| `contentType` | `str` | Yes | — |
| `disposition` | `str` | No | — |
| `contentId` | `Optional[str] | null` | No | — |


## DeliveryWindowRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `start` | `str` | Yes | — |
| `end` | `str` | Yes | — |


## TrackingSettingsRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `Optional[bool] | null` | No | — |
| `clickTracking` | `Optional[bool] | null` | No | — |
| `unsubscribeTracking` | `Optional[bool] | null` | No | — |
| `readEngagement` | `Optional[bool] | null` | No | — |


## SendEmailRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `str` | Yes | — |
| `to` | `List[str]` | Yes | — |
| `cc` | `List[str] | null` | No | — |
| `bcc` | `List[str] | null` | No | — |
| `replyTo` | `Optional[str] | null` | No | — |
| `subject` | `Optional[str] | null` | No | — |
| `html` | `Optional[str] | null` | No | — |
| `text` | `Optional[str] | null` | No | — |
| `tags` | `Dict[str, str] | null` | No | — |
| `metadata` | `Dict[str, str] | null` | No | — |
| `idempotencyKey` | `Optional[str] | null` | No | — |
| `testMode` | `bool` | No | — |
| `attachments` | `List[AttachmentRequest] | null` | No | — |
| `scheduledAt` | `Optional[str] | null` | No | — |
| `deliveryWindow` | `Optional[DeliveryWindowRequest] | null` | No | — |
| `sendTimeCategory` | `str` | No | — |
| `trackingSettings` | `Optional[TrackingSettingsRequest] | null` | No | — |


## BatchSendItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `index` | `int` | Yes | — |
| `id` | `Optional[str] | null` | No | — |
| `messageId` | `Optional[str] | null` | No | — |
| `status` | `Optional[str] | null` | No | — |
| `createdAt` | `Optional[str] | null` | No | — |
| `scheduledAt` | `Optional[str] | null` | No | — |
| `error` | `Optional[str] | null` | No | — |


## SendEmailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `messageId` | `Optional[str] | null` | Yes | — |
| `status` | `str` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `scheduledAt` | `Optional[str] | null` | No | — |
| `audienceId` | `Optional[str] | null` | No | — |
| `messages` | `List[BatchSendItemResponse] | null` | No | — |


## EmailDetailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `messageId` | `Optional[str] | null` | Yes | — |
| `from` | `str` | Yes | — |
| `to` | `List[str]` | Yes | — |
| `cc` | `List[str] | null` | Yes | — |
| `bcc` | `List[str] | null` | Yes | — |
| `replyTo` | `Optional[str] | null` | Yes | — |
| `subject` | `str` | Yes | — |
| `html` | `Optional[str] | null` | No | — |
| `text` | `Optional[str] | null` | No | — |
| `status` | `str` | Yes | — |
| `error` | `Optional[str] | null` | Yes | — |
| `tags` | `Dict[str, str] | null` | Yes | — |
| `metadata` | `Dict[str, str] | null` | Yes | — |
| `testMode` | `bool` | Yes | — |
| `topicId` | `Optional[str] | null` | No | — |
| `createdAt` | `str` | Yes | — |
| `sentAt` | `Optional[str] | null` | Yes | — |
| `updatedAt` | `Optional[str] | null` | Yes | — |


## BatchSendRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `List[SendEmailRequest]` | Yes | — |


## BatchSendResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `results` | `List[BatchSendItemResponse]` | Yes | — |


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
| `token` | `str` | Yes | — |
| `expiresAt` | `str` | Yes | — |


## StreamEventResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `str` | Yes | — |
| `emailId` | `str` | Yes | — |
| `occurredAt` | `str` | Yes | — |
| `data` | `Dict[str, str]` | No | — |


## ValidateLinksRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `html` | `Optional[str] | null` | No | — |


## LinkResultItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `str` | Yes | — |
| `status` | `str` | Yes | — |
| `statusCode` | `Optional[int] | null` | No | — |
| `error` | `Optional[str] | null` | No | — |


## ValidateLinksResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `links` | `List[LinkResultItem]` | Yes | — |
| `totalLinks` | `int` | Yes | — |
| `brokenLinks` | `int` | Yes | — |
| `errorLinks` | `int` | Yes | — |


## MetricsWindowResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `str` | Yes | — |
| `to` | `str` | Yes | — |
| `label` | `str` | Yes | — |


## TopicPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `str` | Yes | — |
| `topicName` | `str` | Yes | — |
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
| `avgReadTimeSeconds` | `Optional[float] | null` | Yes | — |
| `optInCount` | `int` | Yes | — |
| `optOutCount` | `int` | Yes | — |
| `computedAt` | `str` | Yes | — |


## EmailPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `str` | Yes | — |
| `subject` | `str` | Yes | — |
| `fromAddress` | `str` | Yes | — |
| `topicId` | `Optional[str] | null` | Yes | — |
| `status` | `str` | Yes | — |
| `delivered` | `bool` | Yes | — |
| `opened` | `bool` | Yes | — |
| `clicked` | `bool` | Yes | — |
| `totalClicks` | `int` | Yes | — |
| `bounced` | `bool` | Yes | — |
| `complained` | `bool` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `Optional[float] | null` | Yes | — |
| `readCategory` | `Optional[str] | null` | Yes | — |
| `sentAt` | `Optional[str] | null` | Yes | — |
| `lastEventAt` | `Optional[str] | null` | Yes | — |
| `computedAt` | `str` | Yes | — |


## EmailReadScrollAnalyticsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `str` | Yes | — |
| `subject` | `str` | Yes | — |
| `computedAt` | `str` | Yes | — |
| `readEngaged` | `bool` | Yes | — |
| `readTimeSeconds` | `Optional[float] | null` | Yes | — |
| `readCategory` | `Optional[str] | null` | Yes | — |
| `mailClient` | `Optional[str] | null` | Yes | — |
| `deviceType` | `Optional[str] | null` | Yes | — |
| `os` | `Optional[str] | null` | Yes | — |
| `readEngagedAt` | `Optional[str] | null` | Yes | — |
| `shortEmail` | `bool` | Yes | — |
| `depth25Count` | `int` | Yes | — |
| `depth50Count` | `int` | Yes | — |
| `depth75Count` | `int` | Yes | — |
| `depth100Count` | `int` | Yes | — |
| `maxDepthPct` | `Optional[int] | null` | Yes | — |
| `depth25Rate` | `Optional[float] | null` | Yes | — |
| `depth50Rate` | `Optional[float] | null` | Yes | — |
| `depth75Rate` | `Optional[float] | null` | Yes | — |
| `depth100Rate` | `Optional[float] | null` | Yes | — |


## ProjectMetricsSummaryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `str` | Yes | — |
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
| `bucket` | `str` | Yes | — |
| `type` | `str` | Yes | — |
| `count` | `int` | Yes | — |


## ProjectMetricsTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `str` | Yes | — |
| `window` | `MetricsWindowResponse` | Yes | — |
| `granularity` | `str` | Yes | — |
| `format` | `str` | Yes | — |
| `buckets` | `List[ProjectTimelineBucketResponse]` | Yes | — |


## AdvisorRecommendationDataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bounceRate` | `Optional[float] | null` | No | — |
| `bounced` | `Optional[int] | null` | No | — |
| `accepted` | `Optional[int] | null` | No | — |
| `complaintRate` | `Optional[float] | null` | No | — |
| `accepted24h` | `Optional[int] | null` | No | — |
| `avgDailyAccepted7d` | `Optional[int] | null` | No | — |
| `daysSinceLastSend` | `Optional[int] | null` | No | — |
| `reportedOpenRate` | `Optional[float] | null` | No | — |
| `adjustedOpenRate` | `Optional[float] | null` | No | — |
| `proxyRate` | `Optional[float] | null` | No | — |
| `proxyOpens` | `Optional[int] | null` | No | — |
| `totalOpens` | `Optional[int] | null` | No | — |
| `humanOpenRate` | `Optional[float] | null` | No | — |
| `delivered` | `Optional[int] | null` | No | — |
| `unsubRate` | `Optional[float] | null` | No | — |
| `unsubscribed` | `Optional[int] | null` | No | — |
| `dmarcAlignmentFailureRate7d` | `Optional[float] | null` | No | — |
| `dmarcDomain` | `Optional[str] | null` | No | — |
| `dmarcCurrentPolicy` | `Optional[str] | null` | No | — |
| `dmarcRecommendedPolicy` | `Optional[str] | null` | No | — |
| `dmarcObservedMessages` | `Optional[int] | null` | No | — |
| `dmarcAlignedMessages` | `Optional[int] | null` | No | — |
| `dmarcAccountedRate` | `Optional[float] | null` | No | — |
| `dmarcUnknownMessages` | `Optional[int] | null` | No | — |
| `dmarcUnknownSources` | `Optional[int] | null` | No | — |
| `dmarcReportingDays` | `Optional[int] | null` | No | — |


## AdvisorRecommendationResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `code` | `str` | Yes | — |
| `severity` | `str` | Yes | — |
| `title` | `str` | Yes | — |
| `message` | `str` | Yes | — |
| `data` | `Optional[AdvisorRecommendationDataResponse] | null` | No | — |


## AdvisorReportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `str` | Yes | — |
| `generatedAt` | `str` | Yes | — |
| `score` | `int` | Yes | — |
| `recommendations` | `List[AdvisorRecommendationResponse]` | Yes | — |


## SuppressionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `projectId` | `str` | Yes | — |
| `email` | `str` | Yes | — |
| `reason` | `str` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `contactId` | `Optional[str] | null` | No | — |


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
| `data` | `List[SuppressionResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## AddSuppressionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `str` | Yes | — |


## SuppressionImportRowSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `str` | Yes | — |
| `reason` | `Optional[str] | null` | No | — |


## SuppressionImportBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `suppressions` | `List[SuppressionImportRowSerializable]` | Yes | — |


## SuppressionImportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `imported` | `int` | Yes | — |
| `skipped` | `int` | Yes | — |


## SegmentResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `str` | No | — |
| `id` | `str` | Yes | — |
| `name` | `str` | Yes | — |
| `projectId` | `str` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `contactCount` | `int` | No | — |
| `unsubscribedCount` | `int` | No | — |


## SegmentPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[SegmentResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `contactId` | `str` | Yes | — |
| `email` | `str` | Yes | — |
| `firstName` | `Optional[str] | null` | Yes | — |
| `lastName` | `Optional[str] | null` | Yes | — |
| `segments` | `List[str]` | Yes | — |


## CursorInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `nextCursor` | `Optional[str] | null` | Yes | — |
| `previousCursor` | `Optional[str] | null` | Yes | — |
| `hasNextPage` | `bool` | Yes | — |
| `hasPreviousPage` | `bool` | Yes | — |


## CursorPage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[SegmentContactResponse]` | Yes | — |
| `cursor` | `CursorInfo` | Yes | — |


## CreateSegmentBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `str` | Yes | — |


## TopicResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `str` | No | — |
| `id` | `str` | Yes | — |
| `name` | `str` | Yes | — |
| `defaultSubscription` | `str` | Yes | — |
| `description` | `Optional[str] | null` | Yes | — |
| `visibility` | `str` | Yes | — |
| `projectId` | `str` | Yes | — |
| `optInCount` | `int` | Yes | — |
| `optOutCount` | `int` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |


## TopicPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[TopicResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `str` | Yes | — |
| `defaultSubscription` | `str` | Yes | — |
| `description` | `Optional[str] | null` | No | — |
| `visibility` | `Optional[str] | null` | No | — |


## UpdateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `Optional[str] | null` | No | — |
| `description` | `Optional[str] | null` | No | — |
| `visibility` | `Optional[str] | null` | No | — |


## ContactPropertyResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `str` | No | — |
| `id` | `str` | Yes | — |
| `key` | `str` | Yes | — |
| `type` | `str` | Yes | — |
| `fallbackValue` | `Optional[str] | null` | Yes | — |
| `projectId` | `str` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |


## ContactPropertyPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[ContactPropertyResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `key` | `str` | Yes | — |
| `type` | `str` | Yes | — |
| `fallbackValue` | `Optional[str] | null` | No | — |


## UpdateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `fallbackValue` | `Optional[str] | null` | No | — |


## TopicSubscriptionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `str` | Yes | — |
| `subscription` | `str` | Yes | — |


## ContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `str` | No | — |
| `id` | `str` | Yes | — |
| `email` | `str` | Yes | — |
| `phone` | `Optional[str] | null` | No | — |
| `firstName` | `Optional[str] | null` | Yes | — |
| `lastName` | `Optional[str] | null` | Yes | — |
| `unsubscribed` | `bool` | Yes | — |
| `properties` | `Dict[str, str]` | Yes | — |
| `profileImageUrl` | `Optional[str] | null` | Yes | — |
| `projectId` | `str` | Yes | — |
| `segments` | `List[str]` | Yes | — |
| `topics` | `List[TopicSubscriptionResponse]` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |


## ContactPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[ContactResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## SegmentRef

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |


## TopicSubscriptionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `subscription` | `str` | Yes | — |


## CreateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `str` | Yes | — |
| `phone` | `Optional[str] | null` | No | — |
| `firstName` | `Optional[str] | null` | No | — |
| `lastName` | `Optional[str] | null` | No | — |
| `unsubscribed` | `bool` | No | — |
| `properties` | `Dict[str, str]` | No | — |
| `segments` | `List[SegmentRef]` | No | — |
| `topics` | `List[TopicSubscriptionBody]` | No | — |


## UpdateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `firstName` | `Optional[str] | null` | No | — |
| `lastName` | `Optional[str] | null` | No | — |
| `phone` | `Optional[str] | null` | No | — |
| `unsubscribed` | `Optional[bool] | null` | No | — |
| `properties` | `Dict[str, str] | null` | No | — |


## SetImageUrlBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `str` | Yes | — |


## AddToSegmentBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `segmentId` | `str` | Yes | — |


## UpdateTopicsBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topics` | `List[TopicSubscriptionBody]` | Yes | — |


## ActivityMetadataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `Optional[str] | null` | No | — |


## ActivityResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `str` | No | — |
| `id` | `str` | Yes | — |
| `type` | `str` | Yes | — |
| `referenceId` | `Optional[str] | null` | No | — |
| `referenceName` | `Optional[str] | null` | No | — |
| `metadata` | `Optional[ActivityMetadataResponse] | null` | No | — |
| `occurredAt` | `str` | Yes | — |


## EngagementScoreResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `str` | No | — |
| `score` | `int` | Yes | — |
| `tier` | `str` | Yes | — |
| `scoredAt` | `str` | Yes | — |


## EmailValidationStatusResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `str` | No | — |
| `status` | `str` | Yes | — |
| `reason` | `Optional[str] | null` | Yes | — |
| `validatedAt` | `Optional[str] | null` | Yes | — |


## RecordValidationBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `status` | `EmailValidationStatusInput` | Yes | — |
| `reason` | `Optional[str] | null` | No | — |


## WebhookFilterSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `field` | `str` | Yes | — |
| `operator` | `str` | Yes | — |
| `value` | `Optional[str] | null` | No | — |


## WebhookTransformationSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `str` | Yes | — |
| `from` | `Optional[str] | null` | No | — |
| `to` | `Optional[str] | null` | No | — |
| `field` | `Optional[str] | null` | No | — |
| `value` | `Optional[str] | null` | No | — |
| `template` | `Optional[str] | null` | No | — |


## WebhookResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `projectId` | `str` | Yes | — |
| `name` | `str` | Yes | — |
| `url` | `str` | Yes | — |
| `events` | `List[str]` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `List[WebhookFilterSerializable] | null` | Yes | — |
| `transformations` | `List[WebhookTransformationSerializable] | null` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |


## WebhookPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[WebhookResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## WebhookDeliveryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `projectId` | `str` | Yes | — |
| `webhookEndpointId` | `str` | Yes | — |
| `eventType` | `str` | Yes | — |
| `status` | `str` | Yes | — |
| `attemptCount` | `int` | Yes | — |
| `lastStatusCode` | `Optional[int] | null` | Yes | — |
| `lastError` | `Optional[str] | null` | Yes | — |
| `responseBodySnippet` | `Optional[str] | null` | Yes | — |
| `nextAttemptAt` | `Optional[str] | null` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |


## WebhookDeliveryPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[WebhookDeliveryResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## CreateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `str` | Yes | — |
| `events` | `List[str]` | Yes | — |
| `name` | `Optional[str] | null` | No | — |
| `secret` | `Optional[str] | null` | No | — |
| `filters` | `List[WebhookFilterSerializable] | null` | No | — |
| `transformations` | `List[WebhookTransformationSerializable] | null` | No | — |


## WebhookCreateResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `projectId` | `str` | Yes | — |
| `name` | `str` | Yes | — |
| `url` | `str` | Yes | — |
| `events` | `List[str]` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `filters` | `List[WebhookFilterSerializable] | null` | Yes | — |
| `transformations` | `List[WebhookTransformationSerializable] | null` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |
| `secret` | `str` | Yes | — |


## UpdateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `Optional[str] | null` | No | — |
| `url` | `Optional[str] | null` | No | — |
| `events` | `List[str] | null` | No | — |
| `secret` | `Optional[str] | null` | No | — |
| `enabled` | `Optional[bool] | null` | No | — |
| `filters` | `List[WebhookFilterSerializable] | null` | No | — |
| `transformations` | `List[WebhookTransformationSerializable] | null` | No | — |


## ApiKey

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `configId` | `str` | Yes | — |
| `name` | `Optional[str] | null` | Yes | — |
| `start` | `Optional[str] | null` | Yes | — |
| `prefix` | `Optional[str] | null` | Yes | — |
| `organizationId` | `str` | Yes | — |
| `projectId` | `Optional[str] | null` | Yes | — |
| `enabled` | `bool` | Yes | — |
| `rateLimitEnabled` | `bool` | Yes | — |
| `rateLimitTimeWindow` | `Optional[int] | null` | Yes | — |
| `rateLimitMax` | `Optional[int] | null` | Yes | — |
| `requestCount` | `int` | Yes | — |
| `remaining` | `Optional[int] | null` | Yes | — |
| `lastRequest` | `Optional[str] | null` | Yes | — |
| `expiresAt` | `Optional[str] | null` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |
| `metadata` | `Dict[str, str] | null` | Yes | — |
| `permissions` | `Dict[str, List[str]] | null` | Yes | — |


## ApiKeyUsageRecord

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `keyId` | `str` | Yes | — |
| `orgId` | `str` | Yes | — |
| `method` | `str` | Yes | — |
| `route` | `str` | Yes | — |
| `statusCode` | `int` | Yes | — |
| `durationMs` | `Optional[int] | null` | Yes | — |
| `ip` | `Optional[str] | null` | Yes | — |
| `ts` | `str` | Yes | — |


## UsagePage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `size` | `int` | Yes | — |
| `totalPages` | `int` | Yes | — |
| `hasMore` | `bool` | Yes | — |


## ApiKeyUsageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[ApiKeyUsageRecord]` | Yes | — |
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
| `id` | `str` | Yes | — |
| `name` | `str` | Yes | — |
| `slug` | `str` | Yes | — |
| `status` | `str` | Yes | — |
| `suspensionReason` | `Optional[str] | null` | Yes | — |
| `region` | `str` | Yes | — |
| `limits` | `ProjectLimitsModel` | Yes | — |
| `trackingSettings` | `ProjectTrackingSettingsModel` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |


## ProjectPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[ProjectResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## UpdateProjectRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `Optional[str] | null` | No | — |
| `slug` | `Optional[str] | null` | No | — |
| `limits` | `Optional[ProjectLimitsModel] | null` | No | — |
| `trackingSettings` | `Optional[ProjectTrackingSettingsModel] | null` | No | — |


## EmailPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[EmailDetailResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## EmailTimelineItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `type` | `str` | Yes | — |
| `providerEventId` | `Optional[str] | null` | Yes | — |
| `payload` | `Dict[str, Optional[str]] | null` | Yes | — |
| `occurredAt` | `str` | Yes | — |
| `createdAt` | `str` | Yes | — |


## EmailTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `List[EmailTimelineItem]` | Yes | — |


## DomainListItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `domain` | `str` | Yes | — |
| `region` | `str` | Yes | — |
| `status` | `str` | Yes | — |
| `dkimStatus` | `str` | Yes | — |
| `bimiStatus` | `str` | Yes | — |
| `trackingStatus` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |


## DomainListPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `List[DomainListItemResponse]` | Yes | — |
| `page` | `PageInfo` | Yes | — |


## DkimRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `str` | Yes | — |
| `type` | `str` | Yes | — |
| `value` | `str` | Yes | — |
| `status` | `Optional[str] | null` | No | — |


## DnsRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `str` | Yes | — |
| `type` | `str` | Yes | — |
| `value` | `str` | Yes | — |
| `priority` | `Optional[int] | null` | No | — |
| `optional` | `Optional[bool] | null` | No | — |
| `status` | `Optional[str] | null` | No | — |


## VerificationRecordsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dkim` | `List[DkimRecordResponse]` | Yes | — |
| `mailFromMx` | `DnsRecordResponse` | Yes | — |
| `mailFromSpf` | `DnsRecordResponse` | Yes | — |
| `dmarcRecommended` | `Optional[DnsRecordResponse] | null` | No | — |
| `bimi` | `Optional[DnsRecordResponse] | null` | No | — |
| `trackingCname` | `Optional[DnsRecordResponse] | null` | No | — |


## DomainResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `str` | Yes | — |
| `projectId` | `str` | Yes | — |
| `domain` | `str` | Yes | — |
| `region` | `str` | Yes | — |
| `status` | `str` | Yes | — |
| `dkimStatus` | `str` | Yes | — |
| `spfStatus` | `str` | Yes | — |
| `dmarcStatus` | `str` | Yes | — |
| `mailFromStatus` | `str` | Yes | — |
| `mailFromDomain` | `str` | Yes | — |
| `verificationRecords` | `VerificationRecordsResponse` | Yes | — |
| `bimiStatus` | `str` | Yes | — |
| `bimiLogoUrl` | `Optional[str] | null` | Yes | — |
| `createdAt` | `str` | Yes | — |
| `updatedAt` | `str` | Yes | — |
| `verifiedAt` | `Optional[str] | null` | Yes | — |


## RegisterDomainRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `domain` | `str` | Yes | — |
| `region` | `str` | Yes | — |


## UpdateBimiRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `logoUrl` | `Optional[str] | null` | No | — |


## EmailValidationStatusInput

Allowed values:

- `"valid"`
- `"risky"`
- `"invalid"`
- `"unknown"`


## GetTopicPerformanceQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `str` | No | Time window. |
| `projectId` | `str` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsSummaryQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `str` | No | Metrics time window. |
| `projectId` | `str` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsTimelineQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `str` | No | Metrics time window. |
| `granularity` | `str` | No | `hour` or `day`. |
| `format` | `str` | No | `compact` or `detailed`. |
| `projectId` | `str` | No | Required for session auth; ignored for API key auth. |


## GetMetricsAdvisorQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `str` | No | Required for session auth; ignored for API key auth. |


## ListContactSegmentsResponse

Alias of `List[str]`.


## GetContactTopicsResponse

Alias of `List[TopicSubscriptionResponse]`.


## GetContactActivityResponse

Alias of `List[ActivityResponse]`.


## ListApiKeysResponse

This model has no declared properties.

Additional properties use `List[ApiKey]`.

