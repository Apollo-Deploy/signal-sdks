use crate::error::SdkError;
use reqwest::header::{HeaderMap, HeaderName, HeaderValue, COOKIE};
use reqwest::{Client as ReqwestClient, Method, RequestBuilder, Response, StatusCode};
use serde::de::DeserializeOwned;
use serde::Serialize;
use futures_core::Stream;
use futures_util::StreamExt;
use std::collections::HashMap;
use std::pin::Pin;
use std::sync::Arc;
use std::task::{Context, Poll};
use std::time::{Duration, SystemTime, UNIX_EPOCH};
use tokio::sync::mpsc;
use url::Url;

const MAX_RETRY_COUNT: u32 = 8;
const MAX_RESPONSE_BODY_BYTES: usize = 5 * 1024 * 1024;
const MAX_SSE_LINE_BYTES: usize = 64 * 1024;
const MAX_SSE_EVENT_BYTES: usize = 1024 * 1024;
const SSE_CHANNEL_CAPACITY: usize = 8;

pub struct SseEventStream<T> {
    receiver: mpsc::Receiver<Result<T, SdkError>>,
}

impl<T> Unpin for SseEventStream<T> {}

impl<T> Stream for SseEventStream<T> {
    type Item = Result<T, SdkError>;

    fn poll_next(
        self: Pin<&mut Self>,
        context: &mut Context<'_>,
    ) -> Poll<Option<Self::Item>> {
        Pin::new(&mut self.get_mut().receiver).poll_recv(context)
    }
}

#[derive(Debug, Clone)]
pub struct TransportConfig {
    pub base_url: String,
    pub timeout: Duration,
    pub max_retries: u32,
    pub retry_unsafe_requests: bool,
    pub default_headers: HashMap<String, String>,
}

pub(crate) struct WireBody {
    content_type: String,
    bytes: Vec<u8>,
}

impl WireBody {
    pub(crate) fn new(content_type: impl Into<String>, bytes: Vec<u8>) -> Self {
        Self {
            content_type: content_type.into(),
            bytes,
        }
    }

    pub(crate) fn from_multipart<T: Serialize>(body: &T) -> Result<Self, SdkError> {
        let value = serde_json::to_value(body).map_err(|error| {
            SdkError::ValidationError(format!("failed to serialize multipart body: {}", error))
        })?;
        let object = value.as_object().ok_or_else(|| {
            SdkError::ValidationError(
                "multipart request bodies must serialize to an object".to_string(),
            )
        })?;
        let boundary = format!(
            "tesseract-{:x}",
            SystemTime::now()
                .duration_since(UNIX_EPOCH)
                .unwrap_or_default()
                .as_nanos()
        );
        let mut bytes = Vec::new();
        for (name, value) in object {
            append_multipart_value(&mut bytes, &boundary, name, value)?;
        }
        bytes.extend_from_slice(format!("--{}--\r\n", boundary).as_bytes());

        Ok(Self::new(
            format!("multipart/form-data; boundary={}", boundary),
            bytes,
        ))
    }
}

#[derive(Clone)]
pub struct Transport {
    client: ReqwestClient,
    config: Arc<TransportConfig>,
}

impl Transport {
    pub fn new(mut config: TransportConfig) -> Self {
        config.max_retries = config.max_retries.min(MAX_RETRY_COUNT);
        let client = ReqwestClient::builder()
            .timeout(config.timeout)
            .user_agent("apollo_signal_sdk-rust-sdk/4.0.0")
            .build()
            .expect("failed to build reqwest client");
        Self { client, config: Arc::new(config) }
    }

    pub async fn execute<T: DeserializeOwned>(
        &self,
        method: Method,
        path: &str,
        query: Option<&[(String, String)]>,
        body: Option<&(impl Serialize + ?Sized)>,
        headers: Option<&[(String, String)]>,
        operation_timeout_ms: Option<u64>,
    ) -> Result<T, SdkError> {
        let request = self.build_request(
            method.clone(),
            path,
            query,
            body,
            headers,
            "application/json",
            operation_timeout_ms,
        )?;
        let response = self.execute_with_retry(request, &method, headers).await?;
        self.handle_response(response).await
    }

