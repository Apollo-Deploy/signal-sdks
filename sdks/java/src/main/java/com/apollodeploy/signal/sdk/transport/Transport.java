package com.apollodeploy.signal.sdk.transport;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.apollodeploy.signal.sdk.errors.SdkException;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpHeaders;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

/** Shared Java HTTP transport. One instance reuses one java.net.http.HttpClient. */
public final class Transport implements AutoCloseable {
    private static final int MAX_RETRIES = 8;
    private static final long MAX_RETRY_DELAY_MS = 30_000L;
    private static final int MAX_RESPONSE_BODY_BYTES = 5 * 1024 * 1024;
    private static final int MAX_SSE_EVENT_BYTES = 1024 * 1024;
    private static final List<Integer> RETRYABLE_STATUSES = List.of(408, 425, 429, 500, 502, 503, 504);
    private static final List<String> RETRYABLE_METHODS = List.of("GET", "HEAD", "OPTIONS", "PUT", "DELETE");

    public static final class Config {
        public final String baseUrl;
        public final Map<String, String> authValues;
        public final Map<String, String> defaultHeaders;
        public final int timeoutMs;
        public final int maxRetries;
        public final boolean retryUnsafeRequests;

        public Config(
                String baseUrl,
                Map<String, String> authValues,
                Map<String, String> defaultHeaders,
                int timeoutMs,
                int maxRetries,
                boolean retryUnsafeRequests) {
            if (baseUrl == null || baseUrl.isBlank()) throw new IllegalArgumentException("baseUrl must not be blank");
            if (timeoutMs <= 0) throw new IllegalArgumentException("timeoutMs must be greater than zero");
            if (maxRetries < 0 || maxRetries > MAX_RETRIES) {
                throw new IllegalArgumentException("maxRetries must be between 0 and " + MAX_RETRIES);
            }
            this.baseUrl = baseUrl;
            this.authValues = authValues == null ? Map.of() : Map.copyOf(authValues);
            this.defaultHeaders = defaultHeaders == null ? Map.of() : Map.copyOf(defaultHeaders);
            this.timeoutMs = timeoutMs;
            this.maxRetries = maxRetries;
            this.retryUnsafeRequests = retryUnsafeRequests;
        }
    }

    public static final class Request {
        private final String method;
        private final String path;
        private final Map<String, Object> query = new LinkedHashMap<>();
        private final Map<String, String> headers = new LinkedHashMap<>();
        private final Map<String, String> cookies = new LinkedHashMap<>();
        private Object body;
        private String contentType;
        private Duration timeout;

        public Request(String method, String path) {
            this.method = method == null ? "GET" : method.toUpperCase();
            this.path = path == null ? "/" : path;
        }

        public Request query(String name, Object value) {
            if (name != null && value != null) query.put(name, value);
            return this;
        }

        public Request header(String name, String value) {
            if (name != null && value != null) headers.put(name, value);
            return this;
        }

        public Request cookie(String name, String value) {
            if (name != null && value != null) cookies.put(name, value);
            return this;
        }

        public Request body(Object value, String valueContentType) {
            body = value;
            contentType = valueContentType;
            return this;
        }

        public Request timeout(Duration value) {
            if (value == null || value.isZero() || value.isNegative()) {
                throw new IllegalArgumentException("request timeout must be positive");
            }
            timeout = value;
            return this;
        }
    }

    private final Config config;
    private final HttpClient httpClient;
    private final ObjectMapper mapper;

    public Transport(Config config) {
        this(config, HttpClient.newBuilder().build(), defaultMapper());
    }

    public Transport(Config config, HttpClient httpClient) {
        this(config, httpClient, defaultMapper());
    }

    public Transport(Config config, HttpClient httpClient, ObjectMapper mapper) {
        this.config = config;
        this.httpClient = httpClient == null ? HttpClient.newBuilder().build() : httpClient;
        this.mapper = mapper == null ? defaultMapper() : mapper;
    }

