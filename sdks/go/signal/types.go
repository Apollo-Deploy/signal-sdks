package v4


type AttachmentRequest struct {
	Filename string `json:"filename"`
	Content string `json:"content"`
	ContentType string `json:"contentType"`
	Disposition *string `json:"disposition,omitempty"`
	ContentId *string `json:"contentId,omitempty"`
}
type DeliveryWindowRequest struct {
	Start string `json:"start"`
	End string `json:"end"`
}
type TrackingSettingsRequest struct {
	OpenTracking *bool `json:"openTracking,omitempty"`
	ClickTracking *bool `json:"clickTracking,omitempty"`
	UnsubscribeTracking *bool `json:"unsubscribeTracking,omitempty"`
	ReadEngagement *bool `json:"readEngagement,omitempty"`
}
type SendEmailRequest struct {
	From string `json:"from"`
	To []string `json:"to"`
	Cc *[]string `json:"cc,omitempty"`
	Bcc *[]string `json:"bcc,omitempty"`
	ReplyTo *string `json:"replyTo,omitempty"`
	Subject *string `json:"subject,omitempty"`
	Html *string `json:"html,omitempty"`
	Text *string `json:"text,omitempty"`
	Tags *map[string]string `json:"tags,omitempty"`
	Metadata *map[string]string `json:"metadata,omitempty"`
	IdempotencyKey *string `json:"idempotencyKey,omitempty"`
	TestMode *bool `json:"testMode,omitempty"`
	Attachments *[]AttachmentRequest `json:"attachments,omitempty"`
	ScheduledAt *string `json:"scheduledAt,omitempty"`
	DeliveryWindow *DeliveryWindowRequest `json:"deliveryWindow,omitempty"`
	SendTimeCategory *string `json:"sendTimeCategory,omitempty"`
	TrackingSettings *TrackingSettingsRequest `json:"trackingSettings,omitempty"`
}
type BatchSendItemResponse struct {
	Index int `json:"index"`
	Id *string `json:"id,omitempty"`
	MessageId *string `json:"messageId,omitempty"`
	Status *string `json:"status,omitempty"`
	CreatedAt *string `json:"createdAt,omitempty"`
	ScheduledAt *string `json:"scheduledAt,omitempty"`
	Error *string `json:"error,omitempty"`
}
type SendEmailResponse struct {
	Id string `json:"id"`
	MessageId *string `json:"messageId"`
	Status string `json:"status"`
	CreatedAt string `json:"createdAt"`
	ScheduledAt *string `json:"scheduledAt,omitempty"`
	AudienceId *string `json:"audienceId,omitempty"`
	Messages *[]BatchSendItemResponse `json:"messages,omitempty"`
}
type EmailDetailResponse struct {
	Id string `json:"id"`
	MessageId *string `json:"messageId"`
	From string `json:"from"`
	To []string `json:"to"`
	Cc *[]string `json:"cc"`
	Bcc *[]string `json:"bcc"`
	ReplyTo *string `json:"replyTo"`
	Subject string `json:"subject"`
	Html *string `json:"html,omitempty"`
	Text *string `json:"text,omitempty"`
	Status string `json:"status"`
	Error *string `json:"error"`
	Tags *map[string]string `json:"tags"`
	Metadata *map[string]string `json:"metadata"`
	TestMode bool `json:"testMode"`
	TopicId *string `json:"topicId,omitempty"`
	CreatedAt string `json:"createdAt"`
	SentAt *string `json:"sentAt"`
	UpdatedAt *string `json:"updatedAt"`
}
type BatchSendRequest struct {
	Items []SendEmailRequest `json:"items"`
}
type BatchSendResponse struct {
	Results []BatchSendItemResponse `json:"results"`
}
type CancelResponse struct {
	Cancelled *bool `json:"cancelled,omitempty"`
}
type BulkCancelResponse struct {
	Cancelled int `json:"cancelled"`
}
type StreamTokenResponse struct {
	Token string `json:"token"`
	ExpiresAt string `json:"expiresAt"`
}
type StreamEventResponse struct {
	Type string `json:"type"`
	EmailId string `json:"emailId"`
	OccurredAt string `json:"occurredAt"`
	Data *map[string]string `json:"data,omitempty"`
}
type ValidateLinksRequest struct {
	Html *string `json:"html,omitempty"`
}
type LinkResultItem struct {
	Url string `json:"url"`
	Status string `json:"status"`
	StatusCode *int `json:"statusCode,omitempty"`
	Error *string `json:"error,omitempty"`
}
type ValidateLinksResponse struct {
	Links []LinkResultItem `json:"links"`
	TotalLinks int `json:"totalLinks"`
	BrokenLinks int `json:"brokenLinks"`
	ErrorLinks int `json:"errorLinks"`
}
type MetricsWindowResponse struct {
	From string `json:"from"`
	To string `json:"to"`
	Label string `json:"label"`
}
type TopicPerformanceResponse struct {
	TopicId string `json:"topicId"`
	TopicName string `json:"topicName"`
	Window MetricsWindowResponse `json:"window"`
	TotalEmails int `json:"totalEmails"`
	Delivered int `json:"delivered"`
	DeliveryRate float64 `json:"deliveryRate"`
	Opened int `json:"opened"`
	OpenRate float64 `json:"openRate"`
	Clicked int `json:"clicked"`
	ClickRate float64 `json:"clickRate"`
	Bounced int `json:"bounced"`
	BounceRate float64 `json:"bounceRate"`
	Complained int `json:"complained"`
	ComplaintRate float64 `json:"complaintRate"`
	Unsubscribed int `json:"unsubscribed"`
	UnsubscribeRate float64 `json:"unsubscribeRate"`
	ReadEngaged int `json:"readEngaged"`
	ReadEngagementRate float64 `json:"readEngagementRate"`
	AvgReadTimeSeconds *float64 `json:"avgReadTimeSeconds"`
	OptInCount int `json:"optInCount"`
	OptOutCount int `json:"optOutCount"`
	ComputedAt string `json:"computedAt"`
}
type EmailPerformanceResponse struct {
	EmailId string `json:"emailId"`
	Subject string `json:"subject"`
	FromAddress string `json:"fromAddress"`
	TopicId *string `json:"topicId"`
	Status string `json:"status"`
	Delivered bool `json:"delivered"`
	Opened bool `json:"opened"`
	Clicked bool `json:"clicked"`
	TotalClicks int `json:"totalClicks"`
	Bounced bool `json:"bounced"`
	Complained bool `json:"complained"`
	Unsubscribed bool `json:"unsubscribed"`
	ReadEngaged bool `json:"readEngaged"`
	ReadTimeSeconds *float64 `json:"readTimeSeconds"`
	ReadCategory *string `json:"readCategory"`
	SentAt *string `json:"sentAt"`
	LastEventAt *string `json:"lastEventAt"`
	ComputedAt string `json:"computedAt"`
}
type EmailReadScrollAnalyticsResponse struct {
	EmailId string `json:"emailId"`
	Subject string `json:"subject"`
	ComputedAt string `json:"computedAt"`
	ReadEngaged bool `json:"readEngaged"`
	ReadTimeSeconds *float64 `json:"readTimeSeconds"`
	ReadCategory *string `json:"readCategory"`
	MailClient *string `json:"mailClient"`
	DeviceType *string `json:"deviceType"`
	Os *string `json:"os"`
	ReadEngagedAt *string `json:"readEngagedAt"`
	ShortEmail bool `json:"shortEmail"`
	Depth25Count int `json:"depth25Count"`
	Depth50Count int `json:"depth50Count"`
	Depth75Count int `json:"depth75Count"`
	Depth100Count int `json:"depth100Count"`
	MaxDepthPct *int `json:"maxDepthPct"`
	Depth25Rate *float64 `json:"depth25Rate"`
	Depth50Rate *float64 `json:"depth50Rate"`
	Depth75Rate *float64 `json:"depth75Rate"`
	Depth100Rate *float64 `json:"depth100Rate"`
}
type ProjectMetricsSummaryResponse struct {
	ProjectId string `json:"projectId"`
	Window MetricsWindowResponse `json:"window"`
	Sent int `json:"sent"`
	Delivered int `json:"delivered"`
	Opened int `json:"opened"`
	Clicked int `json:"clicked"`
	Bounced int `json:"bounced"`
	Complained int `json:"complained"`
	Failed int `json:"failed"`
	Unsubscribed int `json:"unsubscribed"`
	ReadEngaged int `json:"readEngaged"`
	DeliveryRate float64 `json:"deliveryRate"`
	OpenRate float64 `json:"openRate"`
	ClickRate float64 `json:"clickRate"`
	BounceRate float64 `json:"bounceRate"`
	ComplaintRate float64 `json:"complaintRate"`
	ReadEngagementRate float64 `json:"readEngagementRate"`
}
type ProjectTimelineBucketResponse struct {
	Bucket string `json:"bucket"`
	Type string `json:"type"`
	Count int `json:"count"`
}
type ProjectMetricsTimelineResponse struct {
	ProjectId string `json:"projectId"`
	Window MetricsWindowResponse `json:"window"`
	Granularity string `json:"granularity"`
	Format string `json:"format"`
	Buckets []ProjectTimelineBucketResponse `json:"buckets"`
}
type AdvisorRecommendationDataResponse struct {
	BounceRate *float64 `json:"bounceRate,omitempty"`
	Bounced *int `json:"bounced,omitempty"`
	Accepted *int `json:"accepted,omitempty"`
	ComplaintRate *float64 `json:"complaintRate,omitempty"`
	Accepted24h *int `json:"accepted24h,omitempty"`
	AvgDailyAccepted7d *int `json:"avgDailyAccepted7d,omitempty"`
	DaysSinceLastSend *int `json:"daysSinceLastSend,omitempty"`
	ReportedOpenRate *float64 `json:"reportedOpenRate,omitempty"`
	AdjustedOpenRate *float64 `json:"adjustedOpenRate,omitempty"`
	ProxyRate *float64 `json:"proxyRate,omitempty"`
	ProxyOpens *int `json:"proxyOpens,omitempty"`
	TotalOpens *int `json:"totalOpens,omitempty"`
	HumanOpenRate *float64 `json:"humanOpenRate,omitempty"`
	Delivered *int `json:"delivered,omitempty"`
	UnsubRate *float64 `json:"unsubRate,omitempty"`
	Unsubscribed *int `json:"unsubscribed,omitempty"`
	DmarcAlignmentFailureRate7d *float64 `json:"dmarcAlignmentFailureRate7d,omitempty"`
	DmarcDomain *string `json:"dmarcDomain,omitempty"`
	DmarcCurrentPolicy *string `json:"dmarcCurrentPolicy,omitempty"`
	DmarcRecommendedPolicy *string `json:"dmarcRecommendedPolicy,omitempty"`
	DmarcObservedMessages *int `json:"dmarcObservedMessages,omitempty"`
	DmarcAlignedMessages *int `json:"dmarcAlignedMessages,omitempty"`
	DmarcAccountedRate *float64 `json:"dmarcAccountedRate,omitempty"`
	DmarcUnknownMessages *int `json:"dmarcUnknownMessages,omitempty"`
	DmarcUnknownSources *int `json:"dmarcUnknownSources,omitempty"`
	DmarcReportingDays *int `json:"dmarcReportingDays,omitempty"`
}
type AdvisorRecommendationResponse struct {
	Code string `json:"code"`
	Severity string `json:"severity"`
	Title string `json:"title"`
	Message string `json:"message"`
	Data *AdvisorRecommendationDataResponse `json:"data,omitempty"`
}
type AdvisorReportResponse struct {
	ProjectId string `json:"projectId"`
	GeneratedAt string `json:"generatedAt"`
	Score int `json:"score"`
	Recommendations []AdvisorRecommendationResponse `json:"recommendations"`
}
type SuppressionResponse struct {
	Id string `json:"id"`
	ProjectId string `json:"projectId"`
	Email string `json:"email"`
	Reason string `json:"reason"`
	CreatedAt string `json:"createdAt"`
	ContactId *string `json:"contactId,omitempty"`
}
type PageInfo struct {
	Page int `json:"page"`
	Size int `json:"size"`
	Total int `json:"total"`
	TotalPages int `json:"totalPages"`
	HasNextPage bool `json:"hasNextPage"`
	HasPreviousPage bool `json:"hasPreviousPage"`
}
type SuppressionPageResponse struct {
	Data []SuppressionResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type AddSuppressionBody struct {
	Email string `json:"email"`
}
type SuppressionImportRowSerializable struct {
	Email string `json:"email"`
	Reason *string `json:"reason,omitempty"`
}
type SuppressionImportBody struct {
	Suppressions []SuppressionImportRowSerializable `json:"suppressions"`
}
type SuppressionImportResponse struct {
	Imported int `json:"imported"`
	Skipped int `json:"skipped"`
}
type SegmentResponse struct {
	Object *string `json:"object,omitempty"`
	Id string `json:"id"`
	Name string `json:"name"`
	ProjectId string `json:"projectId"`
	CreatedAt string `json:"createdAt"`
	ContactCount *int `json:"contactCount,omitempty"`
	UnsubscribedCount *int `json:"unsubscribedCount,omitempty"`
}
type SegmentPageResponse struct {
	Data []SegmentResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type SegmentContactResponse struct {
	ContactId string `json:"contactId"`
	Email string `json:"email"`
	FirstName *string `json:"firstName"`
	LastName *string `json:"lastName"`
	Segments []string `json:"segments"`
}
type CursorInfo struct {
	NextCursor *string `json:"nextCursor"`
	PreviousCursor *string `json:"previousCursor"`
	HasNextPage bool `json:"hasNextPage"`
	HasPreviousPage bool `json:"hasPreviousPage"`
}
type CursorPage struct {
	Data []SegmentContactResponse `json:"data"`
	Cursor CursorInfo `json:"cursor"`
}
type CreateSegmentBody struct {
	Name string `json:"name"`
}
type TopicResponse struct {
	Object *string `json:"object,omitempty"`
	Id string `json:"id"`
	Name string `json:"name"`
	DefaultSubscription string `json:"defaultSubscription"`
	Description *string `json:"description"`
	Visibility string `json:"visibility"`
	ProjectId string `json:"projectId"`
	OptInCount int `json:"optInCount"`
	OptOutCount int `json:"optOutCount"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
}
type TopicPageResponse struct {
	Data []TopicResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type CreateTopicBody struct {
	Name string `json:"name"`
	DefaultSubscription string `json:"defaultSubscription"`
	Description *string `json:"description,omitempty"`
	Visibility *string `json:"visibility,omitempty"`
}
type UpdateTopicBody struct {
	Name *string `json:"name,omitempty"`
	Description *string `json:"description,omitempty"`
	Visibility *string `json:"visibility,omitempty"`
}
type ContactPropertyResponse struct {
	Object *string `json:"object,omitempty"`
	Id string `json:"id"`
	Key string `json:"key"`
	Type string `json:"type"`
	FallbackValue *string `json:"fallbackValue"`
	ProjectId string `json:"projectId"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
}
type ContactPropertyPageResponse struct {
	Data []ContactPropertyResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type CreateContactPropertyBody struct {
	Key string `json:"key"`
	Type string `json:"type"`
	FallbackValue *string `json:"fallbackValue,omitempty"`
}
type UpdateContactPropertyBody struct {
	FallbackValue *string `json:"fallbackValue,omitempty"`
}
type TopicSubscriptionResponse struct {
	TopicId string `json:"topicId"`
	Subscription string `json:"subscription"`
}
type ContactResponse struct {
	Object *string `json:"object,omitempty"`
	Id string `json:"id"`
	Email string `json:"email"`
	Phone *string `json:"phone,omitempty"`
	FirstName *string `json:"firstName"`
	LastName *string `json:"lastName"`
	Unsubscribed bool `json:"unsubscribed"`
	Properties map[string]string `json:"properties"`
	ProfileImageUrl *string `json:"profileImageUrl"`
	ProjectId string `json:"projectId"`
	Segments []string `json:"segments"`
	Topics []TopicSubscriptionResponse `json:"topics"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
}
type ContactPageResponse struct {
	Data []ContactResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type SegmentRef struct {
	Id string `json:"id"`
}
type TopicSubscriptionBody struct {
	Id string `json:"id"`
	Subscription string `json:"subscription"`
}
type CreateContactBody struct {
	Email string `json:"email"`
	Phone *string `json:"phone,omitempty"`
	FirstName *string `json:"firstName,omitempty"`
	LastName *string `json:"lastName,omitempty"`
	Unsubscribed *bool `json:"unsubscribed,omitempty"`
	Properties *map[string]string `json:"properties,omitempty"`
	Segments *[]SegmentRef `json:"segments,omitempty"`
	Topics *[]TopicSubscriptionBody `json:"topics,omitempty"`
}
type UpdateContactBody struct {
	FirstName *string `json:"firstName,omitempty"`
	LastName *string `json:"lastName,omitempty"`
	Phone *string `json:"phone,omitempty"`
	Unsubscribed *bool `json:"unsubscribed,omitempty"`
	Properties *map[string]string `json:"properties,omitempty"`
}
type SetImageUrlBody struct {
	Url string `json:"url"`
}
type AddToSegmentBody struct {
	SegmentId string `json:"segmentId"`
}
type UpdateTopicsBody struct {
	Topics []TopicSubscriptionBody `json:"topics"`
}
type ActivityMetadataResponse struct {
	TopicId *string `json:"topicId,omitempty"`
}
type ActivityResponse struct {
	Object *string `json:"object,omitempty"`
	Id string `json:"id"`
	Type string `json:"type"`
	ReferenceId *string `json:"referenceId,omitempty"`
	ReferenceName *string `json:"referenceName,omitempty"`
	Metadata *ActivityMetadataResponse `json:"metadata,omitempty"`
	OccurredAt string `json:"occurredAt"`
}
type EngagementScoreResponse struct {
	Object *string `json:"object,omitempty"`
	Score int `json:"score"`
	Tier string `json:"tier"`
	ScoredAt string `json:"scoredAt"`
}
type EmailValidationStatusResponse struct {
	Object *string `json:"object,omitempty"`
	Status string `json:"status"`
	Reason *string `json:"reason"`
	ValidatedAt *string `json:"validatedAt"`
}
type RecordValidationBody struct {
	Status EmailValidationStatusInput `json:"status"`
	Reason *string `json:"reason,omitempty"`
}
type WebhookFilterSerializable struct {
	Field string `json:"field"`
	Operator string `json:"operator"`
	Value *string `json:"value,omitempty"`
}
type WebhookTransformationSerializable struct {
	Type string `json:"type"`
	From *string `json:"from,omitempty"`
	To *string `json:"to,omitempty"`
	Field *string `json:"field,omitempty"`
	Value *string `json:"value,omitempty"`
	Template *string `json:"template,omitempty"`
}
type WebhookResponse struct {
	Id string `json:"id"`
	ProjectId string `json:"projectId"`
	Name string `json:"name"`
	Url string `json:"url"`
	Events []string `json:"events"`
	Enabled bool `json:"enabled"`
	Filters *[]WebhookFilterSerializable `json:"filters"`
	Transformations *[]WebhookTransformationSerializable `json:"transformations"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
}
type WebhookPageResponse struct {
	Data []WebhookResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type WebhookDeliveryResponse struct {
	Id string `json:"id"`
	ProjectId string `json:"projectId"`
	WebhookEndpointId string `json:"webhookEndpointId"`
	EventType string `json:"eventType"`
	Status string `json:"status"`
	AttemptCount int `json:"attemptCount"`
	LastStatusCode *int `json:"lastStatusCode"`
	LastError *string `json:"lastError"`
	ResponseBodySnippet *string `json:"responseBodySnippet"`
	NextAttemptAt *string `json:"nextAttemptAt"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
}
type WebhookDeliveryPageResponse struct {
	Data []WebhookDeliveryResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type CreateWebhookBody struct {
	Url string `json:"url"`
	Events []string `json:"events"`
	Name *string `json:"name,omitempty"`
	Secret *string `json:"secret,omitempty"`
	Filters *[]WebhookFilterSerializable `json:"filters,omitempty"`
	Transformations *[]WebhookTransformationSerializable `json:"transformations,omitempty"`
}
type WebhookCreateResponse struct {
	Id string `json:"id"`
	ProjectId string `json:"projectId"`
	Name string `json:"name"`
	Url string `json:"url"`
	Events []string `json:"events"`
	Enabled bool `json:"enabled"`
	Filters *[]WebhookFilterSerializable `json:"filters"`
	Transformations *[]WebhookTransformationSerializable `json:"transformations"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
	Secret string `json:"secret"`
}
type UpdateWebhookBody struct {
	Name *string `json:"name,omitempty"`
	Url *string `json:"url,omitempty"`
	Events *[]string `json:"events,omitempty"`
	Secret *string `json:"secret,omitempty"`
	Enabled *bool `json:"enabled,omitempty"`
	Filters *[]WebhookFilterSerializable `json:"filters,omitempty"`
	Transformations *[]WebhookTransformationSerializable `json:"transformations,omitempty"`
}
type ApiKey struct {
	Id string `json:"id"`
	ConfigId string `json:"configId"`
	Name *string `json:"name"`
	Start *string `json:"start"`
	Prefix *string `json:"prefix"`
	OrganizationId string `json:"organizationId"`
	ProjectId *string `json:"projectId"`
	Enabled bool `json:"enabled"`
	RateLimitEnabled bool `json:"rateLimitEnabled"`
	RateLimitTimeWindow *int `json:"rateLimitTimeWindow"`
	RateLimitMax *int `json:"rateLimitMax"`
	RequestCount int `json:"requestCount"`
	Remaining *int `json:"remaining"`
	LastRequest *string `json:"lastRequest"`
	ExpiresAt *string `json:"expiresAt"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
	Metadata *map[string]string `json:"metadata"`
	Permissions *map[string][]string `json:"permissions"`
}
type ApiKeyUsageRecord struct {
	Id string `json:"id"`
	KeyId string `json:"keyId"`
	OrgId string `json:"orgId"`
	Method string `json:"method"`
	Route string `json:"route"`
	StatusCode int `json:"statusCode"`
	DurationMs *int `json:"durationMs"`
	Ip *string `json:"ip"`
	Ts string `json:"ts"`
}
type UsagePage struct {
	Size int `json:"size"`
	TotalPages int `json:"totalPages"`
	HasMore bool `json:"hasMore"`
}
type ApiKeyUsageResponse struct {
	Data []ApiKeyUsageRecord `json:"data"`
	Page UsagePage `json:"page"`
}
type ProjectLimitsModel struct {
	DailySends int `json:"dailySends"`
	PerSecondSends int `json:"perSecondSends"`
	MaxRecipientsPerMessage int `json:"maxRecipientsPerMessage"`
	MaxDomains int `json:"maxDomains"`
	MaxApiKeys int `json:"maxApiKeys"`
	MaxWebhooks int `json:"maxWebhooks"`
}
type ProjectTrackingSettingsModel struct {
	OpenTracking bool `json:"openTracking"`
	ClickTracking bool `json:"clickTracking"`
	UnsubscribeTracking bool `json:"unsubscribeTracking"`
	ReadEngagement bool `json:"readEngagement"`
	ScrollDepth *bool `json:"scrollDepth,omitempty"`
}
type ProjectResponse struct {
	Id string `json:"id"`
	Name string `json:"name"`
	Slug string `json:"slug"`
	Status string `json:"status"`
	SuspensionReason *string `json:"suspensionReason"`
	Region string `json:"region"`
	Limits ProjectLimitsModel `json:"limits"`
	TrackingSettings ProjectTrackingSettingsModel `json:"trackingSettings"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
}
type ProjectPageResponse struct {
	Data []ProjectResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type UpdateProjectRequest struct {
	Name *string `json:"name,omitempty"`
	Slug *string `json:"slug,omitempty"`
	Limits *ProjectLimitsModel `json:"limits,omitempty"`
	TrackingSettings *ProjectTrackingSettingsModel `json:"trackingSettings,omitempty"`
}
type EmailPageResponse struct {
	Data []EmailDetailResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type EmailTimelineItem struct {
	Id string `json:"id"`
	Type string `json:"type"`
	ProviderEventId *string `json:"providerEventId"`
	Payload *map[string]string `json:"payload"`
	OccurredAt string `json:"occurredAt"`
	CreatedAt string `json:"createdAt"`
}
type EmailTimelineResponse struct {
	Items []EmailTimelineItem `json:"items"`
}
type DomainListItemResponse struct {
	Id string `json:"id"`
	Domain string `json:"domain"`
	Region string `json:"region"`
	Status string `json:"status"`
	DkimStatus string `json:"dkimStatus"`
	BimiStatus string `json:"bimiStatus"`
	TrackingStatus string `json:"trackingStatus"`
	UpdatedAt string `json:"updatedAt"`
}
type DomainListPageResponse struct {
	Data []DomainListItemResponse `json:"data"`
	Page PageInfo `json:"page"`
}
type DkimRecordResponse struct {
	Name string `json:"name"`
	Type string `json:"type"`
	Value string `json:"value"`
	Status *string `json:"status,omitempty"`
}
type DnsRecordResponse struct {
	Name string `json:"name"`
	Type string `json:"type"`
	Value string `json:"value"`
	Priority *int `json:"priority,omitempty"`
	Optional *bool `json:"optional,omitempty"`
	Status *string `json:"status,omitempty"`
}
type VerificationRecordsResponse struct {
	Dkim []DkimRecordResponse `json:"dkim"`
	MailFromMx DnsRecordResponse `json:"mailFromMx"`
	MailFromSpf DnsRecordResponse `json:"mailFromSpf"`
	DmarcRecommended *DnsRecordResponse `json:"dmarcRecommended,omitempty"`
	Bimi *DnsRecordResponse `json:"bimi,omitempty"`
	TrackingCname *DnsRecordResponse `json:"trackingCname,omitempty"`
}
type DomainResponse struct {
	Id string `json:"id"`
	ProjectId string `json:"projectId"`
	Domain string `json:"domain"`
	Region string `json:"region"`
	Status string `json:"status"`
	DkimStatus string `json:"dkimStatus"`
	SpfStatus string `json:"spfStatus"`
	DmarcStatus string `json:"dmarcStatus"`
	MailFromStatus string `json:"mailFromStatus"`
	MailFromDomain string `json:"mailFromDomain"`
	VerificationRecords VerificationRecordsResponse `json:"verificationRecords"`
	BimiStatus string `json:"bimiStatus"`
	BimiLogoUrl *string `json:"bimiLogoUrl"`
	CreatedAt string `json:"createdAt"`
	UpdatedAt string `json:"updatedAt"`
	VerifiedAt *string `json:"verifiedAt"`
}
type RegisterDomainRequest struct {
	Domain string `json:"domain"`
	Region string `json:"region"`
}
type UpdateBimiRequest struct {
	LogoUrl *string `json:"logoUrl,omitempty"`
}
// EmailValidationStatusInput
type EmailValidationStatusInput string

const (
	EmailValidationStatusInputValid EmailValidationStatusInput = "valid"
	EmailValidationStatusInputRisky EmailValidationStatusInput = "risky"
	EmailValidationStatusInputInvalid EmailValidationStatusInput = "invalid"
	EmailValidationStatusInputUnknown EmailValidationStatusInput = "unknown"
)

type GetTopicPerformanceQuery struct {
	Window *string `json:"window,omitempty"` // Time window.
	ProjectId *string `json:"projectId,omitempty"` // Required for session auth; ignored for API key auth.
}
type GetProjectMetricsSummaryQuery struct {
	Window *string `json:"window,omitempty"` // Metrics time window.
	ProjectId *string `json:"projectId,omitempty"` // Required for session auth; ignored for API key auth.
}
type GetProjectMetricsTimelineQuery struct {
	Window *string `json:"window,omitempty"` // Metrics time window.
	Granularity *string `json:"granularity,omitempty"` // `hour` or `day`.
	Format *string `json:"format,omitempty"` // `compact` or `detailed`.
	ProjectId *string `json:"projectId,omitempty"` // Required for session auth; ignored for API key auth.
}
type GetMetricsAdvisorQuery struct {
	ProjectId *string `json:"projectId,omitempty"` // Required for session auth; ignored for API key auth.
}
// ListContactSegmentsResponse
type ListContactSegmentsResponse = []string

// GetContactTopicsResponse
type GetContactTopicsResponse = []TopicSubscriptionResponse

// GetContactActivityResponse
type GetContactActivityResponse = []ActivityResponse

type ListApiKeysResponse struct {
}
