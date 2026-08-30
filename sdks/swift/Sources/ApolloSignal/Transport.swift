import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// A typed server-sent event.
public struct SSEEvent<Payload: Decodable & Sendable>: Sendable {
    public let type: String
    public let data: Payload
    public let id: String?
    public let retryMilliseconds: Int?

    public init(
        type: String,
        data: Payload,
        id: String? = nil,
        retryMilliseconds: Int? = nil
    ) {
        self.type = type
        self.data = data
        self.id = id
        self.retryMilliseconds = retryMilliseconds
    }
}

/// Foundation URLSession transport shared by every generated API domain.
public final class Transport: @unchecked Sendable {
    public struct Configuration: Sendable {
        public var baseURL: String
        public var defaultHeaders: [String: String]
        public var timeoutMilliseconds: Int
        public var maxRetries: Int
        public var retryUnsafeRequests: Bool
        public var maxRequestBodyBytes: Int
        public var maxResponseBodyBytes: Int
        public var authHeaders: [String: String]
        public var authQuery: [String: String]
        public var authCookies: [String: String]
        public var userAgent: String

        public init(
            baseURL: String,
            defaultHeaders: [String: String] = [:],
            timeoutMilliseconds: Int = 15_000,
            maxRetries: Int = 3,
            retryUnsafeRequests: Bool = false,
            maxRequestBodyBytes: Int = 5 * 1024 * 1024,
            maxResponseBodyBytes: Int = 5 * 1024 * 1024,
            authHeaders: [String: String] = [:],
            authQuery: [String: String] = [:],
            authCookies: [String: String] = [:],
            userAgent: String = "ApolloSignal/4.0.1"
        ) {
            self.baseURL = baseURL
            self.defaultHeaders = defaultHeaders
            self.timeoutMilliseconds = timeoutMilliseconds
            self.maxRetries = maxRetries
            self.retryUnsafeRequests = retryUnsafeRequests
            self.maxRequestBodyBytes = maxRequestBodyBytes
            self.maxResponseBodyBytes = maxResponseBodyBytes
            self.authHeaders = authHeaders
            self.authQuery = authQuery
            self.authCookies = authCookies
            self.userAgent = userAgent
        }
    }

    public struct QueryParameters: Sendable, Sequence {
        public struct Iterator: IteratorProtocol {
            private let values: [URLQueryItem]
            private var index = 0

            fileprivate init(values: [URLQueryItem]) {
                self.values = values
            }

            public mutating func next() -> (String, String?)? {
                guard index < values.count else { return nil }
                let item = values[index]
                index += 1
                return (item.name, item.value)
            }
        }

        private var values: [URLQueryItem] = []

        public init() {}

        public var isEmpty: Bool {
            values.isEmpty
        }

        public var names: Set<String> {
            Set(values.map(\.name))
        }

        public var urlQueryItems: [URLQueryItem] {
            values
        }

        public subscript(name: String) -> String? {
            get {
                values.last(where: { $0.name == name })?.value
            }
            set {
                values.removeAll { $0.name == name }
                if let newValue {
                    values.append(URLQueryItem(name: name, value: newValue))
                }
            }
        }

        public mutating func append(_ item: URLQueryItem) {
            values.append(item)
        }

        public func makeIterator() -> Iterator {
            Iterator(values: values)
        }
    }

    public struct Request: Sendable {
        public let method: String
        public let path: String
        public let query: QueryParameters
        public let headers: [String: String]
        public let body: Data?
        public let contentType: String?
        public let timeoutMilliseconds: Int?

        public init(
            method: String,
            path: String,
            query: QueryParameters? = nil,
            headers: [String: String]? = nil,
            body: Data? = nil,
            contentType: String? = nil,
            timeoutMilliseconds: Int? = nil
        ) {
            self.method = method
            self.path = path
            self.query = query ?? QueryParameters()
            self.headers = headers ?? [:]
            self.body = body
            self.contentType = contentType
            self.timeoutMilliseconds = timeoutMilliseconds
        }
    }

