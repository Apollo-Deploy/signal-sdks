use crate::error::SdkError;
use crate::transport::Transport;
use reqwest::Method;
use serde::Serialize;
use crate::types::{ AddSuppressionBody, SuppressionImportBody, SuppressionImportResponse, SuppressionPageResponse, SuppressionResponse };

/// SuppressionsAPI API operations.
pub struct SuppressionsAPI {
    transport: Transport,
}

impl SuppressionsAPI {
    pub(crate) fn new(transport: Transport) -> Self {
        Self { transport }
    }

    pub async fn list_suppressions(
        &self,
        project_id: String,
    ) -> Result<SuppressionPageResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/suppressions".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<SuppressionPageResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn export_suppressions(
        &self,
        project_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/suppressions/export".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute_raw(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await.map(|_| ())
    }

    pub async fn add_suppression(
        &self,
        project_id: String,
        body: &AddSuppressionBody,
    ) -> Result<SuppressionResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/suppressions".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<SuppressionResponse>(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn remove_suppression(
        &self,
        project_id: String,
        email: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/suppressions/${email}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${email}", &encode_path(&email.to_string()));

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

    pub async fn import_suppressions(
        &self,
        project_id: String,
        body: &SuppressionImportBody,
    ) -> Result<SuppressionImportResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/suppressions/import".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<SuppressionImportResponse>(
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
