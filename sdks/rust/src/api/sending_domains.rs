use crate::error::SdkError;
use crate::transport::Transport;
use reqwest::Method;
use serde::Serialize;
use crate::types::{ DomainListPageResponse, DomainResponse, RegisterDomainRequest, UpdateBimiRequest };

/// SendingDomainsAPI API operations.
pub struct SendingDomainsAPI {
    transport: Transport,
}

impl SendingDomainsAPI {
    pub(crate) fn new(transport: Transport) -> Self {
        Self { transport }
    }

    pub async fn list_domains(
        &self,
        project_id: String,
    ) -> Result<DomainListPageResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/domains".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<DomainListPageResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_domain(
        &self,
        project_id: String,
        domain_id: String,
    ) -> Result<DomainResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/domains/${domainId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${domainId}", &encode_path(&domain_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<DomainResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn register_domain(
        &self,
        project_id: String,
        body: &RegisterDomainRequest,
    ) -> Result<DomainResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/domains".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<DomainResponse>(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn verify_domain(
        &self,
        project_id: String,
        domain_id: String,
    ) -> Result<DomainResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/domains/${domainId}/verify".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${domainId}", &encode_path(&domain_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<DomainResponse>(
            Method::POST,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn delete_domain(
        &self,
        project_id: String,
        domain_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/domains/${domainId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${domainId}", &encode_path(&domain_id.to_string()));

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

    pub async fn verify_bimi(
        &self,
        project_id: String,
        domain_id: String,
    ) -> Result<DomainResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/domains/${domainId}/bimi/verify".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${domainId}", &encode_path(&domain_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<DomainResponse>(
            Method::POST,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn update_bimi(
        &self,
        project_id: String,
        domain_id: String,
        body: &UpdateBimiRequest,
    ) -> Result<DomainResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/domains/${domainId}/bimi".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${domainId}", &encode_path(&domain_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<DomainResponse>(
            Method::PATCH,
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
