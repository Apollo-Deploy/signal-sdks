package signal

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"math/rand"
	"mime/multipart"
	"net"
	"net/http"
	"net/url"
	"reflect"
	"sort"
	"strconv"
	"strings"
	"time"
)

const (
	maxResponseBodyBytes int64 = 5 * 1024 * 1024
	maxSSELineBytes            = 1024 * 1024
)

var retryableMethods = map[string]struct{}{
	http.MethodGet: {}, http.MethodHead: {}, http.MethodOptions: {},
	http.MethodPut: {}, http.MethodDelete: {},
}

var retryableStatuses = map[int]struct{}{
	http.StatusRequestTimeout: {}, 425: {}, http.StatusTooManyRequests: {},
	http.StatusInternalServerError: {}, http.StatusBadGateway: {},
	http.StatusServiceUnavailable: {}, http.StatusGatewayTimeout: {},
}

// TransportConfig configures the HTTP transport.
type TransportConfig struct {
	BaseURL string
	Timeout             time.Duration
	MaxRetries          int
	RetryUnsafeRequests bool
	Headers             map[string]string
	UserAgent           string
}

// Transport handles authentication, serialization, retries, and errors.
type Transport struct {
	config     TransportConfig
	httpClient *http.Client
}

func NewTransport(cfg TransportConfig) *Transport {
	if cfg.Timeout <= 0 {
		cfg.Timeout = 15 * time.Second
	}
	if cfg.MaxRetries < 0 {
		cfg.MaxRetries = 0
	}
	if cfg.UserAgent == "" {
		cfg.UserAgent = "signal-go-sdk/1.0.4"
	}
	return &Transport{
		config: cfg,
		httpClient: &http.Client{},
	}
}

type request struct {
	Method      string
	Path        string
	Query       url.Values
	Body        interface{}
	ContentType string
	Headers     map[string]string
	Timeout     time.Duration
}

func (t *Transport) Execute(ctx context.Context, req request, result interface{}) error {
	body, err := t.executeWithRetries(ctx, req)
	if err != nil {
		return err
	}
	if result == nil {
		return nil
	}
	if len(body) == 0 {
		return &SDKError{
			Status: 0,
			Code: "empty_response",
			Message: "successful response did not contain the expected JSON body",
		}
	}
	if err := json.Unmarshal(body, result); err != nil {
		return fmt.Errorf("failed to unmarshal response: %w", err)
	}
	return nil
}

func (t *Transport) ExecuteRaw(ctx context.Context, req request) ([]byte, error) {
	return t.executeWithRetries(ctx, req)
}

func (t *Transport) executeWithRetries(ctx context.Context, req request) ([]byte, error) {
	requestCtx, cancel := t.requestContext(ctx, req.Timeout)
	defer cancel()

	canRetry := t.canRetry(req)
	var lastErr error

	for attempt := 0; attempt <= t.config.MaxRetries; attempt++ {
		resp, body, err := t.doRequest(requestCtx, req)
		if err == nil && resp.StatusCode >= 200 && resp.StatusCode < 300 {
			return body, nil
		}

		var retryAfter time.Duration
		if err != nil {
			lastErr = err
			var sdkErr *SDKError
			if errors.As(err, &sdkErr) {
				return nil, sdkErr
			}
			if !canRetry || !isRetryableNetworkError(err) || attempt >= t.config.MaxRetries {
				return nil, normalizeNetworkError(err)
			}
		} else {
			lastErr = parseErrorResponse(resp, body)
			if !canRetry || !isRetryableStatus(resp.StatusCode) || attempt >= t.config.MaxRetries {
				return nil, lastErr
			}
			retryAfter = parseRetryAfter(resp.Header.Get("Retry-After"))
		}

		delay := retryAfter
		if delay <= 0 {
			capDelay := 400 * time.Millisecond * time.Duration(1<<attempt)
			if capDelay > 30*time.Second {
				capDelay = 30 * time.Second
			}
			if capDelay > 0 {
				delay = time.Duration(rand.Int63n(int64(capDelay) + 1))
			}
		}
		select {
		case <-requestCtx.Done():
			return nil, normalizeNetworkError(requestCtx.Err())
		case <-time.After(delay):
		}
	}

	return nil, lastErr
}

