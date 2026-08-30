# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdk
  # apiKeys API domain
  class ApiKeys
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [ListApiKeysResponse]
    def list_api_keys(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/api-keys",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param key_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [ApiKey]
    def get_api_key(project_id:, key_id:)
      path_params = {
        "projectId" => project_id,
        "keyId" => key_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/api-keys/${keyId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param key_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [ApiKeyUsageResponse]
    def get_api_key_usage(project_id:, key_id:)
      path_params = {
        "projectId" => project_id,
        "keyId" => key_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/api-keys/${keyId}/usage",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param key_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [nil]
    def export_api_key_usage(project_id:, key_id:)
      path_params = {
        "projectId" => project_id,
        "keyId" => key_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/api-keys/${keyId}/usage/export",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

  end
end
