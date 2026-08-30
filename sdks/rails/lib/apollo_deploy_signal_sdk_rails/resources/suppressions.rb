# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdkRails
  # suppressions API domain
  class Suppressions
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [SuppressionPageResponse]
    def list_suppressions(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/suppressions",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def export_suppressions(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/suppressions/export",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param body [AddSuppressionBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [SuppressionResponse]
    def add_suppression(project_id:, body:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/suppressions",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param email [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def remove_suppression(project_id:, email:)
      path_params = {
        "projectId" => project_id,
        "email" => email,
      }

      transport.request(
        method: :delete,
        path: "/v1/projects/${projectId}/suppressions/${email}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param body [SuppressionImportBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [SuppressionImportResponse]
    def import_suppressions(project_id:, body:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/suppressions/import",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

  end
end
