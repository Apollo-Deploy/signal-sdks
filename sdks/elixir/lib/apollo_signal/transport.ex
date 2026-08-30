defmodule ApolloSignal.Transport do
  @moduledoc """
  Req-based transport with bounded, idempotency-aware retries and SSE support.
  """

  alias ApolloSignal.Errors, as: Errors

  @safe_methods [:get, :head, :options, :put, :delete]
  @retryable_statuses [408, 425, 429, 500, 502, 503, 504]
  @max_retry_bound 8
  @max_backoff_ms 30_000
  @max_response_body_bytes 5 * 1024 * 1024
  @max_sse_line_bytes 1024 * 1024
  @max_sse_event_bytes 1024 * 1024

  defstruct [
    :req,
    :base_url,
    :timeout_ms,
    :max_retries,
    :retry_unsafe_requests,
    :default_headers,
    :security_headers,
    :security_query,
    :security_cookies,
    :user_agent
  ]

  @type t() :: %__MODULE__{
          req: term(),
          base_url: String.t(),
          timeout_ms: pos_integer(),
          max_retries: non_neg_integer(),
          retry_unsafe_requests: boolean(),
          default_headers: map(),
          security_headers: map(),
          security_query: map(),
          security_cookies: map(),
          user_agent: String.t()
        }

  @type metadata() :: %{
          status: non_neg_integer() | nil,
          headers: term(),
          request_id: String.t() | nil
        }

  defmodule Response do
    @moduledoc "Response data retained for successful operations."
    defstruct [:status, :headers, :body, :request_id]

    @type t() :: %__MODULE__{
            status: non_neg_integer(),
            headers: term(),
            body: term(),
            request_id: String.t() | nil
          }
  end

  defmodule SSEEvent do
    @moduledoc "One decoded Server-Sent Event."
    defstruct [:event, :id, :data]

    @type t() :: %__MODULE__{
            event: String.t() | nil,
            id: String.t() | nil,
            data: term()
          }
  end

  defmodule SSEStream do
    @moduledoc "Lazy enumerable of SSE events and the opening response metadata."
    defstruct [:events, :metadata]

    @type t(_event_type) :: %__MODULE__{events: term(), metadata: map()}

    @spec new(term(), map()) :: t(term())
    def new(events, metadata), do: %__MODULE__{events: events, metadata: metadata}

    @spec map(t(term()), (term() -> term())) :: t(term())
    def map(%__MODULE__{events: events, metadata: metadata}, mapper) do
      %__MODULE__{events: Stream.map(events, mapper), metadata: metadata}
    end

    @spec metadata(t(term())) :: map()
    def metadata(%__MODULE__{metadata: metadata}), do: metadata
  end

  defimpl Enumerable, for: ApolloSignal.Transport.SSEStream do
    def reduce(%ApolloSignal.Transport.SSEStream{events: events}, acc, fun) do
      Enumerable.reduce(events, acc, fun)
    end

    def count(_stream), do: {:error, __MODULE__}
    def member?(_stream, _value), do: {:error, __MODULE__}
    def slice(_stream), do: {:error, __MODULE__}
  end

  @spec new(keyword()) :: t()
  def new(opts \\ []) do
    base_url = opts |> Keyword.get(:base_url, "https://signal.apollodeploy.com") |> normalize_base_url()
    timeout_ms = positive_integer(Keyword.get(opts, :timeout_ms, 15_000), 15_000)
    max_retries = bounded_retries(Keyword.get(opts, :max_retries, 3))
    user_agent = Keyword.get(opts, :user_agent, "apollo_signal-elixir-sdk/1.0.4")

    default_headers =
      opts
      |> Keyword.get(:default_headers, %{})
      |> normalize_headers()
      |> Map.put_new("user-agent", user_agent)

    security_headers =
      %{}

    security_query =
      %{}

    security_cookies =
      %{}

    req =
      Req.new(
        base_url: base_url,
        headers: default_headers,
        receive_timeout: timeout_ms,
        retry: false,
        max_retries: 0
      )

    %__MODULE__{
      req: req,
      base_url: base_url,
      timeout_ms: timeout_ms,
      max_retries: max_retries,
      retry_unsafe_requests: Keyword.get(opts, :retry_unsafe_requests, false),
      default_headers: default_headers,
      security_headers: security_headers,
      security_query: security_query,
      security_cookies: security_cookies,
      user_agent: user_agent
    }
  end

  @spec request(t(), map()) :: {:ok, Response.t()} | {:error, Errors.t()}
  def request(%__MODULE__{} = transport, request) do
    request_loop(transport, request, 0)
  end

  @spec stream(t(), map()) :: {:ok, SSEStream.t(term())} | {:error, Errors.t()}
  def stream(%__MODULE__{} = transport, request) do
    stream_loop(transport, request, 0)
  end

  @spec path(String.t(), map()) :: String.t()
  def path(template, params) when is_binary(template) and is_map(params) do
    Enum.reduce(params, template, fn {name, value}, current ->
      encoded = URI.encode(to_string(value), &URI.char_unreserved?/1)
      current
      |> String.replace("{" <> name <> "}", encoded)
      |> String.replace("${" <> name <> "}", encoded)
    end)
  end

  @spec json_body(term()) :: term()
  def json_body(body) when is_binary(body) do
    case Jason.decode(body) do
      {:ok, value} -> value
      {:error, _reason} -> body
    end
  end

  def json_body(body), do: body

  @spec metadata(Response.t()) :: metadata()
  def metadata(%Response{} = response) do
    %{
      status: response.status,
      headers: response.headers,
      request_id: response.request_id
    }
  end

  @spec metadata() :: metadata()
  def metadata, do: %{status: nil, headers: %{}, request_id: nil}

  defp request_loop(transport, request, attempt) do
    options = request_options(transport, request)

    case Req.request(transport.req, options) do
      {:ok, %Req.Response{} = response} ->
        body = response.body

        if response.status >= 200 and response.status < 300 do
          response = %Response{
            status: response.status,
            headers: response.headers,
            body: body,
            request_id: Errors.request_id(response.headers, body)
          }

          {:ok, response}
        else
          error = Errors.from_response(response.status, response.headers, body, request.method, request.path)
          retry_or_return(transport, request, attempt, error, fn -> request_loop(transport, request, attempt + 1) end)
        end

      {:error, reason} ->
        error = Errors.from_exception(reason, request.method, request.path)
        retry_or_return(transport, request, attempt, error, fn -> request_loop(transport, request, attempt + 1) end)
    end
  end

  defp stream_loop(transport, request, attempt) do
    options = Keyword.put(request_options(transport, request), :into, :self)

    case Req.request(transport.req, options) do
      {:ok, %Req.Response{} = response} ->
        if response.status >= 200 and response.status < 300 do
          response_data = %Response{
            status: response.status,
            headers: response.headers,
            body: response.body,
            request_id: Errors.request_id(response.headers, %{})
          }

          {:ok, SSEStream.new(sse_events(response.body), metadata(response_data))}
        else
          body = materialize_body(response.body)
          error = Errors.from_response(response.status, response.headers, body, request.method, request.path)
          retry_or_return(transport, request, attempt, error, fn -> stream_loop(transport, request, attempt + 1) end)
        end

      {:error, reason} ->
        error = Errors.from_exception(reason, request.method, request.path)
        retry_or_return(transport, request, attempt, error, fn -> stream_loop(transport, request, attempt + 1) end)
    end
  end

  defp request_options(transport, request) do
    options = [
      method: Map.fetch!(request, :method),
      url: request |> Map.fetch!(:path) |> String.trim_leading("/"),
      params: request_query(transport, request),
      headers: request_headers(transport, request),
      receive_timeout: request_timeout(transport, request),
      retry: false,
      max_retries: 0
    ]

    case Map.get(request, :body) do
      nil -> options
      body -> Keyword.put(options, :json, body)
    end
  end

  defp request_query(transport, request) do
    request
    |> Map.get(:query)
    |> string_map()
    |> Map.merge(transport.security_query)
  end

  defp request_headers(transport, request) do
    headers =
      transport.default_headers
      |> Map.merge(normalize_headers(Map.get(request, :headers)))
      |> put_if_present("accept", Map.get(request, :accept, "application/json"))
      |> put_if_present("content-type", Map.get(request, :content_type))
      |> put_if_present("x-idempotency-key", Map.get(request, :idempotency_key))
      |> Map.merge(transport.security_headers)

    cookies =
      request
      |> Map.get(:cookies)
      |> string_map()
      |> Map.merge(transport.security_cookies)
    cookie_header =
      cookies
      |> Enum.reject(fn {_key, value} -> is_nil(value) end)
      |> Enum.map(fn {key, value} -> "#{key}=#{URI.encode_www_form(to_string(value))}" end)
      |> Enum.join("; ")

    if cookie_header == "", do: headers, else: Map.put(headers, "cookie", cookie_header)
  end

  defp request_timeout(transport, request) do
    positive_integer(Map.get(request, :timeout_ms), transport.timeout_ms)
  end

  defp retry_or_return(transport, request, attempt, error, retry) do
    if should_retry?(transport, request, attempt, error) do
      Process.sleep(retry_delay(error, attempt))
      retry.()
    else
      {:error, error}
    end
  end

  defp should_retry?(transport, request, attempt, error) do
    attempt < request_max_retries(transport, request) and
      retryable_method?(transport, request) and
      retryable_error?(error)
  end

  defp retryable_method?(transport, request) do
    method = Map.get(request, :method)
    unsafe = Map.get(request, :retry_unsafe_requests)
    unsafe = if is_boolean(unsafe), do: unsafe, else: transport.retry_unsafe_requests

    unsafe or method in @safe_methods or has_idempotency_key?(request)
  end

  defp retryable_error?(%Errors{status: nil}), do: true
  defp retryable_error?(%Errors{status: status}), do: status in @retryable_statuses

  defp has_idempotency_key?(request) do
    case Map.get(request, :idempotency_key) do
      value when is_binary(value) and byte_size(value) > 0 -> true
      _ ->
        request
        |> Map.get(:headers)
        |> normalize_headers()
        |> Enum.any?(fn {key, value} ->
          key in ["idempotency-key", "x-idempotency-key"] and value != ""
        end)
    end
  end

  defp retry_delay(%Errors{retry_after_ms: retry_after_ms}, _attempt)
       when is_integer(retry_after_ms) and retry_after_ms >= 0,
       do: min(retry_after_ms, @max_backoff_ms)

  defp retry_delay(_error, attempt) do
    min(@max_backoff_ms, 250 * Integer.pow(2, attempt))
  end

  defp request_max_retries(transport, request) do
    bounded_retries(Map.get(request, :max_retries, transport.max_retries), transport.max_retries)
  end

  defp bounded_retries(value, fallback \\ 0)
  defp bounded_retries(value, _fallback) when is_integer(value), do: value |> max(0) |> min(@max_retry_bound)
  defp bounded_retries(_value, fallback), do: bounded_retries(fallback, 0)

  defp positive_integer(value, _fallback) when is_integer(value) and value > 0, do: value
  defp positive_integer(_value, fallback), do: fallback

  defp normalize_base_url(value) when is_binary(value) do
    uri = URI.parse(value)

    if uri.scheme not in ["http", "https"] or is_nil(uri.host) do
      raise ArgumentError, "base_url must be an absolute HTTP(S) URL"
    end

    path = uri.path |> to_string() |> String.trim_trailing("/")
    normalized_path = if path == "", do: "/", else: path <> "/"
    %{uri | path: normalized_path, fragment: nil} |> URI.to_string()
  end

  defp normalize_headers(nil), do: %{}

  defp normalize_headers(headers) when is_map(headers) do
    headers
    |> string_map()
    |> Map.new(fn {key, value} -> {String.downcase(key), to_string(value)} end)
  end

  defp normalize_headers(headers) when is_list(headers) do
    normalize_headers(Map.new(headers))
  end

  defp normalize_headers(_headers), do: %{}

  defp string_map(nil), do: %{}
  defp string_map(value) when is_map(value) do
    value
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new(fn {key, item} -> {to_string(key), item} end)
  end

  defp string_map(value) when is_list(value) do
    value
    |> Enum.reject(fn {_key, item} -> is_nil(item) end)
    |> Map.new(fn {key, item} -> {to_string(key), item} end)
  end

  defp string_map(_value), do: %{}

  defp put_if_present(map, _key, nil), do: map
  defp put_if_present(map, _key, ""), do: map
  defp put_if_present(map, key, value), do: Map.put(map, to_string(key), to_string(value))



  defp materialize_body(%Req.Response.Async{} = body) do
    {chunks, _size} =
      Enum.reduce(body, {[], 0}, fn chunk, {chunks, size} ->
        binary = IO.iodata_to_binary(chunk)
        next_size = size + byte_size(binary)

        if next_size > @max_response_body_bytes do
          raise Errors,
            message: "Response body exceeded the configured safety limit",
            code: "response_body_too_large"
        end

        {[binary | chunks], next_size}
      end)

    chunks |> Enum.reverse() |> IO.iodata_to_binary()
  end

  defp materialize_body(body), do: body

  defp sse_events(body) do
    Stream.transform(
      body,
      %{buffer: "", event: nil, id: nil, data: [], data_bytes: 0},
      &consume_sse_chunk/2,
      &finish_sse/1
    )
  end

  defp consume_sse_chunk(chunk, state) do
    binary = state.buffer <> IO.iodata_to_binary(chunk)
    lines = String.split(binary, "\n")
    {complete, [rest]} = Enum.split(lines, -1)

    {events, state} =
      Enum.reduce(complete, {[], %{state | buffer: ""}}, fn line, {events, current} ->
        {new_events, next} = consume_sse_line(line, current)
        {Enum.reverse(new_events, events), next}
      end)

    if byte_size(rest) > @max_sse_line_bytes do
      raise Errors,
        message: "SSE line exceeded the configured safety limit",
        code: "sse_line_too_large"
    end

    {Enum.reverse(events), %{state | buffer: rest}}
  end

  defp finish_sse(state) do
    {events, state} = consume_sse_line(state.buffer, %{state | buffer: ""})
    {last_events, _state} = consume_sse_line("", state)
    events ++ last_events
  end

  defp consume_sse_line(line, state) do
    line = String.trim_trailing(line, "\r")

    if byte_size(line) > @max_sse_line_bytes do
      raise Errors,
        message: "SSE line exceeded the configured safety limit",
        code: "sse_line_too_large"
    end

    cond do
      line == "" -> emit_sse_event(state)
      String.starts_with?(line, ":") -> {[], state}
      String.starts_with?(line, "event:") -> {[], %{state | event: trim_sse_optional_space(binary_part(line, 6, byte_size(line) - 6))}}
      String.starts_with?(line, "id:") -> {[], %{state | id: trim_sse_optional_space(binary_part(line, 3, byte_size(line) - 3))}}
      String.starts_with?(line, "data:") ->
        data = trim_sse_optional_space(binary_part(line, 5, byte_size(line) - 5))
        separator_bytes = if state.data == [], do: 0, else: 1
        data_bytes = state.data_bytes + separator_bytes + byte_size(data)

        if data_bytes > @max_sse_event_bytes do
          raise Errors,
            message: "SSE event exceeded the configured safety limit",
            code: "sse_event_too_large"
        end

        {[], %{state | data: [data | state.data], data_bytes: data_bytes}}
      true -> {[], state}
    end
  end

  defp emit_sse_event(%{data: []} = state),
    do: {[], %{state | event: nil, id: nil, data_bytes: 0}}

  defp emit_sse_event(state) do
    event = %SSEEvent{
      event: state.event,
      id: state.id,
      data: decode_sse_data(state.data |> Enum.reverse() |> Enum.join("\n"))
    }

    {[event], %{state | event: nil, id: nil, data: [], data_bytes: 0}}
  end

  defp decode_sse_data(data) do
    case Jason.decode(data) do
      {:ok, value} -> value
      {:error, _reason} -> data
    end
  end

  defp trim_sse_optional_space(<<" ", rest::binary>>), do: rest
  defp trim_sse_optional_space(value), do: value
end
