use crate::error::SdkError;
use crate::transport::Transport;
use reqwest::Method;
use serde::Serialize;
use crate::types::{ AddToSegmentBody, ContactPageResponse, ContactResponse, CreateContactBody, EmailValidationStatusResponse, EngagementScoreResponse, GetContactActivityResponse, GetContactTopicsResponse, ListContactSegmentsResponse, RecordValidationBody, SetImageUrlBody, UpdateContactBody, UpdateTopicsBody };

/// ContactsAPI API operations.
pub struct ContactsAPI {
    transport: Transport,
}

impl ContactsAPI {
    pub(crate) fn new(transport: Transport) -> Self {
        Self { transport }
    }

    pub async fn list_contacts(
        &self,
        project_id: String,
    ) -> Result<ContactPageResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactPageResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_contact(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<ContactResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn list_contact_segments(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<ListContactSegmentsResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/segments".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ListContactSegmentsResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_contact_topics(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<GetContactTopicsResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/topics".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<GetContactTopicsResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn create_contact(
        &self,
        project_id: String,
        body: &CreateContactBody,
    ) -> Result<ContactResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactResponse>(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn update_contact(
        &self,
        project_id: String,
        contact_id: String,
        body: &UpdateContactBody,
    ) -> Result<ContactResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactResponse>(
            Method::PATCH,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn delete_contact(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

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

    pub async fn upload_contact_image(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<ContactResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/image".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactResponse>(
            Method::POST,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn set_contact_image_url(
        &self,
        project_id: String,
        contact_id: String,
        body: &SetImageUrlBody,
    ) -> Result<ContactResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/image".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ContactResponse>(
            Method::PUT,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await
    }

    pub async fn delete_contact_image(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/image".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

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

    pub async fn add_contact_to_segment(
        &self,
        project_id: String,
        contact_id: String,
        body: &AddToSegmentBody,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/segments".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute_raw(
            Method::POST,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await.map(|_| ())
    }

    pub async fn remove_contact_from_segment(
        &self,
        project_id: String,
        contact_id: String,
        segment_id: String,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));
        path = path.replace("${segmentId}", &encode_path(&segment_id.to_string()));

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

    pub async fn update_contact_topics(
        &self,
        project_id: String,
        contact_id: String,
        body: &UpdateTopicsBody,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/topics".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute_raw(
            Method::PATCH,
            &path,
            query,
            Some(body),
            headers,
            None,
        ).await.map(|_| ())
    }

    pub async fn get_contact_activity(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<GetContactActivityResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/activity".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<GetContactActivityResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_contact_engagement_score(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<EngagementScoreResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/engagement".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<EngagementScoreResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_contact_email_validation_status(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<EmailValidationStatusResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<EmailValidationStatusResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn refresh_contact_engagement_score(
        &self,
        project_id: String,
        contact_id: String,
    ) -> Result<EngagementScoreResponse, SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/engagement/refresh".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<EngagementScoreResponse>(
            Method::POST,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn record_contact_email_validation(
        &self,
        project_id: String,
        contact_id: String,
        body: &RecordValidationBody,
    ) -> Result<(), SdkError> {
        let mut path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation".to_string();
        path = path.replace("${projectId}", &encode_path(&project_id.to_string()));
        path = path.replace("${contactId}", &encode_path(&contact_id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute_raw(
            Method::POST,
            &path,
            query,
            Some(body),
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
