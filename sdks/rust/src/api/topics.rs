use crate::error::SdkError;
use crate::transport::Transport;
use reqwest::Method;
use serde::Serialize;
use crate::types::{ CreateTopicBody, CursorPage, TopicPageResponse, TopicResponse, UpdateTopicBody };

/// TopicsAPI API operations.
pub struct TopicsAPI {
    transport: Transport,
}

impl TopicsAPI {
    pub(crate) fn new(transport: Transport) -> Self {
        Self { transport }
    }

    pub async fn list_topics(
        &self,
        project_id: String,
    ) -> Result<TopicPageResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/topics".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<TopicPageResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_topic(
        &self,
        project_id: String,
        topic_id: String,
    ) -> Result<TopicResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/topics/${topicId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${topicId}", &encode_path(&topic_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<TopicResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn list_contacts_in_topic(
        &self,
        project_id: String,
        topic_id: String,
    ) -> Result<CursorPage, SdkError> {
        let mut path = "/v1/projects/${projectId}/topics/${topicId}/contacts".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${topicId}", &encode_path(&topic_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<CursorPage>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn create_topic(
        &self,
        project_id: String,
        body: &CreateTopicBody,
    ) -> Result<TopicResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/topics".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<TopicResponse>(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn update_topic(
        &self,
        project_id: String,
        topic_id: String,
        body: &UpdateTopicBody,
    ) -> Result<TopicResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/topics/${topicId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${topicId}", &encode_path(&topic_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<TopicResponse>(
            Method::PATCH,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn delete_topic(
        &self,
        project_id: String,
        topic_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/topics/${topicId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${topicId}", &encode_path(&topic_id.to_string()));

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