    pub(crate) async fn execute_wire<T: DeserializeOwned>(
        &self,
        method: Method,
        path: &str,
        query: Option<&[(String, String)]>,
        body: Option<WireBody>,
        headers: Option<&[(String, String)]>,
        operation_timeout_ms: Option<u64>,
    ) -> Result<T, SdkError> {
        let request = self.build_wire_request(
            method.clone(),
            path,
            query,
            body,
            headers,
            "application/json",
            operation_timeout_ms,
        )?;
        let response = self.execute_with_retry(request, &method, headers).await?;
        self.handle_response(response).await
    }

    pub async fn execute_raw(
        &self,
        method: Method,
        path: &str,
        query: Option<&[(String, String)]>,
        body: Option<&(impl Serialize + ?Sized)>,
        headers: Option<&[(String, String)]>,
        operation_timeout_ms: Option<u64>,
    ) -> Result<String, SdkError> {
        let request = self.build_request(
            method.clone(),
            path,
            query,
            body,
            headers,
            "application/json",
            operation_timeout_ms,
        )?;
        let response = self.execute_with_retry(request, &method, headers).await?;
        let status = response.status();
        let request_id = response
            .headers()
            .get("x-request-id")
            .or_else(|| response.headers().get("request-id"))
            .and_then(|value| value.to_str().ok())
            .map(String::from);
        let text = read_bounded_body(response).await?;
        if status.is_success() {
            Ok(text)
        } else {
            Err(Self::build_api_error(status, request_id, &text))
        }
    }

    pub(crate) async fn execute_raw_wire(
        &self,
        method: Method,
        path: &str,
        query: Option<&[(String, String)]>,
        body: Option<WireBody>,
        headers: Option<&[(String, String)]>,
        operation_timeout_ms: Option<u64>,
    ) -> Result<String, SdkError> {
        let request = self.build_wire_request(
            method.clone(),
            path,
            query,
            body,
            headers,
            "application/json",
            operation_timeout_ms,
        )?;
        let response = self.execute_with_retry(request, &method, headers).await?;
        let status = response.status();
        let request_id = response
            .headers()
            .get("x-request-id")
            .or_else(|| response.headers().get("request-id"))
            .and_then(|value| value.to_str().ok())
            .map(String::from);
        let text = read_bounded_body(response).await?;
        if status.is_success() {
            Ok(text)
        } else {
            Err(Self::build_api_error(status, request_id, &text))
        }
    }