func (t *Transport) requestContext(
	ctx context.Context,
	operationTimeout time.Duration,
) (context.Context, context.CancelFunc) {
	timeout := operationTimeout
	if timeout <= 0 {
		timeout = t.config.Timeout
	}
	return context.WithTimeout(ctx, timeout)
}

func (t *Transport) canRetry(req request) bool {
	if t.config.RetryUnsafeRequests {
		return true
	}
	if _, ok := retryableMethods[strings.ToUpper(req.Method)]; ok {
		return true
	}
	for name, value := range t.config.Headers {
		if isIdempotencyHeader(name, value) {
			return true
		}
	}
	for name, value := range req.Headers {
		if isIdempotencyHeader(name, value) {
			return true
		}
	}
	return false
}

func isIdempotencyHeader(name, value string) bool {
	return value != "" &&
		(strings.EqualFold(name, "Idempotency-Key") ||
			strings.EqualFold(name, "X-Idempotency-Key"))
}

func (t *Transport) doRequest(ctx context.Context, req request) (*http.Response, []byte, error) {
	httpReq, err := t.buildRequest(ctx, req, "application/json")
	if err != nil {
		return nil, nil, err
	}

	resp, err := t.httpClient.Do(httpReq)
	if err != nil {
		return nil, nil, err
	}
	defer resp.Body.Close()
	body, err := readBoundedBody(resp.Body)
	if err != nil {
		return resp, nil, err
	}
	return resp, body, nil
}

func (t *Transport) buildRequest(
	ctx context.Context,
	req request,
	accept string,
) (*http.Request, error) {
	base, err := url.Parse(t.config.BaseURL)
	if err != nil {
		return nil, invalidRequestError("invalid base URL", err)
	}
	baseQuery := base.Query()
	base.RawQuery = ""
	base.Fragment = ""
	base.Path = strings.TrimRight(base.Path, "/") + "/"
	base.RawPath = ""

	rel, err := url.Parse(strings.TrimLeft(req.Path, "/"))
	if err != nil {
		return nil, invalidRequestError("invalid request path", err)
	}
	if rel.IsAbs() || rel.Host != "" {
		return nil, invalidRequestError(
			"request path must be relative",
			errors.New("absolute URL is not allowed"),
		)
	}
	fullURL := base.ResolveReference(rel)
	mergedQuery := baseQuery
	for key, values := range fullURL.Query() {
		mergedQuery.Del(key)
		for _, value := range values {
			mergedQuery.Add(key, value)
		}
	}
	for key, values := range req.Query {
		mergedQuery.Del(key)
		for _, value := range values {
			mergedQuery.Add(key, value)
		}
	}
	fullURL.RawQuery = mergedQuery.Encode()

	bodyReader, contentType, err := encodeRequestBody(req.Body, req.ContentType)
	if err != nil {
		return nil, invalidRequestError("failed to encode request body", err)
	}

	httpReq, err := http.NewRequestWithContext(ctx, req.Method, fullURL.String(), bodyReader)
	if err != nil {
		return nil, invalidRequestError("failed to create request", err)
	}

	for key, value := range t.config.Headers {
		httpReq.Header.Set(key, value)
	}
	for key, value := range req.Headers {
		httpReq.Header.Set(key, value)
	}
	if accept == "text/event-stream" || httpReq.Header.Get("Accept") == "" {
		httpReq.Header.Set("Accept", accept)
	}
	if httpReq.Header.Get("User-Agent") == "" {
		httpReq.Header.Set("User-Agent", t.config.UserAgent)
	}
	if contentType != "" {
		httpReq.Header.Set("Content-Type", contentType)
	}
	if err := t.applyAuthentication(httpReq); err != nil {
		return nil, err
	}
	return httpReq, nil
}

