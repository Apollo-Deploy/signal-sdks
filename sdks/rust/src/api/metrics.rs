use crate::error::SdkError;
use crate::transport::Transport;
use reqwest::Method;
use serde::Serialize;
use crate::types::{ AdvisorReportResponse, EmailPerformanceResponse, EmailReadScrollAnalyticsResponse, GetMetricsAdvisorQuery, GetProjectMetricsSummaryQuery, GetProjectMetricsTimelineQuery, GetTopicPerformanceQuery, ProjectMetricsSummaryResponse, ProjectMetricsTimelineResponse, TopicPerformanceResponse };

/// MetricsAPI API operations.
pub struct MetricsAPI {
    transport: Transport,
}

impl MetricsAPI {
    pub(crate) fn new(transport: Transport) -> Self {
        Self { transport }
    }

    pub async fn get_topic_performance(
        &self,
        id: String,
        window: Option<String>,
        project_id: Option<String>,
    ) -> Result<TopicPerformanceResponse, SdkError> {
        let mut path = "/v1/metrics/topics/${id}".to_string();
        path = path.replace("${id}", &encode_path(&id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        if let Some(value) = window.as_ref() {
            query_params.push(("window".to_string(), encode_value(value)?));
        }
        if let Some(value) = project_id.as_ref() {
            query_params.push(("projectId".to_string(), encode_value(value)?));
        }
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<TopicPerformanceResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_email_performance(
        &self,
        id: String,
    ) -> Result<EmailPerformanceResponse, SdkError> {
        let mut path = "/v1/metrics/emails/${id}".to_string();
        path = path.replace("${id}", &encode_path(&id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<EmailPerformanceResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_email_engagement(
        &self,
        id: String,
    ) -> Result<EmailReadScrollAnalyticsResponse, SdkError> {
        let mut path = "/v1/metrics/emails/${id}/engagement".to_string();
        path = path.replace("${id}", &encode_path(&id.to_string()));

        let mut query_params: Vec<(String, String)> = Vec::new();
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<EmailReadScrollAnalyticsResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_project_metrics_summary(
        &self,
        window: Option<String>,
        project_id: Option<String>,
    ) -> Result<ProjectMetricsSummaryResponse, SdkError> {
        let mut path = "/v1/metrics/summary".to_string();

        let mut query_params: Vec<(String, String)> = Vec::new();
        if let Some(value) = window.as_ref() {
            query_params.push(("window".to_string(), encode_value(value)?));
        }
        if let Some(value) = project_id.as_ref() {
            query_params.push(("projectId".to_string(), encode_value(value)?));
        }
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ProjectMetricsSummaryResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_project_metrics_timeline(
        &self,
        window: Option<String>,
        granularity: Option<String>,
        format: Option<String>,
        project_id: Option<String>,
    ) -> Result<ProjectMetricsTimelineResponse, SdkError> {
        let mut path = "/v1/metrics/timeline".to_string();

        let mut query_params: Vec<(String, String)> = Vec::new();
        if let Some(value) = window.as_ref() {
            query_params.push(("window".to_string(), encode_value(value)?));
        }
        if let Some(value) = granularity.as_ref() {
            query_params.push(("granularity".to_string(), encode_value(value)?));
        }
        if let Some(value) = format.as_ref() {
            query_params.push(("format".to_string(), encode_value(value)?));
        }
        if let Some(value) = project_id.as_ref() {
            query_params.push(("projectId".to_string(), encode_value(value)?));
        }
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<ProjectMetricsTimelineResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
            headers,
            None,
        ).await
    }

    pub async fn get_metrics_advisor(
        &self,
        project_id: Option<String>,
    ) -> Result<AdvisorReportResponse, SdkError> {
        let mut path = "/v1/metrics/advisor".to_string();

        let mut query_params: Vec<(String, String)> = Vec::new();
        if let Some(value) = project_id.as_ref() {
            query_params.push(("projectId".to_string(), encode_value(value)?));
        }
        let query = (!query_params.is_empty()).then_some(query_params.as_slice());

        let mut headers: Vec<(String, String)> = Vec::new();
        let headers = (!headers.is_empty()).then_some(headers.as_slice());

        self.transport.execute::<AdvisorReportResponse>(
            Method::GET,
            &path,
            query,
            None::<&serde_json::Value>,
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
