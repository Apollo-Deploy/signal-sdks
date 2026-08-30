defmodule ApolloSignal.Domains.SendingDomains do
  @moduledoc "sendingDomains API operations."

  alias ApolloSignal.Client, as: Client
  alias ApolloSignal.Types, as: Types
  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors


  defstruct [:client]

  @type t() :: %__MODULE__{client: Client.t()}

  @spec new(Client.t()) :: t()
  def new(%Client{} = client), do: %__MODULE__{client: client}

  @spec list_domains(domain :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainListPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_domains(%__MODULE__{} = domain, project_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/domains", %{
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
        {:ok, ApolloSignal.Types.from_domain_list_page_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_domain(domain :: t(), project_id :: String.t(), domain_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_domain(%__MODULE__{} = domain, project_id, domain_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/domains/${domainId}", %{
        "projectId" => project_id,
        "domainId" => domain_id
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
        {:ok, ApolloSignal.Types.from_domain_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec register_domain(domain :: t(), project_id :: String.t(), body :: ApolloSignal.Types.RegisterDomainRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def register_domain(%__MODULE__{} = domain, project_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/domains", %{
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
        {:ok, ApolloSignal.Types.from_domain_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec verify_domain(domain :: t(), project_id :: String.t(), domain_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def verify_domain(%__MODULE__{} = domain, project_id, domain_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/domains/${domainId}/verify", %{
        "projectId" => project_id,
        "domainId" => domain_id
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
        {:ok, ApolloSignal.Types.from_domain_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec delete_domain(domain :: t(), project_id :: String.t(), domain_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_domain(%__MODULE__{} = domain, project_id, domain_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/domains/${domainId}", %{
        "projectId" => project_id,
        "domainId" => domain_id
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

  @spec verify_bimi(domain :: t(), project_id :: String.t(), domain_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def verify_bimi(%__MODULE__{} = domain, project_id, domain_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/domains/${domainId}/bimi/verify", %{
        "projectId" => project_id,
        "domainId" => domain_id
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
        {:ok, ApolloSignal.Types.from_domain_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec update_bimi(domain :: t(), project_id :: String.t(), domain_id :: String.t(), body :: ApolloSignal.Types.UpdateBimiRequest.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.DomainResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_bimi(%__MODULE__{} = domain, project_id, domain_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/domains/${domainId}/bimi", %{
        "projectId" => project_id,
        "domainId" => domain_id
      })

    request = %{
      method: :patch,
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
        {:ok, ApolloSignal.Types.from_domain_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

end
