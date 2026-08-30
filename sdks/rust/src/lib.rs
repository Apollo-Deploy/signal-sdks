//! Apollo Signal API
//!
//! Auto-generated Rust SDK for the Apollo Signal API API.
//!
//! # Quick Start
//!
//! Add to your `Cargo.toml`:
//!
//! ```toml
//! [dependencies]
//! apollo_signal_sdk = "4.0.0"
//! ```
//!
//! Then use it:
//!
//! ```rust,no_run
//! use apollo_signal_sdk::Client;
//! use apollo_signal_sdk::ClientConfig;
//!
//! #[tokio::main]
//! async fn main() -> Result<(), Box<dyn std::error::Error>> {
//!     let mut config = ClientConfig::default();
//!
//!     let client = Client::new(config);
//!
//!     // Use domain clients
//!     // let result = client.emails.some_method().await?;
//!
//!     Ok(())
//! }
//! ```
//!
//! ## API Reference
//!
//! ### `EmailsAPI`
//! 
//!
//! - `send_email()` — No summary
//! - `get_email()` — No summary
//! - `batch_send_emails()` — No summary
//! - `cancel_email()` — No summary
//! - `bulk_cancel_emails()` — No summary
//! - `issue_stream_token()` — No summary
//! - `stream_email_events()` — No summary
//! - `validate_links()` — No summary
//!
//! ### `MetricsAPI`
//! 
//!
//! - `get_topic_performance()` — No summary
//! - `get_email_performance()` — No summary
//! - `get_email_engagement()` — No summary
//! - `get_project_metrics_summary()` — No summary
//! - `get_project_metrics_timeline()` — No summary
//! - `get_metrics_advisor()` — No summary
//!
//! ### `SuppressionsAPI`
//! 
//!
//! - `list_suppressions()` — No summary
//! - `export_suppressions()` — No summary
//! - `add_suppression()` — No summary
//! - `remove_suppression()` — No summary
//! - `import_suppressions()` — No summary
//!
//! ### `SegmentsAPI`
//! 
//!
//! - `list_segments()` — No summary
//! - `get_segment()` — No summary
//! - `list_contacts_in_segment()` — No summary
//! - `create_segment()` — No summary
//! - `delete_segment()` — No summary
//!
//! ### `TopicsAPI`
//! 
//!
//! - `list_topics()` — No summary
//! - `get_topic()` — No summary
//! - `list_contacts_in_topic()` — No summary
//! - `create_topic()` — No summary
//! - `update_topic()` — No summary
//! - `delete_topic()` — No summary
//!
//! ### `ContactPropertiesAPI`
//! 
//!
//! - `list_contact_properties()` — No summary
//! - `get_contact_property()` — No summary
//! - `create_contact_property()` — No summary
//! - `update_contact_property()` — No summary
//! - `delete_contact_property()` — No summary
//!
//! ### `ContactsAPI`
//! 
//!
//! - `list_contacts()` — No summary
//! - `get_contact()` — No summary
//! - `list_contact_segments()` — No summary
//! - `get_contact_topics()` — No summary
//! - `create_contact()` — No summary
//! - `update_contact()` — No summary
//! - `delete_contact()` — No summary
//! - `upload_contact_image()` — No summary
//! - `set_contact_image_url()` — No summary
//! - `delete_contact_image()` — No summary
//! - `add_contact_to_segment()` — No summary
//! - `remove_contact_from_segment()` — No summary
//! - `update_contact_topics()` — No summary
//! - `get_contact_activity()` — No summary
//! - `get_contact_engagement_score()` — No summary
//! - `get_contact_email_validation_status()` — No summary
//! - `refresh_contact_engagement_score()` — No summary
//! - `record_contact_email_validation()` — No summary
//!
//! ### `WebhooksAPI`
//! 
//!
//! - `list_webhooks()` — No summary
//! - `get_webhook()` — No summary
//! - `list_webhook_deliveries()` — No summary
//! - `get_webhook_delivery()` — No summary
//! - `create_webhook()` — No summary
//! - `update_webhook()` — No summary
//! - `delete_webhook()` — No summary
//! - `test_webhook()` — No summary
//! - `replay_webhook_delivery()` — No summary
//!
//! ### `ApiKeysAPI`
//! 
//!
//! - `list_api_keys()` — No summary
//! - `get_api_key()` — No summary
//! - `get_api_key_usage()` — No summary
//! - `export_api_key_usage()` — No summary
//!
//! ### `ProjectsAPI`
//! 
//!
//! - `list_projects()` — No summary
//! - `get_project()` — No summary
//! - `update_project()` — No summary
//! - `list_emails()` — No summary
//! - `get_project_email()` — No summary
//! - `get_email_timeline()` — No summary
//!
//! ### `SendingDomainsAPI`
//! 
//!
//! - `list_domains()` — No summary
//! - `get_domain()` — No summary
//! - `register_domain()` — No summary
//! - `verify_domain()` — No summary
//! - `delete_domain()` — No summary
//! - `verify_bimi()` — No summary
//! - `update_bimi()` — No summary
//!
//!
//! ## Error Handling
//!
//! All API methods return `Result<T, SdkError>`. The `SdkError` enum covers:
//!
//! - **ApiError** — server returned an error response (4xx/5xx)
//! - **NetworkError** — request failed due to network issues
//! - **DeserializationError** — response body could not be parsed
//! - **ValidationError** — invalid request parameters
//!
//! ```rust,ignore
//! let result = client.resource.some_method().await;
//! match result {
//!     Ok(response) => println!("Success: {:?}", response),
//!     Err(error) => eprintln!("SDK error: {}", error),
//! }
//! ```

pub mod client;
pub mod transport;
pub mod error;
pub mod types;
pub mod api;

pub use client::*;
pub use error::SdkError;
pub use transport::SseEventStream;

/// Re-export API resource modules
pub mod resources {
    pub use super::api::emails::*;
    pub use super::api::metrics::*;
    pub use super::api::suppressions::*;
    pub use super::api::segments::*;
    pub use super::api::topics::*;
    pub use super::api::contact_properties::*;
    pub use super::api::contacts::*;
    pub use super::api::webhooks::*;
    pub use super::api::api_keys::*;
    pub use super::api::projects::*;
    pub use super::api::sending_domains::*;
}