    private let configuration: Configuration
    private let session: URLSession
    private let decoder: JSONDecoder

    public init(configuration: Configuration) {
        var normalized = configuration
        normalized.timeoutMilliseconds = max(1, configuration.timeoutMilliseconds)
        normalized.maxRetries = min(max(0, configuration.maxRetries), 8)
        normalized.maxRequestBodyBytes = max(1, configuration.maxRequestBodyBytes)
        normalized.maxResponseBodyBytes = max(1, configuration.maxResponseBodyBytes)
        self.configuration = normalized

        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest =
            Double(normalized.timeoutMilliseconds) / 1_000.0
        sessionConfiguration.timeoutIntervalForResource =
            Double(normalized.timeoutMilliseconds) / 1_000.0
        self.session = URLSession(configuration: sessionConfiguration)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        self.decoder = decoder
    }

    deinit {
        session.invalidateAndCancel()
    }

    public static func encodeJSON<Value: Encodable>(_ value: Value) throws -> Data {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(value)
    }

    public static func stringValue(_ value: Any) -> String {
        switch value {
        case let value as String:
            return value
        case let value as Bool:
            return value ? "true" : "false"
        case let value as Date:
            return ISO8601DateFormatter().string(from: value)
        case let value as URL:
            return value.absoluteString
        default:
            return String(describing: value)
        }
    }

    public static func percentEncodePathComponent(_ value: String) -> String {
        var allowed = CharacterSet.alphanumerics
        allowed.insert(charactersIn: "-._~")
        return value.addingPercentEncoding(withAllowedCharacters: allowed) ?? value
    }

    public static func cookiePair(name: String, value: String) -> String {
        var allowedNameCharacters = CharacterSet.alphanumerics
        allowedNameCharacters.insert(charactersIn: "!#$%&'*+-.^_`|~")
        let safeName = name.addingPercentEncoding(
            withAllowedCharacters: allowedNameCharacters
        ) ?? ""
        var allowedValueCharacters = CharacterSet()
        allowedValueCharacters.insert(
            charactersIn: "!#$%&'()*+-./0123456789:<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyz{|}~"
        )
        let safeValue = value.addingPercentEncoding(
            withAllowedCharacters: allowedValueCharacters
        ) ?? ""
        return "\(safeName)=\(safeValue)"
    }

    public func execute<Value: Decodable & Sendable>(
        _ request: Request,
        as type: Value.Type
    ) async throws -> Value {
        let (data, response) = try await executeData(request)
        guard !data.isEmpty else {
            throw SDKError(
                statusCode: response.statusCode,
                code: "empty_response",
                message: "The API returned an empty response body.",
                requestID: requestID(from: response)
            )
        }

        do {
            return try decoder.decode(type, from: data)
        } catch {
            throw SDKError(
                statusCode: response.statusCode,
                code: "decode_error",
                message: "The API response could not be decoded: \(error.localizedDescription)",
                requestID: requestID(from: response),
                responseBody: data,
                causeDescription: error.localizedDescription
            )
        }
    }

    public func executeVoid(_ request: Request) async throws {
        _ = try await executeData(request)
    }