func (t *Transport) applyAuthentication(httpReq *http.Request) error {
	return nil
}

func setSecurityHeader(
	headers http.Header,
	claimedHeaders map[string]struct{},
	name string,
	value string,
) error {
	normalized := strings.ToLower(name)
	if _, exists := claimedHeaders[normalized]; exists {
		return &SDKError{
			Status: 0,
			Code: "invalid_security_configuration",
			Message: "multiple configured security schemes target the " + name + " header",
		}
	}
	claimedHeaders[normalized] = struct{}{}
	headers.Set(name, value)
	return nil
}

func encodeRequestBody(body interface{}, declaredContentType string) (io.Reader, string, error) {
	if body == nil {
		return nil, "", nil
	}
	contentType := declaredContentType
	if contentType == "" {
		contentType = "application/json"
	}
	mediaType := strings.ToLower(strings.TrimSpace(strings.SplitN(contentType, ";", 2)[0]))

	if mediaType == "application/json" || strings.HasSuffix(mediaType, "+json") {
		bodyBytes, err := json.Marshal(body)
		if err != nil {
			return nil, "", err
		}
		return bytes.NewReader(bodyBytes), contentType, nil
	}
	if mediaType == "multipart/form-data" {
		return encodeMultipartBody(body)
	}

	switch value := body.(type) {
	case []byte:
		return bytes.NewReader(value), contentType, nil
	case string:
		return strings.NewReader(value), contentType, nil
	default:
		return nil, "", fmt.Errorf(
			"raw request body for %s must be []byte or string, got %T",
			contentType,
			body,
		)
	}
}

func encodeMultipartBody(body interface{}) (io.Reader, string, error) {
	var buffer bytes.Buffer
	writer := multipart.NewWriter(&buffer)
	if err := appendMultipartRoot(writer, reflect.ValueOf(body)); err != nil {
		return nil, "", err
	}
	if err := writer.Close(); err != nil {
		return nil, "", err
	}
	return bytes.NewReader(buffer.Bytes()), writer.FormDataContentType(), nil
}

func appendMultipartRoot(writer *multipart.Writer, value reflect.Value) error {
	value = dereferenceValue(value)
	if !value.IsValid() {
		return fmt.Errorf("multipart request body cannot be nil")
	}

	switch value.Kind() {
	case reflect.Struct:
		valueType := value.Type()
		for index := 0; index < value.NumField(); index++ {
			fieldType := valueType.Field(index)
			if fieldType.PkgPath != "" {
				continue
			}
			name, omitEmpty, skip := multipartFieldName(fieldType)
			if skip || (omitEmpty && value.Field(index).IsZero()) {
				continue
			}
			if err := appendMultipartValue(writer, name, value.Field(index)); err != nil {
				return err
			}
		}
		return nil
	case reflect.Map:
		if value.Type().Key().Kind() != reflect.String {
			return fmt.Errorf("multipart map keys must be strings")
		}
		keys := value.MapKeys()
		sort.Slice(keys, func(left, right int) bool {
			return keys[left].String() < keys[right].String()
		})
		for _, key := range keys {
			if err := appendMultipartValue(writer, key.String(), value.MapIndex(key)); err != nil {
				return err
			}
		}
		return nil
	default:
		return fmt.Errorf("multipart request body must be a struct or string-keyed map")
	}
}

