use crate::error::SdkError;
use crate::transport::Transport;
use reqwest::Method;
use serde::Serialize;
use crate::types::{ CreateWebhookBody, UpdateWebhookBody, WebhookCreateResponse, WebhookDeliveryPageResponse, WebhookDeliveryResponse, WebhookPageResponse, WebhookResponse };

/// WebhooksAPI API operations.
pub struct WebhooksAPI {
    transport: Transport,
}

impl WebhooksAPI {
    pub(crate) fn new(transport: Transport) -> Self {
        Self { transport }
    }

    pub async fn list_webhooks(
        &self,
        project_id: String,
    ) -> Result<WebhookPageResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/webhooks".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<WebhookPageResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_webhook(
        &self,
        project_id: String,
        endpoint_id: String,
    ) -> Result<WebhookResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/webhooks/${endpointId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${endpointId}", &encode_path(&endpoint_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<WebhookResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn list_webhook_deliveries(
        &self,
        project_id: String,
        endpoint_id: String,
    ) -> Result<WebhookDeliveryPageResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${endpointId}", &encode_path(&endpoint_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<WebhookDeliveryPageResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_webhook_delivery(
        &self,
        project_id: String,
        endpoint_id: String,
        delivery_id: String,
    ) -> Result<WebhookDeliveryResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries/${deliveryId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${endpointId}", &encode_path(&endpoint_id.to_string()));
        path = path.replace("${deliveryId}", &encode_path(&delivery_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<WebhookDeliveryResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn create_webhook(
        &self,
        project_id: String,
        body: &CreateWebhookBody,
    ) -> Result<WebhookCreateResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/webhooks".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<WebhookCreateResponse>(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn update_webhook(
        &self,
        project_id: String,
        endpoint_id: String,
        body: &UpdateWebhookBody,
    ) -> Result<WebhookResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/webhooks/${endpointId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${endpointId}", &encode_path(&endpoint_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<WebhookResponse>(
            Method::PATCH,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn delete_webhook(
        &self,
        project_id: String,
        endpoint_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/webhooks/${endpointId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${endpointId}", &encode_path(&endpoint_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute_raw(
            Method::DELETE,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await.map(|_| ())
    }

    pub async fn test_webhook(
        &self,
        project_id: String,
        endpoint_id: String,
    ) -> Result<WebhookDeliveryResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/webhooks/${endpointId}/test".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${endpointId}", &encode_path(&endpoint_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<WebhookDeliveryResponse>(
            Method::POST,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn replay_webhook_delivery(
        &self,
        project_id: String,
        endpoint_id: String,
        delivery_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/webhooks/${endpointId}/replay/${deliveryId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${endpointId}", &encode_path(&endpoint_id.to_string()));
        path = path.replace("${deliveryId}", &encode_path(&delivery_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute_raw(
            Method::POST,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await.map(|_| ())
    }

}

fn encode_path(value: &str) -> String {
    urlencoding::encode(value).into_owned()
}

fn encode_value<T: Serialize>(value: &T) -> Result<String, SdkError> {
    match serde_json::to_value(value)
        .map_err(|error| SdkError::ValidationError(error.to_string()))?
    {
        serde_json::Value::String(value) => Ok(value),
        value => Ok(value.to_string()),
    }
}

fn encode_cookie_name(name: &str) -> String {
    urlencoding::encode(name).into_owned()
}

fn encode_cookie_value<T: Serialize>(value: &T) -> Result<String, SdkError> {
    let value = encode_value(value)?;
    Ok(urlencoding::encode(&value).into_owned())
}
