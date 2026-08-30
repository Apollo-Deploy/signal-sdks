use crate::error::SdkError;
use crate::transport::Transport;
use reqwest::Method;
use serde::Serialize;
use crate::types::{ ApiKey, ApiKeyUsageResponse, ListApiKeysResponse };

/// ApiKeysAPI API operations.
pub struct ApiKeysAPI {
    transport: Transport,
}

impl ApiKeysAPI {
    pub(crate) fn new(transport: Transport) -> Self {
        Self { transport }
    }

    pub async fn list_api_keys(
        &self,
        project_id: String,
    ) -> Result<ListApiKeysResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/api-keys".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ListApiKeysResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_api_key(
        &self,
        project_id: String,
        key_id: String,
    ) -> Result<ApiKey, SdkError> {
        let mut path = "/v1/projects/${projectId}/api-keys/${keyId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${keyId}", &encode_path(&key_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ApiKey>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_api_key_usage(
        &self,
        project_id: String,
        key_id: String,
    ) -> Result<ApiKeyUsageResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/api-keys/${keyId}/usage".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${keyId}", &encode_path(&key_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ApiKeyUsageResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn export_api_key_usage(
        &self,
        project_id: String,
        key_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/api-keys/${keyId}/usage/export".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${keyId}", &encode_path(&key_id.to_string()));

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
