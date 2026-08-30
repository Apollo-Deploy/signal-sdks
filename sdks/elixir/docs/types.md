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
| `filename` | `String.t()` | Yes | — |
| `content` | `String.t()` | Yes | — |
| `contentType` | `String.t()` | Yes | — |
| `disposition` | `String.t()` | No | — |
| `contentId` | `String.t() | nil | null` | No | — |


## DeliveryWindowRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `start` | `String.t()` | Yes | — |
| `end` | `String.t()` | Yes | — |


## TrackingSettingsRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `boolean() | nil | null` | No | — |
| `clickTracking` | `boolean() | nil | null` | No | — |
| `unsubscribeTracking` | `boolean() | nil | null` | No | — |
| `readEngagement` | `boolean() | nil | null` | No | — |


## SendEmailRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `String.t()` | Yes | — |
| `to` | `list(String.t())` | Yes | — |
| `cc` | `list(String.t()) | null` | No | — |
| `bcc` | `list(String.t()) | null` | No | — |
| `replyTo` | `String.t() | nil | null` | No | — |
| `subject` | `String.t() | nil | null` | No | — |
| `html` | `String.t() | nil | null` | No | — |
| `text` | `String.t() | nil | null` | No | — |
| `tags` | `%{optional(String.t()) => String.t()} | null` | No | — |
| `metadata` | `%{optional(String.t()) => String.t()} | null` | No | — |
| `idempotencyKey` | `String.t() | nil | null` | No | — |
| `testMode` | `boolean()` | No | — |
| `attachments` | `list(ApolloSignal.Types.AttachmentRequest.t()) | null` | No | — |
| `scheduledAt` | `String.t() | nil | null` | No | — |
| `deliveryWindow` | `ApolloSignal.Types.DeliveryWindowRequest.t() | nil | null` | No | — |
| `sendTimeCategory` | `String.t()` | No | — |
| `trackingSettings` | `ApolloSignal.Types.TrackingSettingsRequest.t() | nil | null` | No | — |


## BatchSendItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `index` | `integer()` | Yes | — |
| `id` | `String.t() | nil | null` | No | — |
| `messageId` | `String.t() | nil | null` | No | — |
| `status` | `String.t() | nil | null` | No | — |
| `createdAt` | `String.t() | nil | null` | No | — |
| `scheduledAt` | `String.t() | nil | null` | No | — |
| `error` | `String.t() | nil | null` | No | — |


## SendEmailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `messageId` | `String.t() | nil | null` | Yes | — |
| `status` | `String.t()` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `scheduledAt` | `String.t() | nil | null` | No | — |
| `audienceId` | `String.t() | nil | null` | No | — |
| `messages` | `list(ApolloSignal.Types.BatchSendItemResponse.t()) | null` | No | — |


## EmailDetailResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `messageId` | `String.t() | nil | null` | Yes | — |
| `from` | `String.t()` | Yes | — |
| `to` | `list(String.t())` | Yes | — |
| `cc` | `list(String.t()) | null` | Yes | — |
| `bcc` | `list(String.t()) | null` | Yes | — |
| `replyTo` | `String.t() | nil | null` | Yes | — |
| `subject` | `String.t()` | Yes | — |
| `html` | `String.t() | nil | null` | No | — |
| `text` | `String.t() | nil | null` | No | — |
| `status` | `String.t()` | Yes | — |
| `error` | `String.t() | nil | null` | Yes | — |
| `tags` | `%{optional(String.t()) => String.t()} | null` | Yes | — |
| `metadata` | `%{optional(String.t()) => String.t()} | null` | Yes | — |
| `testMode` | `boolean()` | Yes | — |
| `topicId` | `String.t() | nil | null` | No | — |
| `createdAt` | `String.t()` | Yes | — |
| `sentAt` | `String.t() | nil | null` | Yes | — |
| `updatedAt` | `String.t() | nil | null` | Yes | — |


## BatchSendRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `list(ApolloSignal.Types.SendEmailRequest.t())` | Yes | — |


## BatchSendResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `results` | `list(ApolloSignal.Types.BatchSendItemResponse.t())` | Yes | — |


## CancelResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `cancelled` | `boolean()` | No | — |


## BulkCancelResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `cancelled` | `integer()` | Yes | — |


## StreamTokenResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `token` | `String.t()` | Yes | — |
| `expiresAt` | `String.t()` | Yes | — |


## StreamEventResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `String.t()` | Yes | — |
| `emailId` | `String.t()` | Yes | — |
| `occurredAt` | `String.t()` | Yes | — |
| `data` | `%{optional(String.t()) => String.t()}` | No | — |


## ValidateLinksRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `html` | `String.t() | nil | null` | No | — |


## LinkResultItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String.t()` | Yes | — |
| `status` | `String.t()` | Yes | — |
| `statusCode` | `integer() | nil | null` | No | — |
| `error` | `String.t() | nil | null` | No | — |


## ValidateLinksResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `links` | `list(ApolloSignal.Types.LinkResultItem.t())` | Yes | — |
| `totalLinks` | `integer()` | Yes | — |
| `brokenLinks` | `integer()` | Yes | — |
| `errorLinks` | `integer()` | Yes | — |


## MetricsWindowResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `from` | `String.t()` | Yes | — |
| `to` | `String.t()` | Yes | — |
| `label` | `String.t()` | Yes | — |


## TopicPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `String.t()` | Yes | — |
| `topicName` | `String.t()` | Yes | — |
| `window` | `ApolloSignal.Types.MetricsWindowResponse.t()` | Yes | — |
| `totalEmails` | `integer()` | Yes | — |
| `delivered` | `integer()` | Yes | — |
| `deliveryRate` | `number()` | Yes | — |
| `opened` | `integer()` | Yes | — |
| `openRate` | `number()` | Yes | — |
| `clicked` | `integer()` | Yes | — |
| `clickRate` | `number()` | Yes | — |
| `bounced` | `integer()` | Yes | — |
| `bounceRate` | `number()` | Yes | — |
| `complained` | `integer()` | Yes | — |
| `complaintRate` | `number()` | Yes | — |
| `unsubscribed` | `integer()` | Yes | — |
| `unsubscribeRate` | `number()` | Yes | — |
| `readEngaged` | `integer()` | Yes | — |
| `readEngagementRate` | `number()` | Yes | — |
| `avgReadTimeSeconds` | `number() | nil | null` | Yes | — |
| `optInCount` | `integer()` | Yes | — |
| `optOutCount` | `integer()` | Yes | — |
| `computedAt` | `String.t()` | Yes | — |


## EmailPerformanceResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `String.t()` | Yes | — |
| `subject` | `String.t()` | Yes | — |
| `fromAddress` | `String.t()` | Yes | — |
| `topicId` | `String.t() | nil | null` | Yes | — |
| `status` | `String.t()` | Yes | — |
| `delivered` | `boolean()` | Yes | — |
| `opened` | `boolean()` | Yes | — |
| `clicked` | `boolean()` | Yes | — |
| `totalClicks` | `integer()` | Yes | — |
| `bounced` | `boolean()` | Yes | — |
| `complained` | `boolean()` | Yes | — |
| `unsubscribed` | `boolean()` | Yes | — |
| `readEngaged` | `boolean()` | Yes | — |
| `readTimeSeconds` | `number() | nil | null` | Yes | — |
| `readCategory` | `String.t() | nil | null` | Yes | — |
| `sentAt` | `String.t() | nil | null` | Yes | — |
| `lastEventAt` | `String.t() | nil | null` | Yes | — |
| `computedAt` | `String.t()` | Yes | — |


## EmailReadScrollAnalyticsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `emailId` | `String.t()` | Yes | — |
| `subject` | `String.t()` | Yes | — |
| `computedAt` | `String.t()` | Yes | — |
| `readEngaged` | `boolean()` | Yes | — |
| `readTimeSeconds` | `number() | nil | null` | Yes | — |
| `readCategory` | `String.t() | nil | null` | Yes | — |
| `mailClient` | `String.t() | nil | null` | Yes | — |
| `deviceType` | `String.t() | nil | null` | Yes | — |
| `os` | `String.t() | nil | null` | Yes | — |
| `readEngagedAt` | `String.t() | nil | null` | Yes | — |
| `shortEmail` | `boolean()` | Yes | — |
| `depth25Count` | `integer()` | Yes | — |
| `depth50Count` | `integer()` | Yes | — |
| `depth75Count` | `integer()` | Yes | — |
| `depth100Count` | `integer()` | Yes | — |
| `maxDepthPct` | `integer() | nil | null` | Yes | — |
| `depth25Rate` | `number() | nil | null` | Yes | — |
| `depth50Rate` | `number() | nil | null` | Yes | — |
| `depth75Rate` | `number() | nil | null` | Yes | — |
| `depth100Rate` | `number() | nil | null` | Yes | — |


## ProjectMetricsSummaryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String.t()` | Yes | — |
| `window` | `ApolloSignal.Types.MetricsWindowResponse.t()` | Yes | — |
| `sent` | `integer()` | Yes | — |
| `delivered` | `integer()` | Yes | — |
| `opened` | `integer()` | Yes | — |
| `clicked` | `integer()` | Yes | — |
| `bounced` | `integer()` | Yes | — |
| `complained` | `integer()` | Yes | — |
| `failed` | `integer()` | Yes | — |
| `unsubscribed` | `integer()` | Yes | — |
| `readEngaged` | `integer()` | Yes | — |
| `deliveryRate` | `number()` | Yes | — |
| `openRate` | `number()` | Yes | — |
| `clickRate` | `number()` | Yes | — |
| `bounceRate` | `number()` | Yes | — |
| `complaintRate` | `number()` | Yes | — |
| `readEngagementRate` | `number()` | Yes | — |


## ProjectTimelineBucketResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bucket` | `String.t()` | Yes | — |
| `type` | `String.t()` | Yes | — |
| `count` | `integer()` | Yes | — |


## ProjectMetricsTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String.t()` | Yes | — |
| `window` | `ApolloSignal.Types.MetricsWindowResponse.t()` | Yes | — |
| `granularity` | `String.t()` | Yes | — |
| `format` | `String.t()` | Yes | — |
| `buckets` | `list(ApolloSignal.Types.ProjectTimelineBucketResponse.t())` | Yes | — |


## AdvisorRecommendationDataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `bounceRate` | `number() | nil | null` | No | — |
| `bounced` | `integer() | nil | null` | No | — |
| `accepted` | `integer() | nil | null` | No | — |
| `complaintRate` | `number() | nil | null` | No | — |
| `accepted24h` | `integer() | nil | null` | No | — |
| `avgDailyAccepted7d` | `integer() | nil | null` | No | — |
| `daysSinceLastSend` | `integer() | nil | null` | No | — |
| `reportedOpenRate` | `number() | nil | null` | No | — |
| `adjustedOpenRate` | `number() | nil | null` | No | — |
| `proxyRate` | `number() | nil | null` | No | — |
| `proxyOpens` | `integer() | nil | null` | No | — |
| `totalOpens` | `integer() | nil | null` | No | — |
| `humanOpenRate` | `number() | nil | null` | No | — |
| `delivered` | `integer() | nil | null` | No | — |
| `unsubRate` | `number() | nil | null` | No | — |
| `unsubscribed` | `integer() | nil | null` | No | — |
| `dmarcAlignmentFailureRate7d` | `number() | nil | null` | No | — |
| `dmarcDomain` | `String.t() | nil | null` | No | — |
| `dmarcCurrentPolicy` | `String.t() | nil | null` | No | — |
| `dmarcRecommendedPolicy` | `String.t() | nil | null` | No | — |
| `dmarcObservedMessages` | `integer() | nil | null` | No | — |
| `dmarcAlignedMessages` | `integer() | nil | null` | No | — |
| `dmarcAccountedRate` | `number() | nil | null` | No | — |
| `dmarcUnknownMessages` | `integer() | nil | null` | No | — |
| `dmarcUnknownSources` | `integer() | nil | null` | No | — |
| `dmarcReportingDays` | `integer() | nil | null` | No | — |


## AdvisorRecommendationResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `code` | `String.t()` | Yes | — |
| `severity` | `String.t()` | Yes | — |
| `title` | `String.t()` | Yes | — |
| `message` | `String.t()` | Yes | — |
| `data` | `ApolloSignal.Types.AdvisorRecommendationDataResponse.t() | nil | null` | No | — |


## AdvisorReportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String.t()` | Yes | — |
| `generatedAt` | `String.t()` | Yes | — |
| `score` | `integer()` | Yes | — |
| `recommendations` | `list(ApolloSignal.Types.AdvisorRecommendationResponse.t())` | Yes | — |


## SuppressionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `projectId` | `String.t()` | Yes | — |
| `email` | `String.t()` | Yes | — |
| `reason` | `String.t()` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `contactId` | `String.t() | nil | null` | No | — |


## PageInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `page` | `integer()` | Yes | — |
| `size` | `integer()` | Yes | — |
| `total` | `integer()` | Yes | — |
| `totalPages` | `integer()` | Yes | — |
| `hasNextPage` | `boolean()` | Yes | — |
| `hasPreviousPage` | `boolean()` | Yes | — |


## SuppressionPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.SuppressionResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## AddSuppressionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String.t()` | Yes | — |


## SuppressionImportRowSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String.t()` | Yes | — |
| `reason` | `String.t() | nil | null` | No | — |


## SuppressionImportBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `suppressions` | `list(ApolloSignal.Types.SuppressionImportRowSerializable.t())` | Yes | — |


## SuppressionImportResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `imported` | `integer()` | Yes | — |
| `skipped` | `integer()` | Yes | — |


## SegmentResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String.t()` | No | — |
| `id` | `String.t()` | Yes | — |
| `name` | `String.t()` | Yes | — |
| `projectId` | `String.t()` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `contactCount` | `integer()` | No | — |
| `unsubscribedCount` | `integer()` | No | — |


## SegmentPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.SegmentResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## SegmentContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `contactId` | `String.t()` | Yes | — |
| `email` | `String.t()` | Yes | — |
| `firstName` | `String.t() | nil | null` | Yes | — |
| `lastName` | `String.t() | nil | null` | Yes | — |
| `segments` | `list(String.t())` | Yes | — |


## CursorInfo

| Property | Type | Required | Description |
|---|---|:---:|---|
| `nextCursor` | `String.t() | nil | null` | Yes | — |
| `previousCursor` | `String.t() | nil | null` | Yes | — |
| `hasNextPage` | `boolean()` | Yes | — |
| `hasPreviousPage` | `boolean()` | Yes | — |


## CursorPage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.SegmentContactResponse.t())` | Yes | — |
| `cursor` | `ApolloSignal.Types.CursorInfo.t()` | Yes | — |


## CreateSegmentBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String.t()` | Yes | — |


## TopicResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String.t()` | No | — |
| `id` | `String.t()` | Yes | — |
| `name` | `String.t()` | Yes | — |
| `defaultSubscription` | `String.t()` | Yes | — |
| `description` | `String.t() | nil | null` | Yes | — |
| `visibility` | `String.t()` | Yes | — |
| `projectId` | `String.t()` | Yes | — |
| `optInCount` | `integer()` | Yes | — |
| `optOutCount` | `integer()` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |


## TopicPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.TopicResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## CreateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String.t()` | Yes | — |
| `defaultSubscription` | `String.t()` | Yes | — |
| `description` | `String.t() | nil | null` | No | — |
| `visibility` | `String.t() | nil | null` | No | — |


## UpdateTopicBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String.t() | nil | null` | No | — |
| `description` | `String.t() | nil | null` | No | — |
| `visibility` | `String.t() | nil | null` | No | — |


## ContactPropertyResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String.t()` | No | — |
| `id` | `String.t()` | Yes | — |
| `key` | `String.t()` | Yes | — |
| `type` | `String.t()` | Yes | — |
| `fallbackValue` | `String.t() | nil | null` | Yes | — |
| `projectId` | `String.t()` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |


## ContactPropertyPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.ContactPropertyResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## CreateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `key` | `String.t()` | Yes | — |
| `type` | `String.t()` | Yes | — |
| `fallbackValue` | `String.t() | nil | null` | No | — |


## UpdateContactPropertyBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `fallbackValue` | `String.t() | nil | null` | No | — |


## TopicSubscriptionResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `String.t()` | Yes | — |
| `subscription` | `String.t()` | Yes | — |


## ContactResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String.t()` | No | — |
| `id` | `String.t()` | Yes | — |
| `email` | `String.t()` | Yes | — |
| `phone` | `String.t() | nil | null` | No | — |
| `firstName` | `String.t() | nil | null` | Yes | — |
| `lastName` | `String.t() | nil | null` | Yes | — |
| `unsubscribed` | `boolean()` | Yes | — |
| `properties` | `%{optional(String.t()) => String.t()}` | Yes | — |
| `profileImageUrl` | `String.t() | nil | null` | Yes | — |
| `projectId` | `String.t()` | Yes | — |
| `segments` | `list(String.t())` | Yes | — |
| `topics` | `list(ApolloSignal.Types.TopicSubscriptionResponse.t())` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |


## ContactPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.ContactResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## SegmentRef

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |


## TopicSubscriptionBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `subscription` | `String.t()` | Yes | — |


## CreateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `email` | `String.t()` | Yes | — |
| `phone` | `String.t() | nil | null` | No | — |
| `firstName` | `String.t() | nil | null` | No | — |
| `lastName` | `String.t() | nil | null` | No | — |
| `unsubscribed` | `boolean()` | No | — |
| `properties` | `%{optional(String.t()) => String.t()}` | No | — |
| `segments` | `list(ApolloSignal.Types.SegmentRef.t())` | No | — |
| `topics` | `list(ApolloSignal.Types.TopicSubscriptionBody.t())` | No | — |


## UpdateContactBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `firstName` | `String.t() | nil | null` | No | — |
| `lastName` | `String.t() | nil | null` | No | — |
| `phone` | `String.t() | nil | null` | No | — |
| `unsubscribed` | `boolean() | nil | null` | No | — |
| `properties` | `%{optional(String.t()) => String.t()} | null` | No | — |


## SetImageUrlBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String.t()` | Yes | — |


## AddToSegmentBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `segmentId` | `String.t()` | Yes | — |


## UpdateTopicsBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topics` | `list(ApolloSignal.Types.TopicSubscriptionBody.t())` | Yes | — |


## ActivityMetadataResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `topicId` | `String.t() | nil | null` | No | — |


## ActivityResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String.t()` | No | — |
| `id` | `String.t()` | Yes | — |
| `type` | `String.t()` | Yes | — |
| `referenceId` | `String.t() | nil | null` | No | — |
| `referenceName` | `String.t() | nil | null` | No | — |
| `metadata` | `ApolloSignal.Types.ActivityMetadataResponse.t() | nil | null` | No | — |
| `occurredAt` | `String.t()` | Yes | — |


## EngagementScoreResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String.t()` | No | — |
| `score` | `integer()` | Yes | — |
| `tier` | `String.t()` | Yes | — |
| `scoredAt` | `String.t()` | Yes | — |


## EmailValidationStatusResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `object` | `String.t()` | No | — |
| `status` | `String.t()` | Yes | — |
| `reason` | `String.t() | nil | null` | Yes | — |
| `validatedAt` | `String.t() | nil | null` | Yes | — |


## RecordValidationBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `status` | `ApolloSignal.Types.EmailValidationStatusInput.t()` | Yes | — |
| `reason` | `String.t() | nil | null` | No | — |


## WebhookFilterSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `field` | `String.t()` | Yes | — |
| `operator` | `String.t()` | Yes | — |
| `value` | `String.t() | nil | null` | No | — |


## WebhookTransformationSerializable

| Property | Type | Required | Description |
|---|---|:---:|---|
| `type` | `String.t()` | Yes | — |
| `from` | `String.t() | nil | null` | No | — |
| `to` | `String.t() | nil | null` | No | — |
| `field` | `String.t() | nil | null` | No | — |
| `value` | `String.t() | nil | null` | No | — |
| `template` | `String.t() | nil | null` | No | — |


## WebhookResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `projectId` | `String.t()` | Yes | — |
| `name` | `String.t()` | Yes | — |
| `url` | `String.t()` | Yes | — |
| `events` | `list(String.t())` | Yes | — |
| `enabled` | `boolean()` | Yes | — |
| `filters` | `list(ApolloSignal.Types.WebhookFilterSerializable.t()) | null` | Yes | — |
| `transformations` | `list(ApolloSignal.Types.WebhookTransformationSerializable.t()) | null` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |


## WebhookPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.WebhookResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## WebhookDeliveryResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `projectId` | `String.t()` | Yes | — |
| `webhookEndpointId` | `String.t()` | Yes | — |
| `eventType` | `String.t()` | Yes | — |
| `status` | `String.t()` | Yes | — |
| `attemptCount` | `integer()` | Yes | — |
| `lastStatusCode` | `integer() | nil | null` | Yes | — |
| `lastError` | `String.t() | nil | null` | Yes | — |
| `responseBodySnippet` | `String.t() | nil | null` | Yes | — |
| `nextAttemptAt` | `String.t() | nil | null` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |


## WebhookDeliveryPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.WebhookDeliveryResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## CreateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `url` | `String.t()` | Yes | — |
| `events` | `list(String.t())` | Yes | — |
| `name` | `String.t() | nil | null` | No | — |
| `secret` | `String.t() | nil | null` | No | — |
| `filters` | `list(ApolloSignal.Types.WebhookFilterSerializable.t()) | null` | No | — |
| `transformations` | `list(ApolloSignal.Types.WebhookTransformationSerializable.t()) | null` | No | — |


## WebhookCreateResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `projectId` | `String.t()` | Yes | — |
| `name` | `String.t()` | Yes | — |
| `url` | `String.t()` | Yes | — |
| `events` | `list(String.t())` | Yes | — |
| `enabled` | `boolean()` | Yes | — |
| `filters` | `list(ApolloSignal.Types.WebhookFilterSerializable.t()) | null` | Yes | — |
| `transformations` | `list(ApolloSignal.Types.WebhookTransformationSerializable.t()) | null` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |
| `secret` | `String.t()` | Yes | — |


