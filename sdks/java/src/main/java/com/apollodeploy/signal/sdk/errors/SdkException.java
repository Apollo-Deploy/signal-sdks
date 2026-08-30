package com.apollodeploy.signal.sdk.errors;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/** A normalized API or transport error raised by the generated SDK. */
public class SdkException extends RuntimeException {
    private final int status;
    private final String code;
    private final String requestId;
    private final Map<String, List<String>> responseHeaders;
    private final String responseBody;

    public SdkException(
            int status,
            String code,
            String message,
            String requestId,
            Map<String, List<String>> responseHeaders,
            String responseBody,
            Throwable cause) {
        super(message, cause);
        this.status = status;
        this.code = code;
        this.requestId = requestId;
        this.responseHeaders = responseHeaders == null
                ? Map.of()
                : Collections.unmodifiableMap(responseHeaders);
        this.responseBody = responseBody;
    }

    public SdkException(
            int status,
            String code,
            String message,
            String requestId) {
        this(status, code, message, requestId, Map.of(), null, null);
    }

    public int status() {
        return status;
    }

    public int getStatus() {
        return status;
    }

    public String code() {
        return code;
    }

    public String getCode() {
        return code;
    }

    public String requestId() {
        return requestId;
    }

    public String getRequestId() {
        return requestId;
    }

    public Map<String, List<String>> responseHeaders() {
        return responseHeaders;
    }

    public Map<String, List<String>> getResponseHeaders() {
        return responseHeaders;
    }

    public String responseBody() {
        return responseBody;
    }

    public String getResponseBody() {
        return responseBody;
    }

    public boolean isNetworkError() {
        return status == 0;
    }

    public boolean isClientError() {
        return status >= 400 && status <= 499;
    }

    public boolean isServerError() {
        return status >= 500 && status <= 599;
    }

    public boolean isRetryable() {
        return isNetworkError()
                || status == 408
                || status == 425
                || status == 429
                || status == 500
                || status == 502
                || status == 503
                || status == 504;
    }

    @Override
    public String toString() {
        String request = requestId == null || requestId.isBlank()
                ? ""
                : " (request " + requestId + ")";
        String prefix = code == null || code.isBlank()
                ? "[" + status + "] "
                : "[" + status + "] " + code + ": ";
        return prefix + getMessage() + request;
    }
}