    pub async fn execute_sse<T: DeserializeOwned + Send + 'static>(
        &self,
        method: Method,
        path: &str,
        query: Option<&[(String, String)]>,
        body: Option<&(impl Serialize + ?Sized)>,
        headers: Option<&[(String, String)]>,
        operation_timeout_ms: Option<u64>,
    ) -> Result<SseEventStream<T>, SdkError> {
        let request = self.build_request(
            method.clone(),
            path,
            query,
            body,
            headers,
            "text/event-stream",
            operation_timeout_ms,
        )?;
        let response = self.execute_with_retry(request, &method, headers).await?;
        let status = response.status();
        let request_id = response
            .headers()
            .get("x-request-id")
            .or_else(|| response.headers().get("request-id"))
            .and_then(|value| value.to_str().ok())
            .map(String::from);
        if !status.is_success() {
            let text = read_bounded_body(response).await?;
            return Err(Self::build_api_error(status, request_id, &text));
        }

        Ok(Self::start_sse_stream(response))
    }

    pub(crate) async fn execute_sse_wire<T: DeserializeOwned + Send + 'static>(
        &self,
        method: Method,
        path: &str,
        query: Option<&[(String, String)]>,
        body: Option<WireBody>,
        headers: Option<&[(String, String)]>,
        operation_timeout_ms: Option<u64>,
    ) -> Result<SseEventStream<T>, SdkError> {
        let request = self.build_wire_request(
            method.clone(),
            path,
            query,
            body,
            headers,
            "text/event-stream",
            operation_timeout_ms,
        )?;
        let response = self.execute_with_retry(request, &method, headers).await?;
        let status = response.status();
        let request_id = response
            .headers()
            .get("x-request-id")
            .or_else(|| response.headers().get("request-id"))
            .and_then(|value| value.to_str().ok())
            .map(String::from);
        if !status.is_success() {
            let text = read_bounded_body(response).await?;
            return Err(Self::build_api_error(status, request_id, &text));
        }

        Ok(Self::start_sse_stream(response))
    }

    fn build_request(
        &self,
        method: Method,
        path: &str,
        query: Option<&[(String, String)]>,
        body: Option<&(impl Serialize + ?Sized)>,
        headers: Option<&[(String, String)]>,
        accept: &str,
        operation_timeout_ms: Option<u64>,
    ) -> Result<RequestBuilder, SdkError> {
        let url = self.build_url(path, query)?;
        let request_headers = self.build_headers(headers, accept)?;
        let mut request = self.client.request(method, url).headers(request_headers);
        if let Some(body) = body {
            request = request.json(body);
        }
        if let Some(timeout_ms) = operation_timeout_ms {
            request = request.timeout(Duration::from_millis(timeout_ms.max(1)));
        }
        Ok(request)
    }

    fn build_wire_request(
        &self,
        method: Method,
        path: &str,
        query: Option<&[(String, String)]>,
        body: Option<WireBody>,
        headers: Option<&[(String, String)]>,
        accept: &str,
        operation_timeout_ms: Option<u64>,
    ) -> Result<RequestBuilder, SdkError> {
        let url = self.build_url(path, query)?;
        let request_headers = self.build_headers(headers, accept)?;
        let mut request = self.client.request(method, url).headers(request_headers);
        if let Some(body) = body {
            request = request
                .header("Content-Type", body.content_type)
                .body(body.bytes);
        }
        if let Some(timeout_ms) = operation_timeout_ms {
            request = request.timeout(Duration::from_millis(timeout_ms.max(1)));
        }
        Ok(request)
    }

    fn build_url(
        &self,
        path: &str,
        query: Option<&[(String, String)]>,
    ) -> Result<Url, SdkError> {
        let mut base = Url::parse(&self.config.base_url)
            .map_err(|error| SdkError::ValidationError(format!("invalid base URL: {}", error)))?;
        let mut merged_query: Vec<(String, String)> = base
            .query_pairs()
            .map(|(name, value)| (name.into_owned(), value.into_owned()))
            .collect();
        base.set_query(None);
        base.set_fragment(None);
        let base_path = base.path().trim_end_matches('/');
        let request_path = path.trim_start_matches('/');
        let joined_path = if request_path.is_empty() {
            format!("{}/", base_path)
        } else {
            format!("{}/{}", base_path, request_path)
        };
        base.set_path(&joined_path);
        let mut url = base;
        if let Some(params) = query {
            merged_query.retain(|(name, _)| {
                !params
                    .iter()
                    .any(|(request_name, _)| request_name == name)
            });
            merged_query.extend(params.iter().cloned());
        }
        url.set_query(None);
        if !merged_query.is_empty() {
            let mut pairs = url.query_pairs_mut();
            for (name, value) in merged_query {
                pairs.append_pair(&name, &value);
            }
        }
        Ok(url)
    }

    fn build_headers(
        &self,
        request_headers: Option<&[(String, String)]>,
        accept: &str,
    ) -> Result<HeaderMap, SdkError> {
        let mut headers = HeaderMap::new();
        Self::set_header(&mut headers, "accept", accept)?;
        for (key, value) in &self.config.default_headers {
            Self::set_header(&mut headers, key, value)?;
        }
        if let Some(request_headers) = request_headers {
            for (key, value) in request_headers {
                Self::set_header(&mut headers, key, value)?;
            }
        }
        Ok(headers)
    }

    fn set_header(headers: &mut HeaderMap, name: &str, value: &str) -> Result<(), SdkError> {
        let name = HeaderName::from_bytes(name.as_bytes()).map_err(|error| {
            SdkError::ValidationError(format!("invalid header name: {}", error))
        })?;
        let value = HeaderValue::from_str(value).map_err(|error| {
            SdkError::ValidationError(format!("invalid header value: {}", error))
        })?;
        headers.insert(name, value);
        Ok(())
    }


    fn set_cookie(
        headers: &mut HeaderMap,
        name: &str,
        value: &str,
    ) -> Result<(), SdkError> {
        let encoded_name = urlencoding::encode(name).into_owned();
        let encoded_value = urlencoding::encode(value).into_owned();
        let mut pairs: Vec<String> = headers
            .get(COOKIE)
            .and_then(|value| value.to_str().ok())
            .unwrap_or_default()
            .split(';')
            .map(str::trim)
            .filter(|pair| !pair.is_empty())
            .filter(|pair| {
                pair.split_once('=')
                    .map(|(existing_name, _)| existing_name != encoded_name)
                    .unwrap_or(true)
            })
            .map(String::from)
            .collect();
        pairs.push(format!("{}={}", encoded_name, encoded_value));
        Self::set_header(headers, "cookie", &pairs.join("; "))
    }

    async fn execute_with_retry(
        &self,
        request: RequestBuilder,
        method: &Method,
        headers: Option<&[(String, String)]>,
    ) -> Result<Response, SdkError> {
        let can_retry = self.can_retry(method, headers);
        let mut attempt = 0u32;

        loop {
            let current = request.try_clone().ok_or_else(|| {
                SdkError::NetworkError("request body cannot be cloned for execution".to_string())
            })?;
            match current.send().await {
                Ok(response) => {
                    let status = response.status();
                    if can_retry && is_retryable_status(status) && attempt < self.config.max_retries {
                        let delay = retry_delay(response.headers().get("retry-after"), attempt);
                        attempt += 1;
                        tokio::time::sleep(delay).await;
                        continue;
                    }
                    return Ok(response);
                }
                Err(error) => {
                    if can_retry
                        && attempt < self.config.max_retries
                        && (error.is_connect() || error.is_timeout() || error.is_request())
                    {
                        let delay = retry_delay(None, attempt);
                        attempt += 1;
                        tokio::time::sleep(delay).await;
                        continue;
                    }
                    return Err(SdkError::NetworkError(error.to_string()));
                }
            }
        }
    }

    fn can_retry(&self, method: &Method, headers: Option<&[(String, String)]>) -> bool {
        if self.config.retry_unsafe_requests
            || method == Method::GET
            || method == Method::HEAD
            || method == Method::OPTIONS
            || method == Method::PUT
            || method == Method::DELETE
        {
            return true;
        }

        let has_idempotency_key = |name: &str, value: &str| {
            (name.eq_ignore_ascii_case("idempotency-key")
                || name.eq_ignore_ascii_case("x-idempotency-key"))
                && !value.is_empty()
        };

        self.config
            .default_headers
            .iter()
            .any(|(name, value)| has_idempotency_key(name, value))
            || headers
                .unwrap_or_default()
                .iter()
                .any(|(name, value)| has_idempotency_key(name, value))
    }

    async fn handle_response<T: DeserializeOwned>(&self, response: Response) -> Result<T, SdkError> {
        let status = response.status();
        let request_id = response
            .headers()
            .get("x-request-id")
            .or_else(|| response.headers().get("request-id"))
            .and_then(|value| value.to_str().ok())
            .map(String::from);
        let text = read_bounded_body(response).await?;
        if status.is_success() {
            if text.trim().is_empty() {
                serde_json::from_str("null").map_err(|error| {
                    SdkError::DeserializationError(format!("empty response could not be decoded: {}", error))
                })
            } else {
                serde_json::from_str(&text).map_err(|error| {
                    SdkError::DeserializationError(format!(
                        "failed to deserialize response (status {}): {}",
                        status, error
                    ))
                })
            }
        } else {
            Err(Self::build_api_error(status, request_id, &text))
        }
    }

    fn build_api_error(status: StatusCode, request_id: Option<String>, body: &str) -> SdkError {
        let parsed = serde_json::from_str::<serde_json::Value>(body).ok();
        let nested = parsed.as_ref().and_then(|value| value.get("error"));
        let code = parsed
            .as_ref()
            .and_then(|value| value.get("code"))
            .or_else(|| nested.and_then(|value| value.get("code")))
            .or_else(|| nested.filter(|value| value.is_string()))
            .and_then(|value| value.as_str())
            .map(String::from);
        let message = parsed
            .as_ref()
            .and_then(|value| value.get("message"))
            .or_else(|| nested.and_then(|value| value.get("message")))
            .or_else(|| nested.filter(|value| value.is_string()))
            .and_then(|value| value.as_str())
            .unwrap_or(body)
            .to_string();
        let body_request_id = parsed
            .as_ref()
            .and_then(|value| value.get("request_id"))
            .and_then(|value| value.as_str())
            .map(String::from);
        SdkError::ApiError {
            status: status.as_u16(),
            code,
            message,
            request_id: body_request_id.or(request_id),
            body: body.to_string(),
        }
    }

    fn start_sse_stream<T: DeserializeOwned + Send + 'static>(
        response: Response,
    ) -> SseEventStream<T> {
        let (sender, receiver) = mpsc::channel(SSE_CHANNEL_CAPACITY);
        tokio::spawn(async move {
            let mut bytes = response.bytes_stream();
            let mut line = Vec::with_capacity(1024);
            let mut event_data = String::new();

            while let Some(chunk) = bytes.next().await {
                let chunk = match chunk {
                    Ok(chunk) => chunk,
                    Err(error) => {
                        let _ = sender
                            .send(Err(SdkError::NetworkError(format!(
                                "failed to read SSE response: {}",
                                error
                            ))))
                            .await;
                        return;
                    }
                };

                for byte in chunk {
                    if byte == b'\n' {
                        if let Ok(line_text) = std::str::from_utf8(&line) {
                            if line_text.is_empty() {
                                if !dispatch_sse_event(&mut event_data, &sender).await {
                                    return;
                                }
                            } else if let Err(error) = append_sse_data(line_text, &mut event_data) {
                                let _ = sender.send(Err(error)).await;
                                return;
                            }
                        } else {
                            let _ = sender
                                .send(Err(SdkError::DeserializationError(
                                    "SSE response contained invalid UTF-8".to_string(),
                                )))
                                .await;
                            return;
                        }
                        line.clear();
                        continue;
                    }

                    if byte == b'\r' {
                        continue;
                    }
                    if line.len() >= MAX_SSE_LINE_BYTES {
                        let _ = sender
                            .send(Err(SdkError::DeserializationError(format!(
                                "SSE line exceeds {} bytes",
                                MAX_SSE_LINE_BYTES
                            ))))
                            .await;
                        return;
                    }
                    line.push(byte);
                }
            }

            if !line.is_empty() {
                match std::str::from_utf8(&line) {
                    Ok(line_text) => {
                        if let Err(error) = append_sse_data(line_text, &mut event_data) {
                            let _ = sender.send(Err(error)).await;
                            return;
                        }
                    }
                    Err(_) => {
                        let _ = sender
                            .send(Err(SdkError::DeserializationError(
                                "SSE response contained invalid UTF-8".to_string(),
                            )))
                            .await;
                        return;
                    }
                }
            }
            let _ = dispatch_sse_event(&mut event_data, &sender).await;
        });

        SseEventStream { receiver }
    }
}

