package com.apollodeploy.signal.sdk;

import com.apollodeploy.signal.sdk.api.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.util.Map;

/** Configuration and primary client for the Apollo Signal API API. */
public final class ApolloSignalApiClient implements AutoCloseable {
    public static final class Config {
        private String baseUrl = "https://api.signal.apollodeploy.com";
        private Map<String, String> authValues = Map.of();
        private Map<String, String> defaultHeaders = Map.of();
        private int timeoutMs = 15_000;
        private int maxRetries = 3;
        private boolean retryUnsafeRequests;

        public String baseUrl() {
            return baseUrl;
        }

        public Config baseUrl(String value) {
            this.baseUrl = value;
            return this;
        }

        public Map<String, String> authValues() {
            return authValues;
        }

        public Config authValues(Map<String, String> value) {
            this.authValues = value == null ? Map.of() : Map.copyOf(value);
            return this;
        }

        public Map<String, String> defaultHeaders() {
            return defaultHeaders;
        }

        public Config defaultHeaders(Map<String, String> value) {
            this.defaultHeaders = value == null ? Map.of() : Map.copyOf(value);
            return this;
        }

        public int timeoutMs() {
            return timeoutMs;
        }

        public Config timeoutMs(int value) {
            this.timeoutMs = value;
            return this;
        }

        public int maxRetries() {
            return maxRetries;
        }

        public Config maxRetries(int value) {
            this.maxRetries = value;
            return this;
        }

        public boolean retryUnsafeRequests() {
            return retryUnsafeRequests;
        }

        public Config retryUnsafeRequests(boolean value) {
            this.retryUnsafeRequests = value;
            return this;
        }
    }

    private final Transport transport;
    private final EmailsAPI emails;
    private final MetricsAPI metrics;
    private final SuppressionsAPI suppressions;
    private final SegmentsAPI segments;
    private final TopicsAPI topics;
    private final ContactPropertiesAPI contactProperties;
    private final ContactsAPI contacts;
    private final WebhooksAPI webhooks;
    private final ApiKeysAPI apiKeys;
    private final ProjectsAPI projects;
    private final SendingDomainsAPI sendingDomains;

    public ApolloSignalApiClient() {
        this(new Config());
    }

    public ApolloSignalApiClient(Config config) {
        this(new Transport(new Transport.Config(
                config.baseUrl(),
                config.authValues(),
                config.defaultHeaders(),
                config.timeoutMs(),
                config.maxRetries(),
                config.retryUnsafeRequests())));
    }

    public ApolloSignalApiClient(Transport transport) {
        this.transport = transport;
        this.emails = new EmailsAPI(transport);
        this.metrics = new MetricsAPI(transport);
        this.suppressions = new SuppressionsAPI(transport);
        this.segments = new SegmentsAPI(transport);
        this.topics = new TopicsAPI(transport);
        this.contactProperties = new ContactPropertiesAPI(transport);
        this.contacts = new ContactsAPI(transport);
        this.webhooks = new WebhooksAPI(transport);
        this.apiKeys = new ApiKeysAPI(transport);
        this.projects = new ProjectsAPI(transport);
        this.sendingDomains = new SendingDomainsAPI(transport);
    }

    public Transport transport() {
        return transport;
    }

    /** EmailsAPI operations. */
    public EmailsAPI emails() {
        return emails;
    }

    /** MetricsAPI operations. */
    public MetricsAPI metrics() {
        return metrics;
    }

    /** SuppressionsAPI operations. */
    public SuppressionsAPI suppressions() {
        return suppressions;
    }

    /** SegmentsAPI operations. */
    public SegmentsAPI segments() {
        return segments;
    }

    /** TopicsAPI operations. */
    public TopicsAPI topics() {
        return topics;
    }

    /** ContactPropertiesAPI operations. */
    public ContactPropertiesAPI contactProperties() {
        return contactProperties;
    }

    /** ContactsAPI operations. */
    public ContactsAPI contacts() {
        return contacts;
    }

    /** WebhooksAPI operations. */
    public WebhooksAPI webhooks() {
        return webhooks;
    }

    /** ApiKeysAPI operations. */
    public ApiKeysAPI apiKeys() {
        return apiKeys;
    }

    /** ProjectsAPI operations. */
    public ProjectsAPI projects() {
        return projects;
    }

    /** SendingDomainsAPI operations. */
    public SendingDomainsAPI sendingDomains() {
        return sendingDomains;
    }

    @Override
    public void close() {
        transport.close();
    }
}