    public <T> T execute(Request request, TypeReference<T> responseType) {
        BodyResponse response = sendForBody(request);
        if (!isSuccess(response.statusCode())) throw errorFromResponse(response.statusCode(), response.headers(), response.body());
        if (response.body() == null || response.body().isBlank()) {
            throw new SdkException(
                    response.statusCode(),
                    "EMPTY_RESPONSE",
                    "Successful response body was empty",
                    requestId(response.headers()));
        }
        try {
            return mapper.readValue(response.body(), responseType);
        } catch (IOException error) {
            throw new SdkException(
                    0,
                    "DESERIALIZE_ERROR",
                    "Failed to deserialize the response body",
                    requestId(response.headers()),
                    response.headers().map(),
                    response.body(),
                    error);
        }
    }

    public void executeVoid(Request request) {
        BodyResponse response = sendForBody(request);
        if (!isSuccess(response.statusCode())) throw errorFromResponse(response.statusCode(), response.headers(), response.body());
    }

    public <T> SseStream<T> stream(Request request, TypeReference<T> eventType) {
        HttpResponse<InputStream> response = sendForStream(request);
        return new SseStream<>(response.body(), mapper, eventType);
    }

    public void addQueryObject(Request request, Object value) {
        addObject(request, value, RequestPart.QUERY);
    }

    public void addHeaderObject(Request request, Object value) {
        addObject(request, value, RequestPart.HEADER);
    }

    public void addCookieObject(Request request, Object value) {
        addObject(request, value, RequestPart.COOKIE);
    }

    public static String encodePathSegment(String value) {
        return URLEncoder.encode(value, StandardCharsets.UTF_8).replace("+", "%20");
    }

    @Override
    public void close() {
        // java.net.http.HttpClient is reusable and has no close operation on Java 17.
    }

    private enum RequestPart {
        QUERY,
        HEADER,
        COOKIE
    }

    private void addObject(Request request, Object value, RequestPart part) {
        if (value == null) return;
        Map<?, ?> values = mapper.convertValue(value, Map.class);
        for (Map.Entry<?, ?> entry : values.entrySet()) {
            if (entry.getKey() == null || entry.getValue() == null) continue;
            String name = String.valueOf(entry.getKey());
            if (part == RequestPart.QUERY) request.query(name, entry.getValue());
            if (part == RequestPart.HEADER) request.header(name, String.valueOf(entry.getValue()));
            if (part == RequestPart.COOKIE) request.cookie(name, String.valueOf(entry.getValue()));
        }
    }

    private record BodyResponse(int statusCode, HttpHeaders headers, String body) {}

    private BodyResponse sendForBody(Request request) {
        HttpRequest httpRequest = buildRequest(request);
        for (int attempt = 0; attempt <= config.maxRetries; attempt += 1) {
            try {
                HttpResponse<InputStream> response = httpClient.send(
                        httpRequest,
                        HttpResponse.BodyHandlers.ofInputStream());
                String body = readBody(response.body(), MAX_RESPONSE_BODY_BYTES);
                BodyResponse buffered = new BodyResponse(response.statusCode(), response.headers(), body);
                if (isSuccess(response.statusCode())) return buffered;
                if (!canRetry(request) || !isRetryableStatus(response.statusCode()) || attempt == config.maxRetries) {
                    return buffered;
                }
                Thread.sleep(retryDelay(response.headers(), attempt).toMillis());
            } catch (InterruptedException error) {
                Thread.currentThread().interrupt();
                throw networkError("Request interrupted", error);
            } catch (IOException error) {
                if (!canRetry(request) || attempt == config.maxRetries) {
                    throw networkError("Network error: " + error.getMessage(), error);
                }
                sleepForRetry(attempt);
            }
        }
        throw new SdkException(0, "MAX_RETRIES_EXCEEDED", "Request failed after " + (config.maxRetries + 1) + " attempts", null);
    }