async fn dispatch_sse_event<T: DeserializeOwned>(
    event_data: &mut String,
    sender: &mpsc::Sender<Result<T, SdkError>>,
) -> bool {
    if event_data.is_empty() {
        return true;
    }

    let result = serde_json::from_str::<T>(event_data).map_err(|error| {
        SdkError::DeserializationError(format!("failed to decode SSE event: {}", error))
    });
    event_data.clear();
    sender.send(result).await.is_ok()
}

fn append_sse_data(line: &str, event_data: &mut String) -> Result<(), SdkError> {
    if line.starts_with(':') {
        return Ok(());
    }
    let Some((field, value)) = line.split_once(':') else {
        return Ok(());
    };
    if field != "data" {
        return Ok(());
    }

    let value = value.strip_prefix(' ').unwrap_or(value);
    let separator = usize::from(!event_data.is_empty());
    let next_size = event_data
        .len()
        .saturating_add(separator)
        .saturating_add(value.len());
    if next_size > MAX_SSE_EVENT_BYTES {
        return Err(SdkError::DeserializationError(format!(
            "SSE event exceeds {} bytes",
            MAX_SSE_EVENT_BYTES
        )));
    }
    if separator != 0 {
        event_data.push('\n');
    }
    event_data.push_str(value);
    Ok(())
}

