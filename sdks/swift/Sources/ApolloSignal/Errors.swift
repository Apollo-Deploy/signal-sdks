import Foundation

/// Structured error returned by the generated SDK.
public struct SDKError: Error, LocalizedError, Sendable {
    public let statusCode: Int?
    public let code: String?
    public let message: String
    public let requestID: String?
    public let retryAfterSeconds: TimeInterval?
    public let responseBody: Data?
    public let causeDescription: String?

    public init(
        statusCode: Int? = nil,
        code: String? = nil,
        message: String,
        requestID: String? = nil,
        retryAfterSeconds: TimeInterval? = nil,
        responseBody: Data? = nil,
        causeDescription: String? = nil
    ) {
        self.statusCode = statusCode
        self.code = code
        self.message = message
        self.requestID = requestID
        self.retryAfterSeconds = retryAfterSeconds
        self.responseBody = responseBody
        self.causeDescription = causeDescription
    }

    public var errorDescription: String? { message }

    public var isNetworkError: Bool { statusCode == nil }

    public var isClientError: Bool {
        guard let statusCode else { return false }
        return (400..<500).contains(statusCode)
    }

    public var isServerError: Bool {
        guard let statusCode else { return false }
        return (500..<600).contains(statusCode)
    }

    public var isRetryable: Bool {
        guard let statusCode else { return isNetworkError }
        return [408, 425, 429, 500, 502, 503, 504].contains(statusCode)
    }
}