    private HttpResponse<InputStream> sendForStream(Request request) {
        HttpRequest httpRequest = buildRequest(request);
        for (int attempt = 0; attempt <= config.maxRetries; attempt += 1) {
            try {
                HttpResponse<InputStream> response = httpClient.send(
                        httpRequest,
                        HttpResponse.BodyHandlers.ofInputStream());
                if (isSuccess(response.statusCode())) return response;
                if (!canRetry(request) || !isRetryableStatus(response.statusCode()) || attempt == config.maxRetries) {
                    String body = readBody(response.body(), MAX_RESPONSE_BODY_BYTES);
                    throw errorFromResponse(response.statusCode(), response.headers(), body);
                }
                closeQuietly(response.body());
                Thread.sleep(retryDelay(response.headers(), attempt).toMillis());
            } catch (InterruptedException error) {
                Thread.currentThread().interrupt();
                throw networkError("Request interrupted", error);
            } catch (IOException error) {
                if (!canRetry(request) || attempt == config.maxRetries) {
                    throw networkError("Network error: " + error.getMessage(), error);
                }
                sleepForRetry(attempt);
            }
        }
        throw new SdkException(0, "MAX_RETRIES_EXCEEDED", "Request failed after " + (config.maxRetries + 1) + " attempts", null);
    }

    private HttpRequest buildRequest(Request request) {
        try {
            Map<String, Object> query = new LinkedHashMap<>(request.query);
            Map<String, String> headers = new LinkedHashMap<>();
            config.defaultHeaders.forEach((name, value) -> setHeader(headers, name, value));
            request.headers.forEach((name, value) -> setHeader(headers, name, value));
            Map<String, String> cookies = new LinkedHashMap<>(request.cookies);
            Map<String, String> claimedSecurityHeaders = new LinkedHashMap<>();

            if (request.body != null) {
                setHeader(headers, "Content-Type", request.contentType == null ? "application/json" : request.contentType);
            }
            if (!containsHeader(headers, "Accept")) headers.put("Accept", "application/json");
            if (!containsHeader(headers, "User-Agent")) headers.put("User-Agent", "com.apollodeploy.signal.sdk/4.0.0");
            if (!cookies.isEmpty()) {
                String cookieHeader = cookies.entrySet().stream()
                        .map(entry -> encodePathSegment(entry.getKey()) + "="
                                + encodePathSegment(entry.getValue()))
                        .reduce((left, right) -> left + "; " + right)
                        .orElse("");
                setHeader(headers, "Cookie", cookieHeader);
            }

            URI uri = buildUri(config.baseUrl, request.path, query);
            HttpRequest.Builder builder = HttpRequest.newBuilder(uri)
                    .timeout(request.timeout == null ? Duration.ofMillis(config.timeoutMs) : request.timeout);
            headers.forEach(builder::header);

            if (request.body == null) {
                builder.method(request.method, HttpRequest.BodyPublishers.noBody());
            } else {
                builder.method(
                        request.method,
                        HttpRequest.BodyPublishers.ofString(mapper.writeValueAsString(request.body), StandardCharsets.UTF_8));
            }
            return builder.build();
        } catch (JsonProcessingException error) {
            throw new SdkException(0, "SERIALIZE_ERROR", "Failed to serialize the request body", null, Map.of(), null, error);
        } catch (RuntimeException error) {
            if (error instanceof SdkException sdkException) throw sdkException;
            throw new SdkException(0, "REQUEST_BUILD_ERROR", error.getMessage() == null ? "Failed to build request" : error.getMessage(), null, Map.of(), null, error);
        }
    }

