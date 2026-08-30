# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdkRails
  # projects API domain
  class Projects
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ProjectPageResponse]
    def list_projects()

      transport.request(
        method: :get,
        path: "/v1/projects",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ProjectResponse]
    def get_project(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param body [UpdateProjectRequest] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ProjectResponse]
    def update_project(project_id:, body:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :patch,
        path: "/v1/projects/${projectId}",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [EmailPageResponse]
    def list_emails(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/emails",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param email_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [EmailDetailResponse]
    def get_project_email(project_id:, email_id:)
      path_params = {
        "projectId" => project_id,
        "emailId" => email_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/emails/${emailId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param email_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [EmailTimelineResponse]
    def get_email_timeline(project_id:, email_id:)
      path_params = {
        "projectId" => project_id,
        "emailId" => email_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/emails/${emailId}/events",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

  end
end
