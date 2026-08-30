namespace ApolloDeploySignal;

using System;

/// <summary>Represents a normalized SDK or API error.</summary>
public sealed class SdkException : Exception
{
    public int Status { get; }
    public string? Code { get; }
    public string? RequestId { get; }

    public SdkException(
        int status,
        string? code,
        string message,
        string? requestId,
        Exception? innerException = null)
        : base(message, innerException)
    {
        Status = status;
        Code = code;
        RequestId = requestId;
    }

    public bool IsNetworkError => Status == 0;
    public bool IsClientError => Status is >= 400 and <= 499;
    public bool IsServerError => Status is >= 500 and <= 599;
    public bool IsRetryable => IsNetworkError || Status is 408 or 425 or 429 or 500 or 502 or 503 or 504;

    public override string ToString()
    {
        var request = string.IsNullOrEmpty(RequestId) ? "" : $" (request {RequestId})";
        return string.IsNullOrEmpty(Code)
            ? $"[{Status}] {Message}{request}"
            : $"[{Status}] {Code}: {Message}{request}";
    }
}