    private URI buildUri(String baseUrl, String path, Map<String, Object> query) {
        if (path.indexOf('?') >= 0 || path.indexOf('#') >= 0) {
            throw new IllegalArgumentException("Request paths cannot contain a query or fragment");
        }
        URI base = URI.create(baseUrl);
        if (base.getScheme() == null || base.getRawAuthority() == null) {
            throw new IllegalArgumentException("baseUrl must be an absolute URL");
        }

        String basePath = base.getRawPath() == null ? "" : base.getRawPath();
        while (basePath.endsWith("/") && !basePath.isEmpty()) {
            basePath = basePath.substring(0, basePath.length() - 1);
        }
        String requestPath = path;
        while (requestPath.startsWith("/")) requestPath = requestPath.substring(1);

        StringBuilder value = new StringBuilder()
                .append(base.getScheme())
                .append("://")
                .append(base.getRawAuthority());
        if (!basePath.isEmpty()) value.append(basePath);
        value.append('/').append(requestPath);

        List<String> queryPairs = new ArrayList<>();
        if (base.getRawQuery() != null && !base.getRawQuery().isEmpty()) {
            Collections.addAll(queryPairs, base.getRawQuery().split("&", -1));
        }
        for (String name : query.keySet()) {
            queryPairs.removeIf(pair -> queryPairMatches(pair, name));
        }
        for (Map.Entry<String, Object> entry : query.entrySet()) {
            Object rawValue = entry.getValue();
            if (rawValue instanceof Iterable<?> values) {
                for (Object item : values) {
                    if (item != null) appendQueryPair(queryPairs, entry.getKey(), item);
                }
            } else if (rawValue != null) {
                appendQueryPair(queryPairs, entry.getKey(), rawValue);
            }
        }
        if (!queryPairs.isEmpty()) value.append('?').append(String.join("&", queryPairs));
        return URI.create(value.toString());
    }

    private static void appendQueryPair(List<String> target, String name, Object value) {
        target.add(URLEncoder.encode(name, StandardCharsets.UTF_8).replace("+", "%20")
                + '='
                + URLEncoder.encode(String.valueOf(value), StandardCharsets.UTF_8).replace("+", "%20"));
    }

    private static boolean queryPairMatches(String pair, String name) {
        String encodedName = pair.substring(0, pair.indexOf('=') >= 0 ? pair.indexOf('=') : pair.length());
        try {
            return URLDecoder.decode(encodedName, StandardCharsets.UTF_8).equals(name);
        } catch (IllegalArgumentException ignored) {
            return encodedName.equals(URLEncoder.encode(name, StandardCharsets.UTF_8).replace("+", "%20"));
        }
    }

    private boolean canRetry(Request request) {
        if (config.retryUnsafeRequests || RETRYABLE_METHODS.contains(request.method)) return true;
        return hasIdempotencyKey(config.defaultHeaders) || hasIdempotencyKey(request.headers);
    }

    private static boolean hasIdempotencyKey(Map<String, String> headers) {
        return headers.entrySet().stream().anyMatch(entry ->
                (entry.getKey().equalsIgnoreCase("Idempotency-Key")
                        || entry.getKey().equalsIgnoreCase("X-Idempotency-Key"))
                        && entry.getValue() != null
                        && !entry.getValue().isBlank());
    }

    private static boolean isSuccess(int status) {
        return status >= 200 && status <= 299;
    }

    private static boolean isRetryableStatus(int status) {
        return RETRYABLE_STATUSES.contains(status);
    }

    private static boolean containsHeader(Map<String, String> headers, String name) {
        return headers.keySet().stream().anyMatch(key -> key.equalsIgnoreCase(name));
    }

    private static void setHeader(Map<String, String> headers, String name, String value) {
        headers.keySet().removeIf(key -> key.equalsIgnoreCase(name));
        headers.put(name, value);
    }

    private static void setSecurityHeader(
            Map<String, String> headers,
            Map<String, String> claimedHeaders,
            String name,
            String value) {
        String normalized = name.toLowerCase(java.util.Locale.ROOT);
        if (claimedHeaders.putIfAbsent(normalized, name) != null) {
            throw new IllegalArgumentException(
                    "Multiple configured security schemes target the " + name + " header");
        }
        setHeader(headers, name, value);
    }

