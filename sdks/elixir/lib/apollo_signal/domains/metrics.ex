defmodule ApolloSignal.Domains.Metrics do
  @moduledoc "metrics API operations."

  alias ApolloSignal.Client, as: Client
  alias ApolloSignal.Types, as: Types
  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors


  defstruct [:client]

  @type t() :: %__MODULE__{client: Client.t()}

  @spec new(Client.t()) :: t()
  def new(%Client{} = client), do: %__MODULE__{client: client}

  @spec get_topic_performance(domain :: t(), id :: String.t(), query :: ApolloSignal.Types.GetTopicPerformanceQuery.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.TopicPerformanceResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_topic_performance(%__MODULE__{} = domain, id, query \\ %{}, options \\ []) do
    path =
      Transport.path("/v1/metrics/topics/${id}", %{
        "id" => id
      })

    request = %{
      method: :get,
      path: path,
      query: Types.encode(query),
      headers: %{},
      cookies: %{},
      body: nil,
      content_type: nil,
      accept: "application/json",
      timeout_ms: Keyword.get(options, :timeout_ms, nil),
      max_retries: Keyword.get(options, :max_retries),
      retry_unsafe_requests: Keyword.get(options, :retry_unsafe_requests),
      idempotency_key: Keyword.get(options, :idempotency_key)
    }

    case Transport.request(domain.client.transport, request) do
      {:ok, response} ->
        {:ok, ApolloSignal.Types.from_topic_performance_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_email_performance(domain :: t(), id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailPerformanceResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_email_performance(%__MODULE__{} = domain, id, options \\ []) do
    path =
      Transport.path("/v1/metrics/emails/${id}", %{
        "id" => id
      })

    request = %{
      method: :get,
      path: path,
      query: %{},
      headers: %{},
      cookies: %{},
      body: nil,
      content_type: nil,
      accept: "application/json",
      timeout_ms: Keyword.get(options, :timeout_ms, nil),
      max_retries: Keyword.get(options, :max_retries),
      retry_unsafe_requests: Keyword.get(options, :retry_unsafe_requests),
      idempotency_key: Keyword.get(options, :idempotency_key)
    }

    case Transport.request(domain.client.transport, request) do
      {:ok, response} ->
        {:ok, ApolloSignal.Types.from_email_performance_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_email_engagement(domain :: t(), id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailReadScrollAnalyticsResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_email_engagement(%__MODULE__{} = domain, id, options \\ []) do
    path =
      Transport.path("/v1/metrics/emails/${id}/engagement", %{
        "id" => id
      })

    request = %{
      method: :get,
      path: path,
      query: %{},
      headers: %{},
      cookies: %{},
      body: nil,
      content_type: nil,
      accept: "application/json",
      timeout_ms: Keyword.get(options, :timeout_ms, nil),
      max_retries: Keyword.get(options, :max_retries),
      retry_unsafe_requests: Keyword.get(options, :retry_unsafe_requests),
      idempotency_key: Keyword.get(options, :idempotency_key)
    }

    case Transport.request(domain.client.transport, request) do
      {:ok, response} ->
        {:ok, ApolloSignal.Types.from_email_read_scroll_analytics_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_project_metrics_summary(domain :: t(), query :: ApolloSignal.Types.GetProjectMetricsSummaryQuery.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ProjectMetricsSummaryResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_project_metrics_summary(%__MODULE__{} = domain, query \\ %{}, options \\ []) do
    path = "/v1/metrics/summary"

    request = %{
      method: :get,
      path: path,
      query: Types.encode(query),
      headers: %{},
      cookies: %{},
      body: nil,
      content_type: nil,
      accept: "application/json",
      timeout_ms: Keyword.get(options, :timeout_ms, nil),
      max_retries: Keyword.get(options, :max_retries),
      retry_unsafe_requests: Keyword.get(options, :retry_unsafe_requests),
      idempotency_key: Keyword.get(options, :idempotency_key)
    }

    case Transport.request(domain.client.transport, request) do
      {:ok, response} ->
        {:ok, ApolloSignal.Types.from_project_metrics_summary_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_project_metrics_timeline(domain :: t(), query :: ApolloSignal.Types.GetProjectMetricsTimelineQuery.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ProjectMetricsTimelineResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_project_metrics_timeline(%__MODULE__{} = domain, query \\ %{}, options \\ []) do
    path = "/v1/metrics/timeline"

    request = %{
      method: :get,
      path: path,
      query: Types.encode(query),
      headers: %{},
      cookies: %{},
      body: nil,
      content_type: nil,
      accept: "application/json",
      timeout_ms: Keyword.get(options, :timeout_ms, nil),
      max_retries: Keyword.get(options, :max_retries),
      retry_unsafe_requests: Keyword.get(options, :retry_unsafe_requests),
      idempotency_key: Keyword.get(options, :idempotency_key)
    }

    case Transport.request(domain.client.transport, request) do
      {:ok, response} ->
        {:ok, ApolloSignal.Types.from_project_metrics_timeline_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_metrics_advisor(domain :: t(), query :: ApolloSignal.Types.GetMetricsAdvisorQuery.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.AdvisorReportResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_metrics_advisor(%__MODULE__{} = domain, query \\ %{}, options \\ []) do
    path = "/v1/metrics/advisor"

    request = %{
      method: :get,
      path: path,
      query: Types.encode(query),
      headers: %{},
      cookies: %{},
      body: nil,
      content_type: nil,
      accept: "application/json",
      timeout_ms: Keyword.get(options, :timeout_ms, nil),
      max_retries: Keyword.get(options, :max_retries),
      retry_unsafe_requests: Keyword.get(options, :retry_unsafe_requests),
      idempotency_key: Keyword.get(options, :idempotency_key)
    }

    case Transport.request(domain.client.transport, request) do
      {:ok, response} ->
        {:ok, ApolloSignal.Types.from_advisor_report_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

end
