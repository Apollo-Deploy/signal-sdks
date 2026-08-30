defmodule ApolloSignal.Domains.Emails do
  @moduledoc "emails API operations."

  alias ApolloSignal.Client, as: Client
  alias ApolloSignal.Types, as: Types
  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors


  defstruct [:client]

  @type t() :: %__MODULE__{client: Client.t()}

  @spec new(Client.t()) :: t()
  def new(%Client{} = client), do: %__MODULE__{client: client}

  @spec send_email(domain :: t(), body :: ApolloSignal.Types.SendEmailRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SendEmailResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def send_email(%__MODULE__{} = domain, body, options \\ []) do
    path = "/v1/emails"

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
        {:ok, ApolloSignal.Types.from_send_email_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_email(domain :: t(), email_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailDetailResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_email(%__MODULE__{} = domain, email_id, options \\ []) do
    path =
      Transport.path("/v1/emails/${emailId}", %{
        "emailId" => email_id
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
        {:ok, ApolloSignal.Types.from_email_detail_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec batch_send_emails(domain :: t(), body :: ApolloSignal.Types.BatchSendRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.BatchSendResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def batch_send_emails(%__MODULE__{} = domain, body, options \\ []) do
    path = "/v1/emails/batch"

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
        {:ok, ApolloSignal.Types.from_batch_send_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec cancel_email(domain :: t(), email_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.CancelResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def cancel_email(%__MODULE__{} = domain, email_id, options \\ []) do
    path =
      Transport.path("/v1/emails/${emailId}", %{
        "emailId" => email_id
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
        {:ok, ApolloSignal.Types.from_cancel_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec bulk_cancel_emails(domain :: t(), options :: keyword()) :: {:ok, ApolloSignal.Types.BulkCancelResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def bulk_cancel_emails(%__MODULE__{} = domain, options \\ []) do
    path = "/v1/emails"

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
        {:ok, ApolloSignal.Types.from_bulk_cancel_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec issue_stream_token(domain :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.StreamTokenResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def issue_stream_token(%__MODULE__{} = domain, project_id, options \\ []) do
    path =
      Transport.path("/v1/emails/${projectId}/stream/token", %{
        "projectId" => project_id
      })

    request = %{
      method: :post,
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
        {:ok, ApolloSignal.Types.from_stream_token_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec stream_email_events(domain :: t(), options :: keyword()) :: {:ok, Transport.SSEStream.t(ApolloSignal.Types.StreamEventResponse.t())} | {:error, Errors.t()}
  def stream_email_events(%__MODULE__{} = domain, options \\ []) do
    path = "/v1/emails/stream"

    request = %{
      method: :get,
      path: path,
      query: %{},
      headers: %{},
      cookies: %{},
      body: nil,
      content_type: nil,
      accept: "text/event-stream",
      timeout_ms: Keyword.get(options, :timeout_ms, nil),
      max_retries: Keyword.get(options, :max_retries),
      retry_unsafe_requests: Keyword.get(options, :retry_unsafe_requests),
      idempotency_key: Keyword.get(options, :idempotency_key)
    }

    case Transport.stream(domain.client.transport, request) do
      {:ok, stream} ->
        {:ok, Transport.SSEStream.map(stream, fn event ->
          %{event | data: ApolloSignal.Types.from_stream_event_response(event.data) }
        end)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec validate_links(domain :: t(), body :: ApolloSignal.Types.ValidateLinksRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ValidateLinksResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def validate_links(%__MODULE__{} = domain, body, options \\ []) do
    path = "/v1/emails/validate"

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
        {:ok, ApolloSignal.Types.from_validate_links_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

end