    private Duration retryDelay(HttpHeaders headers, int attempt) {
        String retryAfter = headers.firstValue("Retry-After").orElse(null);
        if (retryAfter != null) {
            String value = retryAfter.trim();
            try {
                long seconds = Long.parseLong(value);
                return clampDelay(Duration.ofSeconds(Math.max(0L, seconds)));
            } catch (NumberFormatException ignored) {
                try {
                    long millis = ZonedDateTime.parse(value, DateTimeFormatter.RFC_1123_DATE_TIME)
                            .toInstant()
                            .toEpochMilli() - System.currentTimeMillis();
                    return clampDelay(Duration.ofMillis(Math.max(0L, millis)));
                } catch (RuntimeException ignoredDate) {
                    // Fall back to bounded exponential backoff for malformed headers.
                }
            }
        }

        long exponential = Math.min(MAX_RETRY_DELAY_MS, 200L * (1L << Math.min(attempt, 10)));
        long jitter = ThreadLocalRandom.current().nextLong(0L, Math.max(1L, exponential / 2L + 1L));
        return clampDelay(Duration.ofMillis(exponential + jitter));
    }

    private static Duration clampDelay(Duration value) {
        if (value.isNegative()) return Duration.ZERO;
        return value.compareTo(Duration.ofMillis(MAX_RETRY_DELAY_MS)) > 0
                ? Duration.ofMillis(MAX_RETRY_DELAY_MS)
                : value;
    }

