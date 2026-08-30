# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdk
  # topics API domain
  class Topics
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [TopicPageResponse]
    def list_topics(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/topics",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param topic_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [TopicResponse]
    def get_topic(project_id:, topic_id:)
      path_params = {
        "projectId" => project_id,
        "topicId" => topic_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/topics/${topicId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param topic_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [CursorPage]
    def list_contacts_in_topic(project_id:, topic_id:)
      path_params = {
        "projectId" => project_id,
        "topicId" => topic_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/topics/${topicId}/contacts",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param body [CreateTopicBody] request body
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [TopicResponse]
    def create_topic(project_id:, body:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/topics",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param topic_id [String]
    # @param body [UpdateTopicBody] request body
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [TopicResponse]
    def update_topic(project_id:, topic_id:, body:)
      path_params = {
        "projectId" => project_id,
        "topicId" => topic_id,
      }

      transport.request(
        method: :patch,
        path: "/v1/projects/${projectId}/topics/${topicId}",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param topic_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [nil]
    def delete_topic(project_id:, topic_id:)
      path_params = {
        "projectId" => project_id,
        "topicId" => topic_id,
      }

      transport.request(
        method: :delete,
        path: "/v1/projects/${projectId}/topics/${topicId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

  end
end