func appendMultipartValue(writer *multipart.Writer, name string, value reflect.Value) error {
	if strings.ContainsAny(name, "\r\n") {
		return fmt.Errorf("multipart field name contains a line break")
	}
	value = dereferenceValue(value)
	if !value.IsValid() {
		return nil
	}

	if value.Kind() == reflect.Slice && value.Type().Elem().Kind() == reflect.Uint8 {
		part, err := writer.CreateFormFile(name, name)
		if err != nil {
			return err
		}
		_, err = part.Write(value.Bytes())
		return err
	}

	switch value.Kind() {
	case reflect.Slice, reflect.Array:
		for index := 0; index < value.Len(); index++ {
			if err := appendMultipartValue(writer, name, value.Index(index)); err != nil {
				return err
			}
		}
		return nil
	case reflect.Map:
		if value.Type().Key().Kind() != reflect.String {
			return fmt.Errorf("nested multipart map keys must be strings")
		}
		keys := value.MapKeys()
		sort.Slice(keys, func(left, right int) bool {
			return keys[left].String() < keys[right].String()
		})
		for _, key := range keys {
			nestedName := fmt.Sprintf("%s[%s]", name, key.String())
			if err := appendMultipartValue(writer, nestedName, value.MapIndex(key)); err != nil {
				return err
			}
		}
		return nil
	case reflect.Struct:
		if value.CanInterface() {
			if stringer, ok := value.Interface().(fmt.Stringer); ok {
				return writer.WriteField(name, stringer.String())
			}
		}
		valueType := value.Type()
		for index := 0; index < value.NumField(); index++ {
			fieldType := valueType.Field(index)
			if fieldType.PkgPath != "" {
				continue
			}
			fieldName, omitEmpty, skip := multipartFieldName(fieldType)
			if skip || (omitEmpty && value.Field(index).IsZero()) {
				continue
			}
			nestedName := fmt.Sprintf("%s[%s]", name, fieldName)
			if err := appendMultipartValue(writer, nestedName, value.Field(index)); err != nil {
				return err
			}
		}
		return nil
	default:
		if !value.CanInterface() {
			return fmt.Errorf("multipart field %q is not accessible", name)
		}
		return writer.WriteField(name, fmt.Sprint(value.Interface()))
	}
}

func multipartFieldName(field reflect.StructField) (string, bool, bool) {
	tag := field.Tag.Get("json")
	parts := strings.Split(tag, ",")
	if len(parts) > 0 && parts[0] == "-" {
		return "", false, true
	}
	name := field.Name
	if len(parts) > 0 && parts[0] != "" {
		name = parts[0]
	}
	omitEmpty := false
	for _, option := range parts[1:] {
		if option == "omitempty" {
			omitEmpty = true
		}
	}
	return name, omitEmpty, false
}

func dereferenceValue(value reflect.Value) reflect.Value {
	for value.IsValid() && (value.Kind() == reflect.Interface || value.Kind() == reflect.Pointer) {
		if value.IsNil() {
			return reflect.Value{}
		}
		value = value.Elem()
	}
	return value
}

func encodeCookiePair(name, value string) string {
	return encodeCookieComponent(name) + "=" + encodeCookieComponent(value)
}

func encodeCookieComponent(value string) string {
	return strings.ReplaceAll(url.QueryEscape(value), "+", "%20")
}

func setRequestCookie(req *http.Request, name, value string) {
	encodedName := encodeCookieComponent(name)
	pairs := make([]string, 0)
	for _, pair := range strings.Split(req.Header.Get("Cookie"), ";") {
		pair = strings.TrimSpace(pair)
		if pair == "" {
			continue
		}
		existingName := strings.TrimSpace(strings.SplitN(pair, "=", 2)[0])
		if strings.EqualFold(existingName, name) || strings.EqualFold(existingName, encodedName) {
			continue
		}
		pairs = append(pairs, pair)
	}
	pairs = append(pairs, encodeCookiePair(name, value))
	req.Header.Set("Cookie", strings.Join(pairs, "; "))
}

func readBoundedBody(reader io.Reader) ([]byte, error) {
	body, err := io.ReadAll(io.LimitReader(reader, maxResponseBodyBytes+1))
	if err != nil {
		return nil, fmt.Errorf("failed to read response body: %w", err)
	}
	if int64(len(body)) > maxResponseBodyBytes {
		return nil, &SDKError{
			Status: 0,
			Code: "response_body_too_large",
			Message: fmt.Sprintf("response body exceeds %d bytes", maxResponseBodyBytes),
		}
	}
	return body, nil
}

