defmodule ApolloSignal.Domains.ApiKeys do
  @moduledoc "apiKeys API operations."

  alias ApolloSignal.Client, as: Client
  alias ApolloSignal.Types, as: Types
  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors


  defstruct [:client]

  @type t() :: %__MODULE__{client: Client.t()}

  @spec new(Client.t()) :: t()
  def new(%Client{} = client), do: %__MODULE__{client: client}

  @spec list_api_keys(domain :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ListApiKeysResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_api_keys(%__MODULE__{} = domain, project_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/api-keys", %{
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
        {:ok, ApolloSignal.Types.from_list_api_keys_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_api_key(domain :: t(), project_id :: String.t(), key_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ApiKey.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_api_key(%__MODULE__{} = domain, project_id, key_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/api-keys/${keyId}", %{
        "projectId" => project_id,
        "keyId" => key_id
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
        {:ok, ApolloSignal.Types.from_api_key(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_api_key_usage(domain :: t(), project_id :: String.t(), key_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ApiKeyUsageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_api_key_usage(%__MODULE__{} = domain, project_id, key_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/api-keys/${keyId}/usage", %{
        "projectId" => project_id,
        "keyId" => key_id
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
        {:ok, ApolloSignal.Types.from_api_key_usage_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec export_api_key_usage(domain :: t(), project_id :: String.t(), key_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def export_api_key_usage(%__MODULE__{} = domain, project_id, key_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/api-keys/${keyId}/usage/export", %{
        "projectId" => project_id,
        "keyId" => key_id
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

end
