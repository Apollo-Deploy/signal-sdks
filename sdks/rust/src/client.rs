use crate::transport::{Transport, TransportConfig};
use crate::api::emails::EmailsAPI;
use crate::api::metrics::MetricsAPI;
use crate::api::suppressions::SuppressionsAPI;
use crate::api::segments::SegmentsAPI;
use crate::api::topics::TopicsAPI;
use crate::api::contact_properties::ContactPropertiesAPI;
use crate::api::contacts::ContactsAPI;
use crate::api::webhooks::WebhooksAPI;
use crate::api::api_keys::ApiKeysAPI;
use crate::api::projects::ProjectsAPI;
use crate::api::sending_domains::SendingDomainsAPI;
use std::collections::HashMap;
use std::time::Duration;

/// Configuration for the Apollo Signal API API client.
#[derive(Debug, Clone)]
pub struct ClientConfig {
    /// Base URL for the API.
    pub base_url: String,
    /// Request timeout.
    pub timeout: Duration,
    /// Maximum number of retry attempts.
    pub max_retries: u32,
    /// Allow automatic retries for unsafe methods without an idempotency key.
    pub retry_unsafe_requests: bool,
    /// Headers sent with every request.
    pub default_headers: HashMap<String, String>,
}

impl Default for ClientConfig {
    fn default() -> Self {
        Self {
            base_url: "https://api.signal.apollodeploy.com".to_string(),
            timeout: Duration::from_secs(15),
            max_retries: 3,
            retry_unsafe_requests: false,
            default_headers: HashMap::new(),
        }
    }
}

/// Primary API client for Apollo Signal API.
///
/// Provides access to all domain-specific API groups.
pub struct Client {
    transport: Transport,
    /// EmailsAPI operations.
    pub emails: EmailsAPI,
    /// MetricsAPI operations.
    pub metrics: MetricsAPI,
    /// SuppressionsAPI operations.
    pub suppressions: SuppressionsAPI,
    /// SegmentsAPI operations.
    pub segments: SegmentsAPI,
    /// TopicsAPI operations.
    pub topics: TopicsAPI,
    /// ContactPropertiesAPI operations.
    pub contact_properties: ContactPropertiesAPI,
    /// ContactsAPI operations.
    pub contacts: ContactsAPI,
    /// WebhooksAPI operations.
    pub webhooks: WebhooksAPI,
    /// ApiKeysAPI operations.
    pub api_keys: ApiKeysAPI,
    /// ProjectsAPI operations.
    pub projects: ProjectsAPI,
    /// SendingDomainsAPI operations.
    pub sending_domains: SendingDomainsAPI,
}

impl Client {
    /// Create a new Apollo Signal API API client with the given configuration.
    ///
    /// # Example
    ///
    /// ```rust,no_run
    /// use apollo_signal_sdk::Client;
    /// use apollo_signal_sdk::ClientConfig;
    ///
    /// let config = ClientConfig {
    ///     ..Default::default()
    /// };
    /// let client = Client::new(config);
    /// ```
    pub fn new(config: ClientConfig) -> Self {
        let transport_config = TransportConfig {
            base_url: config.base_url,
            timeout: config.timeout,
            max_retries: config.max_retries,
            retry_unsafe_requests: config.retry_unsafe_requests,
            default_headers: config.default_headers,
        };

        let transport = Transport::new(transport_config);

        Self {
            emails: EmailsAPI::new(transport.clone()),
            metrics: MetricsAPI::new(transport.clone()),
            suppressions: SuppressionsAPI::new(transport.clone()),
            segments: SegmentsAPI::new(transport.clone()),
            topics: TopicsAPI::new(transport.clone()),
            contact_properties: ContactPropertiesAPI::new(transport.clone()),
            contacts: ContactsAPI::new(transport.clone()),
            webhooks: WebhooksAPI::new(transport.clone()),
            api_keys: ApiKeysAPI::new(transport.clone()),
            projects: ProjectsAPI::new(transport.clone()),
            sending_domains: SendingDomainsAPI::new(transport.clone()),
            transport,
        }
    }

    /// Return a reference to the underlying transport layer.
    pub fn transport(&self) -> &Transport {
        &self.transport
    }
}

impl std::fmt::Debug for Client {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("Client")
            .field("transport", &"<Transport>")
            .field("emails", &"<EmailsAPI>")
            .field("metrics", &"<MetricsAPI>")
            .field("suppressions", &"<SuppressionsAPI>")
            .field("segments", &"<SegmentsAPI>")
            .field("topics", &"<TopicsAPI>")
            .field("contact_properties", &"<ContactPropertiesAPI>")
            .field("contacts", &"<ContactsAPI>")
            .field("webhooks", &"<WebhooksAPI>")
            .field("api_keys", &"<ApiKeysAPI>")
            .field("projects", &"<ProjectsAPI>")
            .field("sending_domains", &"<SendingDomainsAPI>")
            .finish()
    }
}
