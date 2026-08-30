# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdk
  # sendingDomains API domain
  class SendingDomains
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [DomainListPageResponse]
    def list_domains(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/domains",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param domain_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [DomainResponse]
    def get_domain(project_id:, domain_id:)
      path_params = {
        "projectId" => project_id,
        "domainId" => domain_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/domains/${domainId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param body [RegisterDomainRequest] request body
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [DomainResponse]
    def register_domain(project_id:, body:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/domains",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param domain_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [DomainResponse]
    def verify_domain(project_id:, domain_id:)
      path_params = {
        "projectId" => project_id,
        "domainId" => domain_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/domains/${domainId}/verify",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param domain_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [nil]
    def delete_domain(project_id:, domain_id:)
      path_params = {
        "projectId" => project_id,
        "domainId" => domain_id,
      }

      transport.request(
        method: :delete,
        path: "/v1/projects/${projectId}/domains/${domainId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param domain_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [DomainResponse]
    def verify_bimi(project_id:, domain_id:)
      path_params = {
        "projectId" => project_id,
        "domainId" => domain_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/domains/${domainId}/bimi/verify",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param domain_id [String]
    # @param body [UpdateBimiRequest] request body
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [DomainResponse]
    def update_bimi(project_id:, domain_id:, body:)
      path_params = {
        "projectId" => project_id,
        "domainId" => domain_id,
      }

      transport.request(
        method: :patch,
        path: "/v1/projects/${projectId}/domains/${domainId}/bimi",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

  end
end