func invalidRequestError(message string, err error) *SDKError {
	return &SDKError{Status: 0, Code: "invalid_request", Message: message + ": " + err.Error()}
}

// Stream opens a streaming response. Reconnection is left to the caller because
// replaying a partially consumed stream can duplicate events.
func (t *Transport) Stream(ctx context.Context, req request) (*http.Response, error) {
	requestCtx, cancel := t.requestContext(ctx, req.Timeout)
	httpReq, err := t.buildRequest(requestCtx, req, "text/event-stream")
	if err != nil {
		cancel()
		return nil, err
	}

	resp, err := t.httpClient.Do(httpReq)
	if err != nil {
		cancel()
		return nil, normalizeNetworkError(err)
	}
	resp.Body = &cancelOnCloseReadCloser{ReadCloser: resp.Body, cancel: cancel}
	if resp.StatusCode < 200 || resp.StatusCode >= 300 {
		body, readErr := readBoundedBody(resp.Body)
		resp.Body.Close()
		if readErr != nil {
			return nil, readErr
		}
		return nil, parseErrorResponse(resp, body)
	}
	return resp, nil
}

type cancelOnCloseReadCloser struct {
	io.ReadCloser
	cancel context.CancelFunc
}

func (body *cancelOnCloseReadCloser) Close() error {
	err := body.ReadCloser.Close()
	body.cancel()
	return err
}

func (t *Transport) CloseIdleConnections() {
	t.httpClient.CloseIdleConnections()
}

func isRetryableStatus(status int) bool {
	_, ok := retryableStatuses[status]
	return ok
}

func isRetryableNetworkError(err error) bool {
	if err == nil {
		return false
	}
	if netErr, ok := err.(net.Error); ok {
		return netErr.Timeout() || netErr.Temporary()
	}
	message := strings.ToLower(err.Error())
	return strings.Contains(message, "connection reset") ||
		strings.Contains(message, "connection refused") ||
		strings.Contains(message, "unexpected eof") ||
		strings.Contains(message, "temporary failure")
}

func normalizeNetworkError(err error) error {
	if err == nil {
		return nil
	}
	return &SDKError{Status: 0, Code: "network_error", Message: err.Error()}
}

func parseRetryAfter(value string) time.Duration {
	if value == "" {
		return 0
	}
	if seconds, err := strconv.ParseFloat(value, 64); err == nil && seconds >= 0 {
		delay := time.Duration(seconds * float64(time.Second))
		if delay > 30*time.Second {
			return 30 * time.Second
		}
		return delay
	}
	if when, err := http.ParseTime(value); err == nil {
		delay := time.Until(when)
		if delay > 30*time.Second {
			return 30 * time.Second
		}
		if delay > 0 {
			return delay
		}
	}
	return 0
}

func parseErrorResponse(resp *http.Response, body []byte) error {
	requestID := resp.Header.Get("X-Request-ID")
	if requestID == "" {
		requestID = resp.Header.Get("Request-ID")
	}
	sdkErr := &SDKError{
		Status: resp.StatusCode, RequestID: requestID,
		Code: "http_error", Message: strings.TrimSpace(string(body)),
	}
	var envelope struct {
		Code      string `json:"code"`
		Message   string `json:"message"`
		Error     string `json:"error"`
		RequestID string `json:"request_id"`
	}
	if err := json.Unmarshal(body, &envelope); err == nil {
		if envelope.Code != "" { sdkErr.Code = envelope.Code } else if envelope.Error != "" { sdkErr.Code = envelope.Error }
		if envelope.Message != "" { sdkErr.Message = envelope.Message }
		if envelope.RequestID != "" { sdkErr.RequestID = envelope.RequestID }
	}
	if sdkErr.Message == "" {
		sdkErr.Message = fmt.Sprintf("HTTP %d: %s", resp.StatusCode, resp.Status)
	}
	return sdkErr
}