    private void sleepForRetry(int attempt) {
        try {
            Thread.sleep(retryDelay(java.net.http.HttpHeaders.of(Map.of(), (left, right) -> true), attempt).toMillis());
        } catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            throw networkError("Request interrupted", error);
        }
    }

    private static SdkException networkError(String message, Throwable cause) {
        return new SdkException(0, "NETWORK_ERROR", message, null, Map.of(), null, cause);
    }

    private SdkException errorFromResponse(int status, java.net.http.HttpHeaders headers, String body) {
        String code = null;
        String message = body == null || body.isBlank() ? "API error (status " + status + ")" : body;
        try {
            JsonNode root = body == null || body.isBlank() ? null : mapper.readTree(body);
            if (root != null) {
                code = text(root, "code");
                message = text(root, "message");
                JsonNode error = root.get("error");
                if (error != null && error.isObject()) {
                    if (code == null) code = text(error, "code");
                    if (message == null) message = text(error, "message");
                } else if (error != null && error.isTextual() && (message == null || message.isBlank())) {
                    message = error.asText();
                }
            }
        } catch (IOException ignored) {
            // Preserve the raw response body when it is not JSON.
        }
        if (message == null || message.isBlank()) message = "API error (status " + status + ")";
        return new SdkException(status, code, message, requestId(headers), headers.map(), body, null);
    }

    private static String text(JsonNode node, String field) {
        JsonNode value = node.get(field);
        return value != null && value.isValueNode() ? value.asText() : null;
    }

    private static String requestId(java.net.http.HttpHeaders headers) {
        return headers.firstValue("X-Request-Id")
                .or(() -> headers.firstValue("Request-Id"))
                .or(() -> headers.firstValue("X-Correlation-Id"))
                .orElse(null);
    }

    private static String readBody(InputStream input, int limit) throws IOException {
        if (input == null) return "";
        try (InputStream stream = input) {
            ByteArrayOutputStream output = new ByteArrayOutputStream(Math.min(limit, 8 * 1024));
            byte[] buffer = new byte[8 * 1024];
            int total = 0;
            int count;
            while ((count = stream.read(buffer)) != -1) {
                total += count;
                if (total > limit) {
                    throw new SdkException(
                            0,
                            "RESPONSE_BODY_TOO_LARGE",
                            "The response body exceeded " + limit + " bytes",
                            null);
                }
                output.write(buffer, 0, count);
            }
            return output.toString(StandardCharsets.UTF_8);
        }
    }

    private static void closeQuietly(InputStream input) {
        if (input == null) return;
        try {
            input.close();
        } catch (IOException ignored) {
            // The response is already being discarded for a retry.
        }
    }

    private static ObjectMapper defaultMapper() {
        return new ObjectMapper()
                .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    /** One-shot SSE response that is both Iterable and convertible to a Java Stream. */
    public static final class SseStream<T> implements Iterable<T>, AutoCloseable {
        private final InputStream input;
        private final ObjectMapper mapper;
        private final TypeReference<T> eventType;
        private boolean iteratorCreated;
        private boolean closed;

        private SseStream(InputStream input, ObjectMapper mapper, TypeReference<T> eventType) {
            this.input = input;
            this.mapper = mapper;
            this.eventType = eventType;
        }

        @Override
        public Iterator<T> iterator() {
            if (iteratorCreated) throw new IllegalStateException("SSE streams can only be iterated once");
            iteratorCreated = true;
            return new Iterator<>() {
                private boolean computed;
                private boolean available;
                private T next;

                @Override
                public boolean hasNext() {
                    if (computed) return available;
                    computed = true;
                    next = readNext();
                    available = !closed && (next != null || lastEventWasPresent);
                    lastEventWasPresent = false;
                    return available;
                }

                @Override
                public T next() {
                    if (!hasNext()) throw new NoSuchElementException();
                    computed = false;
                    return next;
                }

                private boolean lastEventWasPresent;

                private T readNext() {
                    try {
                        String data = nextEvent();
                        if (data == null) return null;
                        lastEventWasPresent = true;
                        return mapper.readValue(data, eventType);
                    } catch (IOException error) {
                        throw new SdkException(0, "SSE_ERROR", "Failed to read SSE event", null, Map.of(), null, error);
                    }
                }
            };
        }

        public Stream<T> stream() {
            return StreamSupport.stream(
                    Spliterators.spliteratorUnknownSize(iterator(), Spliterator.ORDERED),
                    false).onClose(this::close);
        }

        private String nextEvent() throws IOException {
            if (closed) return null;
            StringBuilder data = new StringBuilder();
            int eventBytes = 0;
            String line;
            while ((line = readLine()) != null) {
                if (line.isEmpty()) {
                    if (data.length() > 0) return data.toString();
                    continue;
                }
                if (!line.startsWith("data:")) continue;
                String value = line.substring(5);
                if (value.startsWith(" ")) value = value.substring(1);
                eventBytes += value.getBytes(StandardCharsets.UTF_8).length;
                if (eventBytes > MAX_SSE_EVENT_BYTES) {
                    throw new SdkException(
                            0,
                            "SSE_EVENT_TOO_LARGE",
                            "An SSE event exceeded " + MAX_SSE_EVENT_BYTES + " bytes",
                            null);
                }
                if (data.length() > 0) data.append('\n');
                data.append(value);
            }
            if (data.length() == 0) close();
            return data.length() == 0 ? null : data.toString();
        }

        private String readLine() throws IOException {
            ByteArrayOutputStream line = new ByteArrayOutputStream();
            boolean sawByte = false;
            while (true) {
                int value = input.read();
                if (value == -1) {
                    if (!sawByte) return null;
                    break;
                }
                sawByte = true;
                if (value == '\n') break;
                if (line.size() >= MAX_SSE_EVENT_BYTES) {
                    throw new SdkException(
                            0,
                            "SSE_EVENT_TOO_LARGE",
                            "An SSE line exceeded " + MAX_SSE_EVENT_BYTES + " bytes",
                            null);
                }
                line.write(value);
            }

            byte[] bytes = line.toByteArray();
            int length = bytes.length;
            if (length > 0 && bytes[length - 1] == '\r') length -= 1;
            return new String(bytes, 0, length, StandardCharsets.UTF_8);
        }

        @Override
        public void close() {
            if (closed) return;
            closed = true;
            try {
                input.close();
            } catch (IOException ignored) {
                // Closing an exhausted stream is best effort.
            }
        }
    }
}
