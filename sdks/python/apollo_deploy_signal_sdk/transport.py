"""HTTP transport layer for apollo_deploy_signal_sdk."""

from __future__ import annotations

import email.utils
import json
import random
import time
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from datetime import date, datetime, timezone
from enum import Enum
from typing import Any, Callable, Dict, Generic, Iterator, List, Optional, Tuple, TypeVar
from urllib.parse import parse_qsl, quote, urlencode, urlsplit, urlunsplit

import httpx
from pydantic import TypeAdapter, ValidationError

from .errors import SDKError


_RETRYABLE_METHODS = frozenset({"GET", "HEAD", "OPTIONS", "PUT", "DELETE"})
_RETRYABLE_STATUSES = frozenset({408, 425, 429, 500, 502, 503, 504})
_MAX_RESPONSE_BODY_BYTES = 5 * 1024 * 1024
_MAX_SSE_LINE_BYTES = 1024 * 1024
_PayloadT = TypeVar("_PayloadT")


@dataclass(frozen=True)
class SSEEvent(Generic[_PayloadT]):
    """A framed server-sent event with a validated payload."""

    type: str
    data: _PayloadT
    id: Optional[str] = None
    retry_milliseconds: Optional[int] = None


class RequestOptions:
    """Per-request transport overrides."""

    def __init__(
        self,
        timeout_ms: Optional[int] = None,
        headers: Optional[Dict[str, str]] = None,
        retries: Optional[int] = None,
        retry_unsafe_requests: Optional[bool] = None,
    ):
        self.timeout_ms = timeout_ms
        self.headers = headers or {}
        self.retries = retries
        self.retry_unsafe_requests = retry_unsafe_requests

    def copy(self) -> "RequestOptions":
        return RequestOptions(
            timeout_ms=self.timeout_ms,
            headers=dict(self.headers),
            retries=self.retries,
            retry_unsafe_requests=self.retry_unsafe_requests,
        )

    def with_default_timeout(self, timeout_ms: int) -> "RequestOptions":
        copied = self.copy()
        if copied.timeout_ms is None:
            copied.timeout_ms = timeout_ms
        return copied