    public func stream<Payload: Decodable & Sendable>(
        _ request: Request,
        as type: Payload.Type
    ) -> AsyncThrowingStream<SSEEvent<Payload>, Error> {
        AsyncThrowingStream { continuation in
            let task = Task { [self] in
                do {
                    let (bytes, httpResponse) = try await openStream(request)

                    var lineBuffer = Data()
                    var eventType = "message"
                    var dataLines: [String] = []
                    var eventID: String?
                    var retryMilliseconds: Int?
                    var totalBytes = 0

                    func finishEvent() throws {
                        guard !dataLines.isEmpty else {
                            eventType = "message"
                            eventID = nil
                            retryMilliseconds = nil
                            return
                        }

                        let rawData = dataLines.joined(separator: "\n")
                        guard let payloadData = rawData.data(using: .utf8) else {
                            throw SDKError(
                                statusCode: httpResponse.statusCode,
                                code: "invalid_sse_data",
                                message: "The SSE event payload was not valid UTF-8.",
                                requestID: requestID(from: httpResponse)
                            )
                        }
                        let payload = try decoder.decode(type, from: payloadData)
                        continuation.yield(
                            SSEEvent(
                                type: eventType,
                                data: payload,
                                id: eventID,
                                retryMilliseconds: retryMilliseconds
                            )
                        )
                        eventType = "message"
                        dataLines.removeAll(keepingCapacity: true)
                        eventID = nil
                        retryMilliseconds = nil
                    }

                    func processLine(_ line: String) throws {
                        if line.isEmpty {
                            try finishEvent()
                            return
                        }
                        if line.hasPrefix(":") { return }

                        let separator = line.firstIndex(of: ":")
                        let field: String
                        var value: String
                        if let separator {
                            field = String(line[..<separator])
                            value = String(line[line.index(after: separator)...])
                            if value.first == " " { value.removeFirst() }
                        } else {
                            field = line
                            value = ""
                        }

                        switch field {
                        case "event":
                            eventType = value
                        case "data":
                            dataLines.append(value)
                        case "id":
                            if !value.contains("\0") { eventID = value }
                        case "retry":
                            if let value = Int(value), value >= 0 {
                                retryMilliseconds = value
                            }
                        default:
                            break
                        }
                    }

                    for try await byte in bytes {
                        totalBytes += 1
                        if totalBytes > configuration.maxResponseBodyBytes {
                            throw bodyLimitError(code: "response_body_too_large")
                        }
                        if byte == 0x0A {
                            let text = String(decoding: lineBuffer, as: UTF8.self)
                            lineBuffer.removeAll(keepingCapacity: true)
                            let line = text.hasSuffix("\r") ? String(text.dropLast()) : text
                            try processLine(line)
                        } else {
                            lineBuffer.append(byte)
                        }
                    }

                    if !lineBuffer.isEmpty {
                        let text = String(decoding: lineBuffer, as: UTF8.self)
                        let line = text.hasSuffix("\r") ? String(text.dropLast()) : text
                        try processLine(line)
                    }
                    try finishEvent()
                    continuation.finish()
                } catch is CancellationError {
                    continuation.finish(throwing: CancellationError())
                } catch {
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { @Sendable _ in task.cancel() }
        }
    }

    public func streamValues<Payload: Decodable & Sendable>(
        _ request: Request,
        as type: Payload.Type
    ) -> AsyncThrowingStream<Payload, Error> {
        let events = stream(request, as: type)
        return AsyncThrowingStream { continuation in
            let task = Task {
                do {
                    for try await event in events {
                        continuation.yield(event.data)
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { @Sendable _ in task.cancel() }
        }
    }

    private typealias ResponseByteStream = AsyncThrowingStream<UInt8, Error>

    private func openStream(
        _ request: Request
    ) async throws -> (ResponseByteStream, HTTPURLResponse) {
        let canRetry = canRetry(request)
        var lastError: SDKError?

        for attempt in 0...configuration.maxRetries {
            do {
                let urlRequest = try makeURLRequest(request, accept: "text/event-stream")
                let (bytes, response) = try await responseBytes(for: urlRequest)
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw SDKError(
                        code: "invalid_response",
                        message: "The API returned a non-HTTP SSE response."
                    )
                }

                if (200..<300).contains(httpResponse.statusCode) {
                    return (bytes, httpResponse)
                }

                var body = Data()
                for try await byte in bytes {
                    if body.count >= configuration.maxResponseBodyBytes {
                        throw bodyLimitError(code: "response_body_too_large")
                    }
                    body.append(byte)
                }
                let error = makeHTTPError(response: httpResponse, body: body)
                if canRetry && error.isRetryable && attempt < configuration.maxRetries {
                    lastError = error
                    try await sleep(for: retryDelay(
                        retryAfterSeconds: error.retryAfterSeconds,
                        attempt: attempt
                    ))
                    continue
                }
                throw error
            } catch is CancellationError {
                throw CancellationError()
            } catch let error as SDKError {
                throw error
            } catch let error as URLError {
                let normalized = SDKError(
                    code: "network_error",
                    message: "The SSE request failed: \(error.localizedDescription)",
                    causeDescription: error.localizedDescription
                )
                if canRetry && isRetryableNetworkError(error) && attempt < configuration.maxRetries {
                    lastError = normalized
                    try await sleep(for: retryDelay(retryAfterSeconds: nil, attempt: attempt))
                    continue
                }
                throw normalized
            } catch {
                let normalized = SDKError(
                    code: "network_error",
                    message: "The SSE request failed: \(error.localizedDescription)",
                    causeDescription: error.localizedDescription
                )
                if canRetry && attempt < configuration.maxRetries {
                    lastError = normalized
                    try await sleep(for: retryDelay(retryAfterSeconds: nil, attempt: attempt))
                    continue
                }
                throw normalized
            }
        }

        throw lastError ?? SDKError(code: "request_failed", message: "The SSE request failed.")
    }

    private func executeData(_ request: Request) async throws -> (Data, HTTPURLResponse) {
        let canRetry = canRetry(request)
        var lastError: SDKError?

        for attempt in 0...configuration.maxRetries {
            do {
                let (data, response) = try await perform(request)
                if (200..<300).contains(response.statusCode) {
                    return (data, response)
                }

                let error = makeHTTPError(response: response, body: data)
                if canRetry && error.isRetryable && attempt < configuration.maxRetries {
                    lastError = error
                    try await sleep(for: retryDelay(
                        retryAfterSeconds: error.retryAfterSeconds,
                        attempt: attempt
                    ))
                    continue
                }
                throw error
            } catch is CancellationError {
                throw CancellationError()
            } catch let error as SDKError {
                throw error
            } catch let error as URLError {
                let normalized = SDKError(
                    code: "network_error",
                    message: "The request failed: \(error.localizedDescription)",
                    causeDescription: error.localizedDescription
                )
                if canRetry && isRetryableNetworkError(error) && attempt < configuration.maxRetries {
                    lastError = normalized
                    try await sleep(for: retryDelay(retryAfterSeconds: nil, attempt: attempt))
                    continue
                }
                throw normalized
            } catch {
                let normalized = SDKError(
                    code: "network_error",
                    message: "The request failed: \(error.localizedDescription)",
                    causeDescription: error.localizedDescription
                )
                if canRetry && attempt < configuration.maxRetries {
                    lastError = normalized
                    try await sleep(for: retryDelay(retryAfterSeconds: nil, attempt: attempt))
                    continue
                }
                throw normalized
            }
        }

        throw lastError ?? SDKError(code: "request_failed", message: "The request failed.")
    }

    private func perform(_ request: Request) async throws -> (Data, HTTPURLResponse) {
        if let body = request.body, body.count > configuration.maxRequestBodyBytes {
            throw bodyLimitError(code: "request_body_too_large")
        }

        let urlRequest = try makeURLRequest(request)
        let (bytes, response) = try await responseBytes(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw SDKError(code: "invalid_response", message: "The API returned a non-HTTP response.")
        }
        var data = Data()
        for try await byte in bytes {
            if data.count >= configuration.maxResponseBodyBytes {
                throw bodyLimitError(code: "response_body_too_large")
            }
            data.append(byte)
        }
        return (data, httpResponse)
    }

    private func responseBytes(
        for request: URLRequest
    ) async throws -> (ResponseByteStream, URLResponse) {
#if canImport(Darwin)
        let (bytes, response) = try await session.bytes(for: request)
        let stream = ResponseByteStream { continuation in
            let task = Task {
                do {
                    for try await byte in bytes {
                        continuation.yield(byte)
                    }
                    continuation.finish()
                } catch is CancellationError {
                    continuation.finish(throwing: CancellationError())
                } catch {
                    continuation.finish(throwing: error)
                }
            }
            continuation.onTermination = { @Sendable _ in task.cancel() }
        }
        return (stream, response)
#else
        // FoundationNetworking does not expose URLSession.AsyncBytes. Keep the
        // public API portable while Apple platforms retain incremental delivery.
        let (data, response) = try await session.data(for: request)
        let stream = ResponseByteStream { continuation in
            for byte in data {
                continuation.yield(byte)
            }
            continuation.finish()
        }
        return (stream, response)
#endif
    }

    private func makeURLRequest(_ request: Request, accept: String? = nil) throws -> URLRequest {
        guard var components = URLComponents(string: configuration.baseURL) else {
            throw SDKError(code: "invalid_base_url", message: "The configured base URL is invalid.")
        }

        let basePath = components.path.hasSuffix("/")
            ? String(components.path.dropLast())
            : components.path
        let requestPath = request.path.hasPrefix("/") ? request.path : "/\(request.path)"
        components.path = basePath + requestPath

        var queryItems = components.queryItems ?? []
        queryItems.removeAll { request.query.names.contains($0.name) }
        for (key, value) in request.query {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        let authQueryNames = Set(configuration.authQuery.keys)
        queryItems.removeAll { authQueryNames.contains($0.name) }
        for (key, value) in configuration.authQuery.sorted(by: { $0.key < $1.key }) {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        components.queryItems = queryItems.isEmpty ? nil : queryItems

        guard let url = components.url else {
            throw SDKError(code: "invalid_request_url", message: "The request URL is invalid.")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.uppercased()
        let timeout = request.timeoutMilliseconds ?? configuration.timeoutMilliseconds
        urlRequest.timeoutInterval = Double(max(1, timeout)) / 1_000.0

        var headers: [String: String] = [:]
        merge(configuration.defaultHeaders, into: &headers)
        merge(request.headers, into: &headers)
        merge(configuration.authHeaders, into: &headers)

        if !configuration.authCookies.isEmpty {
            mergeAuthCookies(configuration.authCookies, into: &headers)
        }

        if let accept, headerValue("Accept", in: headers) == nil {
            setHeader("Accept", value: accept, in: &headers)
        } else if headerValue("Accept", in: headers) == nil {
            setHeader("Accept", value: "application/json", in: &headers)
        }
        if request.body != nil && headerValue("Content-Type", in: headers) == nil {
            setHeader("Content-Type", value: request.contentType ?? "application/json", in: &headers)
        }
        if headerValue("User-Agent", in: headers) == nil {
            setHeader("User-Agent", value: configuration.userAgent, in: &headers)
        }
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        urlRequest.httpBody = request.body
        return urlRequest
    }

    private func canRetry(_ request: Request) -> Bool {
        if configuration.retryUnsafeRequests { return true }
        if ["GET", "HEAD", "OPTIONS", "PUT", "DELETE"].contains(request.method.uppercased()) {
            return true
        }
        return ["Idempotency-Key", "X-Idempotency-Key"].contains { name in
            headerValue(name, in: configuration.defaultHeaders) != nil ||
                headerValue(name, in: request.headers) != nil
        }
    }

    private func retryDelay(retryAfterSeconds: TimeInterval?, attempt: Int) -> TimeInterval {
        if let retryAfterSeconds, retryAfterSeconds >= 0 {
            return min(retryAfterSeconds, 30.0)
        }
        var delay = 0.2
        for _ in 0..<min(attempt, 10) {
            delay = min(delay * 2.0, 30.0)
        }
        return delay
    }

    private func sleep(for seconds: TimeInterval) async throws {
        let nanoseconds = UInt64(max(0, seconds) * 1_000_000_000)
        try await Task.sleep(nanoseconds: nanoseconds)
    }

    private func isRetryableNetworkError(_ error: URLError) -> Bool {
        switch error.code {
        case .timedOut, .cannotFindHost, .cannotConnectToHost, .networkConnectionLost,
             .notConnectedToInternet, .dnsLookupFailed, .resourceUnavailable,
             .secureConnectionFailed:
            return true
        default:
            return false
        }
    }

    private func makeHTTPError(response: HTTPURLResponse, body: Data) -> SDKError {
        let requestID = requestID(from: response)
        let retryAfter = parseRetryAfter(response.value(forHTTPHeaderField: "Retry-After"))
        var code: String?
        var message = String(data: body, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
        if message?.isEmpty == true { message = nil }

        if let object = try? JSONSerialization.jsonObject(with: body) as? [String: Any] {
            code = object["code"] as? String
            message = (object["message"] as? String) ?? message
            if let errorObject = object["error"] as? [String: Any] {
                code = code ?? (errorObject["code"] as? String)
                message = (errorObject["message"] as? String) ?? message
            } else if let errorValue = object["error"] as? String {
                code = code ?? errorValue
            }
        }

        return SDKError(
            statusCode: response.statusCode,
            code: code ?? "http_error",
            message: message ?? "The API returned HTTP \(response.statusCode).",
            requestID: requestID,
            retryAfterSeconds: retryAfter,
            responseBody: body.isEmpty ? nil : body
        )
    }

    private func parseRetryAfter(_ value: String?) -> TimeInterval? {
        guard let value = value?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty else {
            return nil
        }
        if let seconds = Double(value), seconds >= 0 {
            return min(seconds, 30.0)
        }

        let formats = [
            "EEE, dd MMM yyyy HH:mm:ss zzz",
            "EEEE, dd-MMM-yy HH:mm:ss zzz",
            "EEE MMM d HH:mm:ss yyyy",
        ]
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        for format in formats {
            formatter.dateFormat = format
            if let date = formatter.date(from: value) {
                return min(max(0, date.timeIntervalSinceNow), 30.0)
            }
        }
        return nil
    }

    private func requestID(from response: HTTPURLResponse) -> String? {
        response.value(forHTTPHeaderField: "X-Request-ID") ??
            response.value(forHTTPHeaderField: "Request-ID")
    }

    private func bodyLimitError(code: String) -> SDKError {
        SDKError(code: code, message: "The request or response body exceeded the configured size limit.")
    }

    private func merge(_ values: [String: String], into headers: inout [String: String]) {
        for (key, value) in values {
            setHeader(key, value: value, in: &headers)
        }
    }

    private func mergeAuthCookies(
        _ authCookies: [String: String],
        into headers: inout [String: String]
    ) {
        let authNames = Set(authCookies.keys)
        var pairs = (headerValue("Cookie", in: headers) ?? "")
            .split(separator: ";", omittingEmptySubsequences: true)
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { pair in
                let name = pair
                    .split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false)
                    .first
                    .map(String.init) ?? ""
                return !authNames.contains(name)
            }
        pairs.append(contentsOf: authCookies.keys.sorted().map {
            Self.cookiePair(name: $0, value: authCookies[$0] ?? "")
        })
        setHeader("Cookie", value: pairs.joined(separator: "; "), in: &headers)
    }

    private func headerValue(_ name: String, in headers: [String: String]) -> String? {
        headers.first { $0.key.caseInsensitiveCompare(name) == .orderedSame }?.value
    }

    private func setHeader(_ name: String, value: String, in headers: inout [String: String]) {
        let matchingKeys = headers.keys.filter {
            $0.caseInsensitiveCompare(name) == .orderedSame
        }
        for key in matchingKeys { headers.removeValue(forKey: key) }
        headers[name] = value
    }
}
