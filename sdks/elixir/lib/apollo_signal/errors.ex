defmodule ApolloSignal.Errors do
  @moduledoc "Structured API and transport errors for Apollo Signal API."

  defexception [
    :status,
    :code,
    :request_id,
    :response_headers,
    :response_body,
    :method,
    :path,
    :retry_after_ms,
    message: "request failed"
  ]

  @type t() :: %__MODULE__{
          message: String.t(),
          status: non_neg_integer() | nil,
          code: String.t() | nil,
          request_id: String.t() | nil,
          response_headers: term(),
          response_body: term(),
          method: atom() | String.t() | nil,
          path: String.t() | nil,
          retry_after_ms: non_neg_integer() | nil
        }

  @spec from_response(non_neg_integer(), term(), term(), atom() | String.t(), String.t()) :: t()
  def from_response(status, headers, body, method, path) do
    parsed_body = decode_body(body)
    %__MODULE__{
      message: response_message(parsed_body, status),
      status: status,
      code: response_code(parsed_body),
      request_id: request_id(headers, parsed_body),
      response_headers: headers,
      response_body: body,
      method: method,
      path: path,
      retry_after_ms: retry_after_ms(headers)
    }
  end

  @spec from_exception(Exception.t() | term(), atom() | String.t(), String.t()) :: t()
  def from_exception(exception, method, path) do
    %__MODULE__{
      message: exception_message(exception),
      code: "transport_error",
      method: method,
      path: path
    }
  end

  @spec request_id(term(), term()) :: String.t() | nil
  def request_id(headers, body) do
    body = decode_body(body)

    body_request_id =
      if is_map(body) do
        Map.get(body, "request_id") ||
          Map.get(body, "requestId") ||
          Map.get(body, "request-id") ||
          Map.get(body, :request_id)
      end

    normalize_string(body_request_id) ||
      header(headers, "x-request-id") ||
      header(headers, "request-id") ||
      header(headers, "x-correlation-id")
  end

  @spec header(term(), String.t()) :: String.t() | nil
  def header(headers, name) when is_map(headers) do
    wanted = String.downcase(name)

    Enum.find_value(headers, fn {key, value} ->
      if String.downcase(to_string(key)) == wanted, do: normalize_string(value)
    end)
  end

  def header(headers, name) when is_list(headers) do
    wanted = String.downcase(name)

    Enum.find_value(headers, fn
      {key, value} when is_binary(key) ->
        if String.downcase(key) == wanted, do: normalize_string(value)

      {key, value} ->
        if String.downcase(to_string(key)) == wanted, do: normalize_string(value)

      _other ->
        nil
    end)
  end

  def header(_headers, _name), do: nil

  @spec retry_after_ms(term()) :: non_neg_integer() | nil
  def retry_after_ms(headers) do
    case header(headers, "retry-after") do
      nil -> nil
      value -> parse_retry_after(value)
    end
  end

  defp parse_retry_after(value) do
    case Integer.parse(String.trim(value)) do
      {seconds, ""} when seconds >= 0 -> seconds * 1_000
      _ ->
        try do
          { {year, month, day}, {hour, minute, second} } =
            :httpd_util.convert_request_date(String.to_charlist(value))

          now = :calendar.datetime_to_gregorian_seconds(:calendar.universal_time())
          target = :calendar.datetime_to_gregorian_seconds({ {year, month, day}, {hour, minute, second} })
          max(target - now, 0) * 1_000
        rescue
          _ -> nil
        end
    end
  end

  defp decode_body(body) when is_binary(body) do
    case Jason.decode(body) do
      {:ok, value} -> value
      {:error, _reason} -> body
    end
  end

  defp decode_body(body), do: body

  defp response_message(body, status) when is_map(body) do
    body
    |> Map.get("message", Map.get(body, :message))
    |> normalize_string()
    |> case do
      nil -> "request failed with status #{status}"
      message -> message
    end
  end

  defp response_message(body, _status) when is_binary(body) and byte_size(body) > 0, do: body
  defp response_message(_body, status), do: "request failed with status #{status}"

  defp response_code(body) when is_map(body) do
    body
    |> Map.get("code", Map.get(body, :code))
    |> normalize_string()
  end

  defp response_code(_body), do: nil

  defp exception_message(exception) do
    if is_exception(exception) do
      Exception.message(exception)
    else
      inspect(exception)
    end
  end

  defp normalize_string(nil), do: nil
  defp normalize_string(value) when is_binary(value), do: value
  defp normalize_string(value) when is_list(value), do: List.to_string(value)
  defp normalize_string(value), do: to_string(value)
end
