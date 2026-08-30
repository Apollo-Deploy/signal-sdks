# frozen_string_literal: true

require "faraday"
require "json"
require "securerandom"
require "time"
require "uri"
require_relative "errors"

module ApolloDeploySignalSdkRails
  class SSEEvent
    attr_reader :type, :data, :id, :retry_milliseconds

    def initialize(type:, data:, id: nil, retry_milliseconds: nil)
      @type = type
      @data = data
      @id = id
      @retry_milliseconds = retry_milliseconds
    end
  end

  # HTTP transport layer built on Faraday.
  class Transport
    RETRYABLE_METHODS = %i[get head options put delete].freeze
    RETRYABLE_STATUSES = [408, 425, 429, 500, 502, 503, 504].freeze
    MAX_RETRIES = 8
    MAX_RETRY_DELAY = 30.0
    MAX_RESPONSE_BODY_BYTES = 5 * 1024 * 1024
    MAX_SSE_LINE_BYTES = 1024 * 1024

    COOKIE_SAFE_CHARACTERS = "!#$%&'()*+-./:<=>?@[]^_`{|}~".freeze

    class SSEParser
      def initialize(output)
        @output = output
        @buffer = +""
        @event_type = "message"
        @data_lines = []
        @event_id = nil
        @retry_milliseconds = nil
        @total_bytes = 0
      end

      def write(chunk)
        @total_bytes += chunk.to_s.bytesize
        raise_response_limit if @total_bytes > MAX_RESPONSE_BODY_BYTES

        @buffer << chunk.to_s
        consume_lines
      end

      def finish
        unless @buffer.empty?
          line = @buffer.end_with?("\r") ? @buffer.byteslice(0, @buffer.bytesize - 1) : @buffer
          process_line(line)
        end
        finish_event
      end

      private

      def consume_lines
        loop do
          index = @buffer.index(/[\r\n]/)
          break if index.nil?

          byte = @buffer.getbyte(index)
          break if byte == 13 && index == @buffer.bytesize - 1

          delimiter_length = byte == 13 && @buffer.getbyte(index + 1) == 10 ? 2 : 1
          line = @buffer.byteslice(0, index)
          @buffer = @buffer.byteslice(index + delimiter_length, @buffer.bytesize) || +""
          process_line(line)
        end

        raise_line_limit if @buffer.bytesize > MAX_SSE_LINE_BYTES
      end

      def process_line(line)
        raise_line_limit if line.bytesize > MAX_SSE_LINE_BYTES
        if line.empty?
          finish_event
          return
        end
        return if line.start_with?(":")

        separator = line.index(":")
        if separator
          field = line.byteslice(0, separator)
          value = line.byteslice(separator + 1, line.bytesize) || ""
          value = value.byteslice(1, value.bytesize) if value.start_with?(" ")
        else
          field = line
          value = ""
        end

        case field
        when "event"
          @event_type = value
        when "data"
          @data_lines << value
        when "id"
          @event_id = value unless value.include?("\0")
        when "retry"
          @retry_milliseconds = Integer(value, 10) if value.match?(/\A\d+\z/)
        end
      rescue ArgumentError
        # Invalid retry fields are ignored by the SSE protocol.
      end

      def finish_event
        return reset_event if @data_lines.empty?

        raw_data = @data_lines.join("\n")
        data = begin
          JSON.parse(raw_data)
        rescue JSON::ParserError
          raw_data
        end
        @output << SSEEvent.new(
          type: @event_type,
          data: data,
          id: @event_id,
          retry_milliseconds: @retry_milliseconds,
        )
        reset_event
      end

      def reset_event
        @event_type = "message"
        @data_lines = []
        @event_id = nil
        @retry_milliseconds = nil
      end

      def raise_response_limit
        raise SDKError.new(
          "Response body exceeded the configured safety limit",
          0,
          "response_body_too_large",
        )
      end

      def raise_line_limit
        raise SDKError.new(
          "SSE line exceeded the configured safety limit",
          0,
          "sse_line_too_large",
        )
      end
    end

    attr_reader :config
    attr_reader :connection

    def initialize(config)
      @config = config
      base_uri = URI.parse(config.base_url)
      unless base_uri.is_a?(URI::HTTP) && base_uri.host
        raise ArgumentError, "base_url must be an absolute HTTP(S) URL"
      end
      @base_query_pairs = URI.decode_www_form(base_uri.query.to_s)
      base_uri.query = nil
      base_uri.fragment = nil
      base_path = base_uri.path.to_s.sub(%r{/+\z}, "")
      base_uri.path = base_path.empty? ? "/" : "#{base_path}/"
      @connection = Faraday.new(url: base_uri.to_s) do |faraday|
        faraday.request :json
        faraday.response :raise_error
        faraday.options.timeout = config.timeout
        faraday.options.open_timeout = [config.timeout / 3.0, 2.0].max
        faraday.headers["Accept"] = "application/json"
        faraday.headers["User-Agent"] = "apollo-deploy-signal-sdk-rails-ruby-sdk/4.0.0"
        config.default_headers.each { |key, value| faraday.headers[key] = value }
        faraday.adapter Faraday.default_adapter
      end
    end

    def request(method:, path:, path_params: {}, query: nil, body: nil, headers: {}, content_type: nil, timeout_ms: nil)
      url = append_query(build_url(path, path_params), build_query(query))
      method = method.to_sym
      max_retries = [[(@config.retries[:attempts] || 3).to_i, 0].max, MAX_RETRIES].min
      attempt = 0

      begin
        request_headers = build_headers(headers, content_type)
        prepared_body, request_headers = prepare_request_body(
          body,
          content_type,
          request_headers,
        )
        response = @connection.run_request(
          method,
          url,
          prepared_body,
          request_headers,
        ) do |request|
          apply_timeout(request, timeout_ms)
        end
        parse_response(response)
      rescue Faraday::Error => error
        mapped = map_error(error, method: method, path: path)
        unless retryable_request?(method, headers) && mapped.retryable? && attempt < max_retries
          raise mapped
        end

        sleep(retry_delay(error, attempt))
        attempt += 1
        retry
      end
    end

    def stream(method:, path:, path_params: {}, query: nil, body: nil, headers: {}, content_type: nil, timeout_ms: nil)
      Enumerator.new do |output|
        url = append_query(build_url(path, path_params), build_query(query))
        parser = SSEParser.new(output)
        stream_headers = build_headers(headers, content_type)
        set_header(stream_headers, "Accept", "text/event-stream")
        prepared_body, stream_headers = prepare_request_body(
          body,
          content_type,
          stream_headers,
        )
        @connection.run_request(
          method.to_sym,
          url,
          prepared_body,
          stream_headers
        ) do |request|
          apply_timeout(request, timeout_ms)
          request.options.on_data = proc { |chunk, _bytes| parser.write(chunk) }
        end
        parser.finish
      rescue Faraday::Error => error
        raise map_error(error, method: method, path: path)
      end
    end

    private

    def apply_timeout(request, timeout_ms)
      seconds = timeout_ms.nil? ? @config.timeout.to_f : timeout_ms.to_f / 1000.0
      if seconds <= 0
        raise SDKError.new("timeout_ms must be greater than zero", 0, "invalid_timeout")
      end

      request.options.timeout = seconds
      request.options.open_timeout = [seconds / 3.0, 2.0].max
    end

    def prepare_request_body(body, content_type, headers)
      return [nil, headers] if body.nil?

      media_type = content_type.to_s.split(";", 2).first.to_s.strip.downcase
      if media_type.empty? || media_type == "application/json" || media_type.end_with?("+json")
        normalized_body = body.respond_to?(:to_h) ? body.to_h : body
        return [normalized_body, headers]
      end

      if media_type == "multipart/form-data"
        boundary = "tesseract-#{SecureRandom.hex(16)}"
        multipart_headers = headers.dup
        set_header(
          multipart_headers,
          "Content-Type",
          "multipart/form-data; boundary=#{boundary}",
        )
        return [encode_multipart_body(body, boundary), multipart_headers]
      end

      [read_raw_body(body), headers]
    end

    def read_raw_body(body)
      return body if body.is_a?(String)
      return body.to_str if body.respond_to?(:to_str)

      if body.respond_to?(:read)
        contents = body.read
        return contents.to_s if contents.nil? || contents.is_a?(String)
      end

      return body.to_s if body.is_a?(Numeric) || body == true || body == false

      raise SDKError.new(
        "Raw request bodies must be strings or readable streams",
        0,
        "invalid_request_body",
      )
    end

    def encode_multipart_body(body, boundary)
      fields = if body.is_a?(Hash)
        body
      elsif body.respond_to?(:to_h)
        body.to_h
      end
      unless fields.is_a?(Hash)
        raise SDKError.new(
          "Multipart request bodies must be hashes or model objects",
          0,
          "invalid_request_body",
        )
      end

      encoded = String.new(encoding: Encoding::BINARY)
      fields.each do |name, value|
        append_multipart_fields(encoded, boundary, name, value)
      end
      encoded << "--#{boundary}--\r\n".b
      encoded
    end

    def append_multipart_fields(buffer, boundary, name, value)
      return if value.nil?

      if !value.is_a?(Hash) && !value.is_a?(Array) && value.respond_to?(:to_h) && !value.respond_to?(:read)
        value = value.to_h
      end

      descriptor = multipart_descriptor(value)
      if descriptor
        append_multipart_part(
          buffer,
          boundary,
          descriptor[:name] || name,
          descriptor[:contents],
          descriptor[:filename],
          descriptor[:content_type],
        )
      elsif value.is_a?(Array)
        value.each { |item| append_multipart_fields(buffer, boundary, name, item) }
      elsif value.is_a?(Hash)
        value.each do |nested_name, nested_value|
          append_multipart_fields(
            buffer,
            boundary,
            "#{name}[#{nested_name}]",
            nested_value,
          )
        end
      else
        append_multipart_part(buffer, boundary, name, value, nil, nil)
      end
    end

    def multipart_descriptor(value)
      return nil unless value.is_a?(Hash)
      return nil unless value.key?(:contents) || value.key?("contents")

      keys = value.keys.map(&:to_s)
      allowed = %w[contents name filename content_type contentType]
      return nil unless (keys - allowed).empty?

      {
        name: value[:name] || value["name"],
        contents: value.key?(:contents) ? value[:contents] : value["contents"],
        filename: value[:filename] || value["filename"],
        content_type: value[:content_type] || value["content_type"] || value["contentType"],
      }
    end

    def append_multipart_part(buffer, boundary, name, value, filename, content_type)
      contents = value
      if value.respond_to?(:read)
        contents = value.read.to_s
        filename ||= multipart_filename(value)
        content_type ||= "application/octet-stream"
      end

      unless contents.is_a?(String) || contents.respond_to?(:to_str)
        contents = contents.to_s
      end

      disposition = "Content-Disposition: form-data; name=\"#{multipart_quote(name)}\""
      disposition += "; filename=\"#{multipart_quote(filename)}\"" if filename

      buffer << "--#{boundary}\r\n".b
      buffer << disposition.b << "\r\n".b
      buffer << "Content-Type: #{content_type}\r\n".b if content_type
      buffer << "\r\n".b
      buffer << contents.to_str.b
      buffer << "\r\n".b
    end

    def multipart_filename(value)
      if value.respond_to?(:original_filename) && value.original_filename
        return value.original_filename.to_s
      end

      return nil unless value.respond_to?(:path)

      path = value.path
      path.nil? || path.to_s.empty? ? nil : File.basename(path.to_s)
    end

    def multipart_quote(value)
      value.to_s
        .gsub(/[\r\n]/, "")
        .gsub(/["\\]/) { |character| "\\#{character}" }
    end

    def build_url(path, path_params)
      expanded = if path_params.empty?
        path
      else
        path.gsub(/(?:\$\{(\w+)\}|:(\w+))/) do |match|
          key = Regexp.last_match(1) || Regexp.last_match(2)
          value = if path_params.key?(key.to_sym)
            path_params[key.to_sym]
          elsif path_params.key?(key)
            path_params[key]
          end
          value.nil? ? match : URI.encode_www_form_component(wire_value(value)).gsub("+", "%20")
        end
      end
      expanded.sub(%r{\A/+}, "")
    end

    def build_headers(extra_headers = {}, content_type = nil)
      headers = {}
      headers["Content-Type"] = content_type if content_type
      headers.merge!(extra_headers)
      claimed_security_headers = {}
      headers
    end

    def build_query(query)
      request_pairs = []
      (query || {}).each do |key, value|
        next if value.nil?

        values = value.is_a?(Array) ? value : [value]
        values.each do |item|
          request_pairs << [key.to_s, wire_value(item)] unless item.nil?
        end
      end

      request_names = request_pairs.map(&:first).to_h { |name| [name, true] }
      pairs = @base_query_pairs.reject { |key, _| request_names.key?(key) }
      pairs.concat(request_pairs)
      pairs
    end

    def append_query(path, pairs)
      query = URI.encode_www_form(pairs)
      query.empty? ? path : "#{path}?#{query}"
    end

    def wire_value(value)
      return "true" if value == true
      return "false" if value == false
      return value.iso8601 if value.respond_to?(:iso8601)

      value.to_s
    end

    def set_header(headers, name, value)
      headers.delete_if { |key, _| key.to_s.casecmp(name).zero? }
      headers[name] = value
    end

    def set_security_header(headers, claimed_headers, name, value)
      normalized = name.to_s.downcase
      if claimed_headers.key?(normalized)
        raise ArgumentError, "Multiple configured security schemes target the #{name} header"
      end

      claimed_headers[normalized] = true
      set_header(headers, name, value)
    end

    def credential_configured?(value)
      !value.nil? && !value.to_s.empty?
    end

    def set_security_cookie(headers, name, value)
      cookie_key = headers.keys.find { |key| key.to_s.casecmp("Cookie").zero? }
      pairs = cookie_key ? headers.delete(cookie_key).to_s.split(";") : []
      pairs.reject! { |pair| pair.partition("=").first.strip == name }
      pairs << "#{name}=#{self.class.encode_cookie_component(value)}"
      headers["Cookie"] = pairs.map(&:strip).reject(&:empty?).join("; ")
    end

    def self.encode_cookie_component(value)
      value.to_s.bytes.map do |byte|
        character = byte.chr
        if (byte >= 0x30 && byte <= 0x39) ||
            (byte >= 0x41 && byte <= 0x5A) ||
            (byte >= 0x61 && byte <= 0x7A) ||
            COOKIE_SAFE_CHARACTERS.include?(character)
          character
        else
          format("%%%02X", byte)
        end
      end.join
    end

    def parse_response(response)
      body = response.body
      ensure_response_body_size!(body, response.status)
      return nil if body.nil? || (body.is_a?(String) && body.strip.empty?)
      return body unless body.is_a?(String)

      JSON.parse(body)
    rescue JSON::ParserError
      body
    end

    def ensure_response_body_size!(body, status = 0, request_id: nil, method: nil, path: nil)
      return body unless body.is_a?(String) && body.bytesize > MAX_RESPONSE_BODY_BYTES

      raise SDKError.new(
        "Response body exceeded the configured safety limit",
        status.to_i,
        "response_body_too_large",
        request_id: request_id,
        method: method,
        path: path,
      )
    end

    def retryable_request?(method, headers)
      return true if @config.retry_unsafe_requests
      return true if RETRYABLE_METHODS.include?(method)

      @config.default_headers.merge(headers).any? do |key, value|
        ["Idempotency-Key", "X-Idempotency-Key"].any? { |name| key.to_s.casecmp(name).zero? } &&
          !value.to_s.empty?
      end
    end

    def retry_delay(error, attempt)
      retry_after = retry_after_seconds(error)
      return retry_after unless retry_after.nil?

      base = [(@config.retries[:backoff] || 0.4).to_f, 0.0].max
      max_backoff = retry_max_backoff
      delay = [base * (2**attempt), max_backoff].min
      @config.retries.fetch(:jitter, true) ? rand * delay : delay
    end

    def retry_max_backoff
      [[(@config.retries[:max_backoff] || MAX_RETRY_DELAY).to_f, 0.0].max, MAX_RETRY_DELAY].min
    end

    def retry_after_seconds(error)
      headers = error.response&.[](:headers) || {}
      value = headers["retry-after"] || headers["Retry-After"]
      return nil if value.nil? || value.to_s.empty?

      [[Float(value), 0.0].max, retry_max_backoff].min
    rescue ArgumentError, TypeError
      begin
        [
          [Time.httpdate(value.to_s) - Time.now, 0.0].max,
          retry_max_backoff
        ].min
      rescue ArgumentError
        nil
      end
    end

    def map_error(error, method:, path:)
      status = error.response&.[](:status).to_i
      headers = error.response&.[](:headers) || {}
      request_id = headers["x-request-id"] || headers["X-Request-ID"] || headers["request-id"]

      case error
      when Faraday::TimeoutError
        SDKError.new("Request timed out", 0, "timeout", method: method, path: path)
      when Faraday::ConnectionFailed
        SDKError.new("Connection failed: #{error.message}", 0, "network_error", method: method, path: path)
      else
        body = error.response&.[](:body)
        ensure_response_body_size!(
          body,
          status,
          request_id: request_id,
          method: method,
          path: path,
        )
        envelope = parse_error_body(body)
        message = envelope["message"] || envelope.dig("error", "message") || error.message
        code = envelope["code"] || envelope.dig("error", "code")
        code ||= envelope["error"] if envelope["error"].is_a?(String)
        SDKError.new(
          message,
          status,
          code || default_error_code(status),
          request_id: envelope["request_id"] || request_id,
          method: method,
          path: path,
          details: envelope["details"]
        )
      end
    end

    def parse_error_body(body)
      return body if body.is_a?(Hash)
      return {} unless body.is_a?(String) && !body.empty?

      parsed = JSON.parse(body)
      parsed.is_a?(Hash) ? parsed : {}
    rescue JSON::ParserError
      {}
    end

    def default_error_code(status)
      return "network_error" if status.zero?
      return "rate_limit_exceeded" if status == 429
      return "request_timeout" if status == 408
      return "internal_server_error" if status >= 500

      "http_error"
    end
  end
end
