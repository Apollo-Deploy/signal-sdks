use crate::error::SdkError;
use crate::transport::Transport;
use reqwest::Method;
use serde::Serialize;
use crate::types::{ ContactPropertyPageResponse, ContactPropertyResponse, CreateContactPropertyBody, UpdateContactPropertyBody };

/// ContactPropertiesAPI API operations.
pub struct ContactPropertiesAPI {
    transport: Transport,
}

impl ContactPropertiesAPI {
    pub(crate) fn new(transport: Transport) -> Self {
        Self { transport }
    }

    pub async fn list_contact_properties(
        &self,
        project_id: String,
    ) -> Result<ContactPropertyPageResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contact-properties".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactPropertyPageResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_contact_property(
        &self,
        project_id: String,
        property_id: String,
    ) -> Result<ContactPropertyResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contact-properties/${propertyId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${propertyId}", &encode_path(&property_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactPropertyResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn create_contact_property(
        &self,
        project_id: String,
        body: &CreateContactPropertyBody,
    ) -> Result<ContactPropertyResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contact-properties".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactPropertyResponse>(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn update_contact_property(
        &self,
        project_id: String,
        property_id: String,
        body: &UpdateContactPropertyBody,
    ) -> Result<ContactPropertyResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contact-properties/${propertyId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${propertyId}", &encode_path(&property_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactPropertyResponse>(
            Method::PATCH,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn delete_contact_property(
        &self,
        project_id: String,
        property_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/contact-properties/${propertyId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${propertyId}", &encode_path(&property_id.to_string()));

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
