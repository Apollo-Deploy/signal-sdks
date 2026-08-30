use crate::error::SdkError;
use crate::transport::Transport;
use crate::transport::SseEventStream;
use reqwest::Method;
use serde::Serialize;
use crate::types::{ BatchSendRequest, BatchSendResponse, BulkCancelResponse, CancelResponse, EmailDetailResponse, SendEmailRequest, SendEmailResponse, StreamEventResponse, StreamTokenResponse, ValidateLinksRequest, ValidateLinksResponse };

/// EmailsAPI API operations.
pub struct EmailsAPI {
    transport: Transport,
}

impl EmailsAPI {
    pub(crate) fn new(transport: Transport) -> Self {
        Self { transport }
    }

    pub async fn send_email(
        &self,
        body: &SendEmailRequest,
    ) -> Result<SendEmailResponse, SdkError> {
        let mut path = "/v1/emails".to_string();

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<SendEmailResponse>(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn get_email(
        &self,
        email_id: String,
    ) -> Result<EmailDetailResponse, SdkError> {
        let mut path = "/v1/emails/${emailId}".to_string();
        path = path.replace("${emailId}", &encode_path(&email_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<EmailDetailResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn batch_send_emails(
        &self,
        body: &BatchSendRequest,
    ) -> Result<BatchSendResponse, SdkError> {
        let mut path = "/v1/emails/batch".to_string();

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<BatchSendResponse>(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn cancel_email(
        &self,
        email_id: String,
    ) -> Result<CancelResponse, SdkError> {
        let mut path = "/v1/emails/${emailId}".to_string();
        path = path.replace("${emailId}", &encode_path(&email_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<CancelResponse>(
            Method::DELETE,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn bulk_cancel_emails(
        &self,
    ) -> Result<BulkCancelResponse, SdkError> {
        let mut path = "/v1/emails".to_string();

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<BulkCancelResponse>(
            Method::DELETE,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn issue_stream_token(
        &self,
        project_id: String,
    ) -> Result<StreamTokenResponse, SdkError> {
        let mut path = "/v1/emails/${projectId}/stream/token".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<StreamTokenResponse>(
            Method::POST,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn stream_email_events(
        &self,
    ) -> Result<SseEventStream<StreamEventResponse>, SdkError> {
        let mut path = "/v1/emails/stream".to_string();

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute_sse::<StreamEventResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn validate_links(
        &self,
        body: &ValidateLinksRequest,
    ) -> Result<ValidateLinksResponse, SdkError> {
        let mut path = "/v1/emails/validate".to_string();

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ValidateLinksResponse>(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
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