async fn read_bounded_body(response: Response) -> Result<String, SdkError> {
    if response
        .content_length()
        .is_some_and(|length| length > MAX_RESPONSE_BODY_BYTES as u64)
    {
        return Err(SdkError::DeserializationError(format!(
            "response body exceeds {} bytes",
            MAX_RESPONSE_BODY_BYTES
        )));
    }

    let mut body = Vec::new();
    let mut bytes = response.bytes_stream();
    while let Some(chunk) = bytes.next().await {
        let chunk = chunk.map_err(|error| {
            SdkError::DeserializationError(format!("failed to read response body: {}", error))
        })?;
        if body.len().saturating_add(chunk.len()) > MAX_RESPONSE_BODY_BYTES {
            return Err(SdkError::DeserializationError(format!(
                "response body exceeds {} bytes",
                MAX_RESPONSE_BODY_BYTES
            )));
        }
        body.extend_from_slice(&chunk);
    }

    String::from_utf8(body).map_err(|_| {
        SdkError::DeserializationError("response body contained invalid UTF-8".to_string())
    })
}

fn append_multipart_value(
    body: &mut Vec<u8>,
    boundary: &str,
    name: &str,
    value: &serde_json::Value,
) -> Result<(), SdkError> {
    match value {
        serde_json::Value::Null => Ok(()),
        serde_json::Value::Array(values) if values.iter().all(is_byte_value) => {
            let bytes = values
                .iter()
                .map(|value| value.as_u64().unwrap_or_default() as u8)
                .collect::<Vec<_>>();
            append_multipart_part(body, boundary, name, &bytes, true);
            Ok(())
        }
        serde_json::Value::Array(values) => {
            for value in values {
                append_multipart_value(body, boundary, name, value)?;
            }
            Ok(())
        }
        value => {
            let text = match value {
                serde_json::Value::String(text) => text.clone(),
                serde_json::Value::Bool(_) | serde_json::Value::Number(_) => value.to_string(),
                serde_json::Value::Object(_) => serde_json::to_string(value).map_err(|error| {
                    SdkError::ValidationError(format!(
                        "failed to encode multipart field '{}': {}",
                        name, error
                    ))
                })?,
                serde_json::Value::Null | serde_json::Value::Array(_) => unreachable!(),
            };
            append_multipart_part(body, boundary, name, text.as_bytes(), false);
            Ok(())
        }
    }
}

