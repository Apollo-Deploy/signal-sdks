defmodule ApolloSignal.Domains.Suppressions do
  @moduledoc "suppressions API operations."

  alias ApolloSignal.Client, as: Client
  alias ApolloSignal.Types, as: Types
  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors


  defstruct [:client]

  @type t() :: %__MODULE__{client: Client.t()}

  @spec new(Client.t()) :: t()
  def new(%Client{} = client), do: %__MODULE__{client: client}

  @spec list_suppressions(domain :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SuppressionPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_suppressions(%__MODULE__{} = domain, project_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/suppressions", %{
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
        {:ok, ApolloSignal.Types.from_suppression_page_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec export_suppressions(domain :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def export_suppressions(%__MODULE__{} = domain, project_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/suppressions/export", %{
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
        {:ok, Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec add_suppression(domain :: t(), project_id :: String.t(), body :: ApolloSignal.Types.AddSuppressionBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SuppressionResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def add_suppression(%__MODULE__{} = domain, project_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/suppressions", %{
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
        {:ok, ApolloSignal.Types.from_suppression_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec remove_suppression(domain :: t(), project_id :: String.t(), email :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def remove_suppression(%__MODULE__{} = domain, project_id, email, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/suppressions/${email}", %{
        "projectId" => project_id,
        "email" => email
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

  @spec import_suppressions(domain :: t(), project_id :: String.t(), body :: ApolloSignal.Types.SuppressionImportBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.SuppressionImportResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def import_suppressions(%__MODULE__{} = domain, project_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/suppressions/import", %{
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
        {:ok, ApolloSignal.Types.from_suppression_import_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

end
