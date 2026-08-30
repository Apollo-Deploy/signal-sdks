defmodule ApolloSignal.Domains.Segments do
  @moduledoc "segments API operations."

  alias ApolloSignal.Client, as: Client
  alias ApolloSignal.Types, as: Types
  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors


  defstruct [:client]

  @type t() :: %__MODULE__{client: Client.t()}

  @spec new(Client.t()) :: t()
  def new(%Client{} = client), do: %__MODULE__{client: client}

  @spec list_segments(domain :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SegmentPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_segments(%__MODULE__{} = domain, project_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/segments", %{
        "projectId" => project_id
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
        {:ok, ApolloSignal.Types.from_segment_page_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_segment(domain :: t(), project_id :: String.t(), segment_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SegmentResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_segment(%__MODULE__{} = domain, project_id, segment_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/segments/${segmentId}", %{
        "projectId" => project_id,
        "segmentId" => segment_id
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
        {:ok, ApolloSignal.Types.from_segment_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec list_contacts_in_segment(domain :: t(), project_id :: String.t(), segment_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.CursorPage.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_contacts_in_segment(%__MODULE__{} = domain, project_id, segment_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/segments/${segmentId}/contacts", %{
        "projectId" => project_id,
        "segmentId" => segment_id
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
        {:ok, ApolloSignal.Types.from_cursor_page(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec create_segment(domain :: t(), project_id :: String.t(), body :: ApolloSignal.Types.CreateSegmentBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SegmentResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def create_segment(%__MODULE__{} = domain, project_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/segments", %{
        "projectId" => project_id
      })

    request = %{
      method: :post,
      path: path,
      query: %{},
      headers: %{},
      cookies: %{},
      body: Types.encode(body),
      content_type: "application/json",
      accept: "application/json",
      timeout_ms: Keyword.get(options, :timeout_ms, nil),
      max_retries: Keyword.get(options, :max_retries),
      retry_unsafe_requests: Keyword.get(options, :retry_unsafe_requests),
      idempotency_key: Keyword.get(options, :idempotency_key)
    }

    case Transport.request(domain.client.transport, request) do
      {:ok, response} ->
        {:ok, ApolloSignal.Types.from_segment_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec delete_segment(domain :: t(), project_id :: String.t(), segment_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_segment(%__MODULE__{} = domain, project_id, segment_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/segments/${segmentId}", %{
        "projectId" => project_id,
        "segmentId" => segment_id
      })

    request = %{
      method: :delete,
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
        {:ok, Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

end