fn is_byte_value(value: &serde_json::Value) -> bool {
    value.as_u64().is_some_and(|number| number <= u8::MAX as u64)
}

fn append_multipart_part(
    body: &mut Vec<u8>,
    boundary: &str,
    name: &str,
    value: &[u8],
    binary: bool,
) {
    let safe_name = escape_multipart_token(name);
    let filename = if binary {
        format!("; filename=\"{}\"", safe_name)
    } else {
        String::new()
    };
    let content_type = if binary {
        "\r\nContent-Type: application/octet-stream"
    } else {
        ""
    };
    body.extend_from_slice(
        format!(
            "--{}\r\nContent-Disposition: form-data; name=\"{}\"{}{}\r\n\r\n",
            boundary, safe_name, filename, content_type
        )
        .as_bytes(),
    );
    body.extend_from_slice(value);
    body.extend_from_slice(b"\r\n");
}

fn escape_multipart_token(value: &str) -> String {
    value
        .replace('\\', "\\\\")
        .replace('"', "\\\"")
        .replace('\r', "")
        .replace('\n', "")
}

fn is_retryable_status(status: StatusCode) -> bool {
    matches!(status.as_u16(), 408 | 425 | 429 | 500 | 502 | 503 | 504)
}

fn retry_delay(retry_after: Option<&reqwest::header::HeaderValue>, attempt: u32) -> Duration {
    if let Some(value) = retry_after.and_then(|value| value.to_str().ok()) {
        if let Ok(seconds) = value.parse::<f64>() {
            return Duration::from_secs_f64(seconds.max(0.0).min(30.0));
        }
        if let Ok(time) = httpdate::parse_http_date(value) {
            if let Ok(delay) = time.duration_since(SystemTime::now()) {
                return delay.min(Duration::from_secs(30));
            }
        }
    }
    let base = (400u64.saturating_mul(2u64.saturating_pow(attempt))).min(30_000);
    let jitter = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .subsec_nanos() as u64
        % (base / 2 + 1);
    Duration::from_millis((base + jitter).min(30_000))
}

impl std::fmt::Debug for Transport {
    fn fmt(&self, formatter: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        formatter.debug_struct("Transport").field("config", &self.config).finish()
    }
}
