# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdkRails
  # metrics API domain
  class Metrics
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param id [String]
    # @param query [Hash, nil] query parameters
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [TopicPerformanceResponse]
    def get_topic_performance(id:, query: nil)
      path_params = {
        "id" => id,
      }
      query_params = {}
      query_params["window"] = query[:window] if query && query.key?(:window)
      query_params["projectId"] = query[:project_id] if query && query.key?(:project_id)
      query_params = nil if query_params.empty?

      transport.request(
        method: :get,
        path: "/v1/metrics/topics/${id}",
        path_params: path_params,
        query: query_params,
        timeout_ms: nil,
      )
    end

    # @param id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [EmailPerformanceResponse]
    def get_email_performance(id:)
      path_params = {
        "id" => id,
      }

      transport.request(
        method: :get,
        path: "/v1/metrics/emails/${id}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [EmailReadScrollAnalyticsResponse]
    def get_email_engagement(id:)
      path_params = {
        "id" => id,
      }

      transport.request(
        method: :get,
        path: "/v1/metrics/emails/${id}/engagement",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param query [Hash, nil] query parameters
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ProjectMetricsSummaryResponse]
    def get_project_metrics_summary(query: nil)
      query_params = {}
      query_params["window"] = query[:window] if query && query.key?(:window)
      query_params["projectId"] = query[:project_id] if query && query.key?(:project_id)
      query_params = nil if query_params.empty?

      transport.request(
        method: :get,
        path: "/v1/metrics/summary",
        query: query_params,
        timeout_ms: nil,
      )
    end

    # @param query [Hash, nil] query parameters
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ProjectMetricsTimelineResponse]
    def get_project_metrics_timeline(query: nil)
      query_params = {}
      query_params["window"] = query[:window] if query && query.key?(:window)
      query_params["granularity"] = query[:granularity] if query && query.key?(:granularity)
      query_params["format"] = query[:format] if query && query.key?(:format)
      query_params["projectId"] = query[:project_id] if query && query.key?(:project_id)
      query_params = nil if query_params.empty?

      transport.request(
        method: :get,
        path: "/v1/metrics/timeline",
        query: query_params,
        timeout_ms: nil,
      )
    end

    # @param query [Hash, nil] query parameters
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [AdvisorReportResponse]
    def get_metrics_advisor(query: nil)
      query_params = {}
      query_params["projectId"] = query[:project_id] if query && query.key?(:project_id)
      query_params = nil if query_params.empty?

      transport.request(
        method: :get,
        path: "/v1/metrics/advisor",
        query: query_params,
        timeout_ms: nil,
      )
    end

  end
end
