defmodule ApolloSignal.Client do
  @moduledoc "Main client for Apollo Signal API."

  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors

  defstruct [:transport]

  @type t() :: %__MODULE__{transport: Transport.t()}

  @spec new(keyword()) :: t()
  def new(opts \\ []) do
    %__MODULE__{transport: Transport.new(opts)}
  end

  @spec transport(t()) :: Transport.t()
  def transport(%__MODULE__{transport: transport}), do: transport

  @doc "Access the emails API domain."
  @spec emails(t()) :: ApolloSignal.Domains.Emails.t()
  def emails(%__MODULE__{} = client), do: ApolloSignal.Domains.Emails.new(client)

  @doc "Access the metrics API domain."
  @spec metrics(t()) :: ApolloSignal.Domains.Metrics.t()
  def metrics(%__MODULE__{} = client), do: ApolloSignal.Domains.Metrics.new(client)

  @doc "Access the suppressions API domain."
  @spec suppressions(t()) :: ApolloSignal.Domains.Suppressions.t()
  def suppressions(%__MODULE__{} = client), do: ApolloSignal.Domains.Suppressions.new(client)

  @doc "Access the segments API domain."
  @spec segments(t()) :: ApolloSignal.Domains.Segments.t()
  def segments(%__MODULE__{} = client), do: ApolloSignal.Domains.Segments.new(client)

  @doc "Access the topics API domain."
  @spec topics(t()) :: ApolloSignal.Domains.Topics.t()
  def topics(%__MODULE__{} = client), do: ApolloSignal.Domains.Topics.new(client)

  @doc "Access the contactProperties API domain."
  @spec contact_properties(t()) :: ApolloSignal.Domains.ContactProperties.t()
  def contact_properties(%__MODULE__{} = client), do: ApolloSignal.Domains.ContactProperties.new(client)

  @doc "Access the contacts API domain."
  @spec contacts(t()) :: ApolloSignal.Domains.Contacts.t()
  def contacts(%__MODULE__{} = client), do: ApolloSignal.Domains.Contacts.new(client)

  @doc "Access the webhooks API domain."
  @spec webhooks(t()) :: ApolloSignal.Domains.Webhooks.t()
  def webhooks(%__MODULE__{} = client), do: ApolloSignal.Domains.Webhooks.new(client)

  @doc "Access the apiKeys API domain."
  @spec api_keys(t()) :: ApolloSignal.Domains.ApiKeys.t()
  def api_keys(%__MODULE__{} = client), do: ApolloSignal.Domains.ApiKeys.new(client)

  @doc "Access the projects API domain."
  @spec projects(t()) :: ApolloSignal.Domains.Projects.t()
  def projects(%__MODULE__{} = client), do: ApolloSignal.Domains.Projects.new(client)

  @doc "Access the sendingDomains API domain."
  @spec sending_domains(t()) :: ApolloSignal.Domains.SendingDomains.t()
  def sending_domains(%__MODULE__{} = client), do: ApolloSignal.Domains.SendingDomains.new(client)

  @spec send_email(client :: t(), body :: ApolloSignal.Types.SendEmailRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SendEmailResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def send_email(%__MODULE__{} = client, body, options \\ []) do
    ApolloSignal.Domains.Emails.send_email(ApolloSignal.Domains.Emails.new(client), body, options)
  end

  @spec get_email(client :: t(), email_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailDetailResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_email(%__MODULE__{} = client, email_id, options \\ []) do
    ApolloSignal.Domains.Emails.get_email(ApolloSignal.Domains.Emails.new(client), email_id, options)
  end

  @spec batch_send_emails(client :: t(), body :: ApolloSignal.Types.BatchSendRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.BatchSendResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def batch_send_emails(%__MODULE__{} = client, body, options \\ []) do
    ApolloSignal.Domains.Emails.batch_send_emails(ApolloSignal.Domains.Emails.new(client), body, options)
  end

  @spec cancel_email(client :: t(), email_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.CancelResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def cancel_email(%__MODULE__{} = client, email_id, options \\ []) do
    ApolloSignal.Domains.Emails.cancel_email(ApolloSignal.Domains.Emails.new(client), email_id, options)
  end

  @spec bulk_cancel_emails(client :: t(), options :: keyword()) :: {:ok, ApolloSignal.Types.BulkCancelResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def bulk_cancel_emails(%__MODULE__{} = client, options \\ []) do
    ApolloSignal.Domains.Emails.bulk_cancel_emails(ApolloSignal.Domains.Emails.new(client), options)
  end

  @spec issue_stream_token(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.StreamTokenResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def issue_stream_token(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.Emails.issue_stream_token(ApolloSignal.Domains.Emails.new(client), project_id, options)
  end

  @spec stream_email_events(client :: t(), options :: keyword()) :: {:ok, Transport.SSEStream.t(ApolloSignal.Types.StreamEventResponse.t())} | {:error, Errors.t()}
  def stream_email_events(%__MODULE__{} = client, options \\ []) do
    ApolloSignal.Domains.Emails.stream_email_events(ApolloSignal.Domains.Emails.new(client), options)
  end

  @spec validate_links(client :: t(), body :: ApolloSignal.Types.ValidateLinksRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ValidateLinksResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def validate_links(%__MODULE__{} = client, body, options \\ []) do
    ApolloSignal.Domains.Emails.validate_links(ApolloSignal.Domains.Emails.new(client), body, options)
  end

  @spec get_topic_performance(client :: t(), id :: String.t(), query :: ApolloSignal.Types.GetTopicPerformanceQuery.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.TopicPerformanceResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_topic_performance(%__MODULE__{} = client, id, query \\ %{}, options \\ []) do
    ApolloSignal.Domains.Metrics.get_topic_performance(ApolloSignal.Domains.Metrics.new(client), id, query, options)
  end

  @spec get_email_performance(client :: t(), id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailPerformanceResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_email_performance(%__MODULE__{} = client, id, options \\ []) do
    ApolloSignal.Domains.Metrics.get_email_performance(ApolloSignal.Domains.Metrics.new(client), id, options)
  end

  @spec get_email_engagement(client :: t(), id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailReadScrollAnalyticsResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_email_engagement(%__MODULE__{} = client, id, options \\ []) do
    ApolloSignal.Domains.Metrics.get_email_engagement(ApolloSignal.Domains.Metrics.new(client), id, options)
  end

  @spec get_project_metrics_summary(client :: t(), query :: ApolloSignal.Types.GetProjectMetricsSummaryQuery.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ProjectMetricsSummaryResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_project_metrics_summary(%__MODULE__{} = client, query \\ %{}, options \\ []) do
    ApolloSignal.Domains.Metrics.get_project_metrics_summary(ApolloSignal.Domains.Metrics.new(client), query, options)
  end

  @spec get_project_metrics_timeline(client :: t(), query :: ApolloSignal.Types.GetProjectMetricsTimelineQuery.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ProjectMetricsTimelineResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_project_metrics_timeline(%__MODULE__{} = client, query \\ %{}, options \\ []) do
    ApolloSignal.Domains.Metrics.get_project_metrics_timeline(ApolloSignal.Domains.Metrics.new(client), query, options)
  end

  @spec get_metrics_advisor(client :: t(), query :: ApolloSignal.Types.GetMetricsAdvisorQuery.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.AdvisorReportResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_metrics_advisor(%__MODULE__{} = client, query \\ %{}, options \\ []) do
    ApolloSignal.Domains.Metrics.get_metrics_advisor(ApolloSignal.Domains.Metrics.new(client), query, options)
  end

  @spec list_suppressions(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SuppressionPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_suppressions(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.Suppressions.list_suppressions(ApolloSignal.Domains.Suppressions.new(client), project_id, options)
  end

  @spec export_suppressions(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def export_suppressions(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.Suppressions.export_suppressions(ApolloSignal.Domains.Suppressions.new(client), project_id, options)
  end

  @spec add_suppression(client :: t(), project_id :: String.t(), body :: ApolloSignal.Types.AddSuppressionBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SuppressionResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def add_suppression(%__MODULE__{} = client, project_id, body, options \\ []) do
    ApolloSignal.Domains.Suppressions.add_suppression(ApolloSignal.Domains.Suppressions.new(client), project_id, body, options)
  end

  @spec remove_suppression(client :: t(), project_id :: String.t(), email :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def remove_suppression(%__MODULE__{} = client, project_id, email, options \\ []) do
    ApolloSignal.Domains.Suppressions.remove_suppression(ApolloSignal.Domains.Suppressions.new(client), project_id, email, options)
  end

  @spec import_suppressions(client :: t(), project_id :: String.t(), body :: ApolloSignal.Types.SuppressionImportBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SuppressionImportResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def import_suppressions(%__MODULE__{} = client, project_id, body, options \\ []) do
    ApolloSignal.Domains.Suppressions.import_suppressions(ApolloSignal.Domains.Suppressions.new(client), project_id, body, options)
  end

  @spec list_segments(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SegmentPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_segments(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.Segments.list_segments(ApolloSignal.Domains.Segments.new(client), project_id, options)
  end

  @spec get_segment(client :: t(), project_id :: String.t(), segment_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SegmentResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_segment(%__MODULE__{} = client, project_id, segment_id, options \\ []) do
    ApolloSignal.Domains.Segments.get_segment(ApolloSignal.Domains.Segments.new(client), project_id, segment_id, options)
  end

  @spec list_contacts_in_segment(client :: t(), project_id :: String.t(), segment_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.CursorPage.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_contacts_in_segment(%__MODULE__{} = client, project_id, segment_id, options \\ []) do
    ApolloSignal.Domains.Segments.list_contacts_in_segment(ApolloSignal.Domains.Segments.new(client), project_id, segment_id, options)
  end

  @spec create_segment(client :: t(), project_id :: String.t(), body :: ApolloSignal.Types.CreateSegmentBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SegmentResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def create_segment(%__MODULE__{} = client, project_id, body, options \\ []) do
    ApolloSignal.Domains.Segments.create_segment(ApolloSignal.Domains.Segments.new(client), project_id, body, options)
  end

  @spec delete_segment(client :: t(), project_id :: String.t(), segment_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_segment(%__MODULE__{} = client, project_id, segment_id, options \\ []) do
    ApolloSignal.Domains.Segments.delete_segment(ApolloSignal.Domains.Segments.new(client), project_id, segment_id, options)
  end

  @spec list_topics(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.TopicPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_topics(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.Topics.list_topics(ApolloSignal.Domains.Topics.new(client), project_id, options)
  end

  @spec get_topic(client :: t(), project_id :: String.t(), topic_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.TopicResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_topic(%__MODULE__{} = client, project_id, topic_id, options \\ []) do
    ApolloSignal.Domains.Topics.get_topic(ApolloSignal.Domains.Topics.new(client), project_id, topic_id, options)
  end

  @spec list_contacts_in_topic(client :: t(), project_id :: String.t(), topic_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.CursorPage.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_contacts_in_topic(%__MODULE__{} = client, project_id, topic_id, options \\ []) do
    ApolloSignal.Domains.Topics.list_contacts_in_topic(ApolloSignal.Domains.Topics.new(client), project_id, topic_id, options)
  end

  @spec create_topic(client :: t(), project_id :: String.t(), body :: ApolloSignal.Types.CreateTopicBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.TopicResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def create_topic(%__MODULE__{} = client, project_id, body, options \\ []) do
    ApolloSignal.Domains.Topics.create_topic(ApolloSignal.Domains.Topics.new(client), project_id, body, options)
  end

  @spec update_topic(client :: t(), project_id :: String.t(), topic_id :: String.t(), body :: ApolloSignal.Types.UpdateTopicBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.TopicResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_topic(%__MODULE__{} = client, project_id, topic_id, body, options \\ []) do
    ApolloSignal.Domains.Topics.update_topic(ApolloSignal.Domains.Topics.new(client), project_id, topic_id, body, options)
  end

  @spec delete_topic(client :: t(), project_id :: String.t(), topic_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_topic(%__MODULE__{} = client, project_id, topic_id, options \\ []) do
    ApolloSignal.Domains.Topics.delete_topic(ApolloSignal.Domains.Topics.new(client), project_id, topic_id, options)
  end

  @spec list_contact_properties(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPropertyPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_contact_properties(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.ContactProperties.list_contact_properties(ApolloSignal.Domains.ContactProperties.new(client), project_id, options)
  end

  @spec get_contact_property(client :: t(), project_id :: String.t(), property_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPropertyResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_property(%__MODULE__{} = client, project_id, property_id, options \\ []) do
    ApolloSignal.Domains.ContactProperties.get_contact_property(ApolloSignal.Domains.ContactProperties.new(client), project_id, property_id, options)
  end

  @spec create_contact_property(client :: t(), project_id :: String.t(), body :: ApolloSignal.Types.CreateContactPropertyBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPropertyResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def create_contact_property(%__MODULE__{} = client, project_id, body, options \\ []) do
    ApolloSignal.Domains.ContactProperties.create_contact_property(ApolloSignal.Domains.ContactProperties.new(client), project_id, body, options)
  end

  @spec update_contact_property(client :: t(), project_id :: String.t(), property_id :: String.t(), body :: ApolloSignal.Types.UpdateContactPropertyBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPropertyResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_contact_property(%__MODULE__{} = client, project_id, property_id, body, options \\ []) do
    ApolloSignal.Domains.ContactProperties.update_contact_property(ApolloSignal.Domains.ContactProperties.new(client), project_id, property_id, body, options)
  end

  @spec delete_contact_property(client :: t(), project_id :: String.t(), property_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_contact_property(%__MODULE__{} = client, project_id, property_id, options \\ []) do
    ApolloSignal.Domains.ContactProperties.delete_contact_property(ApolloSignal.Domains.ContactProperties.new(client), project_id, property_id, options)
  end

  @spec list_contacts(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_contacts(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.Contacts.list_contacts(ApolloSignal.Domains.Contacts.new(client), project_id, options)
  end

  @spec get_contact(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.get_contact(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec list_contact_segments(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.list_contact_segments_response(), Transport.metadata()} | {:error, Errors.t()}
  def list_contact_segments(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.list_contact_segments(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec get_contact_topics(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.get_contact_topics_response(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_topics(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.get_contact_topics(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec create_contact(client :: t(), project_id :: String.t(), body :: ApolloSignal.Types.CreateContactBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def create_contact(%__MODULE__{} = client, project_id, body, options \\ []) do
    ApolloSignal.Domains.Contacts.create_contact(ApolloSignal.Domains.Contacts.new(client), project_id, body, options)
  end

  @spec update_contact(client :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.UpdateContactBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_contact(%__MODULE__{} = client, project_id, contact_id, body, options \\ []) do
    ApolloSignal.Domains.Contacts.update_contact(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, body, options)
  end

  @spec delete_contact(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_contact(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.delete_contact(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec upload_contact_image(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def upload_contact_image(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.upload_contact_image(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec set_contact_image_url(client :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.SetImageUrlBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def set_contact_image_url(%__MODULE__{} = client, project_id, contact_id, body, options \\ []) do
    ApolloSignal.Domains.Contacts.set_contact_image_url(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, body, options)
  end

  @spec delete_contact_image(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_contact_image(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.delete_contact_image(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec add_contact_to_segment(client :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.AddToSegmentBody.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def add_contact_to_segment(%__MODULE__{} = client, project_id, contact_id, body, options \\ []) do
    ApolloSignal.Domains.Contacts.add_contact_to_segment(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, body, options)
  end

  @spec remove_contact_from_segment(client :: t(), project_id :: String.t(), contact_id :: String.t(), segment_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def remove_contact_from_segment(%__MODULE__{} = client, project_id, contact_id, segment_id, options \\ []) do
    ApolloSignal.Domains.Contacts.remove_contact_from_segment(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, segment_id, options)
  end

  @spec update_contact_topics(client :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.UpdateTopicsBody.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def update_contact_topics(%__MODULE__{} = client, project_id, contact_id, body, options \\ []) do
    ApolloSignal.Domains.Contacts.update_contact_topics(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, body, options)
  end

  @spec get_contact_activity(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.get_contact_activity_response(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_activity(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.get_contact_activity(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec get_contact_engagement_score(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EngagementScoreResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_engagement_score(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.get_contact_engagement_score(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec get_contact_email_validation_status(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailValidationStatusResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_email_validation_status(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.get_contact_email_validation_status(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec refresh_contact_engagement_score(client :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EngagementScoreResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def refresh_contact_engagement_score(%__MODULE__{} = client, project_id, contact_id, options \\ []) do
    ApolloSignal.Domains.Contacts.refresh_contact_engagement_score(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, options)
  end

  @spec record_contact_email_validation(client :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.RecordValidationBody.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def record_contact_email_validation(%__MODULE__{} = client, project_id, contact_id, body, options \\ []) do
    ApolloSignal.Domains.Contacts.record_contact_email_validation(ApolloSignal.Domains.Contacts.new(client), project_id, contact_id, body, options)
  end

  @spec list_webhooks(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_webhooks(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.Webhooks.list_webhooks(ApolloSignal.Domains.Webhooks.new(client), project_id, options)
  end

  @spec get_webhook(client :: t(), project_id :: String.t(), endpoint_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_webhook(%__MODULE__{} = client, project_id, endpoint_id, options \\ []) do
    ApolloSignal.Domains.Webhooks.get_webhook(ApolloSignal.Domains.Webhooks.new(client), project_id, endpoint_id, options)
  end

  @spec list_webhook_deliveries(client :: t(), project_id :: String.t(), endpoint_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookDeliveryPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_webhook_deliveries(%__MODULE__{} = client, project_id, endpoint_id, options \\ []) do
    ApolloSignal.Domains.Webhooks.list_webhook_deliveries(ApolloSignal.Domains.Webhooks.new(client), project_id, endpoint_id, options)
  end

  @spec get_webhook_delivery(client :: t(), project_id :: String.t(), endpoint_id :: String.t(), delivery_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookDeliveryResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_webhook_delivery(%__MODULE__{} = client, project_id, endpoint_id, delivery_id, options \\ []) do
    ApolloSignal.Domains.Webhooks.get_webhook_delivery(ApolloSignal.Domains.Webhooks.new(client), project_id, endpoint_id, delivery_id, options)
  end

  @spec create_webhook(client :: t(), project_id :: String.t(), body :: ApolloSignal.Types.CreateWebhookBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookCreateResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def create_webhook(%__MODULE__{} = client, project_id, body, options \\ []) do
    ApolloSignal.Domains.Webhooks.create_webhook(ApolloSignal.Domains.Webhooks.new(client), project_id, body, options)
  end

  @spec update_webhook(client :: t(), project_id :: String.t(), endpoint_id :: String.t(), body :: ApolloSignal.Types.UpdateWebhookBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_webhook(%__MODULE__{} = client, project_id, endpoint_id, body, options \\ []) do
    ApolloSignal.Domains.Webhooks.update_webhook(ApolloSignal.Domains.Webhooks.new(client), project_id, endpoint_id, body, options)
  end

  @spec delete_webhook(client :: t(), project_id :: String.t(), endpoint_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_webhook(%__MODULE__{} = client, project_id, endpoint_id, options \\ []) do
    ApolloSignal.Domains.Webhooks.delete_webhook(ApolloSignal.Domains.Webhooks.new(client), project_id, endpoint_id, options)
  end

  @spec test_webhook(client :: t(), project_id :: String.t(), endpoint_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookDeliveryResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def test_webhook(%__MODULE__{} = client, project_id, endpoint_id, options \\ []) do
    ApolloSignal.Domains.Webhooks.test_webhook(ApolloSignal.Domains.Webhooks.new(client), project_id, endpoint_id, options)
  end

  @spec replay_webhook_delivery(client :: t(), project_id :: String.t(), endpoint_id :: String.t(), delivery_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def replay_webhook_delivery(%__MODULE__{} = client, project_id, endpoint_id, delivery_id, options \\ []) do
    ApolloSignal.Domains.Webhooks.replay_webhook_delivery(ApolloSignal.Domains.Webhooks.new(client), project_id, endpoint_id, delivery_id, options)
  end

  @spec list_api_keys(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ListApiKeysResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_api_keys(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.ApiKeys.list_api_keys(ApolloSignal.Domains.ApiKeys.new(client), project_id, options)
  end

  @spec get_api_key(client :: t(), project_id :: String.t(), key_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ApiKey.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_api_key(%__MODULE__{} = client, project_id, key_id, options \\ []) do
    ApolloSignal.Domains.ApiKeys.get_api_key(ApolloSignal.Domains.ApiKeys.new(client), project_id, key_id, options)
  end

  @spec get_api_key_usage(client :: t(), project_id :: String.t(), key_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ApiKeyUsageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_api_key_usage(%__MODULE__{} = client, project_id, key_id, options \\ []) do
    ApolloSignal.Domains.ApiKeys.get_api_key_usage(ApolloSignal.Domains.ApiKeys.new(client), project_id, key_id, options)
  end

  @spec export_api_key_usage(client :: t(), project_id :: String.t(), key_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def export_api_key_usage(%__MODULE__{} = client, project_id, key_id, options \\ []) do
    ApolloSignal.Domains.ApiKeys.export_api_key_usage(ApolloSignal.Domains.ApiKeys.new(client), project_id, key_id, options)
  end

  @spec list_projects(client :: t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ProjectPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_projects(%__MODULE__{} = client, options \\ []) do
    ApolloSignal.Domains.Projects.list_projects(ApolloSignal.Domains.Projects.new(client), options)
  end

  @spec get_project(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ProjectResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_project(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.Projects.get_project(ApolloSignal.Domains.Projects.new(client), project_id, options)
  end

  @spec update_project(client :: t(), project_id :: String.t(), body :: ApolloSignal.Types.UpdateProjectRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ProjectResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_project(%__MODULE__{} = client, project_id, body, options \\ []) do
    ApolloSignal.Domains.Projects.update_project(ApolloSignal.Domains.Projects.new(client), project_id, body, options)
  end

  @spec list_emails(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_emails(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.Projects.list_emails(ApolloSignal.Domains.Projects.new(client), project_id, options)
  end

  @spec get_project_email(client :: t(), project_id :: String.t(), email_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailDetailResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_project_email(%__MODULE__{} = client, project_id, email_id, options \\ []) do
    ApolloSignal.Domains.Projects.get_project_email(ApolloSignal.Domains.Projects.new(client), project_id, email_id, options)
  end

  @spec get_email_timeline(client :: t(), project_id :: String.t(), email_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailTimelineResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_email_timeline(%__MODULE__{} = client, project_id, email_id, options \\ []) do
    ApolloSignal.Domains.Projects.get_email_timeline(ApolloSignal.Domains.Projects.new(client), project_id, email_id, options)
  end

  @spec list_domains(client :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainListPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_domains(%__MODULE__{} = client, project_id, options \\ []) do
    ApolloSignal.Domains.SendingDomains.list_domains(ApolloSignal.Domains.SendingDomains.new(client), project_id, options)
  end

  @spec get_domain(client :: t(), project_id :: String.t(), domain_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_domain(%__MODULE__{} = client, project_id, domain_id, options \\ []) do
    ApolloSignal.Domains.SendingDomains.get_domain(ApolloSignal.Domains.SendingDomains.new(client), project_id, domain_id, options)
  end

  @spec register_domain(client :: t(), project_id :: String.t(), body :: ApolloSignal.Types.RegisterDomainRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def register_domain(%__MODULE__{} = client, project_id, body, options \\ []) do
    ApolloSignal.Domains.SendingDomains.register_domain(ApolloSignal.Domains.SendingDomains.new(client), project_id, body, options)
  end

  @spec verify_domain(client :: t(), project_id :: String.t(), domain_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def verify_domain(%__MODULE__{} = client, project_id, domain_id, options \\ []) do
    ApolloSignal.Domains.SendingDomains.verify_domain(ApolloSignal.Domains.SendingDomains.new(client), project_id, domain_id, options)
  end

  @spec delete_domain(client :: t(), project_id :: String.t(), domain_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_domain(%__MODULE__{} = client, project_id, domain_id, options \\ []) do
    ApolloSignal.Domains.SendingDomains.delete_domain(ApolloSignal.Domains.SendingDomains.new(client), project_id, domain_id, options)
  end

  @spec verify_bimi(client :: t(), project_id :: String.t(), domain_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def verify_bimi(%__MODULE__{} = client, project_id, domain_id, options \\ []) do
    ApolloSignal.Domains.SendingDomains.verify_bimi(ApolloSignal.Domains.SendingDomains.new(client), project_id, domain_id, options)
  end

  @spec update_bimi(client :: t(), project_id :: String.t(), domain_id :: String.t(), body :: ApolloSignal.Types.UpdateBimiRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_bimi(%__MODULE__{} = client, project_id, domain_id, body, options \\ []) do
    ApolloSignal.Domains.SendingDomains.update_bimi(ApolloSignal.Domains.SendingDomains.new(client), project_id, domain_id, body, options)
  end

end
