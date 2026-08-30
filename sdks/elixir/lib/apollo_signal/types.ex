defmodule ApolloSignal.Types do
  @moduledoc "Typed models and JSON conversion helpers for Apollo Signal API."

  @type json_value() :: nil | boolean() | number() | String.t() | [json_value()] | map()

  @spec field(map(), String.t(), atom()) :: term()
  def field(data, key, atom) when is_map(data) do
    case Map.fetch(data, key) do
      {:ok, value} -> value
      :error -> Map.get(data, atom)
    end
  end

  def field(_data, _key, _atom), do: nil

  @spec decode_nullable(term(), (term() -> term())) :: term()
  def decode_nullable(nil, _decoder), do: nil
  def decode_nullable(value, decoder), do: decoder.(value)

  @spec decode_list(term(), (term() -> term())) :: term()
  def decode_list(nil, _decoder), do: nil
  def decode_list(values, decoder) when is_list(values), do: Enum.map(values, decoder)
  def decode_list(value, _decoder), do: value

  @spec decode_map(term(), (term() -> term())) :: term()
  def decode_map(nil, _decoder), do: nil

  def decode_map(values, decoder) when is_map(values) do
    Map.new(values, fn {key, value} -> {to_string(key), decoder.(value)} end)
  end

  def decode_map(value, _decoder), do: value

  @spec decode_enum(term(), [{term(), term()}]) :: term()
  def decode_enum(value, pairs) do
    case Enum.find(pairs, fn {raw, _atom} -> raw == value end) do
      {_, atom} -> atom
      nil -> raise ArgumentError, "unexpected enum value: #{inspect(value)}"
    end
  end

  @spec decode_union(term(), [(term() -> term())]) :: term()
  def decode_union(value, decoders) do
    Enum.reduce_while(decoders, value, fn decoder, _current ->
      try do
        {:halt, decoder.(value)}
      rescue
        _ -> {:cont, value}
      end
    end)
  end

  @spec put_field(map(), String.t(), term(), boolean()) :: map()
  def put_field(data, key, value, include_nil) do
    if include_nil or not is_nil(value) do
      Map.put(data, key, encode(value))
    else
      data
    end
  end

  @spec extra_fields(map(), [String.t()]) :: map()
  def extra_fields(data, known_fields) when is_map(data), do: Map.drop(data, known_fields)
  def extra_fields(_data, _known_fields), do: %{}

  @spec from_attachment_request(term()) :: ApolloSignal.Types.AttachmentRequest.t()
  def from_attachment_request(value), do: ApolloSignal.Types.AttachmentRequest.from_map(value)

  @spec from_delivery_window_request(term()) :: ApolloSignal.Types.DeliveryWindowRequest.t()
  def from_delivery_window_request(value), do: ApolloSignal.Types.DeliveryWindowRequest.from_map(value)

  @spec from_tracking_settings_request(term()) :: ApolloSignal.Types.TrackingSettingsRequest.t()
  def from_tracking_settings_request(value), do: ApolloSignal.Types.TrackingSettingsRequest.from_map(value)

  @spec from_send_email_request(term()) :: ApolloSignal.Types.SendEmailRequest.t()
  def from_send_email_request(value), do: ApolloSignal.Types.SendEmailRequest.from_map(value)

  @spec from_batch_send_item_response(term()) :: ApolloSignal.Types.BatchSendItemResponse.t()
  def from_batch_send_item_response(value), do: ApolloSignal.Types.BatchSendItemResponse.from_map(value)

  @spec from_send_email_response(term()) :: ApolloSignal.Types.SendEmailResponse.t()
  def from_send_email_response(value), do: ApolloSignal.Types.SendEmailResponse.from_map(value)

  @spec from_email_detail_response(term()) :: ApolloSignal.Types.EmailDetailResponse.t()
  def from_email_detail_response(value), do: ApolloSignal.Types.EmailDetailResponse.from_map(value)

  @spec from_batch_send_request(term()) :: ApolloSignal.Types.BatchSendRequest.t()
  def from_batch_send_request(value), do: ApolloSignal.Types.BatchSendRequest.from_map(value)

  @spec from_batch_send_response(term()) :: ApolloSignal.Types.BatchSendResponse.t()
  def from_batch_send_response(value), do: ApolloSignal.Types.BatchSendResponse.from_map(value)

  @spec from_cancel_response(term()) :: ApolloSignal.Types.CancelResponse.t()
  def from_cancel_response(value), do: ApolloSignal.Types.CancelResponse.from_map(value)

  @spec from_bulk_cancel_response(term()) :: ApolloSignal.Types.BulkCancelResponse.t()
  def from_bulk_cancel_response(value), do: ApolloSignal.Types.BulkCancelResponse.from_map(value)

  @spec from_stream_token_response(term()) :: ApolloSignal.Types.StreamTokenResponse.t()
  def from_stream_token_response(value), do: ApolloSignal.Types.StreamTokenResponse.from_map(value)

  @spec from_stream_event_response(term()) :: ApolloSignal.Types.StreamEventResponse.t()
  def from_stream_event_response(value), do: ApolloSignal.Types.StreamEventResponse.from_map(value)

  @spec from_validate_links_request(term()) :: ApolloSignal.Types.ValidateLinksRequest.t()
  def from_validate_links_request(value), do: ApolloSignal.Types.ValidateLinksRequest.from_map(value)

  @spec from_link_result_item(term()) :: ApolloSignal.Types.LinkResultItem.t()
  def from_link_result_item(value), do: ApolloSignal.Types.LinkResultItem.from_map(value)

  @spec from_validate_links_response(term()) :: ApolloSignal.Types.ValidateLinksResponse.t()
  def from_validate_links_response(value), do: ApolloSignal.Types.ValidateLinksResponse.from_map(value)

  @spec from_metrics_window_response(term()) :: ApolloSignal.Types.MetricsWindowResponse.t()
  def from_metrics_window_response(value), do: ApolloSignal.Types.MetricsWindowResponse.from_map(value)

  @spec from_topic_performance_response(term()) :: ApolloSignal.Types.TopicPerformanceResponse.t()
  def from_topic_performance_response(value), do: ApolloSignal.Types.TopicPerformanceResponse.from_map(value)

  @spec from_email_performance_response(term()) :: ApolloSignal.Types.EmailPerformanceResponse.t()
  def from_email_performance_response(value), do: ApolloSignal.Types.EmailPerformanceResponse.from_map(value)

  @spec from_email_read_scroll_analytics_response(term()) :: ApolloSignal.Types.EmailReadScrollAnalyticsResponse.t()
  def from_email_read_scroll_analytics_response(value), do: ApolloSignal.Types.EmailReadScrollAnalyticsResponse.from_map(value)

  @spec from_project_metrics_summary_response(term()) :: ApolloSignal.Types.ProjectMetricsSummaryResponse.t()
  def from_project_metrics_summary_response(value), do: ApolloSignal.Types.ProjectMetricsSummaryResponse.from_map(value)

  @spec from_project_timeline_bucket_response(term()) :: ApolloSignal.Types.ProjectTimelineBucketResponse.t()
  def from_project_timeline_bucket_response(value), do: ApolloSignal.Types.ProjectTimelineBucketResponse.from_map(value)

  @spec from_project_metrics_timeline_response(term()) :: ApolloSignal.Types.ProjectMetricsTimelineResponse.t()
  def from_project_metrics_timeline_response(value), do: ApolloSignal.Types.ProjectMetricsTimelineResponse.from_map(value)

  @spec from_advisor_recommendation_data_response(term()) :: ApolloSignal.Types.AdvisorRecommendationDataResponse.t()
  def from_advisor_recommendation_data_response(value), do: ApolloSignal.Types.AdvisorRecommendationDataResponse.from_map(value)

  @spec from_advisor_recommendation_response(term()) :: ApolloSignal.Types.AdvisorRecommendationResponse.t()
  def from_advisor_recommendation_response(value), do: ApolloSignal.Types.AdvisorRecommendationResponse.from_map(value)

  @spec from_advisor_report_response(term()) :: ApolloSignal.Types.AdvisorReportResponse.t()
  def from_advisor_report_response(value), do: ApolloSignal.Types.AdvisorReportResponse.from_map(value)

  @spec from_suppression_response(term()) :: ApolloSignal.Types.SuppressionResponse.t()
  def from_suppression_response(value), do: ApolloSignal.Types.SuppressionResponse.from_map(value)

  @spec from_page_info(term()) :: ApolloSignal.Types.PageInfo.t()
  def from_page_info(value), do: ApolloSignal.Types.PageInfo.from_map(value)

  @spec from_suppression_page_response(term()) :: ApolloSignal.Types.SuppressionPageResponse.t()
  def from_suppression_page_response(value), do: ApolloSignal.Types.SuppressionPageResponse.from_map(value)

  @spec from_add_suppression_body(term()) :: ApolloSignal.Types.AddSuppressionBody.t()
  def from_add_suppression_body(value), do: ApolloSignal.Types.AddSuppressionBody.from_map(value)

  @spec from_suppression_import_row_serializable(term()) :: ApolloSignal.Types.SuppressionImportRowSerializable.t()
  def from_suppression_import_row_serializable(value), do: ApolloSignal.Types.SuppressionImportRowSerializable.from_map(value)

  @spec from_suppression_import_body(term()) :: ApolloSignal.Types.SuppressionImportBody.t()
  def from_suppression_import_body(value), do: ApolloSignal.Types.SuppressionImportBody.from_map(value)

  @spec from_suppression_import_response(term()) :: ApolloSignal.Types.SuppressionImportResponse.t()
  def from_suppression_import_response(value), do: ApolloSignal.Types.SuppressionImportResponse.from_map(value)

  @spec from_segment_response(term()) :: ApolloSignal.Types.SegmentResponse.t()
  def from_segment_response(value), do: ApolloSignal.Types.SegmentResponse.from_map(value)

  @spec from_segment_page_response(term()) :: ApolloSignal.Types.SegmentPageResponse.t()
  def from_segment_page_response(value), do: ApolloSignal.Types.SegmentPageResponse.from_map(value)

  @spec from_segment_contact_response(term()) :: ApolloSignal.Types.SegmentContactResponse.t()
  def from_segment_contact_response(value), do: ApolloSignal.Types.SegmentContactResponse.from_map(value)

  @spec from_cursor_info(term()) :: ApolloSignal.Types.CursorInfo.t()
  def from_cursor_info(value), do: ApolloSignal.Types.CursorInfo.from_map(value)

  @spec from_cursor_page(term()) :: ApolloSignal.Types.CursorPage.t()
  def from_cursor_page(value), do: ApolloSignal.Types.CursorPage.from_map(value)

  @spec from_create_segment_body(term()) :: ApolloSignal.Types.CreateSegmentBody.t()
  def from_create_segment_body(value), do: ApolloSignal.Types.CreateSegmentBody.from_map(value)

  @spec from_topic_response(term()) :: ApolloSignal.Types.TopicResponse.t()
  def from_topic_response(value), do: ApolloSignal.Types.TopicResponse.from_map(value)

  @spec from_topic_page_response(term()) :: ApolloSignal.Types.TopicPageResponse.t()
  def from_topic_page_response(value), do: ApolloSignal.Types.TopicPageResponse.from_map(value)

  @spec from_create_topic_body(term()) :: ApolloSignal.Types.CreateTopicBody.t()
  def from_create_topic_body(value), do: ApolloSignal.Types.CreateTopicBody.from_map(value)

  @spec from_update_topic_body(term()) :: ApolloSignal.Types.UpdateTopicBody.t()
  def from_update_topic_body(value), do: ApolloSignal.Types.UpdateTopicBody.from_map(value)

  @spec from_contact_property_response(term()) :: ApolloSignal.Types.ContactPropertyResponse.t()
  def from_contact_property_response(value), do: ApolloSignal.Types.ContactPropertyResponse.from_map(value)

  @spec from_contact_property_page_response(term()) :: ApolloSignal.Types.ContactPropertyPageResponse.t()
  def from_contact_property_page_response(value), do: ApolloSignal.Types.ContactPropertyPageResponse.from_map(value)

  @spec from_create_contact_property_body(term()) :: ApolloSignal.Types.CreateContactPropertyBody.t()
  def from_create_contact_property_body(value), do: ApolloSignal.Types.CreateContactPropertyBody.from_map(value)

  @spec from_update_contact_property_body(term()) :: ApolloSignal.Types.UpdateContactPropertyBody.t()
  def from_update_contact_property_body(value), do: ApolloSignal.Types.UpdateContactPropertyBody.from_map(value)

  @spec from_topic_subscription_response(term()) :: ApolloSignal.Types.TopicSubscriptionResponse.t()
  def from_topic_subscription_response(value), do: ApolloSignal.Types.TopicSubscriptionResponse.from_map(value)

  @spec from_contact_response(term()) :: ApolloSignal.Types.ContactResponse.t()
  def from_contact_response(value), do: ApolloSignal.Types.ContactResponse.from_map(value)

  @spec from_contact_page_response(term()) :: ApolloSignal.Types.ContactPageResponse.t()
  def from_contact_page_response(value), do: ApolloSignal.Types.ContactPageResponse.from_map(value)

  @spec from_segment_ref(term()) :: ApolloSignal.Types.SegmentRef.t()
  def from_segment_ref(value), do: ApolloSignal.Types.SegmentRef.from_map(value)

  @spec from_topic_subscription_body(term()) :: ApolloSignal.Types.TopicSubscriptionBody.t()
  def from_topic_subscription_body(value), do: ApolloSignal.Types.TopicSubscriptionBody.from_map(value)

  @spec from_create_contact_body(term()) :: ApolloSignal.Types.CreateContactBody.t()
  def from_create_contact_body(value), do: ApolloSignal.Types.CreateContactBody.from_map(value)

  @spec from_update_contact_body(term()) :: ApolloSignal.Types.UpdateContactBody.t()
  def from_update_contact_body(value), do: ApolloSignal.Types.UpdateContactBody.from_map(value)

  @spec from_set_image_url_body(term()) :: ApolloSignal.Types.SetImageUrlBody.t()
  def from_set_image_url_body(value), do: ApolloSignal.Types.SetImageUrlBody.from_map(value)

  @spec from_add_to_segment_body(term()) :: ApolloSignal.Types.AddToSegmentBody.t()
  def from_add_to_segment_body(value), do: ApolloSignal.Types.AddToSegmentBody.from_map(value)

  @spec from_update_topics_body(term()) :: ApolloSignal.Types.UpdateTopicsBody.t()
  def from_update_topics_body(value), do: ApolloSignal.Types.UpdateTopicsBody.from_map(value)

  @spec from_activity_metadata_response(term()) :: ApolloSignal.Types.ActivityMetadataResponse.t()
  def from_activity_metadata_response(value), do: ApolloSignal.Types.ActivityMetadataResponse.from_map(value)

  @spec from_activity_response(term()) :: ApolloSignal.Types.ActivityResponse.t()
  def from_activity_response(value), do: ApolloSignal.Types.ActivityResponse.from_map(value)

  @spec from_engagement_score_response(term()) :: ApolloSignal.Types.EngagementScoreResponse.t()
  def from_engagement_score_response(value), do: ApolloSignal.Types.EngagementScoreResponse.from_map(value)

  @spec from_email_validation_status_response(term()) :: ApolloSignal.Types.EmailValidationStatusResponse.t()
  def from_email_validation_status_response(value), do: ApolloSignal.Types.EmailValidationStatusResponse.from_map(value)

  @spec from_record_validation_body(term()) :: ApolloSignal.Types.RecordValidationBody.t()
  def from_record_validation_body(value), do: ApolloSignal.Types.RecordValidationBody.from_map(value)

  @spec from_webhook_filter_serializable(term()) :: ApolloSignal.Types.WebhookFilterSerializable.t()
  def from_webhook_filter_serializable(value), do: ApolloSignal.Types.WebhookFilterSerializable.from_map(value)

  @spec from_webhook_transformation_serializable(term()) :: ApolloSignal.Types.WebhookTransformationSerializable.t()
  def from_webhook_transformation_serializable(value), do: ApolloSignal.Types.WebhookTransformationSerializable.from_map(value)

  @spec from_webhook_response(term()) :: ApolloSignal.Types.WebhookResponse.t()
  def from_webhook_response(value), do: ApolloSignal.Types.WebhookResponse.from_map(value)

  @spec from_webhook_page_response(term()) :: ApolloSignal.Types.WebhookPageResponse.t()
  def from_webhook_page_response(value), do: ApolloSignal.Types.WebhookPageResponse.from_map(value)

  @spec from_webhook_delivery_response(term()) :: ApolloSignal.Types.WebhookDeliveryResponse.t()
  def from_webhook_delivery_response(value), do: ApolloSignal.Types.WebhookDeliveryResponse.from_map(value)

  @spec from_webhook_delivery_page_response(term()) :: ApolloSignal.Types.WebhookDeliveryPageResponse.t()
  def from_webhook_delivery_page_response(value), do: ApolloSignal.Types.WebhookDeliveryPageResponse.from_map(value)

  @spec from_create_webhook_body(term()) :: ApolloSignal.Types.CreateWebhookBody.t()
  def from_create_webhook_body(value), do: ApolloSignal.Types.CreateWebhookBody.from_map(value)

  @spec from_webhook_create_response(term()) :: ApolloSignal.Types.WebhookCreateResponse.t()
  def from_webhook_create_response(value), do: ApolloSignal.Types.WebhookCreateResponse.from_map(value)

  @spec from_update_webhook_body(term()) :: ApolloSignal.Types.UpdateWebhookBody.t()
  def from_update_webhook_body(value), do: ApolloSignal.Types.UpdateWebhookBody.from_map(value)

  @spec from_api_key(term()) :: ApolloSignal.Types.ApiKey.t()
  def from_api_key(value), do: ApolloSignal.Types.ApiKey.from_map(value)

  @spec from_api_key_usage_record(term()) :: ApolloSignal.Types.ApiKeyUsageRecord.t()
  def from_api_key_usage_record(value), do: ApolloSignal.Types.ApiKeyUsageRecord.from_map(value)

  @spec from_usage_page(term()) :: ApolloSignal.Types.UsagePage.t()
  def from_usage_page(value), do: ApolloSignal.Types.UsagePage.from_map(value)

  @spec from_api_key_usage_response(term()) :: ApolloSignal.Types.ApiKeyUsageResponse.t()
  def from_api_key_usage_response(value), do: ApolloSignal.Types.ApiKeyUsageResponse.from_map(value)

  @spec from_project_limits_model(term()) :: ApolloSignal.Types.ProjectLimitsModel.t()
  def from_project_limits_model(value), do: ApolloSignal.Types.ProjectLimitsModel.from_map(value)

  @spec from_project_tracking_settings_model(term()) :: ApolloSignal.Types.ProjectTrackingSettingsModel.t()
  def from_project_tracking_settings_model(value), do: ApolloSignal.Types.ProjectTrackingSettingsModel.from_map(value)

  @spec from_project_response(term()) :: ApolloSignal.Types.ProjectResponse.t()
  def from_project_response(value), do: ApolloSignal.Types.ProjectResponse.from_map(value)

  @spec from_project_page_response(term()) :: ApolloSignal.Types.ProjectPageResponse.t()
  def from_project_page_response(value), do: ApolloSignal.Types.ProjectPageResponse.from_map(value)

  @spec from_update_project_request(term()) :: ApolloSignal.Types.UpdateProjectRequest.t()
  def from_update_project_request(value), do: ApolloSignal.Types.UpdateProjectRequest.from_map(value)

  @spec from_email_page_response(term()) :: ApolloSignal.Types.EmailPageResponse.t()
  def from_email_page_response(value), do: ApolloSignal.Types.EmailPageResponse.from_map(value)

  @spec from_email_timeline_item(term()) :: ApolloSignal.Types.EmailTimelineItem.t()
  def from_email_timeline_item(value), do: ApolloSignal.Types.EmailTimelineItem.from_map(value)

  @spec from_email_timeline_response(term()) :: ApolloSignal.Types.EmailTimelineResponse.t()
  def from_email_timeline_response(value), do: ApolloSignal.Types.EmailTimelineResponse.from_map(value)

  @spec from_domain_list_item_response(term()) :: ApolloSignal.Types.DomainListItemResponse.t()
  def from_domain_list_item_response(value), do: ApolloSignal.Types.DomainListItemResponse.from_map(value)

  @spec from_domain_list_page_response(term()) :: ApolloSignal.Types.DomainListPageResponse.t()
  def from_domain_list_page_response(value), do: ApolloSignal.Types.DomainListPageResponse.from_map(value)

  @spec from_dkim_record_response(term()) :: ApolloSignal.Types.DkimRecordResponse.t()
  def from_dkim_record_response(value), do: ApolloSignal.Types.DkimRecordResponse.from_map(value)

  @spec from_dns_record_response(term()) :: ApolloSignal.Types.DnsRecordResponse.t()
  def from_dns_record_response(value), do: ApolloSignal.Types.DnsRecordResponse.from_map(value)

  @spec from_verification_records_response(term()) :: ApolloSignal.Types.VerificationRecordsResponse.t()
  def from_verification_records_response(value), do: ApolloSignal.Types.VerificationRecordsResponse.from_map(value)

  @spec from_domain_response(term()) :: ApolloSignal.Types.DomainResponse.t()
  def from_domain_response(value), do: ApolloSignal.Types.DomainResponse.from_map(value)

  @spec from_register_domain_request(term()) :: ApolloSignal.Types.RegisterDomainRequest.t()
  def from_register_domain_request(value), do: ApolloSignal.Types.RegisterDomainRequest.from_map(value)

  @spec from_update_bimi_request(term()) :: ApolloSignal.Types.UpdateBimiRequest.t()
  def from_update_bimi_request(value), do: ApolloSignal.Types.UpdateBimiRequest.from_map(value)

  @spec from_email_validation_status_input(term()) :: ApolloSignal.Types.EmailValidationStatusInput.t()
  def from_email_validation_status_input(value), do: decode_enum(value, [{ "valid", :valid }, { "risky", :risky }, { "invalid", :invalid }, { "unknown", :unknown }])

  @spec from_get_topic_performance_query(term()) :: ApolloSignal.Types.GetTopicPerformanceQuery.t()
  def from_get_topic_performance_query(value), do: ApolloSignal.Types.GetTopicPerformanceQuery.from_map(value)

  @spec from_get_project_metrics_summary_query(term()) :: ApolloSignal.Types.GetProjectMetricsSummaryQuery.t()
  def from_get_project_metrics_summary_query(value), do: ApolloSignal.Types.GetProjectMetricsSummaryQuery.from_map(value)

  @spec from_get_project_metrics_timeline_query(term()) :: ApolloSignal.Types.GetProjectMetricsTimelineQuery.t()
  def from_get_project_metrics_timeline_query(value), do: ApolloSignal.Types.GetProjectMetricsTimelineQuery.from_map(value)

  @spec from_get_metrics_advisor_query(term()) :: ApolloSignal.Types.GetMetricsAdvisorQuery.t()
  def from_get_metrics_advisor_query(value), do: ApolloSignal.Types.GetMetricsAdvisorQuery.from_map(value)

  @spec from_list_contact_segments_response(term()) :: from_list_contact_segments_response()
  def from_list_contact_segments_response(value), do: decode_list(value, fn value -> value end)

  @spec from_get_contact_topics_response(term()) :: from_get_contact_topics_response()
  def from_get_contact_topics_response(value), do: decode_list(value, fn value -> ApolloSignal.Types.from_topic_subscription_response(value) end)

  @spec from_get_contact_activity_response(term()) :: from_get_contact_activity_response()
  def from_get_contact_activity_response(value), do: decode_list(value, fn value -> ApolloSignal.Types.from_activity_response(value) end)

  @spec from_list_api_keys_response(term()) :: ApolloSignal.Types.ListApiKeysResponse.t()
  def from_list_api_keys_response(value), do: ApolloSignal.Types.ListApiKeysResponse.from_map(value)


  def encode(%{__struct__: ApolloSignal.Types.AttachmentRequest } = value), do: ApolloSignal.Types.AttachmentRequest.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.DeliveryWindowRequest } = value), do: ApolloSignal.Types.DeliveryWindowRequest.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.TrackingSettingsRequest } = value), do: ApolloSignal.Types.TrackingSettingsRequest.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SendEmailRequest } = value), do: ApolloSignal.Types.SendEmailRequest.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.BatchSendItemResponse } = value), do: ApolloSignal.Types.BatchSendItemResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SendEmailResponse } = value), do: ApolloSignal.Types.SendEmailResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.EmailDetailResponse } = value), do: ApolloSignal.Types.EmailDetailResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.BatchSendRequest } = value), do: ApolloSignal.Types.BatchSendRequest.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.BatchSendResponse } = value), do: ApolloSignal.Types.BatchSendResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.CancelResponse } = value), do: ApolloSignal.Types.CancelResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.BulkCancelResponse } = value), do: ApolloSignal.Types.BulkCancelResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.StreamTokenResponse } = value), do: ApolloSignal.Types.StreamTokenResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.StreamEventResponse } = value), do: ApolloSignal.Types.StreamEventResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ValidateLinksRequest } = value), do: ApolloSignal.Types.ValidateLinksRequest.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.LinkResultItem } = value), do: ApolloSignal.Types.LinkResultItem.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ValidateLinksResponse } = value), do: ApolloSignal.Types.ValidateLinksResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.MetricsWindowResponse } = value), do: ApolloSignal.Types.MetricsWindowResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.TopicPerformanceResponse } = value), do: ApolloSignal.Types.TopicPerformanceResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.EmailPerformanceResponse } = value), do: ApolloSignal.Types.EmailPerformanceResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.EmailReadScrollAnalyticsResponse } = value), do: ApolloSignal.Types.EmailReadScrollAnalyticsResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ProjectMetricsSummaryResponse } = value), do: ApolloSignal.Types.ProjectMetricsSummaryResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ProjectTimelineBucketResponse } = value), do: ApolloSignal.Types.ProjectTimelineBucketResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ProjectMetricsTimelineResponse } = value), do: ApolloSignal.Types.ProjectMetricsTimelineResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.AdvisorRecommendationDataResponse } = value), do: ApolloSignal.Types.AdvisorRecommendationDataResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.AdvisorRecommendationResponse } = value), do: ApolloSignal.Types.AdvisorRecommendationResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.AdvisorReportResponse } = value), do: ApolloSignal.Types.AdvisorReportResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SuppressionResponse } = value), do: ApolloSignal.Types.SuppressionResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.PageInfo } = value), do: ApolloSignal.Types.PageInfo.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SuppressionPageResponse } = value), do: ApolloSignal.Types.SuppressionPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.AddSuppressionBody } = value), do: ApolloSignal.Types.AddSuppressionBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SuppressionImportRowSerializable } = value), do: ApolloSignal.Types.SuppressionImportRowSerializable.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SuppressionImportBody } = value), do: ApolloSignal.Types.SuppressionImportBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SuppressionImportResponse } = value), do: ApolloSignal.Types.SuppressionImportResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SegmentResponse } = value), do: ApolloSignal.Types.SegmentResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SegmentPageResponse } = value), do: ApolloSignal.Types.SegmentPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SegmentContactResponse } = value), do: ApolloSignal.Types.SegmentContactResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.CursorInfo } = value), do: ApolloSignal.Types.CursorInfo.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.CursorPage } = value), do: ApolloSignal.Types.CursorPage.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.CreateSegmentBody } = value), do: ApolloSignal.Types.CreateSegmentBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.TopicResponse } = value), do: ApolloSignal.Types.TopicResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.TopicPageResponse } = value), do: ApolloSignal.Types.TopicPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.CreateTopicBody } = value), do: ApolloSignal.Types.CreateTopicBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.UpdateTopicBody } = value), do: ApolloSignal.Types.UpdateTopicBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ContactPropertyResponse } = value), do: ApolloSignal.Types.ContactPropertyResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ContactPropertyPageResponse } = value), do: ApolloSignal.Types.ContactPropertyPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.CreateContactPropertyBody } = value), do: ApolloSignal.Types.CreateContactPropertyBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.UpdateContactPropertyBody } = value), do: ApolloSignal.Types.UpdateContactPropertyBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.TopicSubscriptionResponse } = value), do: ApolloSignal.Types.TopicSubscriptionResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ContactResponse } = value), do: ApolloSignal.Types.ContactResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ContactPageResponse } = value), do: ApolloSignal.Types.ContactPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SegmentRef } = value), do: ApolloSignal.Types.SegmentRef.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.TopicSubscriptionBody } = value), do: ApolloSignal.Types.TopicSubscriptionBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.CreateContactBody } = value), do: ApolloSignal.Types.CreateContactBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.UpdateContactBody } = value), do: ApolloSignal.Types.UpdateContactBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.SetImageUrlBody } = value), do: ApolloSignal.Types.SetImageUrlBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.AddToSegmentBody } = value), do: ApolloSignal.Types.AddToSegmentBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.UpdateTopicsBody } = value), do: ApolloSignal.Types.UpdateTopicsBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ActivityMetadataResponse } = value), do: ApolloSignal.Types.ActivityMetadataResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ActivityResponse } = value), do: ApolloSignal.Types.ActivityResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.EngagementScoreResponse } = value), do: ApolloSignal.Types.EngagementScoreResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.EmailValidationStatusResponse } = value), do: ApolloSignal.Types.EmailValidationStatusResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.RecordValidationBody } = value), do: ApolloSignal.Types.RecordValidationBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.WebhookFilterSerializable } = value), do: ApolloSignal.Types.WebhookFilterSerializable.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.WebhookTransformationSerializable } = value), do: ApolloSignal.Types.WebhookTransformationSerializable.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.WebhookResponse } = value), do: ApolloSignal.Types.WebhookResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.WebhookPageResponse } = value), do: ApolloSignal.Types.WebhookPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.WebhookDeliveryResponse } = value), do: ApolloSignal.Types.WebhookDeliveryResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.WebhookDeliveryPageResponse } = value), do: ApolloSignal.Types.WebhookDeliveryPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.CreateWebhookBody } = value), do: ApolloSignal.Types.CreateWebhookBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.WebhookCreateResponse } = value), do: ApolloSignal.Types.WebhookCreateResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.UpdateWebhookBody } = value), do: ApolloSignal.Types.UpdateWebhookBody.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ApiKey } = value), do: ApolloSignal.Types.ApiKey.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ApiKeyUsageRecord } = value), do: ApolloSignal.Types.ApiKeyUsageRecord.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.UsagePage } = value), do: ApolloSignal.Types.UsagePage.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ApiKeyUsageResponse } = value), do: ApolloSignal.Types.ApiKeyUsageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ProjectLimitsModel } = value), do: ApolloSignal.Types.ProjectLimitsModel.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ProjectTrackingSettingsModel } = value), do: ApolloSignal.Types.ProjectTrackingSettingsModel.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ProjectResponse } = value), do: ApolloSignal.Types.ProjectResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ProjectPageResponse } = value), do: ApolloSignal.Types.ProjectPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.UpdateProjectRequest } = value), do: ApolloSignal.Types.UpdateProjectRequest.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.EmailPageResponse } = value), do: ApolloSignal.Types.EmailPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.EmailTimelineItem } = value), do: ApolloSignal.Types.EmailTimelineItem.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.EmailTimelineResponse } = value), do: ApolloSignal.Types.EmailTimelineResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.DomainListItemResponse } = value), do: ApolloSignal.Types.DomainListItemResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.DomainListPageResponse } = value), do: ApolloSignal.Types.DomainListPageResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.DkimRecordResponse } = value), do: ApolloSignal.Types.DkimRecordResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.DnsRecordResponse } = value), do: ApolloSignal.Types.DnsRecordResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.VerificationRecordsResponse } = value), do: ApolloSignal.Types.VerificationRecordsResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.DomainResponse } = value), do: ApolloSignal.Types.DomainResponse.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.RegisterDomainRequest } = value), do: ApolloSignal.Types.RegisterDomainRequest.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.UpdateBimiRequest } = value), do: ApolloSignal.Types.UpdateBimiRequest.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.GetTopicPerformanceQuery } = value), do: ApolloSignal.Types.GetTopicPerformanceQuery.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.GetProjectMetricsSummaryQuery } = value), do: ApolloSignal.Types.GetProjectMetricsSummaryQuery.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.GetProjectMetricsTimelineQuery } = value), do: ApolloSignal.Types.GetProjectMetricsTimelineQuery.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.GetMetricsAdvisorQuery } = value), do: ApolloSignal.Types.GetMetricsAdvisorQuery.to_map(value)
  def encode(%{__struct__: ApolloSignal.Types.ListApiKeysResponse } = value), do: ApolloSignal.Types.ListApiKeysResponse.to_map(value)

  def encode(nil), do: nil
  def encode(value) when is_boolean(value) or is_number(value) or is_binary(value), do: value
  def encode(value) when is_atom(value), do: Atom.to_string(value)
  def encode(values) when is_list(values), do: Enum.map(values, &encode/1)

  def encode(values) when is_map(values) do
    Map.new(values, fn {key, value} -> {to_string(key), encode(value)} end)
  end

  def encode(value), do: value

  @type from_list_contact_segments_response() :: list(String.t())
  @type from_get_contact_topics_response() :: list(ApolloSignal.Types.TopicSubscriptionResponse.t())
  @type from_get_contact_activity_response() :: list(ApolloSignal.Types.ActivityResponse.t())