## UpdateWebhookBody

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String.t() | nil | null` | No | — |
| `url` | `String.t() | nil | null` | No | — |
| `events` | `list(String.t()) | null` | No | — |
| `secret` | `String.t() | nil | null` | No | — |
| `enabled` | `boolean() | nil | null` | No | — |
| `filters` | `list(ApolloSignal.Types.WebhookFilterSerializable.t()) | null` | No | — |
| `transformations` | `list(ApolloSignal.Types.WebhookTransformationSerializable.t()) | null` | No | — |


## ApiKey

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `configId` | `String.t()` | Yes | — |
| `name` | `String.t() | nil | null` | Yes | — |
| `start` | `String.t() | nil | null` | Yes | — |
| `prefix` | `String.t() | nil | null` | Yes | — |
| `organizationId` | `String.t()` | Yes | — |
| `projectId` | `String.t() | nil | null` | Yes | — |
| `enabled` | `boolean()` | Yes | — |
| `rateLimitEnabled` | `boolean()` | Yes | — |
| `rateLimitTimeWindow` | `integer() | nil | null` | Yes | — |
| `rateLimitMax` | `integer() | nil | null` | Yes | — |
| `requestCount` | `integer()` | Yes | — |
| `remaining` | `integer() | nil | null` | Yes | — |
| `lastRequest` | `String.t() | nil | null` | Yes | — |
| `expiresAt` | `String.t() | nil | null` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |
| `metadata` | `%{optional(String.t()) => String.t()} | null` | Yes | — |
| `permissions` | `%{optional(String.t()) => list(String.t())} | null` | Yes | — |


## ApiKeyUsageRecord

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `keyId` | `String.t()` | Yes | — |
| `orgId` | `String.t()` | Yes | — |
| `method` | `String.t()` | Yes | — |
| `route` | `String.t()` | Yes | — |
| `statusCode` | `integer()` | Yes | — |
| `durationMs` | `integer() | nil | null` | Yes | — |
| `ip` | `String.t() | nil | null` | Yes | — |
| `ts` | `String.t()` | Yes | — |


## UsagePage

| Property | Type | Required | Description |
|---|---|:---:|---|
| `size` | `integer()` | Yes | — |
| `totalPages` | `integer()` | Yes | — |
| `hasMore` | `boolean()` | Yes | — |


## ApiKeyUsageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.ApiKeyUsageRecord.t())` | Yes | — |
| `page` | `ApolloSignal.Types.UsagePage.t()` | Yes | — |


## ProjectLimitsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dailySends` | `integer()` | Yes | — |
| `perSecondSends` | `integer()` | Yes | — |
| `maxRecipientsPerMessage` | `integer()` | Yes | — |
| `maxDomains` | `integer()` | Yes | — |
| `maxApiKeys` | `integer()` | Yes | — |
| `maxWebhooks` | `integer()` | Yes | — |


## ProjectTrackingSettingsModel

| Property | Type | Required | Description |
|---|---|:---:|---|
| `openTracking` | `boolean()` | Yes | — |
| `clickTracking` | `boolean()` | Yes | — |
| `unsubscribeTracking` | `boolean()` | Yes | — |
| `readEngagement` | `boolean()` | Yes | — |
| `scrollDepth` | `boolean()` | No | — |


## ProjectResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `name` | `String.t()` | Yes | — |
| `slug` | `String.t()` | Yes | — |
| `status` | `String.t()` | Yes | — |
| `suspensionReason` | `String.t() | nil | null` | Yes | — |
| `region` | `String.t()` | Yes | — |
| `limits` | `ApolloSignal.Types.ProjectLimitsModel.t()` | Yes | — |
| `trackingSettings` | `ApolloSignal.Types.ProjectTrackingSettingsModel.t()` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |


## ProjectPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.ProjectResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## UpdateProjectRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String.t() | nil | null` | No | — |
| `slug` | `String.t() | nil | null` | No | — |
| `limits` | `ApolloSignal.Types.ProjectLimitsModel.t() | nil | null` | No | — |
| `trackingSettings` | `ApolloSignal.Types.ProjectTrackingSettingsModel.t() | nil | null` | No | — |


## EmailPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.EmailDetailResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## EmailTimelineItem

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `type` | `String.t()` | Yes | — |
| `providerEventId` | `String.t() | nil | null` | Yes | — |
| `payload` | `%{optional(String.t()) => String.t() | nil} | null` | Yes | — |
| `occurredAt` | `String.t()` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |


## EmailTimelineResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `items` | `list(ApolloSignal.Types.EmailTimelineItem.t())` | Yes | — |


## DomainListItemResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `domain` | `String.t()` | Yes | — |
| `region` | `String.t()` | Yes | — |
| `status` | `String.t()` | Yes | — |
| `dkimStatus` | `String.t()` | Yes | — |
| `bimiStatus` | `String.t()` | Yes | — |
| `trackingStatus` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |


## DomainListPageResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `data` | `list(ApolloSignal.Types.DomainListItemResponse.t())` | Yes | — |
| `page` | `ApolloSignal.Types.PageInfo.t()` | Yes | — |


## DkimRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String.t()` | Yes | — |
| `type` | `String.t()` | Yes | — |
| `value` | `String.t()` | Yes | — |
| `status` | `String.t() | nil | null` | No | — |


## DnsRecordResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `name` | `String.t()` | Yes | — |
| `type` | `String.t()` | Yes | — |
| `value` | `String.t()` | Yes | — |
| `priority` | `integer() | nil | null` | No | — |
| `optional` | `boolean() | nil | null` | No | — |
| `status` | `String.t() | nil | null` | No | — |


## VerificationRecordsResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `dkim` | `list(ApolloSignal.Types.DkimRecordResponse.t())` | Yes | — |
| `mailFromMx` | `ApolloSignal.Types.DnsRecordResponse.t()` | Yes | — |
| `mailFromSpf` | `ApolloSignal.Types.DnsRecordResponse.t()` | Yes | — |
| `dmarcRecommended` | `ApolloSignal.Types.DnsRecordResponse.t() | nil | null` | No | — |
| `bimi` | `ApolloSignal.Types.DnsRecordResponse.t() | nil | null` | No | — |
| `trackingCname` | `ApolloSignal.Types.DnsRecordResponse.t() | nil | null` | No | — |


## DomainResponse

| Property | Type | Required | Description |
|---|---|:---:|---|
| `id` | `String.t()` | Yes | — |
| `projectId` | `String.t()` | Yes | — |
| `domain` | `String.t()` | Yes | — |
| `region` | `String.t()` | Yes | — |
| `status` | `String.t()` | Yes | — |
| `dkimStatus` | `String.t()` | Yes | — |
| `spfStatus` | `String.t()` | Yes | — |
| `dmarcStatus` | `String.t()` | Yes | — |
| `mailFromStatus` | `String.t()` | Yes | — |
| `mailFromDomain` | `String.t()` | Yes | — |
| `verificationRecords` | `ApolloSignal.Types.VerificationRecordsResponse.t()` | Yes | — |
| `bimiStatus` | `String.t()` | Yes | — |
| `bimiLogoUrl` | `String.t() | nil | null` | Yes | — |
| `createdAt` | `String.t()` | Yes | — |
| `updatedAt` | `String.t()` | Yes | — |
| `verifiedAt` | `String.t() | nil | null` | Yes | — |


## RegisterDomainRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `domain` | `String.t()` | Yes | — |
| `region` | `String.t()` | Yes | — |


## UpdateBimiRequest

| Property | Type | Required | Description |
|---|---|:---:|---|
| `logoUrl` | `String.t() | nil | null` | No | — |


## EmailValidationStatusInput

Allowed values:

- `"valid"`
- `"risky"`
- `"invalid"`
- `"unknown"`


## GetTopicPerformanceQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `String.t()` | No | Time window. |
| `projectId` | `String.t()` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsSummaryQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `String.t()` | No | Metrics time window. |
| `projectId` | `String.t()` | No | Required for session auth; ignored for API key auth. |


## GetProjectMetricsTimelineQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `window` | `String.t()` | No | Metrics time window. |
| `granularity` | `String.t()` | No | `hour` or `day`. |
| `format` | `String.t()` | No | `compact` or `detailed`. |
| `projectId` | `String.t()` | No | Required for session auth; ignored for API key auth. |


## GetMetricsAdvisorQuery

| Property | Type | Required | Description |
|---|---|:---:|---|
| `projectId` | `String.t()` | No | Required for session auth; ignored for API key auth. |


## ListContactSegmentsResponse

Alias of `list(String.t())`.


## GetContactTopicsResponse

Alias of `list(ApolloSignal.Types.TopicSubscriptionResponse.t())`.


## GetContactActivityResponse

Alias of `list(ApolloSignal.Types.ActivityResponse.t())`.


## ListApiKeysResponse

This model has no declared properties.

Additional properties use `list(ApolloSignal.Types.ApiKey.t())`.