class SDKTransport:
    """Synchronous HTTP transport with bounded retries and structured errors."""

    def __init__(
        self,
        base_url: str,
        timeout_ms: int = 15000,
        retries: int = 3,
        retry_unsafe_requests: bool = False,
        default_headers: Optional[Dict[str, str]] = None,
        on_request: Optional[Callable[..., None]] = None,
        on_response: Optional[Callable[[httpx.Response], None]] = None,
        on_error: Optional[Callable[[SDKError], None]] = None,
    ):
        if timeout_ms <= 0:
            raise ValueError("timeout_ms must be greater than zero")
        if retries < 0:
            raise ValueError("retries cannot be negative")

        self.base_url = base_url
        self.timeout_ms = timeout_ms
        self.max_retries = retries
        self.retry_unsafe_requests = retry_unsafe_requests
        self.default_headers = {
            "Accept": "application/json",
            "User-Agent": "apollo_deploy_signal_sdk-python-sdk/1.0.4",
            **(default_headers or {}),
        }
        self.on_request = on_request
        self.on_response = on_response
        self.on_error = on_error
        self._client = httpx.Client(timeout=timeout_ms / 1000.0)

    @staticmethod
    def _header_key(headers: Dict[str, str], name: str) -> Optional[str]:
        return next((key for key in headers if key.lower() == name.lower()), None)

    @classmethod
    def _set_header(cls, headers: Dict[str, str], name: str, value: str) -> None:
        existing = cls._header_key(headers, name)
        if existing is not None and existing != name:
            del headers[existing]
        headers[name] = value

    @classmethod
    def _set_security_header(
        cls,
        headers: Dict[str, str],
        claimed_headers: set[str],
        name: str,
        value: str,
    ) -> None:
        normalized = name.lower()
        if normalized in claimed_headers:
            raise ValueError(
                f"Multiple configured security schemes target the {name} header"
            )
        claimed_headers.add(normalized)
        cls._set_header(headers, name, value)

    @classmethod
    def _remove_header(cls, headers: Dict[str, str], name: str) -> None:
        existing = cls._header_key(headers, name)
        if existing is not None:
            del headers[existing]

    @classmethod
    def _get_header(cls, headers: Dict[str, str], name: str) -> Optional[str]:
        existing = cls._header_key(headers, name)
        return headers.get(existing) if existing is not None else None

    @staticmethod
    def wire_value(value: Any) -> str:
        if isinstance(value, Enum):
            value = value.value
        if isinstance(value, bool):
            return "true" if value else "false"
        if isinstance(value, (date, datetime)):
            return value.isoformat()
        return str(value)

    @classmethod
    def wire_query_value(cls, value: Any) -> Any:
        if isinstance(value, (list, tuple)):
            return [cls.wire_value(item) for item in value]
        return cls.wire_value(value)

    @staticmethod
    def cookie_pair(name: str, value: str) -> str:
        return quote(name, safe="-._~") + "=" + quote(value, safe="-._~")

    def _build_headers(self, extra_headers: Optional[Dict[str, str]] = None) -> Dict[str, str]:
        headers = dict(self.default_headers)
        if extra_headers:
            headers.update(extra_headers)
        claimed_security_headers: set[str] = set()
        self._apply_auth_cookies(headers)
        return headers

    def _build_url(self, path: str, query: Optional[Dict[str, Any]]) -> str:
        if "?" in path or "#" in path:
            raise ValueError("Request paths cannot contain a query or fragment")

        parts = urlsplit(self.base_url)
        if parts.scheme not in {"http", "https"} or not parts.netloc:
            raise ValueError("base_url must be an absolute HTTP(S) URL")

        request_pairs: List[Tuple[str, Any]] = []
        for key, value in (query or {}).items():
            if value is None:
                continue
            if isinstance(value, (list, tuple)):
                request_pairs.extend((key, item) for item in value if item is not None)
            else:
                request_pairs.append((key, value))

        request_query_names = {key for key, _ in request_pairs}
        pairs: List[Tuple[str, Any]] = [
            (key, value)
            for key, value in parse_qsl(parts.query, keep_blank_values=True)
            if key not in request_query_names
        ]
        pairs.extend(request_pairs)

        auth_query: Dict[str, str] = {}
        auth_query_names = set(auth_query)
        pairs = [(key, value) for key, value in pairs if key not in auth_query_names]
        pairs.extend(auth_query.items())

        base_path = parts.path.rstrip("/")
        request_path = path.lstrip("/")
        combined_path = (
            f"{base_path}/{request_path}"
            if request_path
            else (base_path + "/" if base_path else "/")
        )
        return urlunsplit(
            (
                parts.scheme,
                parts.netloc,
                combined_path,
                urlencode(pairs, doseq=True),
                "",
            )
        )

    def _apply_auth_cookies(self, headers: Dict[str, str]) -> None:
        auth_cookies: Dict[str, str] = {}
        if not auth_cookies:
            return

        auth_names = set(auth_cookies)
        encoded_auth_names = {quote(name, safe="-._~") for name in auth_names}
        retained = []
        for pair in (self._get_header(headers, "Cookie") or "").split(";"):
            pair = pair.strip()
            if not pair:
                continue
            name = pair.split("=", 1)[0].strip()
            if name not in auth_names and name not in encoded_auth_names:
                retained.append(pair)
        retained.extend(
            self.cookie_pair(name, value) for name, value in auth_cookies.items()
        )
        self._set_header(headers, "Cookie", "; ".join(retained))

    def _resolve_options(
        self,
        method: str,
        headers: Dict[str, str],
        options: Optional[RequestOptions],
    ) -> Tuple[int, int, bool]:
        timeout_ms = (
            options.timeout_ms
            if options is not None and options.timeout_ms is not None
            else self.timeout_ms
        )
        retries = (
            options.retries
            if options is not None and options.retries is not None
            else self.max_retries
        )
        retry_unsafe = (
            options.retry_unsafe_requests
            if options is not None and options.retry_unsafe_requests is not None
            else self.retry_unsafe_requests
        )
        if timeout_ms <= 0:
            raise ValueError("timeout_ms must be greater than zero")
        if retries < 0:
            raise ValueError("retries cannot be negative")
        return timeout_ms, retries, self._can_retry(method, headers, retry_unsafe)

    @staticmethod
    def _normalize_body(body: Any) -> Any:
        return (
            body.model_dump(by_alias=True, exclude_none=True)
            if hasattr(body, "model_dump")
            else body
        )

    def _prepare_body(
        self,
        body: Optional[Any],
        content_type: str,
        headers: Dict[str, str],
    ) -> Tuple[Optional[Any], Optional[List[Tuple[str, Any]]]]:
        if body is None:
            return None, None

        media_type = content_type.split(";", 1)[0].strip().lower()
        if media_type == "application/json" or media_type.endswith("+json"):
            payload = self._normalize_body(body)
            self._set_header(headers, "Content-Type", content_type)
            return json.dumps(payload, default=str), None
        if media_type == "multipart/form-data":
            self._remove_header(headers, "Content-Type")
            files = self._build_multipart_files(body)
            return None, files

        raw_body = body.read() if hasattr(body, "read") else body
        if not isinstance(raw_body, (str, bytes, bytearray, memoryview)):
            raise SDKError(
                f"Raw request body for {content_type} must be text or bytes",
                0,
                "invalid_request_body",
            )
        self._set_header(headers, "Content-Type", content_type)
        if isinstance(raw_body, (bytearray, memoryview)):
            return bytes(raw_body), None
        return raw_body, None

    def _build_multipart_files(self, body: Any) -> List[Tuple[str, Any]]:
        normalized = self._normalize_body(body)
        if not isinstance(normalized, Mapping):
            raise SDKError(
                "Multipart request body must be a model or mapping",
                0,
                "invalid_request_body",
            )
        files: List[Tuple[str, Any]] = []
        for name, value in normalized.items():
            self._append_multipart_value(files, str(name), value)
        return files

    def _append_multipart_value(
        self,
        files: List[Tuple[str, Any]],
        name: str,
        value: Any,
    ) -> None:
        if "\r" in name or "\n" in name:
            raise SDKError(
                "Multipart field names cannot contain line breaks",
                0,
                "invalid_request_body",
            )
        if value is None:
            return
        value = self._normalize_body(value)

        if isinstance(value, Mapping):
            descriptor_keys = {
                "name",
                "contents",
                "filename",
                "headers",
                "content_type",
                "contentType",
            }
            if "contents" in value and set(value).issubset(descriptor_keys):
                part_name = str(value.get("name") or name)
                contents = value["contents"]
                contents = contents.read() if hasattr(contents, "read") else contents
                filename = value.get("filename")
                part_content_type = value.get("content_type") or value.get("contentType")
                self._append_multipart_part(
                    files,
                    part_name,
                    contents,
                    str(filename) if filename is not None else None,
                    str(part_content_type) if part_content_type is not None else None,
                )
                return
            for nested_name, nested_value in value.items():
                self._append_multipart_value(
                    files,
                    f"{name}[{nested_name}]",
                    nested_value,
                )
            return
        if isinstance(value, Sequence) and not isinstance(
            value,
            (str, bytes, bytearray, memoryview),
        ):
            for item in value:
                self._append_multipart_value(files, name, item)
            return
        if hasattr(value, "read"):
            filename = getattr(value, "name", None)
            contents = value.read()
            self._append_multipart_part(
                files,
                name,
                contents,
                str(filename) if filename else name,
                "application/octet-stream",
            )
            return
        if isinstance(value, (bytes, bytearray, memoryview)):
            self._append_multipart_part(
                files,
                name,
                bytes(value),
                name,
                "application/octet-stream",
            )
            return

        text = str(value).lower() if isinstance(value, bool) else str(value)
        self._append_multipart_part(files, name, text, None, None)

    def _append_multipart_part(
        self,
        files: List[Tuple[str, Any]],
        name: str,
        contents: Any,
        filename: Optional[str],
        content_type: Optional[str],
    ) -> None:
        if "\r" in name or "\n" in name:
            raise SDKError(
                "Multipart field names cannot contain line breaks",
                0,
                "invalid_request_body",
            )
        if filename is not None:
            filename = filename.replace("\\", "/").rsplit("/", 1)[-1]
            if "\r" in filename or "\n" in filename:
                raise SDKError(
                    "Multipart filenames cannot contain line breaks",
                    0,
                    "invalid_request_body",
                )
        files.append((name, (filename, contents, content_type)))

    def request(
        self,
        method: str,
        path: str,
        query: Optional[Dict[str, Any]] = None,
        body: Optional[Any] = None,
        content_type: str = "application/json",
        options: Optional[RequestOptions] = None,
    ) -> httpx.Response:
        """Execute a request and retry only transient, idempotent failures."""
        method = method.upper()
        url = self._build_url(path, query)
        headers = self._build_headers(options.headers if options else None)
        timeout_ms, retries, can_retry = self._resolve_options(
            method,
            headers,
            options,
        )
        content, files = self._prepare_body(body, content_type, headers)
        last_error: Optional[SDKError] = None

        for attempt in range(retries + 1):
            try:
                if self.on_request:
                    self.on_request(method=method, url=url, attempt=attempt)

                response = self._client.request(
                    method=method,
                    url=url,
                    headers=headers,
                    content=content,
                    files=files,
                    timeout=timeout_ms / 1000.0,
                )

                if self.on_response:
                    self.on_response(response)

                if len(response.content) > _MAX_RESPONSE_BODY_BYTES:
                    raise SDKError(
                        "Response body exceeded the configured safety limit",
                        response.status_code,
                        "response_body_too_large",
                    )
                if 200 <= response.status_code < 300:
                    return response

                last_error = self._error_from_response(response)
                if not (
                    can_retry
                    and attempt < retries
                    and response.status_code in _RETRYABLE_STATUSES
                ):
                    self._notify_error(last_error)
                    raise last_error

                self._sleep_before_retry(attempt, response.headers.get("Retry-After"))
            except (httpx.TimeoutException, httpx.NetworkError) as error:
                code = "timeout" if isinstance(error, httpx.TimeoutException) else "network_error"
                last_error = SDKError(str(error) or "Request failed", 0, code)
                if not (can_retry and attempt < retries):
                    self._notify_error(last_error)
                    raise last_error from error
                self._sleep_before_retry(attempt, None)
            except SDKError:
                raise
            except Exception as error:
                last_error = SDKError(str(error) or "Request failed", 0, "unknown_error")
                self._notify_error(last_error)
                raise last_error from error

        error = last_error or SDKError("Request failed after retries", 0, "retry_exhausted")
        self._notify_error(error)
        raise error

    def stream(
        self,
        method: str,
        path: str,
        query: Optional[Dict[str, Any]] = None,
        body: Optional[Any] = None,
        content_type: str = "application/json",
        options: Optional[RequestOptions] = None,
        type_adapter: TypeAdapter[_PayloadT] = TypeAdapter(Any),
    ) -> Iterator[SSEEvent[_PayloadT]]:
        """Yield framed, typed SSE events and close the response deterministically."""
        method = method.upper()
        url = self._build_url(path, query)
        headers = self._build_headers(options.headers if options else None)
        self._set_header(headers, "Accept", "text/event-stream")
        timeout_ms, retries, can_retry = self._resolve_options(
            method,
            headers,
            options,
        )
        content, files = self._prepare_body(body, content_type, headers)
        last_error: Optional[SDKError] = None

        for attempt in range(retries + 1):
            emitted = False
            try:
                if self.on_request:
                    self.on_request(method=method, url=url, attempt=attempt)

                with self._client.stream(
                    method=method,
                    url=url,
                    headers=headers,
                    content=content,
                    files=files,
                    timeout=timeout_ms / 1000.0,
                ) as response:
                    if self.on_response:
                        self.on_response(response)
                    if not 200 <= response.status_code < 300:
                        error_body = self._read_stream_body(response)
                        last_error = self._error_from_response(response, error_body)
                        if not (
                            can_retry
                            and attempt < retries
                            and response.status_code in _RETRYABLE_STATUSES
                        ):
                            self._notify_error(last_error)
                            raise last_error
                        retry_after = response.headers.get("Retry-After")
                    else:
                        total_bytes = 0
                        event_type = "message"
                        data_lines: List[str] = []
                        last_event_id: Optional[str] = None
                        retry_milliseconds: Optional[int] = None
                        for line in response.iter_lines():
                            line_bytes = len(line.encode("utf-8"))
                            total_bytes += line_bytes + 1
                            if line_bytes > _MAX_SSE_LINE_BYTES:
                                raise SDKError(
                                    "SSE line exceeded the configured safety limit",
                                    response.status_code,
                                    "sse_line_too_large",
                                )
                            if total_bytes > _MAX_RESPONSE_BODY_BYTES:
                                raise SDKError(
                                    "SSE response exceeded the configured safety limit",
                                    response.status_code,
                                    "response_body_too_large",
                                )

                            if line == "":
                                if data_lines:
                                    event = self._decode_sse_event(
                                        type_adapter,
                                        event_type,
                                        data_lines,
                                        last_event_id,
                                        retry_milliseconds,
                                        response.status_code,
                                    )
                                    emitted = True
                                    yield event
                                event_type = "message"
                                data_lines = []
                                retry_milliseconds = None
                                continue

                            if line.startswith(":"):
                                continue
                            field, separator, value = line.partition(":")
                            if separator and value.startswith(" "):
                                value = value[1:]
                            if field == "event":
                                event_type = value
                            elif field == "data":
                                data_lines.append(value)
                            elif field == "id" and "\0" not in value:
                                last_event_id = value
                            elif field == "retry" and value.isascii() and value.isdigit():
                                retry_milliseconds = int(value)

                        if data_lines:
                            event = self._decode_sse_event(
                                type_adapter,
                                event_type,
                                data_lines,
                                last_event_id,
                                retry_milliseconds,
                                response.status_code,
                            )
                            emitted = True
                            yield event
                        return

                self._sleep_before_retry(attempt, retry_after)
            except (httpx.TimeoutException, httpx.NetworkError) as error:
                code = "timeout" if isinstance(error, httpx.TimeoutException) else "network_error"
                last_error = SDKError(str(error) or "Streaming request failed", 0, code)
                if emitted or not (can_retry and attempt < retries):
                    self._notify_error(last_error)
                    raise last_error from error
                self._sleep_before_retry(attempt, None)
            except SDKError as error:
                if error is not last_error:
                    self._notify_error(error)
                raise
            except Exception as error:
                last_error = SDKError(str(error) or "Streaming request failed", 0, "unknown_error")
                self._notify_error(last_error)
                raise last_error from error

        error = last_error or SDKError(
            "Streaming request failed after retries",
            0,
            "retry_exhausted",
        )
        self._notify_error(error)
        raise error

    @staticmethod
    def _decode_sse_event(
        type_adapter: TypeAdapter[_PayloadT],
        event_type: str,
        data_lines: List[str],
        event_id: Optional[str],
        retry_milliseconds: Optional[int],
        status_code: int,
    ) -> SSEEvent[_PayloadT]:
        raw_data = "\n".join(data_lines)
        try:
            decoded: Any = json.loads(raw_data)
        except json.JSONDecodeError:
            decoded = raw_data

        try:
            data = type_adapter.validate_python(decoded)
        except ValidationError as error:
            raise SDKError(
                "SSE event data did not match the declared response type",
                status_code,
                "sse_decode_error",
                details=error.errors(include_url=False),
            ) from error

        return SSEEvent(
            type=event_type,
            data=data,
            id=event_id,
            retry_milliseconds=retry_milliseconds,
        )

    def _can_retry(self, method: str, headers: Dict[str, str], retry_unsafe: bool) -> bool:
        if retry_unsafe or method in _RETRYABLE_METHODS:
            return True
        return any(
            name.lower() in {"idempotency-key", "x-idempotency-key"}
            and bool(value)
            for name, value in headers.items()
        )

    def _sleep_before_retry(self, attempt: int, retry_after: Optional[str]) -> None:
        delay = self._parse_retry_after(retry_after)
        if delay is None:
            maximum = min(0.4 * (2**attempt), 30.0)
            delay = random.uniform(0.0, maximum)
        time.sleep(delay)

    @staticmethod
    def _parse_retry_after(value: Optional[str]) -> Optional[float]:
        if not value:
            return None
        try:
            return min(max(float(value), 0.0), 30.0)
        except ValueError:
            try:
                parsed = email.utils.parsedate_to_datetime(value)
                if parsed.tzinfo is None:
                    parsed = parsed.replace(tzinfo=timezone.utc)
                return min(
                    max((parsed - datetime.now(timezone.utc)).total_seconds(), 0.0),
                    30.0,
                )
            except (TypeError, ValueError, OverflowError):
                return None

    @staticmethod
    def _read_stream_body(response: httpx.Response) -> bytes:
        body = bytearray()
        for chunk in response.iter_bytes():
            body.extend(chunk)
            if len(body) > _MAX_RESPONSE_BODY_BYTES:
                raise SDKError(
                    "Response body exceeded the configured safety limit",
                    response.status_code,
                    "response_body_too_large",
                )
        return bytes(body)

    def _error_from_response(
        self,
        response: httpx.Response,
        content: Optional[bytes] = None,
    ) -> SDKError:
        request_id = response.headers.get("x-request-id") or response.headers.get("request-id")
        raw = response.content if content is None else content
        try:
            body = json.loads(raw.decode("utf-8"))
        except (json.JSONDecodeError, UnicodeDecodeError):
            body = None

        if isinstance(body, dict):
            nested = body.get("error") if isinstance(body.get("error"), dict) else None
            code = body.get("code") or (nested or {}).get("code")
            if not code and isinstance(body.get("error"), str):
                code = body.get("error")
            message = body.get("message") or (nested or {}).get("message")
            return SDKError(
                str(message or response.reason_phrase or "Request failed"),
                response.status_code,
                str(code or "http_error"),
                str(body.get("request_id") or request_id) if body.get("request_id") or request_id else None,
                details=body.get("details"),
            )

        text = raw.decode("utf-8", errors="replace").strip()
        return SDKError(
            text[:500] or f"HTTP {response.status_code}: {response.reason_phrase}",
            response.status_code,
            "http_error",
            request_id,
        )

    def _notify_error(self, error: SDKError) -> None:
        if self.on_error:
            self.on_error(error)

    def close(self) -> None:
        self._client.close()

    def __enter__(self) -> "SDKTransport":
        return self

    def __exit__(self, *_: Any) -> None:
        self.close()


def create_transport(
    base_url: str,
    timeout_ms: int = 15000,
    retries: int = 3,
    retry_unsafe_requests: bool = False,
    default_headers: Optional[Dict[str, str]] = None,
    on_request: Optional[Callable[..., None]] = None,
    on_response: Optional[Callable[[httpx.Response], None]] = None,
    on_error: Optional[Callable[[SDKError], None]] = None,
) -> SDKTransport:
    return SDKTransport(
        base_url=base_url,
        timeout_ms=timeout_ms,
        retries=retries,
        retry_unsafe_requests=retry_unsafe_requests,
        default_headers=default_headers,
        on_request=on_request,
        on_response=on_response,
        on_error=on_error,
    )