end

defmodule ApolloSignal.Types.AttachmentRequest do
  @moduledoc "Typed AttachmentRequest model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:filename, :content, :content_type]
  defstruct [filename: nil, content: nil, content_type: nil, disposition: nil, content_id: nil]

  @type t() :: %__MODULE__{filename: String.t(), content: String.t(), content_type: String.t(), disposition: String.t() | nil, content_id: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      filename: field(data, "filename", :filename),
      content: field(data, "content", :content),
      content_type: field(data, "contentType", :content_type),
      disposition: field(data, "disposition", :disposition),
      content_id: decode_nullable(field(data, "contentId", :content_id), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected AttachmentRequest to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("filename", value.filename, true)
    |> ApolloSignal.Types.put_field("content", value.content, true)
    |> ApolloSignal.Types.put_field("contentType", value.content_type, true)
    |> ApolloSignal.Types.put_field("disposition", value.disposition, false)
    |> ApolloSignal.Types.put_field("contentId", value.content_id, true)
  end
end

defmodule ApolloSignal.Types.DeliveryWindowRequest do
  @moduledoc "Typed DeliveryWindowRequest model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:start, :value_end]
  defstruct [start: nil, value_end: nil]

  @type t() :: %__MODULE__{start: String.t(), value_end: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      start: field(data, "start", :start),
      value_end: field(data, "end", :value_end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected DeliveryWindowRequest to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("start", value.start, true)
    |> ApolloSignal.Types.put_field("end", value.value_end, true)
  end
end

defmodule ApolloSignal.Types.TrackingSettingsRequest do
  @moduledoc "Typed TrackingSettingsRequest model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  defstruct [open_tracking: nil, click_tracking: nil, unsubscribe_tracking: nil, read_engagement: nil]

  @type t() :: %__MODULE__{open_tracking: boolean() | nil, click_tracking: boolean() | nil, unsubscribe_tracking: boolean() | nil, read_engagement: boolean() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      open_tracking: decode_nullable(field(data, "openTracking", :open_tracking), fn value -> value end),
      click_tracking: decode_nullable(field(data, "clickTracking", :click_tracking), fn value -> value end),
      unsubscribe_tracking: decode_nullable(field(data, "unsubscribeTracking", :unsubscribe_tracking), fn value -> value end),
      read_engagement: decode_nullable(field(data, "readEngagement", :read_engagement), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected TrackingSettingsRequest to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("openTracking", value.open_tracking, true)
    |> ApolloSignal.Types.put_field("clickTracking", value.click_tracking, true)
    |> ApolloSignal.Types.put_field("unsubscribeTracking", value.unsubscribe_tracking, true)
    |> ApolloSignal.Types.put_field("readEngagement", value.read_engagement, true)
  end
end

defmodule ApolloSignal.Types.SendEmailRequest do
  @moduledoc "Typed SendEmailRequest model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    decode_map: 2,
    field: 3
  ]

  @enforce_keys [:from, :to]
  defstruct [from: nil, to: nil, cc: nil, bcc: nil, reply_to: nil, subject: nil, html: nil, text: nil, tags: nil, metadata: nil, idempotency_key: nil, test_mode: nil, attachments: nil, scheduled_at: nil, delivery_window: nil, send_time_category: nil, tracking_settings: nil]

  @type t() :: %__MODULE__{from: String.t(), to: list(String.t()), cc: list(String.t()) | nil, bcc: list(String.t()) | nil, reply_to: String.t() | nil, subject: String.t() | nil, html: String.t() | nil, text: String.t() | nil, tags: %{optional(String.t()) => String.t()} | nil, metadata: %{optional(String.t()) => String.t()} | nil, idempotency_key: String.t() | nil, test_mode: boolean() | nil, attachments: list(ApolloSignal.Types.AttachmentRequest.t()) | nil, scheduled_at: String.t() | nil, delivery_window: ApolloSignal.Types.DeliveryWindowRequest.t() | nil, send_time_category: String.t() | nil, tracking_settings: ApolloSignal.Types.TrackingSettingsRequest.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      from: field(data, "from", :from),
      to: decode_list(field(data, "to", :to), fn value -> value end),
      cc: decode_list(field(data, "cc", :cc), fn value -> value end),
      bcc: decode_list(field(data, "bcc", :bcc), fn value -> value end),
      reply_to: decode_nullable(field(data, "replyTo", :reply_to), fn value -> value end),
      subject: decode_nullable(field(data, "subject", :subject), fn value -> value end),
      html: decode_nullable(field(data, "html", :html), fn value -> value end),
      text: decode_nullable(field(data, "text", :text), fn value -> value end),
      tags: decode_map(field(data, "tags", :tags), fn value -> value end),
      metadata: decode_map(field(data, "metadata", :metadata), fn value -> value end),
      idempotency_key: decode_nullable(field(data, "idempotencyKey", :idempotency_key), fn value -> value end),
      test_mode: field(data, "testMode", :test_mode),
      attachments: decode_list(field(data, "attachments", :attachments), fn value -> ApolloSignal.Types.from_attachment_request(value) end),
      scheduled_at: decode_nullable(field(data, "scheduledAt", :scheduled_at), fn value -> value end),
      delivery_window: decode_nullable(field(data, "deliveryWindow", :delivery_window), fn value -> ApolloSignal.Types.from_delivery_window_request(value) end),
      send_time_category: field(data, "sendTimeCategory", :send_time_category),
      tracking_settings: decode_nullable(field(data, "trackingSettings", :tracking_settings), fn value -> ApolloSignal.Types.from_tracking_settings_request(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SendEmailRequest to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("from", value.from, true)
    |> ApolloSignal.Types.put_field("to", value.to, true)
    |> ApolloSignal.Types.put_field("cc", value.cc, true)
    |> ApolloSignal.Types.put_field("bcc", value.bcc, true)
    |> ApolloSignal.Types.put_field("replyTo", value.reply_to, true)
    |> ApolloSignal.Types.put_field("subject", value.subject, true)
    |> ApolloSignal.Types.put_field("html", value.html, true)
    |> ApolloSignal.Types.put_field("text", value.text, true)
    |> ApolloSignal.Types.put_field("tags", value.tags, true)
    |> ApolloSignal.Types.put_field("metadata", value.metadata, true)
    |> ApolloSignal.Types.put_field("idempotencyKey", value.idempotency_key, true)
    |> ApolloSignal.Types.put_field("testMode", value.test_mode, false)
    |> ApolloSignal.Types.put_field("attachments", value.attachments, true)
    |> ApolloSignal.Types.put_field("scheduledAt", value.scheduled_at, true)
    |> ApolloSignal.Types.put_field("deliveryWindow", value.delivery_window, true)
    |> ApolloSignal.Types.put_field("sendTimeCategory", value.send_time_category, false)
    |> ApolloSignal.Types.put_field("trackingSettings", value.tracking_settings, true)
  end
end

defmodule ApolloSignal.Types.BatchSendItemResponse do
  @moduledoc "Typed BatchSendItemResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:index]
  defstruct [index: nil, id: nil, message_id: nil, status: nil, created_at: nil, scheduled_at: nil, error: nil]

  @type t() :: %__MODULE__{index: integer(), id: String.t() | nil, message_id: String.t() | nil, status: String.t() | nil, created_at: String.t() | nil, scheduled_at: String.t() | nil, error: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      index: field(data, "index", :index),
      id: decode_nullable(field(data, "id", :id), fn value -> value end),
      message_id: decode_nullable(field(data, "messageId", :message_id), fn value -> value end),
      status: decode_nullable(field(data, "status", :status), fn value -> value end),
      created_at: decode_nullable(field(data, "createdAt", :created_at), fn value -> value end),
      scheduled_at: decode_nullable(field(data, "scheduledAt", :scheduled_at), fn value -> value end),
      error: decode_nullable(field(data, "error", :error), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected BatchSendItemResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("index", value.index, true)
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("messageId", value.message_id, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("scheduledAt", value.scheduled_at, true)
    |> ApolloSignal.Types.put_field("error", value.error, true)
  end
end

defmodule ApolloSignal.Types.SendEmailResponse do
  @moduledoc "Typed SendEmailResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:id, :message_id, :status, :created_at]
  defstruct [id: nil, message_id: nil, status: nil, created_at: nil, scheduled_at: nil, audience_id: nil, messages: nil]

  @type t() :: %__MODULE__{id: String.t(), message_id: String.t() | nil, status: String.t(), created_at: String.t(), scheduled_at: String.t() | nil, audience_id: String.t() | nil, messages: list(ApolloSignal.Types.BatchSendItemResponse.t()) | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      message_id: decode_nullable(field(data, "messageId", :message_id), fn value -> value end),
      status: field(data, "status", :status),
      created_at: field(data, "createdAt", :created_at),
      scheduled_at: decode_nullable(field(data, "scheduledAt", :scheduled_at), fn value -> value end),
      audience_id: decode_nullable(field(data, "audienceId", :audience_id), fn value -> value end),
      messages: decode_list(field(data, "messages", :messages), fn value -> ApolloSignal.Types.from_batch_send_item_response(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SendEmailResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("messageId", value.message_id, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("scheduledAt", value.scheduled_at, true)
    |> ApolloSignal.Types.put_field("audienceId", value.audience_id, true)
    |> ApolloSignal.Types.put_field("messages", value.messages, true)
  end
end

defmodule ApolloSignal.Types.EmailDetailResponse do
  @moduledoc "Typed EmailDetailResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    decode_map: 2,
    field: 3
  ]

  @enforce_keys [:id, :message_id, :from, :to, :cc, :bcc, :reply_to, :subject, :status, :error, :tags, :metadata, :test_mode, :created_at, :sent_at, :updated_at]
  defstruct [id: nil, message_id: nil, from: nil, to: nil, cc: nil, bcc: nil, reply_to: nil, subject: nil, html: nil, text: nil, status: nil, error: nil, tags: nil, metadata: nil, test_mode: nil, topic_id: nil, created_at: nil, sent_at: nil, updated_at: nil]

  @type t() :: %__MODULE__{id: String.t(), message_id: String.t() | nil, from: String.t(), to: list(String.t()), cc: list(String.t()) | nil, bcc: list(String.t()) | nil, reply_to: String.t() | nil, subject: String.t(), html: String.t() | nil, text: String.t() | nil, status: String.t(), error: String.t() | nil, tags: %{optional(String.t()) => String.t()} | nil, metadata: %{optional(String.t()) => String.t()} | nil, test_mode: boolean(), topic_id: String.t() | nil, created_at: String.t(), sent_at: String.t() | nil, updated_at: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      message_id: decode_nullable(field(data, "messageId", :message_id), fn value -> value end),
      from: field(data, "from", :from),
      to: decode_list(field(data, "to", :to), fn value -> value end),
      cc: decode_list(field(data, "cc", :cc), fn value -> value end),
      bcc: decode_list(field(data, "bcc", :bcc), fn value -> value end),
      reply_to: decode_nullable(field(data, "replyTo", :reply_to), fn value -> value end),
      subject: field(data, "subject", :subject),
      html: decode_nullable(field(data, "html", :html), fn value -> value end),
      text: decode_nullable(field(data, "text", :text), fn value -> value end),
      status: field(data, "status", :status),
      error: decode_nullable(field(data, "error", :error), fn value -> value end),
      tags: decode_map(field(data, "tags", :tags), fn value -> value end),
      metadata: decode_map(field(data, "metadata", :metadata), fn value -> value end),
      test_mode: field(data, "testMode", :test_mode),
      topic_id: decode_nullable(field(data, "topicId", :topic_id), fn value -> value end),
      created_at: field(data, "createdAt", :created_at),
      sent_at: decode_nullable(field(data, "sentAt", :sent_at), fn value -> value end),
      updated_at: decode_nullable(field(data, "updatedAt", :updated_at), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected EmailDetailResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("messageId", value.message_id, true)
    |> ApolloSignal.Types.put_field("from", value.from, true)
    |> ApolloSignal.Types.put_field("to", value.to, true)
    |> ApolloSignal.Types.put_field("cc", value.cc, true)
    |> ApolloSignal.Types.put_field("bcc", value.bcc, true)
    |> ApolloSignal.Types.put_field("replyTo", value.reply_to, true)
    |> ApolloSignal.Types.put_field("subject", value.subject, true)
    |> ApolloSignal.Types.put_field("html", value.html, true)
    |> ApolloSignal.Types.put_field("text", value.text, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("error", value.error, true)
    |> ApolloSignal.Types.put_field("tags", value.tags, true)
    |> ApolloSignal.Types.put_field("metadata", value.metadata, true)
    |> ApolloSignal.Types.put_field("testMode", value.test_mode, true)
    |> ApolloSignal.Types.put_field("topicId", value.topic_id, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("sentAt", value.sent_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
  end
end

defmodule ApolloSignal.Types.BatchSendRequest do
  @moduledoc "Typed BatchSendRequest model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:items]
  defstruct [items: nil]

  @type t() :: %__MODULE__{items: list(ApolloSignal.Types.SendEmailRequest.t())}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      items: decode_list(field(data, "items", :items), fn value -> ApolloSignal.Types.from_send_email_request(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected BatchSendRequest to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("items", value.items, true)
  end
end

defmodule ApolloSignal.Types.BatchSendResponse do
  @moduledoc "Typed BatchSendResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:results]
  defstruct [results: nil]

  @type t() :: %__MODULE__{results: list(ApolloSignal.Types.BatchSendItemResponse.t())}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      results: decode_list(field(data, "results", :results), fn value -> ApolloSignal.Types.from_batch_send_item_response(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected BatchSendResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("results", value.results, true)
  end
end

defmodule ApolloSignal.Types.CancelResponse do
  @moduledoc "Typed CancelResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  defstruct [cancelled: nil]

  @type t() :: %__MODULE__{cancelled: boolean() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      cancelled: field(data, "cancelled", :cancelled),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected CancelResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("cancelled", value.cancelled, false)
  end
end

defmodule ApolloSignal.Types.BulkCancelResponse do
  @moduledoc "Typed BulkCancelResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:cancelled]
  defstruct [cancelled: nil]

  @type t() :: %__MODULE__{cancelled: integer()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      cancelled: field(data, "cancelled", :cancelled),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected BulkCancelResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("cancelled", value.cancelled, true)
  end
end

defmodule ApolloSignal.Types.StreamTokenResponse do
  @moduledoc "Typed StreamTokenResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:token, :expires_at]
  defstruct [token: nil, expires_at: nil]

  @type t() :: %__MODULE__{token: String.t(), expires_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      token: field(data, "token", :token),
      expires_at: field(data, "expiresAt", :expires_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected StreamTokenResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("token", value.token, true)
    |> ApolloSignal.Types.put_field("expiresAt", value.expires_at, true)
  end
end

defmodule ApolloSignal.Types.StreamEventResponse do
  @moduledoc "Typed StreamEventResponse model."

  import ApolloSignal.Types, only: [
    decode_map: 2,
    field: 3
  ]

  @enforce_keys [:type, :email_id, :occurred_at]
  defstruct [type: nil, email_id: nil, occurred_at: nil, data: nil]

  @type t() :: %__MODULE__{type: String.t(), email_id: String.t(), occurred_at: String.t(), data: %{optional(String.t()) => String.t()} | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      type: field(data, "type", :type),
      email_id: field(data, "emailId", :email_id),
      occurred_at: field(data, "occurredAt", :occurred_at),
      data: decode_map(field(data, "data", :data), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected StreamEventResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("type", value.type, true)
    |> ApolloSignal.Types.put_field("emailId", value.email_id, true)
    |> ApolloSignal.Types.put_field("occurredAt", value.occurred_at, true)
    |> ApolloSignal.Types.put_field("data", value.data, false)
  end
end

defmodule ApolloSignal.Types.ValidateLinksRequest do
  @moduledoc "Typed ValidateLinksRequest model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  defstruct [html: nil]

  @type t() :: %__MODULE__{html: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      html: decode_nullable(field(data, "html", :html), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ValidateLinksRequest to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("html", value.html, true)
  end
end

defmodule ApolloSignal.Types.LinkResultItem do
  @moduledoc "Typed LinkResultItem model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:url, :status]
  defstruct [url: nil, status: nil, status_code: nil, error: nil]

  @type t() :: %__MODULE__{url: String.t(), status: String.t(), status_code: integer() | nil, error: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      url: field(data, "url", :url),
      status: field(data, "status", :status),
      status_code: decode_nullable(field(data, "statusCode", :status_code), fn value -> value end),
      error: decode_nullable(field(data, "error", :error), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected LinkResultItem to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("url", value.url, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("statusCode", value.status_code, true)
    |> ApolloSignal.Types.put_field("error", value.error, true)
  end
end

defmodule ApolloSignal.Types.ValidateLinksResponse do
  @moduledoc "Typed ValidateLinksResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:links, :total_links, :broken_links, :error_links]
  defstruct [links: nil, total_links: nil, broken_links: nil, error_links: nil]

  @type t() :: %__MODULE__{links: list(ApolloSignal.Types.LinkResultItem.t()), total_links: integer(), broken_links: integer(), error_links: integer()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      links: decode_list(field(data, "links", :links), fn value -> ApolloSignal.Types.from_link_result_item(value) end),
      total_links: field(data, "totalLinks", :total_links),
      broken_links: field(data, "brokenLinks", :broken_links),
      error_links: field(data, "errorLinks", :error_links),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ValidateLinksResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("links", value.links, true)
    |> ApolloSignal.Types.put_field("totalLinks", value.total_links, true)
    |> ApolloSignal.Types.put_field("brokenLinks", value.broken_links, true)
    |> ApolloSignal.Types.put_field("errorLinks", value.error_links, true)
  end
end

defmodule ApolloSignal.Types.MetricsWindowResponse do
  @moduledoc "Typed MetricsWindowResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:from, :to, :label]
  defstruct [from: nil, to: nil, label: nil]

  @type t() :: %__MODULE__{from: String.t(), to: String.t(), label: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      from: field(data, "from", :from),
      to: field(data, "to", :to),
      label: field(data, "label", :label),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected MetricsWindowResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("from", value.from, true)
    |> ApolloSignal.Types.put_field("to", value.to, true)
    |> ApolloSignal.Types.put_field("label", value.label, true)
  end
end

defmodule ApolloSignal.Types.TopicPerformanceResponse do
  @moduledoc "Typed TopicPerformanceResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:topic_id, :topic_name, :window, :total_emails, :delivered, :delivery_rate, :opened, :open_rate, :clicked, :click_rate, :bounced, :bounce_rate, :complained, :complaint_rate, :unsubscribed, :unsubscribe_rate, :read_engaged, :read_engagement_rate, :avg_read_time_seconds, :opt_in_count, :opt_out_count, :computed_at]
  defstruct [topic_id: nil, topic_name: nil, window: nil, total_emails: nil, delivered: nil, delivery_rate: nil, opened: nil, open_rate: nil, clicked: nil, click_rate: nil, bounced: nil, bounce_rate: nil, complained: nil, complaint_rate: nil, unsubscribed: nil, unsubscribe_rate: nil, read_engaged: nil, read_engagement_rate: nil, avg_read_time_seconds: nil, opt_in_count: nil, opt_out_count: nil, computed_at: nil]

  @type t() :: %__MODULE__{topic_id: String.t(), topic_name: String.t(), window: ApolloSignal.Types.MetricsWindowResponse.t(), total_emails: integer(), delivered: integer(), delivery_rate: number(), opened: integer(), open_rate: number(), clicked: integer(), click_rate: number(), bounced: integer(), bounce_rate: number(), complained: integer(), complaint_rate: number(), unsubscribed: integer(), unsubscribe_rate: number(), read_engaged: integer(), read_engagement_rate: number(), avg_read_time_seconds: number() | nil, opt_in_count: integer(), opt_out_count: integer(), computed_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      topic_id: field(data, "topicId", :topic_id),
      topic_name: field(data, "topicName", :topic_name),
      window: ApolloSignal.Types.from_metrics_window_response(field(data, "window", :window)),
      total_emails: field(data, "totalEmails", :total_emails),
      delivered: field(data, "delivered", :delivered),
      delivery_rate: field(data, "deliveryRate", :delivery_rate),
      opened: field(data, "opened", :opened),
      open_rate: field(data, "openRate", :open_rate),
      clicked: field(data, "clicked", :clicked),
      click_rate: field(data, "clickRate", :click_rate),
      bounced: field(data, "bounced", :bounced),
      bounce_rate: field(data, "bounceRate", :bounce_rate),
      complained: field(data, "complained", :complained),
      complaint_rate: field(data, "complaintRate", :complaint_rate),
      unsubscribed: field(data, "unsubscribed", :unsubscribed),
      unsubscribe_rate: field(data, "unsubscribeRate", :unsubscribe_rate),
      read_engaged: field(data, "readEngaged", :read_engaged),
      read_engagement_rate: field(data, "readEngagementRate", :read_engagement_rate),
      avg_read_time_seconds: decode_nullable(field(data, "avgReadTimeSeconds", :avg_read_time_seconds), fn value -> value end),
      opt_in_count: field(data, "optInCount", :opt_in_count),
      opt_out_count: field(data, "optOutCount", :opt_out_count),
      computed_at: field(data, "computedAt", :computed_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected TopicPerformanceResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("topicId", value.topic_id, true)
    |> ApolloSignal.Types.put_field("topicName", value.topic_name, true)
    |> ApolloSignal.Types.put_field("window", value.window, true)
    |> ApolloSignal.Types.put_field("totalEmails", value.total_emails, true)
    |> ApolloSignal.Types.put_field("delivered", value.delivered, true)
    |> ApolloSignal.Types.put_field("deliveryRate", value.delivery_rate, true)
    |> ApolloSignal.Types.put_field("opened", value.opened, true)
    |> ApolloSignal.Types.put_field("openRate", value.open_rate, true)
    |> ApolloSignal.Types.put_field("clicked", value.clicked, true)
    |> ApolloSignal.Types.put_field("clickRate", value.click_rate, true)
    |> ApolloSignal.Types.put_field("bounced", value.bounced, true)
    |> ApolloSignal.Types.put_field("bounceRate", value.bounce_rate, true)
    |> ApolloSignal.Types.put_field("complained", value.complained, true)
    |> ApolloSignal.Types.put_field("complaintRate", value.complaint_rate, true)
    |> ApolloSignal.Types.put_field("unsubscribed", value.unsubscribed, true)
    |> ApolloSignal.Types.put_field("unsubscribeRate", value.unsubscribe_rate, true)
    |> ApolloSignal.Types.put_field("readEngaged", value.read_engaged, true)
    |> ApolloSignal.Types.put_field("readEngagementRate", value.read_engagement_rate, true)
    |> ApolloSignal.Types.put_field("avgReadTimeSeconds", value.avg_read_time_seconds, true)
    |> ApolloSignal.Types.put_field("optInCount", value.opt_in_count, true)
    |> ApolloSignal.Types.put_field("optOutCount", value.opt_out_count, true)
    |> ApolloSignal.Types.put_field("computedAt", value.computed_at, true)
  end
end

defmodule ApolloSignal.Types.EmailPerformanceResponse do
  @moduledoc "Typed EmailPerformanceResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:email_id, :subject, :from_address, :topic_id, :status, :delivered, :opened, :clicked, :total_clicks, :bounced, :complained, :unsubscribed, :read_engaged, :read_time_seconds, :read_category, :sent_at, :last_event_at, :computed_at]
  defstruct [email_id: nil, subject: nil, from_address: nil, topic_id: nil, status: nil, delivered: nil, opened: nil, clicked: nil, total_clicks: nil, bounced: nil, complained: nil, unsubscribed: nil, read_engaged: nil, read_time_seconds: nil, read_category: nil, sent_at: nil, last_event_at: nil, computed_at: nil]

  @type t() :: %__MODULE__{email_id: String.t(), subject: String.t(), from_address: String.t(), topic_id: String.t() | nil, status: String.t(), delivered: boolean(), opened: boolean(), clicked: boolean(), total_clicks: integer(), bounced: boolean(), complained: boolean(), unsubscribed: boolean(), read_engaged: boolean(), read_time_seconds: number() | nil, read_category: String.t() | nil, sent_at: String.t() | nil, last_event_at: String.t() | nil, computed_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      email_id: field(data, "emailId", :email_id),
      subject: field(data, "subject", :subject),
      from_address: field(data, "fromAddress", :from_address),
      topic_id: decode_nullable(field(data, "topicId", :topic_id), fn value -> value end),
      status: field(data, "status", :status),
      delivered: field(data, "delivered", :delivered),
      opened: field(data, "opened", :opened),
      clicked: field(data, "clicked", :clicked),
      total_clicks: field(data, "totalClicks", :total_clicks),
      bounced: field(data, "bounced", :bounced),
      complained: field(data, "complained", :complained),
      unsubscribed: field(data, "unsubscribed", :unsubscribed),
      read_engaged: field(data, "readEngaged", :read_engaged),
      read_time_seconds: decode_nullable(field(data, "readTimeSeconds", :read_time_seconds), fn value -> value end),
      read_category: decode_nullable(field(data, "readCategory", :read_category), fn value -> value end),
      sent_at: decode_nullable(field(data, "sentAt", :sent_at), fn value -> value end),
      last_event_at: decode_nullable(field(data, "lastEventAt", :last_event_at), fn value -> value end),
      computed_at: field(data, "computedAt", :computed_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected EmailPerformanceResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("emailId", value.email_id, true)
    |> ApolloSignal.Types.put_field("subject", value.subject, true)
    |> ApolloSignal.Types.put_field("fromAddress", value.from_address, true)
    |> ApolloSignal.Types.put_field("topicId", value.topic_id, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("delivered", value.delivered, true)
    |> ApolloSignal.Types.put_field("opened", value.opened, true)
    |> ApolloSignal.Types.put_field("clicked", value.clicked, true)
    |> ApolloSignal.Types.put_field("totalClicks", value.total_clicks, true)
    |> ApolloSignal.Types.put_field("bounced", value.bounced, true)
    |> ApolloSignal.Types.put_field("complained", value.complained, true)
    |> ApolloSignal.Types.put_field("unsubscribed", value.unsubscribed, true)
    |> ApolloSignal.Types.put_field("readEngaged", value.read_engaged, true)
    |> ApolloSignal.Types.put_field("readTimeSeconds", value.read_time_seconds, true)
    |> ApolloSignal.Types.put_field("readCategory", value.read_category, true)
    |> ApolloSignal.Types.put_field("sentAt", value.sent_at, true)
    |> ApolloSignal.Types.put_field("lastEventAt", value.last_event_at, true)
    |> ApolloSignal.Types.put_field("computedAt", value.computed_at, true)
  end
end

defmodule ApolloSignal.Types.EmailReadScrollAnalyticsResponse do
  @moduledoc "Typed EmailReadScrollAnalyticsResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:email_id, :subject, :computed_at, :read_engaged, :read_time_seconds, :read_category, :mail_client, :device_type, :os, :read_engaged_at, :short_email, :depth25_count, :depth50_count, :depth75_count, :depth100_count, :max_depth_pct, :depth25_rate, :depth50_rate, :depth75_rate, :depth100_rate]
  defstruct [email_id: nil, subject: nil, computed_at: nil, read_engaged: nil, read_time_seconds: nil, read_category: nil, mail_client: nil, device_type: nil, os: nil, read_engaged_at: nil, short_email: nil, depth25_count: nil, depth50_count: nil, depth75_count: nil, depth100_count: nil, max_depth_pct: nil, depth25_rate: nil, depth50_rate: nil, depth75_rate: nil, depth100_rate: nil]

  @type t() :: %__MODULE__{email_id: String.t(), subject: String.t(), computed_at: String.t(), read_engaged: boolean(), read_time_seconds: number() | nil, read_category: String.t() | nil, mail_client: String.t() | nil, device_type: String.t() | nil, os: String.t() | nil, read_engaged_at: String.t() | nil, short_email: boolean(), depth25_count: integer(), depth50_count: integer(), depth75_count: integer(), depth100_count: integer(), max_depth_pct: integer() | nil, depth25_rate: number() | nil, depth50_rate: number() | nil, depth75_rate: number() | nil, depth100_rate: number() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      email_id: field(data, "emailId", :email_id),
      subject: field(data, "subject", :subject),
      computed_at: field(data, "computedAt", :computed_at),
      read_engaged: field(data, "readEngaged", :read_engaged),
      read_time_seconds: decode_nullable(field(data, "readTimeSeconds", :read_time_seconds), fn value -> value end),
      read_category: decode_nullable(field(data, "readCategory", :read_category), fn value -> value end),
      mail_client: decode_nullable(field(data, "mailClient", :mail_client), fn value -> value end),
      device_type: decode_nullable(field(data, "deviceType", :device_type), fn value -> value end),
      os: decode_nullable(field(data, "os", :os), fn value -> value end),
      read_engaged_at: decode_nullable(field(data, "readEngagedAt", :read_engaged_at), fn value -> value end),
      short_email: field(data, "shortEmail", :short_email),
      depth25_count: field(data, "depth25Count", :depth25_count),
      depth50_count: field(data, "depth50Count", :depth50_count),
      depth75_count: field(data, "depth75Count", :depth75_count),
      depth100_count: field(data, "depth100Count", :depth100_count),
      max_depth_pct: decode_nullable(field(data, "maxDepthPct", :max_depth_pct), fn value -> value end),
      depth25_rate: decode_nullable(field(data, "depth25Rate", :depth25_rate), fn value -> value end),
      depth50_rate: decode_nullable(field(data, "depth50Rate", :depth50_rate), fn value -> value end),
      depth75_rate: decode_nullable(field(data, "depth75Rate", :depth75_rate), fn value -> value end),
      depth100_rate: decode_nullable(field(data, "depth100Rate", :depth100_rate), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected EmailReadScrollAnalyticsResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("emailId", value.email_id, true)
    |> ApolloSignal.Types.put_field("subject", value.subject, true)
    |> ApolloSignal.Types.put_field("computedAt", value.computed_at, true)
    |> ApolloSignal.Types.put_field("readEngaged", value.read_engaged, true)
    |> ApolloSignal.Types.put_field("readTimeSeconds", value.read_time_seconds, true)
    |> ApolloSignal.Types.put_field("readCategory", value.read_category, true)
    |> ApolloSignal.Types.put_field("mailClient", value.mail_client, true)
    |> ApolloSignal.Types.put_field("deviceType", value.device_type, true)
    |> ApolloSignal.Types.put_field("os", value.os, true)
    |> ApolloSignal.Types.put_field("readEngagedAt", value.read_engaged_at, true)
    |> ApolloSignal.Types.put_field("shortEmail", value.short_email, true)
    |> ApolloSignal.Types.put_field("depth25Count", value.depth25_count, true)
    |> ApolloSignal.Types.put_field("depth50Count", value.depth50_count, true)
    |> ApolloSignal.Types.put_field("depth75Count", value.depth75_count, true)
    |> ApolloSignal.Types.put_field("depth100Count", value.depth100_count, true)
    |> ApolloSignal.Types.put_field("maxDepthPct", value.max_depth_pct, true)
    |> ApolloSignal.Types.put_field("depth25Rate", value.depth25_rate, true)
    |> ApolloSignal.Types.put_field("depth50Rate", value.depth50_rate, true)
    |> ApolloSignal.Types.put_field("depth75Rate", value.depth75_rate, true)
    |> ApolloSignal.Types.put_field("depth100Rate", value.depth100_rate, true)
  end
end

defmodule ApolloSignal.Types.ProjectMetricsSummaryResponse do
  @moduledoc "Typed ProjectMetricsSummaryResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:project_id, :window, :sent, :delivered, :opened, :clicked, :bounced, :complained, :failed, :unsubscribed, :read_engaged, :delivery_rate, :open_rate, :click_rate, :bounce_rate, :complaint_rate, :read_engagement_rate]
  defstruct [project_id: nil, window: nil, sent: nil, delivered: nil, opened: nil, clicked: nil, bounced: nil, complained: nil, failed: nil, unsubscribed: nil, read_engaged: nil, delivery_rate: nil, open_rate: nil, click_rate: nil, bounce_rate: nil, complaint_rate: nil, read_engagement_rate: nil]

  @type t() :: %__MODULE__{project_id: String.t(), window: ApolloSignal.Types.MetricsWindowResponse.t(), sent: integer(), delivered: integer(), opened: integer(), clicked: integer(), bounced: integer(), complained: integer(), failed: integer(), unsubscribed: integer(), read_engaged: integer(), delivery_rate: number(), open_rate: number(), click_rate: number(), bounce_rate: number(), complaint_rate: number(), read_engagement_rate: number()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      project_id: field(data, "projectId", :project_id),
      window: ApolloSignal.Types.from_metrics_window_response(field(data, "window", :window)),
      sent: field(data, "sent", :sent),
      delivered: field(data, "delivered", :delivered),
      opened: field(data, "opened", :opened),
      clicked: field(data, "clicked", :clicked),
      bounced: field(data, "bounced", :bounced),
      complained: field(data, "complained", :complained),
      failed: field(data, "failed", :failed),
      unsubscribed: field(data, "unsubscribed", :unsubscribed),
      read_engaged: field(data, "readEngaged", :read_engaged),
      delivery_rate: field(data, "deliveryRate", :delivery_rate),
      open_rate: field(data, "openRate", :open_rate),
      click_rate: field(data, "clickRate", :click_rate),
      bounce_rate: field(data, "bounceRate", :bounce_rate),
      complaint_rate: field(data, "complaintRate", :complaint_rate),
      read_engagement_rate: field(data, "readEngagementRate", :read_engagement_rate),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ProjectMetricsSummaryResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("window", value.window, true)
    |> ApolloSignal.Types.put_field("sent", value.sent, true)
    |> ApolloSignal.Types.put_field("delivered", value.delivered, true)
    |> ApolloSignal.Types.put_field("opened", value.opened, true)
    |> ApolloSignal.Types.put_field("clicked", value.clicked, true)
    |> ApolloSignal.Types.put_field("bounced", value.bounced, true)
    |> ApolloSignal.Types.put_field("complained", value.complained, true)
    |> ApolloSignal.Types.put_field("failed", value.failed, true)
    |> ApolloSignal.Types.put_field("unsubscribed", value.unsubscribed, true)
    |> ApolloSignal.Types.put_field("readEngaged", value.read_engaged, true)
    |> ApolloSignal.Types.put_field("deliveryRate", value.delivery_rate, true)
    |> ApolloSignal.Types.put_field("openRate", value.open_rate, true)
    |> ApolloSignal.Types.put_field("clickRate", value.click_rate, true)
    |> ApolloSignal.Types.put_field("bounceRate", value.bounce_rate, true)
    |> ApolloSignal.Types.put_field("complaintRate", value.complaint_rate, true)
    |> ApolloSignal.Types.put_field("readEngagementRate", value.read_engagement_rate, true)
  end
end

defmodule ApolloSignal.Types.ProjectTimelineBucketResponse do
  @moduledoc "Typed ProjectTimelineBucketResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:bucket, :type, :count]
  defstruct [bucket: nil, type: nil, count: nil]

  @type t() :: %__MODULE__{bucket: String.t(), type: String.t(), count: integer()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      bucket: field(data, "bucket", :bucket),
      type: field(data, "type", :type),
      count: field(data, "count", :count),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ProjectTimelineBucketResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("bucket", value.bucket, true)
    |> ApolloSignal.Types.put_field("type", value.type, true)
    |> ApolloSignal.Types.put_field("count", value.count, true)
  end
end

defmodule ApolloSignal.Types.ProjectMetricsTimelineResponse do
  @moduledoc "Typed ProjectMetricsTimelineResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:project_id, :window, :granularity, :format, :buckets]
  defstruct [project_id: nil, window: nil, granularity: nil, format: nil, buckets: nil]

  @type t() :: %__MODULE__{project_id: String.t(), window: ApolloSignal.Types.MetricsWindowResponse.t(), granularity: String.t(), format: String.t(), buckets: list(ApolloSignal.Types.ProjectTimelineBucketResponse.t())}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      project_id: field(data, "projectId", :project_id),
      window: ApolloSignal.Types.from_metrics_window_response(field(data, "window", :window)),
      granularity: field(data, "granularity", :granularity),
      format: field(data, "format", :format),
      buckets: decode_list(field(data, "buckets", :buckets), fn value -> ApolloSignal.Types.from_project_timeline_bucket_response(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ProjectMetricsTimelineResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("window", value.window, true)
    |> ApolloSignal.Types.put_field("granularity", value.granularity, true)
    |> ApolloSignal.Types.put_field("format", value.format, true)
    |> ApolloSignal.Types.put_field("buckets", value.buckets, true)
  end
end

defmodule ApolloSignal.Types.AdvisorRecommendationDataResponse do
  @moduledoc "Typed AdvisorRecommendationDataResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  defstruct [bounce_rate: nil, bounced: nil, accepted: nil, complaint_rate: nil, accepted24h: nil, avg_daily_accepted7d: nil, days_since_last_send: nil, reported_open_rate: nil, adjusted_open_rate: nil, proxy_rate: nil, proxy_opens: nil, total_opens: nil, human_open_rate: nil, delivered: nil, unsub_rate: nil, unsubscribed: nil, dmarc_alignment_failure_rate7d: nil, dmarc_domain: nil, dmarc_current_policy: nil, dmarc_recommended_policy: nil, dmarc_observed_messages: nil, dmarc_aligned_messages: nil, dmarc_accounted_rate: nil, dmarc_unknown_messages: nil, dmarc_unknown_sources: nil, dmarc_reporting_days: nil]

  @type t() :: %__MODULE__{bounce_rate: number() | nil, bounced: integer() | nil, accepted: integer() | nil, complaint_rate: number() | nil, accepted24h: integer() | nil, avg_daily_accepted7d: integer() | nil, days_since_last_send: integer() | nil, reported_open_rate: number() | nil, adjusted_open_rate: number() | nil, proxy_rate: number() | nil, proxy_opens: integer() | nil, total_opens: integer() | nil, human_open_rate: number() | nil, delivered: integer() | nil, unsub_rate: number() | nil, unsubscribed: integer() | nil, dmarc_alignment_failure_rate7d: number() | nil, dmarc_domain: String.t() | nil, dmarc_current_policy: String.t() | nil, dmarc_recommended_policy: String.t() | nil, dmarc_observed_messages: integer() | nil, dmarc_aligned_messages: integer() | nil, dmarc_accounted_rate: number() | nil, dmarc_unknown_messages: integer() | nil, dmarc_unknown_sources: integer() | nil, dmarc_reporting_days: integer() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      bounce_rate: decode_nullable(field(data, "bounceRate", :bounce_rate), fn value -> value end),
      bounced: decode_nullable(field(data, "bounced", :bounced), fn value -> value end),
      accepted: decode_nullable(field(data, "accepted", :accepted), fn value -> value end),
      complaint_rate: decode_nullable(field(data, "complaintRate", :complaint_rate), fn value -> value end),
      accepted24h: decode_nullable(field(data, "accepted24h", :accepted24h), fn value -> value end),
      avg_daily_accepted7d: decode_nullable(field(data, "avgDailyAccepted7d", :avg_daily_accepted7d), fn value -> value end),
      days_since_last_send: decode_nullable(field(data, "daysSinceLastSend", :days_since_last_send), fn value -> value end),
      reported_open_rate: decode_nullable(field(data, "reportedOpenRate", :reported_open_rate), fn value -> value end),
      adjusted_open_rate: decode_nullable(field(data, "adjustedOpenRate", :adjusted_open_rate), fn value -> value end),
      proxy_rate: decode_nullable(field(data, "proxyRate", :proxy_rate), fn value -> value end),
      proxy_opens: decode_nullable(field(data, "proxyOpens", :proxy_opens), fn value -> value end),
      total_opens: decode_nullable(field(data, "totalOpens", :total_opens), fn value -> value end),
      human_open_rate: decode_nullable(field(data, "humanOpenRate", :human_open_rate), fn value -> value end),
      delivered: decode_nullable(field(data, "delivered", :delivered), fn value -> value end),
      unsub_rate: decode_nullable(field(data, "unsubRate", :unsub_rate), fn value -> value end),
      unsubscribed: decode_nullable(field(data, "unsubscribed", :unsubscribed), fn value -> value end),
      dmarc_alignment_failure_rate7d: decode_nullable(field(data, "dmarcAlignmentFailureRate7d", :dmarc_alignment_failure_rate7d), fn value -> value end),
      dmarc_domain: decode_nullable(field(data, "dmarcDomain", :dmarc_domain), fn value -> value end),
      dmarc_current_policy: decode_nullable(field(data, "dmarcCurrentPolicy", :dmarc_current_policy), fn value -> value end),
      dmarc_recommended_policy: decode_nullable(field(data, "dmarcRecommendedPolicy", :dmarc_recommended_policy), fn value -> value end),
      dmarc_observed_messages: decode_nullable(field(data, "dmarcObservedMessages", :dmarc_observed_messages), fn value -> value end),
      dmarc_aligned_messages: decode_nullable(field(data, "dmarcAlignedMessages", :dmarc_aligned_messages), fn value -> value end),
      dmarc_accounted_rate: decode_nullable(field(data, "dmarcAccountedRate", :dmarc_accounted_rate), fn value -> value end),
      dmarc_unknown_messages: decode_nullable(field(data, "dmarcUnknownMessages", :dmarc_unknown_messages), fn value -> value end),
      dmarc_unknown_sources: decode_nullable(field(data, "dmarcUnknownSources", :dmarc_unknown_sources), fn value -> value end),
      dmarc_reporting_days: decode_nullable(field(data, "dmarcReportingDays", :dmarc_reporting_days), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected AdvisorRecommendationDataResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("bounceRate", value.bounce_rate, true)
    |> ApolloSignal.Types.put_field("bounced", value.bounced, true)
    |> ApolloSignal.Types.put_field("accepted", value.accepted, true)
    |> ApolloSignal.Types.put_field("complaintRate", value.complaint_rate, true)
    |> ApolloSignal.Types.put_field("accepted24h", value.accepted24h, true)
    |> ApolloSignal.Types.put_field("avgDailyAccepted7d", value.avg_daily_accepted7d, true)
    |> ApolloSignal.Types.put_field("daysSinceLastSend", value.days_since_last_send, true)
    |> ApolloSignal.Types.put_field("reportedOpenRate", value.reported_open_rate, true)
    |> ApolloSignal.Types.put_field("adjustedOpenRate", value.adjusted_open_rate, true)
    |> ApolloSignal.Types.put_field("proxyRate", value.proxy_rate, true)
    |> ApolloSignal.Types.put_field("proxyOpens", value.proxy_opens, true)
    |> ApolloSignal.Types.put_field("totalOpens", value.total_opens, true)
    |> ApolloSignal.Types.put_field("humanOpenRate", value.human_open_rate, true)
    |> ApolloSignal.Types.put_field("delivered", value.delivered, true)
    |> ApolloSignal.Types.put_field("unsubRate", value.unsub_rate, true)
    |> ApolloSignal.Types.put_field("unsubscribed", value.unsubscribed, true)
    |> ApolloSignal.Types.put_field("dmarcAlignmentFailureRate7d", value.dmarc_alignment_failure_rate7d, true)
    |> ApolloSignal.Types.put_field("dmarcDomain", value.dmarc_domain, true)
    |> ApolloSignal.Types.put_field("dmarcCurrentPolicy", value.dmarc_current_policy, true)
    |> ApolloSignal.Types.put_field("dmarcRecommendedPolicy", value.dmarc_recommended_policy, true)
    |> ApolloSignal.Types.put_field("dmarcObservedMessages", value.dmarc_observed_messages, true)
    |> ApolloSignal.Types.put_field("dmarcAlignedMessages", value.dmarc_aligned_messages, true)
    |> ApolloSignal.Types.put_field("dmarcAccountedRate", value.dmarc_accounted_rate, true)
    |> ApolloSignal.Types.put_field("dmarcUnknownMessages", value.dmarc_unknown_messages, true)
    |> ApolloSignal.Types.put_field("dmarcUnknownSources", value.dmarc_unknown_sources, true)
    |> ApolloSignal.Types.put_field("dmarcReportingDays", value.dmarc_reporting_days, true)
  end
end

defmodule ApolloSignal.Types.AdvisorRecommendationResponse do
  @moduledoc "Typed AdvisorRecommendationResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:code, :severity, :title, :message]
  defstruct [code: nil, severity: nil, title: nil, message: nil, data: nil]

  @type t() :: %__MODULE__{code: String.t(), severity: String.t(), title: String.t(), message: String.t(), data: ApolloSignal.Types.AdvisorRecommendationDataResponse.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      code: field(data, "code", :code),
      severity: field(data, "severity", :severity),
      title: field(data, "title", :title),
      message: field(data, "message", :message),
      data: decode_nullable(field(data, "data", :data), fn value -> ApolloSignal.Types.from_advisor_recommendation_data_response(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected AdvisorRecommendationResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("code", value.code, true)
    |> ApolloSignal.Types.put_field("severity", value.severity, true)
    |> ApolloSignal.Types.put_field("title", value.title, true)
    |> ApolloSignal.Types.put_field("message", value.message, true)
    |> ApolloSignal.Types.put_field("data", value.data, true)
  end
end

defmodule ApolloSignal.Types.AdvisorReportResponse do
  @moduledoc "Typed AdvisorReportResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:project_id, :generated_at, :score, :recommendations]
  defstruct [project_id: nil, generated_at: nil, score: nil, recommendations: nil]

  @type t() :: %__MODULE__{project_id: String.t(), generated_at: String.t(), score: integer(), recommendations: list(ApolloSignal.Types.AdvisorRecommendationResponse.t())}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      project_id: field(data, "projectId", :project_id),
      generated_at: field(data, "generatedAt", :generated_at),
      score: field(data, "score", :score),
      recommendations: decode_list(field(data, "recommendations", :recommendations), fn value -> ApolloSignal.Types.from_advisor_recommendation_response(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected AdvisorReportResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("generatedAt", value.generated_at, true)
    |> ApolloSignal.Types.put_field("score", value.score, true)
    |> ApolloSignal.Types.put_field("recommendations", value.recommendations, true)
  end
end

defmodule ApolloSignal.Types.SuppressionResponse do
  @moduledoc "Typed SuppressionResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:id, :project_id, :email, :reason, :created_at]
  defstruct [id: nil, project_id: nil, email: nil, reason: nil, created_at: nil, contact_id: nil]

  @type t() :: %__MODULE__{id: String.t(), project_id: String.t(), email: String.t(), reason: String.t(), created_at: String.t(), contact_id: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      project_id: field(data, "projectId", :project_id),
      email: field(data, "email", :email),
      reason: field(data, "reason", :reason),
      created_at: field(data, "createdAt", :created_at),
      contact_id: decode_nullable(field(data, "contactId", :contact_id), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SuppressionResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("email", value.email, true)
    |> ApolloSignal.Types.put_field("reason", value.reason, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("contactId", value.contact_id, true)
  end
end

defmodule ApolloSignal.Types.PageInfo do
  @moduledoc "Typed PageInfo model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:page, :size, :total, :total_pages, :has_next_page, :has_previous_page]
  defstruct [page: nil, size: nil, total: nil, total_pages: nil, has_next_page: nil, has_previous_page: nil]

  @type t() :: %__MODULE__{page: integer(), size: integer(), total: integer(), total_pages: integer(), has_next_page: boolean(), has_previous_page: boolean()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      page: field(data, "page", :page),
      size: field(data, "size", :size),
      total: field(data, "total", :total),
      total_pages: field(data, "totalPages", :total_pages),
      has_next_page: field(data, "hasNextPage", :has_next_page),
      has_previous_page: field(data, "hasPreviousPage", :has_previous_page),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected PageInfo to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("page", value.page, true)
    |> ApolloSignal.Types.put_field("size", value.size, true)
    |> ApolloSignal.Types.put_field("total", value.total, true)
    |> ApolloSignal.Types.put_field("totalPages", value.total_pages, true)
    |> ApolloSignal.Types.put_field("hasNextPage", value.has_next_page, true)
    |> ApolloSignal.Types.put_field("hasPreviousPage", value.has_previous_page, true)
  end
end

defmodule ApolloSignal.Types.SuppressionPageResponse do
  @moduledoc "Typed SuppressionPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.SuppressionResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_suppression_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SuppressionPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.AddSuppressionBody do
  @moduledoc "Typed AddSuppressionBody model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:email]
  defstruct [email: nil]

  @type t() :: %__MODULE__{email: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      email: field(data, "email", :email),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected AddSuppressionBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("email", value.email, true)
  end
end

defmodule ApolloSignal.Types.SuppressionImportRowSerializable do
  @moduledoc "Typed SuppressionImportRowSerializable model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:email]
  defstruct [email: nil, reason: nil]

  @type t() :: %__MODULE__{email: String.t(), reason: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      email: field(data, "email", :email),
      reason: decode_nullable(field(data, "reason", :reason), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SuppressionImportRowSerializable to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("email", value.email, true)
    |> ApolloSignal.Types.put_field("reason", value.reason, true)
  end
end

defmodule ApolloSignal.Types.SuppressionImportBody do
  @moduledoc "Typed SuppressionImportBody model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:suppressions]
  defstruct [suppressions: nil]

  @type t() :: %__MODULE__{suppressions: list(ApolloSignal.Types.SuppressionImportRowSerializable.t())}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      suppressions: decode_list(field(data, "suppressions", :suppressions), fn value -> ApolloSignal.Types.from_suppression_import_row_serializable(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SuppressionImportBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("suppressions", value.suppressions, true)
  end
end

defmodule ApolloSignal.Types.SuppressionImportResponse do
  @moduledoc "Typed SuppressionImportResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:imported, :skipped]
  defstruct [imported: nil, skipped: nil]

  @type t() :: %__MODULE__{imported: integer(), skipped: integer()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      imported: field(data, "imported", :imported),
      skipped: field(data, "skipped", :skipped),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SuppressionImportResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("imported", value.imported, true)
    |> ApolloSignal.Types.put_field("skipped", value.skipped, true)
  end
end

defmodule ApolloSignal.Types.SegmentResponse do
  @moduledoc "Typed SegmentResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:id, :name, :project_id, :created_at]
  defstruct [object: nil, id: nil, name: nil, project_id: nil, created_at: nil, contact_count: nil, unsubscribed_count: nil]

  @type t() :: %__MODULE__{object: String.t() | nil, id: String.t(), name: String.t(), project_id: String.t(), created_at: String.t(), contact_count: integer() | nil, unsubscribed_count: integer() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      object: field(data, "object", :object),
      id: field(data, "id", :id),
      name: field(data, "name", :name),
      project_id: field(data, "projectId", :project_id),
      created_at: field(data, "createdAt", :created_at),
      contact_count: field(data, "contactCount", :contact_count),
      unsubscribed_count: field(data, "unsubscribedCount", :unsubscribed_count),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SegmentResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("object", value.object, false)
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("contactCount", value.contact_count, false)
    |> ApolloSignal.Types.put_field("unsubscribedCount", value.unsubscribed_count, false)
  end
end

defmodule ApolloSignal.Types.SegmentPageResponse do
  @moduledoc "Typed SegmentPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.SegmentResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_segment_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SegmentPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.SegmentContactResponse do
  @moduledoc "Typed SegmentContactResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:contact_id, :email, :first_name, :last_name, :segments]
  defstruct [contact_id: nil, email: nil, first_name: nil, last_name: nil, segments: nil]

  @type t() :: %__MODULE__{contact_id: String.t(), email: String.t(), first_name: String.t() | nil, last_name: String.t() | nil, segments: list(String.t())}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      contact_id: field(data, "contactId", :contact_id),
      email: field(data, "email", :email),
      first_name: decode_nullable(field(data, "firstName", :first_name), fn value -> value end),
      last_name: decode_nullable(field(data, "lastName", :last_name), fn value -> value end),
      segments: decode_list(field(data, "segments", :segments), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SegmentContactResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("contactId", value.contact_id, true)
    |> ApolloSignal.Types.put_field("email", value.email, true)
    |> ApolloSignal.Types.put_field("firstName", value.first_name, true)
    |> ApolloSignal.Types.put_field("lastName", value.last_name, true)
    |> ApolloSignal.Types.put_field("segments", value.segments, true)
  end
end

defmodule ApolloSignal.Types.CursorInfo do
  @moduledoc "Typed CursorInfo model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:next_cursor, :previous_cursor, :has_next_page, :has_previous_page]
  defstruct [next_cursor: nil, previous_cursor: nil, has_next_page: nil, has_previous_page: nil]

  @type t() :: %__MODULE__{next_cursor: String.t() | nil, previous_cursor: String.t() | nil, has_next_page: boolean(), has_previous_page: boolean()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      next_cursor: decode_nullable(field(data, "nextCursor", :next_cursor), fn value -> value end),
      previous_cursor: decode_nullable(field(data, "previousCursor", :previous_cursor), fn value -> value end),
      has_next_page: field(data, "hasNextPage", :has_next_page),
      has_previous_page: field(data, "hasPreviousPage", :has_previous_page),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected CursorInfo to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("nextCursor", value.next_cursor, true)
    |> ApolloSignal.Types.put_field("previousCursor", value.previous_cursor, true)
    |> ApolloSignal.Types.put_field("hasNextPage", value.has_next_page, true)
    |> ApolloSignal.Types.put_field("hasPreviousPage", value.has_previous_page, true)
  end
end

defmodule ApolloSignal.Types.CursorPage do
  @moduledoc "Typed CursorPage model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :cursor]
  defstruct [data: nil, cursor: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.SegmentContactResponse.t()), cursor: ApolloSignal.Types.CursorInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_segment_contact_response(value) end),
      cursor: ApolloSignal.Types.from_cursor_info(field(data, "cursor", :cursor)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected CursorPage to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("cursor", value.cursor, true)
  end
end

defmodule ApolloSignal.Types.CreateSegmentBody do
  @moduledoc "Typed CreateSegmentBody model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:name]
  defstruct [name: nil]

  @type t() :: %__MODULE__{name: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      name: field(data, "name", :name),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected CreateSegmentBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("name", value.name, true)
  end
end

defmodule ApolloSignal.Types.TopicResponse do
  @moduledoc "Typed TopicResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:id, :name, :default_subscription, :description, :visibility, :project_id, :opt_in_count, :opt_out_count, :created_at, :updated_at]
  defstruct [object: nil, id: nil, name: nil, default_subscription: nil, description: nil, visibility: nil, project_id: nil, opt_in_count: nil, opt_out_count: nil, created_at: nil, updated_at: nil]

  @type t() :: %__MODULE__{object: String.t() | nil, id: String.t(), name: String.t(), default_subscription: String.t(), description: String.t() | nil, visibility: String.t(), project_id: String.t(), opt_in_count: integer(), opt_out_count: integer(), created_at: String.t(), updated_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      object: field(data, "object", :object),
      id: field(data, "id", :id),
      name: field(data, "name", :name),
      default_subscription: field(data, "defaultSubscription", :default_subscription),
      description: decode_nullable(field(data, "description", :description), fn value -> value end),
      visibility: field(data, "visibility", :visibility),
      project_id: field(data, "projectId", :project_id),
      opt_in_count: field(data, "optInCount", :opt_in_count),
      opt_out_count: field(data, "optOutCount", :opt_out_count),
      created_at: field(data, "createdAt", :created_at),
      updated_at: field(data, "updatedAt", :updated_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected TopicResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("object", value.object, false)
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("defaultSubscription", value.default_subscription, true)
    |> ApolloSignal.Types.put_field("description", value.description, true)
    |> ApolloSignal.Types.put_field("visibility", value.visibility, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("optInCount", value.opt_in_count, true)
    |> ApolloSignal.Types.put_field("optOutCount", value.opt_out_count, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
  end
end

defmodule ApolloSignal.Types.TopicPageResponse do
  @moduledoc "Typed TopicPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.TopicResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_topic_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected TopicPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.CreateTopicBody do
  @moduledoc "Typed CreateTopicBody model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:name, :default_subscription]
  defstruct [name: nil, default_subscription: nil, description: nil, visibility: nil]

  @type t() :: %__MODULE__{name: String.t(), default_subscription: String.t(), description: String.t() | nil, visibility: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      name: field(data, "name", :name),
      default_subscription: field(data, "defaultSubscription", :default_subscription),
      description: decode_nullable(field(data, "description", :description), fn value -> value end),
      visibility: decode_nullable(field(data, "visibility", :visibility), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected CreateTopicBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("defaultSubscription", value.default_subscription, true)
    |> ApolloSignal.Types.put_field("description", value.description, true)
    |> ApolloSignal.Types.put_field("visibility", value.visibility, true)
  end
end

defmodule ApolloSignal.Types.UpdateTopicBody do
  @moduledoc "Typed UpdateTopicBody model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  defstruct [name: nil, description: nil, visibility: nil]

  @type t() :: %__MODULE__{name: String.t() | nil, description: String.t() | nil, visibility: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      name: decode_nullable(field(data, "name", :name), fn value -> value end),
      description: decode_nullable(field(data, "description", :description), fn value -> value end),
      visibility: decode_nullable(field(data, "visibility", :visibility), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected UpdateTopicBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("description", value.description, true)
    |> ApolloSignal.Types.put_field("visibility", value.visibility, true)
  end
end

defmodule ApolloSignal.Types.ContactPropertyResponse do
  @moduledoc "Typed ContactPropertyResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:id, :key, :type, :fallback_value, :project_id, :created_at, :updated_at]
  defstruct [object: nil, id: nil, key: nil, type: nil, fallback_value: nil, project_id: nil, created_at: nil, updated_at: nil]

  @type t() :: %__MODULE__{object: String.t() | nil, id: String.t(), key: String.t(), type: String.t(), fallback_value: String.t() | nil, project_id: String.t(), created_at: String.t(), updated_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      object: field(data, "object", :object),
      id: field(data, "id", :id),
      key: field(data, "key", :key),
      type: field(data, "type", :type),
      fallback_value: decode_nullable(field(data, "fallbackValue", :fallback_value), fn value -> value end),
      project_id: field(data, "projectId", :project_id),
      created_at: field(data, "createdAt", :created_at),
      updated_at: field(data, "updatedAt", :updated_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ContactPropertyResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("object", value.object, false)
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("key", value.key, true)
    |> ApolloSignal.Types.put_field("type", value.type, true)
    |> ApolloSignal.Types.put_field("fallbackValue", value.fallback_value, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
  end
end

defmodule ApolloSignal.Types.ContactPropertyPageResponse do
  @moduledoc "Typed ContactPropertyPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.ContactPropertyResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_contact_property_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ContactPropertyPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.CreateContactPropertyBody do
  @moduledoc "Typed CreateContactPropertyBody model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:key, :type]
  defstruct [key: nil, type: nil, fallback_value: nil]

  @type t() :: %__MODULE__{key: String.t(), type: String.t(), fallback_value: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      key: field(data, "key", :key),
      type: field(data, "type", :type),
      fallback_value: decode_nullable(field(data, "fallbackValue", :fallback_value), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected CreateContactPropertyBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("key", value.key, true)
    |> ApolloSignal.Types.put_field("type", value.type, true)
    |> ApolloSignal.Types.put_field("fallbackValue", value.fallback_value, true)
  end
end

defmodule ApolloSignal.Types.UpdateContactPropertyBody do
  @moduledoc "Typed UpdateContactPropertyBody model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  defstruct [fallback_value: nil]

  @type t() :: %__MODULE__{fallback_value: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      fallback_value: decode_nullable(field(data, "fallbackValue", :fallback_value), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected UpdateContactPropertyBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("fallbackValue", value.fallback_value, true)
  end
end

defmodule ApolloSignal.Types.TopicSubscriptionResponse do
  @moduledoc "Typed TopicSubscriptionResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:topic_id, :subscription]
  defstruct [topic_id: nil, subscription: nil]

  @type t() :: %__MODULE__{topic_id: String.t(), subscription: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      topic_id: field(data, "topicId", :topic_id),
      subscription: field(data, "subscription", :subscription),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected TopicSubscriptionResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("topicId", value.topic_id, true)
    |> ApolloSignal.Types.put_field("subscription", value.subscription, true)
  end
end

defmodule ApolloSignal.Types.ContactResponse do
  @moduledoc "Typed ContactResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    decode_map: 2,
    field: 3
  ]

  @enforce_keys [:id, :email, :first_name, :last_name, :unsubscribed, :properties, :profile_image_url, :project_id, :segments, :topics, :created_at, :updated_at]
  defstruct [object: nil, id: nil, email: nil, phone: nil, first_name: nil, last_name: nil, unsubscribed: nil, properties: nil, profile_image_url: nil, project_id: nil, segments: nil, topics: nil, created_at: nil, updated_at: nil]

  @type t() :: %__MODULE__{object: String.t() | nil, id: String.t(), email: String.t(), phone: String.t() | nil, first_name: String.t() | nil, last_name: String.t() | nil, unsubscribed: boolean(), properties: %{optional(String.t()) => String.t()}, profile_image_url: String.t() | nil, project_id: String.t(), segments: list(String.t()), topics: list(ApolloSignal.Types.TopicSubscriptionResponse.t()), created_at: String.t(), updated_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      object: field(data, "object", :object),
      id: field(data, "id", :id),
      email: field(data, "email", :email),
      phone: decode_nullable(field(data, "phone", :phone), fn value -> value end),
      first_name: decode_nullable(field(data, "firstName", :first_name), fn value -> value end),
      last_name: decode_nullable(field(data, "lastName", :last_name), fn value -> value end),
      unsubscribed: field(data, "unsubscribed", :unsubscribed),
      properties: decode_map(field(data, "properties", :properties), fn value -> value end),
      profile_image_url: decode_nullable(field(data, "profileImageUrl", :profile_image_url), fn value -> value end),
      project_id: field(data, "projectId", :project_id),
      segments: decode_list(field(data, "segments", :segments), fn value -> value end),
      topics: decode_list(field(data, "topics", :topics), fn value -> ApolloSignal.Types.from_topic_subscription_response(value) end),
      created_at: field(data, "createdAt", :created_at),
      updated_at: field(data, "updatedAt", :updated_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ContactResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("object", value.object, false)
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("email", value.email, true)
    |> ApolloSignal.Types.put_field("phone", value.phone, true)
    |> ApolloSignal.Types.put_field("firstName", value.first_name, true)
    |> ApolloSignal.Types.put_field("lastName", value.last_name, true)
    |> ApolloSignal.Types.put_field("unsubscribed", value.unsubscribed, true)
    |> ApolloSignal.Types.put_field("properties", value.properties, true)
    |> ApolloSignal.Types.put_field("profileImageUrl", value.profile_image_url, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("segments", value.segments, true)
    |> ApolloSignal.Types.put_field("topics", value.topics, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
  end
end

defmodule ApolloSignal.Types.ContactPageResponse do
  @moduledoc "Typed ContactPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.ContactResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_contact_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ContactPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.SegmentRef do
  @moduledoc "Typed SegmentRef model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:id]
  defstruct [id: nil]

  @type t() :: %__MODULE__{id: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SegmentRef to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
  end
end

defmodule ApolloSignal.Types.TopicSubscriptionBody do
  @moduledoc "Typed TopicSubscriptionBody model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:id, :subscription]
  defstruct [id: nil, subscription: nil]

  @type t() :: %__MODULE__{id: String.t(), subscription: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      subscription: field(data, "subscription", :subscription),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected TopicSubscriptionBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("subscription", value.subscription, true)
  end
end

defmodule ApolloSignal.Types.CreateContactBody do
  @moduledoc "Typed CreateContactBody model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    decode_map: 2,
    field: 3
  ]

  @enforce_keys [:email]
  defstruct [email: nil, phone: nil, first_name: nil, last_name: nil, unsubscribed: nil, properties: nil, segments: nil, topics: nil]

  @type t() :: %__MODULE__{email: String.t(), phone: String.t() | nil, first_name: String.t() | nil, last_name: String.t() | nil, unsubscribed: boolean() | nil, properties: %{optional(String.t()) => String.t()} | nil, segments: list(ApolloSignal.Types.SegmentRef.t()) | nil, topics: list(ApolloSignal.Types.TopicSubscriptionBody.t()) | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      email: field(data, "email", :email),
      phone: decode_nullable(field(data, "phone", :phone), fn value -> value end),
      first_name: decode_nullable(field(data, "firstName", :first_name), fn value -> value end),
      last_name: decode_nullable(field(data, "lastName", :last_name), fn value -> value end),
      unsubscribed: field(data, "unsubscribed", :unsubscribed),
      properties: decode_map(field(data, "properties", :properties), fn value -> value end),
      segments: decode_list(field(data, "segments", :segments), fn value -> ApolloSignal.Types.from_segment_ref(value) end),
      topics: decode_list(field(data, "topics", :topics), fn value -> ApolloSignal.Types.from_topic_subscription_body(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected CreateContactBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("email", value.email, true)
    |> ApolloSignal.Types.put_field("phone", value.phone, true)
    |> ApolloSignal.Types.put_field("firstName", value.first_name, true)
    |> ApolloSignal.Types.put_field("lastName", value.last_name, true)
    |> ApolloSignal.Types.put_field("unsubscribed", value.unsubscribed, false)
    |> ApolloSignal.Types.put_field("properties", value.properties, false)
    |> ApolloSignal.Types.put_field("segments", value.segments, false)
    |> ApolloSignal.Types.put_field("topics", value.topics, false)
  end
end

defmodule ApolloSignal.Types.UpdateContactBody do
  @moduledoc "Typed UpdateContactBody model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_map: 2,
    field: 3
  ]

  defstruct [first_name: nil, last_name: nil, phone: nil, unsubscribed: nil, properties: nil]

  @type t() :: %__MODULE__{first_name: String.t() | nil, last_name: String.t() | nil, phone: String.t() | nil, unsubscribed: boolean() | nil, properties: %{optional(String.t()) => String.t()} | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      first_name: decode_nullable(field(data, "firstName", :first_name), fn value -> value end),
      last_name: decode_nullable(field(data, "lastName", :last_name), fn value -> value end),
      phone: decode_nullable(field(data, "phone", :phone), fn value -> value end),
      unsubscribed: decode_nullable(field(data, "unsubscribed", :unsubscribed), fn value -> value end),
      properties: decode_map(field(data, "properties", :properties), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected UpdateContactBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("firstName", value.first_name, true)
    |> ApolloSignal.Types.put_field("lastName", value.last_name, true)
    |> ApolloSignal.Types.put_field("phone", value.phone, true)
    |> ApolloSignal.Types.put_field("unsubscribed", value.unsubscribed, true)
    |> ApolloSignal.Types.put_field("properties", value.properties, true)
  end
end

defmodule ApolloSignal.Types.SetImageUrlBody do
  @moduledoc "Typed SetImageUrlBody model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:url]
  defstruct [url: nil]

  @type t() :: %__MODULE__{url: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      url: field(data, "url", :url),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected SetImageUrlBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("url", value.url, true)
  end
end

defmodule ApolloSignal.Types.AddToSegmentBody do
  @moduledoc "Typed AddToSegmentBody model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:segment_id]
  defstruct [segment_id: nil]

  @type t() :: %__MODULE__{segment_id: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      segment_id: field(data, "segmentId", :segment_id),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected AddToSegmentBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("segmentId", value.segment_id, true)
  end
end

defmodule ApolloSignal.Types.UpdateTopicsBody do
  @moduledoc "Typed UpdateTopicsBody model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:topics]
  defstruct [topics: nil]

  @type t() :: %__MODULE__{topics: list(ApolloSignal.Types.TopicSubscriptionBody.t())}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      topics: decode_list(field(data, "topics", :topics), fn value -> ApolloSignal.Types.from_topic_subscription_body(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected UpdateTopicsBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("topics", value.topics, true)
  end
end

defmodule ApolloSignal.Types.ActivityMetadataResponse do
  @moduledoc "Typed ActivityMetadataResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  defstruct [topic_id: nil]

  @type t() :: %__MODULE__{topic_id: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      topic_id: decode_nullable(field(data, "topicId", :topic_id), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ActivityMetadataResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("topicId", value.topic_id, true)
  end
end

defmodule ApolloSignal.Types.ActivityResponse do
  @moduledoc "Typed ActivityResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:id, :type, :occurred_at]
  defstruct [object: nil, id: nil, type: nil, reference_id: nil, reference_name: nil, metadata: nil, occurred_at: nil]

  @type t() :: %__MODULE__{object: String.t() | nil, id: String.t(), type: String.t(), reference_id: String.t() | nil, reference_name: String.t() | nil, metadata: ApolloSignal.Types.ActivityMetadataResponse.t() | nil, occurred_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      object: field(data, "object", :object),
      id: field(data, "id", :id),
      type: field(data, "type", :type),
      reference_id: decode_nullable(field(data, "referenceId", :reference_id), fn value -> value end),
      reference_name: decode_nullable(field(data, "referenceName", :reference_name), fn value -> value end),
      metadata: decode_nullable(field(data, "metadata", :metadata), fn value -> ApolloSignal.Types.from_activity_metadata_response(value) end),
      occurred_at: field(data, "occurredAt", :occurred_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ActivityResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("object", value.object, false)
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("type", value.type, true)
    |> ApolloSignal.Types.put_field("referenceId", value.reference_id, true)
    |> ApolloSignal.Types.put_field("referenceName", value.reference_name, true)
    |> ApolloSignal.Types.put_field("metadata", value.metadata, true)
    |> ApolloSignal.Types.put_field("occurredAt", value.occurred_at, true)
  end
end

defmodule ApolloSignal.Types.EngagementScoreResponse do
  @moduledoc "Typed EngagementScoreResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:score, :tier, :scored_at]
  defstruct [object: nil, score: nil, tier: nil, scored_at: nil]

  @type t() :: %__MODULE__{object: String.t() | nil, score: integer(), tier: String.t(), scored_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      object: field(data, "object", :object),
      score: field(data, "score", :score),
      tier: field(data, "tier", :tier),
      scored_at: field(data, "scoredAt", :scored_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected EngagementScoreResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("object", value.object, false)
    |> ApolloSignal.Types.put_field("score", value.score, true)
    |> ApolloSignal.Types.put_field("tier", value.tier, true)
    |> ApolloSignal.Types.put_field("scoredAt", value.scored_at, true)
  end
end

defmodule ApolloSignal.Types.EmailValidationStatusResponse do
  @moduledoc "Typed EmailValidationStatusResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:status, :reason, :validated_at]
  defstruct [object: nil, status: nil, reason: nil, validated_at: nil]

  @type t() :: %__MODULE__{object: String.t() | nil, status: String.t(), reason: String.t() | nil, validated_at: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      object: field(data, "object", :object),
      status: field(data, "status", :status),
      reason: decode_nullable(field(data, "reason", :reason), fn value -> value end),
      validated_at: decode_nullable(field(data, "validatedAt", :validated_at), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected EmailValidationStatusResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("object", value.object, false)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("reason", value.reason, true)
    |> ApolloSignal.Types.put_field("validatedAt", value.validated_at, true)
  end
end

defmodule ApolloSignal.Types.RecordValidationBody do
  @moduledoc "Typed RecordValidationBody model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:status]
  defstruct [status: nil, reason: nil]

  @type t() :: %__MODULE__{status: ApolloSignal.Types.EmailValidationStatusInput.t(), reason: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      status: ApolloSignal.Types.from_email_validation_status_input(field(data, "status", :status)),
      reason: decode_nullable(field(data, "reason", :reason), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected RecordValidationBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("reason", value.reason, true)
  end
end

defmodule ApolloSignal.Types.WebhookFilterSerializable do
  @moduledoc "Typed WebhookFilterSerializable model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:field, :operator]
  defstruct [field: nil, operator: nil, value: nil]

  @type t() :: %__MODULE__{field: String.t(), operator: String.t(), value: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      field: field(data, "field", :field),
      operator: field(data, "operator", :operator),
      value: decode_nullable(field(data, "value", :value), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected WebhookFilterSerializable to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("field", value.field, true)
    |> ApolloSignal.Types.put_field("operator", value.operator, true)
    |> ApolloSignal.Types.put_field("value", value.value, true)
  end
end

defmodule ApolloSignal.Types.WebhookTransformationSerializable do
  @moduledoc "Typed WebhookTransformationSerializable model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:type]
  defstruct [type: nil, from: nil, to: nil, field: nil, value: nil, template: nil]

  @type t() :: %__MODULE__{type: String.t(), from: String.t() | nil, to: String.t() | nil, field: String.t() | nil, value: String.t() | nil, template: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      type: field(data, "type", :type),
      from: decode_nullable(field(data, "from", :from), fn value -> value end),
      to: decode_nullable(field(data, "to", :to), fn value -> value end),
      field: decode_nullable(field(data, "field", :field), fn value -> value end),
      value: decode_nullable(field(data, "value", :value), fn value -> value end),
      template: decode_nullable(field(data, "template", :template), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected WebhookTransformationSerializable to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("type", value.type, true)
    |> ApolloSignal.Types.put_field("from", value.from, true)
    |> ApolloSignal.Types.put_field("to", value.to, true)
    |> ApolloSignal.Types.put_field("field", value.field, true)
    |> ApolloSignal.Types.put_field("value", value.value, true)
    |> ApolloSignal.Types.put_field("template", value.template, true)
  end
end

defmodule ApolloSignal.Types.WebhookResponse do
  @moduledoc "Typed WebhookResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:id, :project_id, :name, :url, :events, :enabled, :filters, :transformations, :created_at, :updated_at]
  defstruct [id: nil, project_id: nil, name: nil, url: nil, events: nil, enabled: nil, filters: nil, transformations: nil, created_at: nil, updated_at: nil]

  @type t() :: %__MODULE__{id: String.t(), project_id: String.t(), name: String.t(), url: String.t(), events: list(String.t()), enabled: boolean(), filters: list(ApolloSignal.Types.WebhookFilterSerializable.t()) | nil, transformations: list(ApolloSignal.Types.WebhookTransformationSerializable.t()) | nil, created_at: String.t(), updated_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      project_id: field(data, "projectId", :project_id),
      name: field(data, "name", :name),
      url: field(data, "url", :url),
      events: decode_list(field(data, "events", :events), fn value -> value end),
      enabled: field(data, "enabled", :enabled),
      filters: decode_list(field(data, "filters", :filters), fn value -> ApolloSignal.Types.from_webhook_filter_serializable(value) end),
      transformations: decode_list(field(data, "transformations", :transformations), fn value -> ApolloSignal.Types.from_webhook_transformation_serializable(value) end),
      created_at: field(data, "createdAt", :created_at),
      updated_at: field(data, "updatedAt", :updated_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected WebhookResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("url", value.url, true)
    |> ApolloSignal.Types.put_field("events", value.events, true)
    |> ApolloSignal.Types.put_field("enabled", value.enabled, true)
    |> ApolloSignal.Types.put_field("filters", value.filters, true)
    |> ApolloSignal.Types.put_field("transformations", value.transformations, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
  end
end

defmodule ApolloSignal.Types.WebhookPageResponse do
  @moduledoc "Typed WebhookPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.WebhookResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_webhook_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected WebhookPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.WebhookDeliveryResponse do
  @moduledoc "Typed WebhookDeliveryResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:id, :project_id, :webhook_endpoint_id, :event_type, :status, :attempt_count, :last_status_code, :last_error, :response_body_snippet, :next_attempt_at, :created_at, :updated_at]
  defstruct [id: nil, project_id: nil, webhook_endpoint_id: nil, event_type: nil, status: nil, attempt_count: nil, last_status_code: nil, last_error: nil, response_body_snippet: nil, next_attempt_at: nil, created_at: nil, updated_at: nil]

  @type t() :: %__MODULE__{id: String.t(), project_id: String.t(), webhook_endpoint_id: String.t(), event_type: String.t(), status: String.t(), attempt_count: integer(), last_status_code: integer() | nil, last_error: String.t() | nil, response_body_snippet: String.t() | nil, next_attempt_at: String.t() | nil, created_at: String.t(), updated_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      project_id: field(data, "projectId", :project_id),
      webhook_endpoint_id: field(data, "webhookEndpointId", :webhook_endpoint_id),
      event_type: field(data, "eventType", :event_type),
      status: field(data, "status", :status),
      attempt_count: field(data, "attemptCount", :attempt_count),
      last_status_code: decode_nullable(field(data, "lastStatusCode", :last_status_code), fn value -> value end),
      last_error: decode_nullable(field(data, "lastError", :last_error), fn value -> value end),
      response_body_snippet: decode_nullable(field(data, "responseBodySnippet", :response_body_snippet), fn value -> value end),
      next_attempt_at: decode_nullable(field(data, "nextAttemptAt", :next_attempt_at), fn value -> value end),
      created_at: field(data, "createdAt", :created_at),
      updated_at: field(data, "updatedAt", :updated_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected WebhookDeliveryResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("webhookEndpointId", value.webhook_endpoint_id, true)
    |> ApolloSignal.Types.put_field("eventType", value.event_type, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("attemptCount", value.attempt_count, true)
    |> ApolloSignal.Types.put_field("lastStatusCode", value.last_status_code, true)
    |> ApolloSignal.Types.put_field("lastError", value.last_error, true)
    |> ApolloSignal.Types.put_field("responseBodySnippet", value.response_body_snippet, true)
    |> ApolloSignal.Types.put_field("nextAttemptAt", value.next_attempt_at, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
  end
end

defmodule ApolloSignal.Types.WebhookDeliveryPageResponse do
  @moduledoc "Typed WebhookDeliveryPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.WebhookDeliveryResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_webhook_delivery_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected WebhookDeliveryPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.CreateWebhookBody do
  @moduledoc "Typed CreateWebhookBody model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:url, :events]
  defstruct [url: nil, events: nil, name: nil, secret: nil, filters: nil, transformations: nil]

  @type t() :: %__MODULE__{url: String.t(), events: list(String.t()), name: String.t() | nil, secret: String.t() | nil, filters: list(ApolloSignal.Types.WebhookFilterSerializable.t()) | nil, transformations: list(ApolloSignal.Types.WebhookTransformationSerializable.t()) | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      url: field(data, "url", :url),
      events: decode_list(field(data, "events", :events), fn value -> value end),
      name: decode_nullable(field(data, "name", :name), fn value -> value end),
      secret: decode_nullable(field(data, "secret", :secret), fn value -> value end),
      filters: decode_list(field(data, "filters", :filters), fn value -> ApolloSignal.Types.from_webhook_filter_serializable(value) end),
      transformations: decode_list(field(data, "transformations", :transformations), fn value -> ApolloSignal.Types.from_webhook_transformation_serializable(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected CreateWebhookBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("url", value.url, true)
    |> ApolloSignal.Types.put_field("events", value.events, true)
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("secret", value.secret, true)
    |> ApolloSignal.Types.put_field("filters", value.filters, true)
    |> ApolloSignal.Types.put_field("transformations", value.transformations, true)
  end
end

defmodule ApolloSignal.Types.WebhookCreateResponse do
  @moduledoc "Typed WebhookCreateResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:id, :project_id, :name, :url, :events, :enabled, :filters, :transformations, :created_at, :updated_at, :secret]
  defstruct [id: nil, project_id: nil, name: nil, url: nil, events: nil, enabled: nil, filters: nil, transformations: nil, created_at: nil, updated_at: nil, secret: nil]

  @type t() :: %__MODULE__{id: String.t(), project_id: String.t(), name: String.t(), url: String.t(), events: list(String.t()), enabled: boolean(), filters: list(ApolloSignal.Types.WebhookFilterSerializable.t()) | nil, transformations: list(ApolloSignal.Types.WebhookTransformationSerializable.t()) | nil, created_at: String.t(), updated_at: String.t(), secret: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      project_id: field(data, "projectId", :project_id),
      name: field(data, "name", :name),
      url: field(data, "url", :url),
      events: decode_list(field(data, "events", :events), fn value -> value end),
      enabled: field(data, "enabled", :enabled),
      filters: decode_list(field(data, "filters", :filters), fn value -> ApolloSignal.Types.from_webhook_filter_serializable(value) end),
      transformations: decode_list(field(data, "transformations", :transformations), fn value -> ApolloSignal.Types.from_webhook_transformation_serializable(value) end),
      created_at: field(data, "createdAt", :created_at),
      updated_at: field(data, "updatedAt", :updated_at),
      secret: field(data, "secret", :secret),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected WebhookCreateResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("url", value.url, true)
    |> ApolloSignal.Types.put_field("events", value.events, true)
    |> ApolloSignal.Types.put_field("enabled", value.enabled, true)
    |> ApolloSignal.Types.put_field("filters", value.filters, true)
    |> ApolloSignal.Types.put_field("transformations", value.transformations, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
    |> ApolloSignal.Types.put_field("secret", value.secret, true)
  end
end

defmodule ApolloSignal.Types.UpdateWebhookBody do
  @moduledoc "Typed UpdateWebhookBody model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    field: 3
  ]

  defstruct [name: nil, url: nil, events: nil, secret: nil, enabled: nil, filters: nil, transformations: nil]

  @type t() :: %__MODULE__{name: String.t() | nil, url: String.t() | nil, events: list(String.t()) | nil, secret: String.t() | nil, enabled: boolean() | nil, filters: list(ApolloSignal.Types.WebhookFilterSerializable.t()) | nil, transformations: list(ApolloSignal.Types.WebhookTransformationSerializable.t()) | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      name: decode_nullable(field(data, "name", :name), fn value -> value end),
      url: decode_nullable(field(data, "url", :url), fn value -> value end),
      events: decode_list(field(data, "events", :events), fn value -> value end),
      secret: decode_nullable(field(data, "secret", :secret), fn value -> value end),
      enabled: decode_nullable(field(data, "enabled", :enabled), fn value -> value end),
      filters: decode_list(field(data, "filters", :filters), fn value -> ApolloSignal.Types.from_webhook_filter_serializable(value) end),
      transformations: decode_list(field(data, "transformations", :transformations), fn value -> ApolloSignal.Types.from_webhook_transformation_serializable(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected UpdateWebhookBody to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("url", value.url, true)
    |> ApolloSignal.Types.put_field("events", value.events, true)
    |> ApolloSignal.Types.put_field("secret", value.secret, true)
    |> ApolloSignal.Types.put_field("enabled", value.enabled, true)
    |> ApolloSignal.Types.put_field("filters", value.filters, true)
    |> ApolloSignal.Types.put_field("transformations", value.transformations, true)
  end
end

defmodule ApolloSignal.Types.ApiKey do
  @moduledoc "Typed ApiKey model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    decode_map: 2,
    field: 3
  ]

  @enforce_keys [:id, :config_id, :name, :start, :prefix, :organization_id, :project_id, :enabled, :rate_limit_enabled, :rate_limit_time_window, :rate_limit_max, :request_count, :remaining, :last_request, :expires_at, :created_at, :updated_at, :metadata, :permissions]
  defstruct [id: nil, config_id: nil, name: nil, start: nil, prefix: nil, organization_id: nil, project_id: nil, enabled: nil, rate_limit_enabled: nil, rate_limit_time_window: nil, rate_limit_max: nil, request_count: nil, remaining: nil, last_request: nil, expires_at: nil, created_at: nil, updated_at: nil, metadata: nil, permissions: nil]

  @type t() :: %__MODULE__{id: String.t(), config_id: String.t(), name: String.t() | nil, start: String.t() | nil, prefix: String.t() | nil, organization_id: String.t(), project_id: String.t() | nil, enabled: boolean(), rate_limit_enabled: boolean(), rate_limit_time_window: integer() | nil, rate_limit_max: integer() | nil, request_count: integer(), remaining: integer() | nil, last_request: String.t() | nil, expires_at: String.t() | nil, created_at: String.t(), updated_at: String.t(), metadata: %{optional(String.t()) => String.t()} | nil, permissions: %{optional(String.t()) => list(String.t())} | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      config_id: field(data, "configId", :config_id),
      name: decode_nullable(field(data, "name", :name), fn value -> value end),
      start: decode_nullable(field(data, "start", :start), fn value -> value end),
      prefix: decode_nullable(field(data, "prefix", :prefix), fn value -> value end),
      organization_id: field(data, "organizationId", :organization_id),
      project_id: decode_nullable(field(data, "projectId", :project_id), fn value -> value end),
      enabled: field(data, "enabled", :enabled),
      rate_limit_enabled: field(data, "rateLimitEnabled", :rate_limit_enabled),
      rate_limit_time_window: decode_nullable(field(data, "rateLimitTimeWindow", :rate_limit_time_window), fn value -> value end),
      rate_limit_max: decode_nullable(field(data, "rateLimitMax", :rate_limit_max), fn value -> value end),
      request_count: field(data, "requestCount", :request_count),
      remaining: decode_nullable(field(data, "remaining", :remaining), fn value -> value end),
      last_request: decode_nullable(field(data, "lastRequest", :last_request), fn value -> value end),
      expires_at: decode_nullable(field(data, "expiresAt", :expires_at), fn value -> value end),
      created_at: field(data, "createdAt", :created_at),
      updated_at: field(data, "updatedAt", :updated_at),
      metadata: decode_map(field(data, "metadata", :metadata), fn value -> value end),
      permissions: decode_map(field(data, "permissions", :permissions), fn value -> decode_list(value, fn value -> value end) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ApiKey to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("configId", value.config_id, true)
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("start", value.start, true)
    |> ApolloSignal.Types.put_field("prefix", value.prefix, true)
    |> ApolloSignal.Types.put_field("organizationId", value.organization_id, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("enabled", value.enabled, true)
    |> ApolloSignal.Types.put_field("rateLimitEnabled", value.rate_limit_enabled, true)
    |> ApolloSignal.Types.put_field("rateLimitTimeWindow", value.rate_limit_time_window, true)
    |> ApolloSignal.Types.put_field("rateLimitMax", value.rate_limit_max, true)
    |> ApolloSignal.Types.put_field("requestCount", value.request_count, true)
    |> ApolloSignal.Types.put_field("remaining", value.remaining, true)
    |> ApolloSignal.Types.put_field("lastRequest", value.last_request, true)
    |> ApolloSignal.Types.put_field("expiresAt", value.expires_at, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
    |> ApolloSignal.Types.put_field("metadata", value.metadata, true)
    |> ApolloSignal.Types.put_field("permissions", value.permissions, true)
  end
end

defmodule ApolloSignal.Types.ApiKeyUsageRecord do
  @moduledoc "Typed ApiKeyUsageRecord model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:id, :key_id, :org_id, :method, :route, :status_code, :duration_ms, :ip, :ts]
  defstruct [id: nil, key_id: nil, org_id: nil, method: nil, route: nil, status_code: nil, duration_ms: nil, ip: nil, ts: nil]

  @type t() :: %__MODULE__{id: String.t(), key_id: String.t(), org_id: String.t(), method: String.t(), route: String.t(), status_code: integer(), duration_ms: integer() | nil, ip: String.t() | nil, ts: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      key_id: field(data, "keyId", :key_id),
      org_id: field(data, "orgId", :org_id),
      method: field(data, "method", :method),
      route: field(data, "route", :route),
      status_code: field(data, "statusCode", :status_code),
      duration_ms: decode_nullable(field(data, "durationMs", :duration_ms), fn value -> value end),
      ip: decode_nullable(field(data, "ip", :ip), fn value -> value end),
      ts: field(data, "ts", :ts),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ApiKeyUsageRecord to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("keyId", value.key_id, true)
    |> ApolloSignal.Types.put_field("orgId", value.org_id, true)
    |> ApolloSignal.Types.put_field("method", value.method, true)
    |> ApolloSignal.Types.put_field("route", value.route, true)
    |> ApolloSignal.Types.put_field("statusCode", value.status_code, true)
    |> ApolloSignal.Types.put_field("durationMs", value.duration_ms, true)
    |> ApolloSignal.Types.put_field("ip", value.ip, true)
    |> ApolloSignal.Types.put_field("ts", value.ts, true)
  end
end

defmodule ApolloSignal.Types.UsagePage do
  @moduledoc "Typed UsagePage model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:size, :total_pages, :has_more]
  defstruct [size: nil, total_pages: nil, has_more: nil]

  @type t() :: %__MODULE__{size: integer(), total_pages: integer(), has_more: boolean()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      size: field(data, "size", :size),
      total_pages: field(data, "totalPages", :total_pages),
      has_more: field(data, "hasMore", :has_more),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected UsagePage to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("size", value.size, true)
    |> ApolloSignal.Types.put_field("totalPages", value.total_pages, true)
    |> ApolloSignal.Types.put_field("hasMore", value.has_more, true)
  end
end

defmodule ApolloSignal.Types.ApiKeyUsageResponse do
  @moduledoc "Typed ApiKeyUsageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.ApiKeyUsageRecord.t()), page: ApolloSignal.Types.UsagePage.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_api_key_usage_record(value) end),
      page: ApolloSignal.Types.from_usage_page(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ApiKeyUsageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.ProjectLimitsModel do
  @moduledoc "Typed ProjectLimitsModel model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:daily_sends, :per_second_sends, :max_recipients_per_message, :max_domains, :max_api_keys, :max_webhooks]
  defstruct [daily_sends: nil, per_second_sends: nil, max_recipients_per_message: nil, max_domains: nil, max_api_keys: nil, max_webhooks: nil]

  @type t() :: %__MODULE__{daily_sends: integer(), per_second_sends: integer(), max_recipients_per_message: integer(), max_domains: integer(), max_api_keys: integer(), max_webhooks: integer()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      daily_sends: field(data, "dailySends", :daily_sends),
      per_second_sends: field(data, "perSecondSends", :per_second_sends),
      max_recipients_per_message: field(data, "maxRecipientsPerMessage", :max_recipients_per_message),
      max_domains: field(data, "maxDomains", :max_domains),
      max_api_keys: field(data, "maxApiKeys", :max_api_keys),
      max_webhooks: field(data, "maxWebhooks", :max_webhooks),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ProjectLimitsModel to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("dailySends", value.daily_sends, true)
    |> ApolloSignal.Types.put_field("perSecondSends", value.per_second_sends, true)
    |> ApolloSignal.Types.put_field("maxRecipientsPerMessage", value.max_recipients_per_message, true)
    |> ApolloSignal.Types.put_field("maxDomains", value.max_domains, true)
    |> ApolloSignal.Types.put_field("maxApiKeys", value.max_api_keys, true)
    |> ApolloSignal.Types.put_field("maxWebhooks", value.max_webhooks, true)
  end
end

defmodule ApolloSignal.Types.ProjectTrackingSettingsModel do
  @moduledoc "Typed ProjectTrackingSettingsModel model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:open_tracking, :click_tracking, :unsubscribe_tracking, :read_engagement]
  defstruct [open_tracking: nil, click_tracking: nil, unsubscribe_tracking: nil, read_engagement: nil, scroll_depth: nil]

  @type t() :: %__MODULE__{open_tracking: boolean(), click_tracking: boolean(), unsubscribe_tracking: boolean(), read_engagement: boolean(), scroll_depth: boolean() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      open_tracking: field(data, "openTracking", :open_tracking),
      click_tracking: field(data, "clickTracking", :click_tracking),
      unsubscribe_tracking: field(data, "unsubscribeTracking", :unsubscribe_tracking),
      read_engagement: field(data, "readEngagement", :read_engagement),
      scroll_depth: field(data, "scrollDepth", :scroll_depth),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ProjectTrackingSettingsModel to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("openTracking", value.open_tracking, true)
    |> ApolloSignal.Types.put_field("clickTracking", value.click_tracking, true)
    |> ApolloSignal.Types.put_field("unsubscribeTracking", value.unsubscribe_tracking, true)
    |> ApolloSignal.Types.put_field("readEngagement", value.read_engagement, true)
    |> ApolloSignal.Types.put_field("scrollDepth", value.scroll_depth, false)
  end
end

defmodule ApolloSignal.Types.ProjectResponse do
  @moduledoc "Typed ProjectResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:id, :name, :slug, :status, :suspension_reason, :region, :limits, :tracking_settings, :created_at, :updated_at]
  defstruct [id: nil, name: nil, slug: nil, status: nil, suspension_reason: nil, region: nil, limits: nil, tracking_settings: nil, created_at: nil, updated_at: nil]

  @type t() :: %__MODULE__{id: String.t(), name: String.t(), slug: String.t(), status: String.t(), suspension_reason: String.t() | nil, region: String.t(), limits: ApolloSignal.Types.ProjectLimitsModel.t(), tracking_settings: ApolloSignal.Types.ProjectTrackingSettingsModel.t(), created_at: String.t(), updated_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      name: field(data, "name", :name),
      slug: field(data, "slug", :slug),
      status: field(data, "status", :status),
      suspension_reason: decode_nullable(field(data, "suspensionReason", :suspension_reason), fn value -> value end),
      region: field(data, "region", :region),
      limits: ApolloSignal.Types.from_project_limits_model(field(data, "limits", :limits)),
      tracking_settings: ApolloSignal.Types.from_project_tracking_settings_model(field(data, "trackingSettings", :tracking_settings)),
      created_at: field(data, "createdAt", :created_at),
      updated_at: field(data, "updatedAt", :updated_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ProjectResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("slug", value.slug, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("suspensionReason", value.suspension_reason, true)
    |> ApolloSignal.Types.put_field("region", value.region, true)
    |> ApolloSignal.Types.put_field("limits", value.limits, true)
    |> ApolloSignal.Types.put_field("trackingSettings", value.tracking_settings, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
  end
end

defmodule ApolloSignal.Types.ProjectPageResponse do
  @moduledoc "Typed ProjectPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.ProjectResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_project_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ProjectPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.UpdateProjectRequest do
  @moduledoc "Typed UpdateProjectRequest model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  defstruct [name: nil, slug: nil, limits: nil, tracking_settings: nil]

  @type t() :: %__MODULE__{name: String.t() | nil, slug: String.t() | nil, limits: ApolloSignal.Types.ProjectLimitsModel.t() | nil, tracking_settings: ApolloSignal.Types.ProjectTrackingSettingsModel.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      name: decode_nullable(field(data, "name", :name), fn value -> value end),
      slug: decode_nullable(field(data, "slug", :slug), fn value -> value end),
      limits: decode_nullable(field(data, "limits", :limits), fn value -> ApolloSignal.Types.from_project_limits_model(value) end),
      tracking_settings: decode_nullable(field(data, "trackingSettings", :tracking_settings), fn value -> ApolloSignal.Types.from_project_tracking_settings_model(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected UpdateProjectRequest to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("slug", value.slug, true)
    |> ApolloSignal.Types.put_field("limits", value.limits, true)
    |> ApolloSignal.Types.put_field("trackingSettings", value.tracking_settings, true)
  end
end

defmodule ApolloSignal.Types.EmailPageResponse do
  @moduledoc "Typed EmailPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.EmailDetailResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_email_detail_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected EmailPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.EmailTimelineItem do
  @moduledoc "Typed EmailTimelineItem model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_map: 2,
    field: 3
  ]

  @enforce_keys [:id, :type, :provider_event_id, :payload, :occurred_at, :created_at]
  defstruct [id: nil, type: nil, provider_event_id: nil, payload: nil, occurred_at: nil, created_at: nil]

  @type t() :: %__MODULE__{id: String.t(), type: String.t(), provider_event_id: String.t() | nil, payload: %{optional(String.t()) => String.t() | nil} | nil, occurred_at: String.t(), created_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      type: field(data, "type", :type),
      provider_event_id: decode_nullable(field(data, "providerEventId", :provider_event_id), fn value -> value end),
      payload: decode_map(field(data, "payload", :payload), fn value -> decode_nullable(value, fn value -> value end) end),
      occurred_at: field(data, "occurredAt", :occurred_at),
      created_at: field(data, "createdAt", :created_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected EmailTimelineItem to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("type", value.type, true)
    |> ApolloSignal.Types.put_field("providerEventId", value.provider_event_id, true)
    |> ApolloSignal.Types.put_field("payload", value.payload, true)
    |> ApolloSignal.Types.put_field("occurredAt", value.occurred_at, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
  end
end

defmodule ApolloSignal.Types.EmailTimelineResponse do
  @moduledoc "Typed EmailTimelineResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:items]
  defstruct [items: nil]

  @type t() :: %__MODULE__{items: list(ApolloSignal.Types.EmailTimelineItem.t())}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      items: decode_list(field(data, "items", :items), fn value -> ApolloSignal.Types.from_email_timeline_item(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected EmailTimelineResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("items", value.items, true)
  end
end

defmodule ApolloSignal.Types.DomainListItemResponse do
  @moduledoc "Typed DomainListItemResponse model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:id, :domain, :region, :status, :dkim_status, :bimi_status, :tracking_status, :updated_at]
  defstruct [id: nil, domain: nil, region: nil, status: nil, dkim_status: nil, bimi_status: nil, tracking_status: nil, updated_at: nil]

  @type t() :: %__MODULE__{id: String.t(), domain: String.t(), region: String.t(), status: String.t(), dkim_status: String.t(), bimi_status: String.t(), tracking_status: String.t(), updated_at: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      domain: field(data, "domain", :domain),
      region: field(data, "region", :region),
      status: field(data, "status", :status),
      dkim_status: field(data, "dkimStatus", :dkim_status),
      bimi_status: field(data, "bimiStatus", :bimi_status),
      tracking_status: field(data, "trackingStatus", :tracking_status),
      updated_at: field(data, "updatedAt", :updated_at),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected DomainListItemResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("domain", value.domain, true)
    |> ApolloSignal.Types.put_field("region", value.region, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("dkimStatus", value.dkim_status, true)
    |> ApolloSignal.Types.put_field("bimiStatus", value.bimi_status, true)
    |> ApolloSignal.Types.put_field("trackingStatus", value.tracking_status, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
  end
end

defmodule ApolloSignal.Types.DomainListPageResponse do
  @moduledoc "Typed DomainListPageResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:data, :page]
  defstruct [data: nil, page: nil]

  @type t() :: %__MODULE__{data: list(ApolloSignal.Types.DomainListItemResponse.t()), page: ApolloSignal.Types.PageInfo.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      data: decode_list(field(data, "data", :data), fn value -> ApolloSignal.Types.from_domain_list_item_response(value) end),
      page: ApolloSignal.Types.from_page_info(field(data, "page", :page)),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected DomainListPageResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("data", value.data, true)
    |> ApolloSignal.Types.put_field("page", value.page, true)
  end
end

defmodule ApolloSignal.Types.DkimRecordResponse do
  @moduledoc "Typed DkimRecordResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:name, :type, :value]
  defstruct [name: nil, type: nil, value: nil, status: nil]

  @type t() :: %__MODULE__{name: String.t(), type: String.t(), value: String.t(), status: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      name: field(data, "name", :name),
      type: field(data, "type", :type),
      value: field(data, "value", :value),
      status: decode_nullable(field(data, "status", :status), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected DkimRecordResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("type", value.type, true)
    |> ApolloSignal.Types.put_field("value", value.value, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
  end
end

defmodule ApolloSignal.Types.DnsRecordResponse do
  @moduledoc "Typed DnsRecordResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:name, :type, :value]
  defstruct [name: nil, type: nil, value: nil, priority: nil, optional: nil, status: nil]

  @type t() :: %__MODULE__{name: String.t(), type: String.t(), value: String.t(), priority: integer() | nil, optional: boolean() | nil, status: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      name: field(data, "name", :name),
      type: field(data, "type", :type),
      value: field(data, "value", :value),
      priority: decode_nullable(field(data, "priority", :priority), fn value -> value end),
      optional: decode_nullable(field(data, "optional", :optional), fn value -> value end),
      status: decode_nullable(field(data, "status", :status), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected DnsRecordResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("name", value.name, true)
    |> ApolloSignal.Types.put_field("type", value.type, true)
    |> ApolloSignal.Types.put_field("value", value.value, true)
    |> ApolloSignal.Types.put_field("priority", value.priority, true)
    |> ApolloSignal.Types.put_field("optional", value.optional, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
  end
end

defmodule ApolloSignal.Types.VerificationRecordsResponse do
  @moduledoc "Typed VerificationRecordsResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    decode_list: 2,
    field: 3
  ]

  @enforce_keys [:dkim, :mail_from_mx, :mail_from_spf]
  defstruct [dkim: nil, mail_from_mx: nil, mail_from_spf: nil, dmarc_recommended: nil, bimi: nil, tracking_cname: nil]

  @type t() :: %__MODULE__{dkim: list(ApolloSignal.Types.DkimRecordResponse.t()), mail_from_mx: ApolloSignal.Types.DnsRecordResponse.t(), mail_from_spf: ApolloSignal.Types.DnsRecordResponse.t(), dmarc_recommended: ApolloSignal.Types.DnsRecordResponse.t() | nil, bimi: ApolloSignal.Types.DnsRecordResponse.t() | nil, tracking_cname: ApolloSignal.Types.DnsRecordResponse.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      dkim: decode_list(field(data, "dkim", :dkim), fn value -> ApolloSignal.Types.from_dkim_record_response(value) end),
      mail_from_mx: ApolloSignal.Types.from_dns_record_response(field(data, "mailFromMx", :mail_from_mx)),
      mail_from_spf: ApolloSignal.Types.from_dns_record_response(field(data, "mailFromSpf", :mail_from_spf)),
      dmarc_recommended: decode_nullable(field(data, "dmarcRecommended", :dmarc_recommended), fn value -> ApolloSignal.Types.from_dns_record_response(value) end),
      bimi: decode_nullable(field(data, "bimi", :bimi), fn value -> ApolloSignal.Types.from_dns_record_response(value) end),
      tracking_cname: decode_nullable(field(data, "trackingCname", :tracking_cname), fn value -> ApolloSignal.Types.from_dns_record_response(value) end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected VerificationRecordsResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("dkim", value.dkim, true)
    |> ApolloSignal.Types.put_field("mailFromMx", value.mail_from_mx, true)
    |> ApolloSignal.Types.put_field("mailFromSpf", value.mail_from_spf, true)
    |> ApolloSignal.Types.put_field("dmarcRecommended", value.dmarc_recommended, true)
    |> ApolloSignal.Types.put_field("bimi", value.bimi, true)
    |> ApolloSignal.Types.put_field("trackingCname", value.tracking_cname, true)
  end
end

defmodule ApolloSignal.Types.DomainResponse do
  @moduledoc "Typed DomainResponse model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  @enforce_keys [:id, :project_id, :domain, :region, :status, :dkim_status, :spf_status, :dmarc_status, :mail_from_status, :mail_from_domain, :verification_records, :bimi_status, :bimi_logo_url, :created_at, :updated_at, :verified_at]
  defstruct [id: nil, project_id: nil, domain: nil, region: nil, status: nil, dkim_status: nil, spf_status: nil, dmarc_status: nil, mail_from_status: nil, mail_from_domain: nil, verification_records: nil, bimi_status: nil, bimi_logo_url: nil, created_at: nil, updated_at: nil, verified_at: nil]

  @type t() :: %__MODULE__{id: String.t(), project_id: String.t(), domain: String.t(), region: String.t(), status: String.t(), dkim_status: String.t(), spf_status: String.t(), dmarc_status: String.t(), mail_from_status: String.t(), mail_from_domain: String.t(), verification_records: ApolloSignal.Types.VerificationRecordsResponse.t(), bimi_status: String.t(), bimi_logo_url: String.t() | nil, created_at: String.t(), updated_at: String.t(), verified_at: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      id: field(data, "id", :id),
      project_id: field(data, "projectId", :project_id),
      domain: field(data, "domain", :domain),
      region: field(data, "region", :region),
      status: field(data, "status", :status),
      dkim_status: field(data, "dkimStatus", :dkim_status),
      spf_status: field(data, "spfStatus", :spf_status),
      dmarc_status: field(data, "dmarcStatus", :dmarc_status),
      mail_from_status: field(data, "mailFromStatus", :mail_from_status),
      mail_from_domain: field(data, "mailFromDomain", :mail_from_domain),
      verification_records: ApolloSignal.Types.from_verification_records_response(field(data, "verificationRecords", :verification_records)),
      bimi_status: field(data, "bimiStatus", :bimi_status),
      bimi_logo_url: decode_nullable(field(data, "bimiLogoUrl", :bimi_logo_url), fn value -> value end),
      created_at: field(data, "createdAt", :created_at),
      updated_at: field(data, "updatedAt", :updated_at),
      verified_at: decode_nullable(field(data, "verifiedAt", :verified_at), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected DomainResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("id", value.id, true)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, true)
    |> ApolloSignal.Types.put_field("domain", value.domain, true)
    |> ApolloSignal.Types.put_field("region", value.region, true)
    |> ApolloSignal.Types.put_field("status", value.status, true)
    |> ApolloSignal.Types.put_field("dkimStatus", value.dkim_status, true)
    |> ApolloSignal.Types.put_field("spfStatus", value.spf_status, true)
    |> ApolloSignal.Types.put_field("dmarcStatus", value.dmarc_status, true)
    |> ApolloSignal.Types.put_field("mailFromStatus", value.mail_from_status, true)
    |> ApolloSignal.Types.put_field("mailFromDomain", value.mail_from_domain, true)
    |> ApolloSignal.Types.put_field("verificationRecords", value.verification_records, true)
    |> ApolloSignal.Types.put_field("bimiStatus", value.bimi_status, true)
    |> ApolloSignal.Types.put_field("bimiLogoUrl", value.bimi_logo_url, true)
    |> ApolloSignal.Types.put_field("createdAt", value.created_at, true)
    |> ApolloSignal.Types.put_field("updatedAt", value.updated_at, true)
    |> ApolloSignal.Types.put_field("verifiedAt", value.verified_at, true)
  end
end

defmodule ApolloSignal.Types.RegisterDomainRequest do
  @moduledoc "Typed RegisterDomainRequest model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  @enforce_keys [:domain, :region]
  defstruct [domain: nil, region: nil]

  @type t() :: %__MODULE__{domain: String.t(), region: String.t()}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      domain: field(data, "domain", :domain),
      region: field(data, "region", :region),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected RegisterDomainRequest to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("domain", value.domain, true)
    |> ApolloSignal.Types.put_field("region", value.region, true)
  end
end

defmodule ApolloSignal.Types.UpdateBimiRequest do
  @moduledoc "Typed UpdateBimiRequest model."

  import ApolloSignal.Types, only: [
    decode_nullable: 2,
    field: 3
  ]

  defstruct [logo_url: nil]

  @type t() :: %__MODULE__{logo_url: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      logo_url: decode_nullable(field(data, "logoUrl", :logo_url), fn value -> value end),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected UpdateBimiRequest to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("logoUrl", value.logo_url, true)
  end
end

defmodule ApolloSignal.Types.EmailValidationStatusInput do
  @moduledoc "Typed EmailValidationStatusInput enum."

  @type t() :: :valid | :risky | :invalid | :unknown

  @spec from(term()) :: t()
  def from(value), do: ApolloSignal.Types.from_email_validation_status_input(value)
end

defmodule ApolloSignal.Types.GetTopicPerformanceQuery do
  @moduledoc "Typed GetTopicPerformanceQuery model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  defstruct [window: nil, project_id: nil]

  @type t() :: %__MODULE__{window: String.t() | nil, project_id: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      window: field(data, "window", :window),
      project_id: field(data, "projectId", :project_id),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected GetTopicPerformanceQuery to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("window", value.window, false)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, false)
  end
end

defmodule ApolloSignal.Types.GetProjectMetricsSummaryQuery do
  @moduledoc "Typed GetProjectMetricsSummaryQuery model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  defstruct [window: nil, project_id: nil]

  @type t() :: %__MODULE__{window: String.t() | nil, project_id: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      window: field(data, "window", :window),
      project_id: field(data, "projectId", :project_id),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected GetProjectMetricsSummaryQuery to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("window", value.window, false)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, false)
  end
end

defmodule ApolloSignal.Types.GetProjectMetricsTimelineQuery do
  @moduledoc "Typed GetProjectMetricsTimelineQuery model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  defstruct [window: nil, granularity: nil, format: nil, project_id: nil]

  @type t() :: %__MODULE__{window: String.t() | nil, granularity: String.t() | nil, format: String.t() | nil, project_id: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      window: field(data, "window", :window),
      granularity: field(data, "granularity", :granularity),
      format: field(data, "format", :format),
      project_id: field(data, "projectId", :project_id),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected GetProjectMetricsTimelineQuery to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("window", value.window, false)
    |> ApolloSignal.Types.put_field("granularity", value.granularity, false)
    |> ApolloSignal.Types.put_field("format", value.format, false)
    |> ApolloSignal.Types.put_field("projectId", value.project_id, false)
  end
end

defmodule ApolloSignal.Types.GetMetricsAdvisorQuery do
  @moduledoc "Typed GetMetricsAdvisorQuery model."

  import ApolloSignal.Types, only: [
    field: 3
  ]

  defstruct [project_id: nil]

  @type t() :: %__MODULE__{project_id: String.t() | nil}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      project_id: field(data, "projectId", :project_id),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected GetMetricsAdvisorQuery to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> ApolloSignal.Types.put_field("projectId", value.project_id, false)
  end
end

defmodule ApolloSignal.Types.ListApiKeysResponse do
  @moduledoc "Typed ListApiKeysResponse model."

  import ApolloSignal.Types, only: [
    decode_list: 2
  ]

  defstruct [additional_properties: %{}]

  @type t() :: %__MODULE__{additional_properties: %{optional(String.t()) => list(ApolloSignal.Types.ApiKey.t())}}

  @spec from_map(map()) :: t()
  def from_map(data) when is_map(data) do
    %__MODULE__{
      additional_properties:
        ApolloSignal.Types.decode_map(
          ApolloSignal.Types.extra_fields(data, []),
          fn value -> decode_list(value, fn value -> ApolloSignal.Types.from_api_key(value) end) end
        ),
    }
  end

  def from_map(_value), do: raise(ArgumentError, "expected ListApiKeysResponse to be a map")

  @spec to_map(t()) :: map()
  def to_map(value) do
    %{}
    |> Map.merge(ApolloSignal.Types.encode(value.additional_properties))
  end
end

