namespace ApolloDeploySignal;

using System;
using System.Collections.Generic;
using System.Net.Http;
using ApolloDeploySignal.Api;

/// <summary>Configuration for the ApolloSignalApi API client.</summary>
public sealed class ApolloSignalApiClientConfig
{
    public string BaseUrl { get; set; } = "https://api.signal.apollodeploy.com";
    public int TimeoutMs { get; set; } = 15000;
    public int MaxRetries { get; set; } = 3;
    public bool RetryUnsafeRequests { get; set; }
    public Dictionary<string, string>? DefaultHeaders { get; set; }
    /// <summary>Optional shared HttpClient. The SDK will not dispose an injected client.</summary>
    public HttpClient? HttpClient { get; set; }
}

/// <summary>Primary API client for Apollo Signal API.</summary>
public sealed class ApolloSignalApiClient : IDisposable
{
    private readonly Transport _transport;

    /// <summary>emails operations</summary>
    public EmailsAPI Emails { get; }
    /// <summary>metrics operations</summary>
    public MetricsAPI Metrics { get; }
    /// <summary>suppressions operations</summary>
    public SuppressionsAPI Suppressions { get; }
    /// <summary>segments operations</summary>
    public SegmentsAPI Segments { get; }
    /// <summary>topics operations</summary>
    public TopicsAPI Topics { get; }
    /// <summary>contactProperties operations</summary>
    public ContactPropertiesAPI ContactProperties { get; }
    /// <summary>contacts operations</summary>
    public ContactsAPI Contacts { get; }
    /// <summary>webhooks operations</summary>
    public WebhooksAPI Webhooks { get; }
    /// <summary>apiKeys operations</summary>
    public ApiKeysAPI ApiKeys { get; }
    /// <summary>projects operations</summary>
    public ProjectsAPI Projects { get; }
    /// <summary>sendingDomains operations</summary>
    public SendingDomainsAPI SendingDomains { get; }

    public ApolloSignalApiClient(ApolloSignalApiClientConfig? config = null)
    {
        config ??= new ApolloSignalApiClientConfig();

        _transport = new Transport(
            new TransportConfig
            {
                BaseUrl = config.BaseUrl,
                TimeoutMs = config.TimeoutMs,
                MaxRetries = config.MaxRetries,
                RetryUnsafeRequests = config.RetryUnsafeRequests,
                DefaultHeaders = config.DefaultHeaders,
            },
            config.HttpClient);

        Emails = new EmailsAPI(_transport);
        Metrics = new MetricsAPI(_transport);
        Suppressions = new SuppressionsAPI(_transport);
        Segments = new SegmentsAPI(_transport);
        Topics = new TopicsAPI(_transport);
        ContactProperties = new ContactPropertiesAPI(_transport);
        Contacts = new ContactsAPI(_transport);
        Webhooks = new WebhooksAPI(_transport);
        ApiKeys = new ApiKeysAPI(_transport);
        Projects = new ProjectsAPI(_transport);
        SendingDomains = new SendingDomainsAPI(_transport);
    }

    public void Dispose() => _transport.Dispose();
}
