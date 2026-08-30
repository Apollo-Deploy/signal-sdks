defmodule ApolloSignal.Domains.Webhooks do
  @moduledoc "webhooks API operations."

  alias ApolloSignal.Client, as: Client
  alias ApolloSignal.Types, as: Types
  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors


  defstruct [:client]

  @type t() :: %__MODULE__{client: Client.t()}

  @spec new(Client.t()) :: t()
  def new(%Client{} = client), do: %__MODULE__{client: client}

  @spec list_webhooks(domain :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_webhooks(%__MODULE__{} = domain, project_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/webhooks", %{
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
        {:ok, ApolloSignal.Types.from_webhook_page_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_webhook(domain :: t(), project_id :: String.t(), endpoint_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_webhook(%__MODULE__{} = domain, project_id, endpoint_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/webhooks/${endpointId}", %{
        "projectId" => project_id,
        "endpointId" => endpoint_id
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
        {:ok, ApolloSignal.Types.from_webhook_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec list_webhook_deliveries(domain :: t(), project_id :: String.t(), endpoint_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookDeliveryPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_webhook_deliveries(%__MODULE__{} = domain, project_id, endpoint_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/webhooks/${endpointId}/deliveries", %{
        "projectId" => project_id,
        "endpointId" => endpoint_id
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
        {:ok, ApolloSignal.Types.from_webhook_delivery_page_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_webhook_delivery(domain :: t(), project_id :: String.t(), endpoint_id :: String.t(), delivery_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookDeliveryResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_webhook_delivery(%__MODULE__{} = domain, project_id, endpoint_id, delivery_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/webhooks/${endpointId}/deliveries/${deliveryId}", %{
        "projectId" => project_id,
        "endpointId" => endpoint_id,
        "deliveryId" => delivery_id
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
        {:ok, ApolloSignal.Types.from_webhook_delivery_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec create_webhook(domain :: t(), project_id :: String.t(), body :: ApolloSignal.Types.CreateWebhookBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookCreateResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def create_webhook(%__MODULE__{} = domain, project_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/webhooks", %{
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
        {:ok, ApolloSignal.Types.from_webhook_create_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec update_webhook(domain :: t(), project_id :: String.t(), endpoint_id :: String.t(), body :: ApolloSignal.Types.UpdateWebhookBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_webhook(%__MODULE__{} = domain, project_id, endpoint_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/webhooks/${endpointId}", %{
        "projectId" => project_id,
        "endpointId" => endpoint_id
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
        {:ok, ApolloSignal.Types.from_webhook_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec delete_webhook(domain :: t(), project_id :: String.t(), endpoint_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_webhook(%__MODULE__{} = domain, project_id, endpoint_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/webhooks/${endpointId}", %{
        "projectId" => project_id,
        "endpointId" => endpoint_id
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

  @spec test_webhook(domain :: t(), project_id :: String.t(), endpoint_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.WebhookDeliveryResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def test_webhook(%__MODULE__{} = domain, project_id, endpoint_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/webhooks/${endpointId}/test", %{
        "projectId" => project_id,
        "endpointId" => endpoint_id
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
        {:ok, ApolloSignal.Types.from_webhook_delivery_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec replay_webhook_delivery(domain :: t(), project_id :: String.t(), endpoint_id :: String.t(), delivery_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def replay_webhook_delivery(%__MODULE__{} = domain, project_id, endpoint_id, delivery_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/webhooks/${endpointId}/replay/${deliveryId}", %{
        "projectId" => project_id,
        "endpointId" => endpoint_id,
        "deliveryId" => delivery_id
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
        {:ok, Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

end
