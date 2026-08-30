defmodule ApolloSignal.Domains.Contacts do
  @moduledoc "contacts API operations."

  alias ApolloSignal.Client, as: Client
  alias ApolloSignal.Types, as: Types
  alias ApolloSignal.Transport, as: Transport
  alias ApolloSignal.Errors, as: Errors


  defstruct [:client]

  @type t() :: %__MODULE__{client: Client.t()}

  @spec new(Client.t()) :: t()
  def new(%Client{} = client), do: %__MODULE__{client: client}

  @spec list_contacts(domain :: t(), project_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactPageResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def list_contacts(%__MODULE__{} = domain, project_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts", %{
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
        {:ok, ApolloSignal.Types.from_contact_page_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_contact(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, ApolloSignal.Types.from_contact_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec list_contact_segments(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.list_contact_segments_response(), Transport.metadata()} | {:error, Errors.t()}
  def list_contact_segments(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/segments", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, ApolloSignal.Types.from_list_contact_segments_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_contact_topics(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.get_contact_topics_response(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_topics(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/topics", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, ApolloSignal.Types.from_get_contact_topics_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec create_contact(domain :: t(), project_id :: String.t(), body :: ApolloSignal.Types.CreateContactBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def create_contact(%__MODULE__{} = domain, project_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts", %{
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
        {:ok, ApolloSignal.Types.from_contact_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec update_contact(domain :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.UpdateContactBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def update_contact(%__MODULE__{} = domain, project_id, contact_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, ApolloSignal.Types.from_contact_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec delete_contact(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_contact(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}", %{
        "projectId" => project_id,
        "contactId" => contact_id
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

  @spec upload_contact_image(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def upload_contact_image(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/image", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, ApolloSignal.Types.from_contact_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec set_contact_image_url(domain :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.SetImageUrlBody.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.ContactResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def set_contact_image_url(%__MODULE__{} = domain, project_id, contact_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/image", %{
        "projectId" => project_id,
        "contactId" => contact_id
      })

    request = %{
      method: :put,
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
        {:ok, ApolloSignal.Types.from_contact_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec delete_contact_image(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def delete_contact_image(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/image", %{
        "projectId" => project_id,
        "contactId" => contact_id
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

  @spec add_contact_to_segment(domain :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.AddToSegmentBody.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def add_contact_to_segment(%__MODULE__{} = domain, project_id, contact_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/segments", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec remove_contact_from_segment(domain :: t(), project_id :: String.t(), contact_id :: String.t(), segment_id :: String.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def remove_contact_from_segment(%__MODULE__{} = domain, project_id, contact_id, segment_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}", %{
        "projectId" => project_id,
        "contactId" => contact_id,
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

  @spec update_contact_topics(domain :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.UpdateTopicsBody.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def update_contact_topics(%__MODULE__{} = domain, project_id, contact_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/topics", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_contact_activity(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.get_contact_activity_response(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_activity(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/activity", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, ApolloSignal.Types.from_get_contact_activity_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_contact_engagement_score(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EngagementScoreResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_engagement_score(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/engagement", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, ApolloSignal.Types.from_engagement_score_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec get_contact_email_validation_status(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EmailValidationStatusResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def get_contact_email_validation_status(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/email-validation", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, ApolloSignal.Types.from_email_validation_status_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec refresh_contact_engagement_score(domain :: t(), project_id :: String.t(), contact_id :: String.t(), options :: keyword()) :: {:ok, ApolloSignal.Types.EngagementScoreResponse.t(), Transport.metadata()} | {:error, Errors.t()}
  def refresh_contact_engagement_score(%__MODULE__{} = domain, project_id, contact_id, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/engagement/refresh", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, ApolloSignal.Types.from_engagement_score_response(Transport.json_body(response.body)), Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

  @spec record_contact_email_validation(domain :: t(), project_id :: String.t(), contact_id :: String.t(), body :: ApolloSignal.Types.RecordValidationBody.t(), options :: keyword()) :: {:ok, Transport.metadata()} | {:error, Errors.t()}
  def record_contact_email_validation(%__MODULE__{} = domain, project_id, contact_id, body, options \\ []) do
    path =
      Transport.path("/v1/projects/${projectId}/contacts/${contactId}/email-validation", %{
        "projectId" => project_id,
        "contactId" => contact_id
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
        {:ok, Transport.metadata(response)}

      {:error, %Errors{} = error} -> {:error, error}
    end
  end

end
