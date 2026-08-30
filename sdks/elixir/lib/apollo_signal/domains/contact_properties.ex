defmodule ApolloSignal.Domains.ContactProperties do
  @moduledoc "contactProperties API operations."

  alias ApolloSignal.Client, as: Client
  alias ApolloSignal.Types, as: Types
  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors


  defstruct [:client]

  @type t() :: %__MODULE__{client: Client.t()}

  @spec new(Client.t()) :: t()
  def new(%Client{} = client), do: %__MODULE__{client: client}

  @spec list_contact_properties(domain :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPropertyPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_contact_properties(%__MODULE__{} = domain, project_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contact-properties", %{
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
        {:ok, ApolloSignal.Types.from_contact_property_page_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_contact_property(domain :: t(), project_id :: String.t(), property_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPropertyResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_property(%__MODULE__{} = domain, project_id, property_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contact-properties/${propertyId}", %{
        "projectId" => project_id,
        "propertyId" => property_id
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
        {:ok, ApolloSignal.Types.from_contact_property_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec create_contact_property(domain :: t(), project_id :: String.t(), body :: ApolloSignal.Types.CreateContactPropertyBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPropertyResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def create_contact_property(%__MODULE__{} = domain, project_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contact-properties", %{
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
        {:ok, ApolloSignal.Types.from_contact_property_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec update_contact_property(domain :: t(), project_id :: String.t(), property_id :: String.t(), body :: ApolloSignal.Types.UpdateContactPropertyBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPropertyResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_contact_property(%__MODULE__{} = domain, project_id, property_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contact-properties/${propertyId}", %{
        "projectId" => project_id,
        "propertyId" => property_id
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
        {:ok, ApolloSignal.Types.from_contact_property_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec delete_contact_property(domain :: t(), project_id :: String.t(), property_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_contact_property(%__MODULE__{} = domain, project_id, property_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contact-properties/${propertyId}", %{
        "projectId" => project_id,
        "propertyId" => property_id
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
