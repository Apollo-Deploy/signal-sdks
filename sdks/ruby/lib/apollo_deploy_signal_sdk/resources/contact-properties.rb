# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdk
  # contactProperties API domain
  class ContactProperties
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [ContactPropertyPageResponse]
    def list_contact_properties(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/contact-properties",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param property_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [ContactPropertyResponse]
    def get_contact_property(project_id:, property_id:)
      path_params = {
        "projectId" => project_id,
        "propertyId" => property_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/contact-properties/${propertyId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param body [CreateContactPropertyBody] request body
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [ContactPropertyResponse]
    def create_contact_property(project_id:, body:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/contact-properties",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param property_id [String]
    # @param body [UpdateContactPropertyBody] request body
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [ContactPropertyResponse]
    def update_contact_property(project_id:, property_id:, body:)
      path_params = {
        "projectId" => project_id,
        "propertyId" => property_id,
      }

      transport.request(
        method: :patch,
        path: "/v1/projects/${projectId}/contact-properties/${propertyId}",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param property_id [String]
    # @raise [ApolloDeploySignalSdk::SDKError]
    # @return [nil]
    def delete_contact_property(project_id:, property_id:)
      path_params = {
        "projectId" => project_id,
        "propertyId" => property_id,
      }

      transport.request(
        method: :delete,
        path: "/v1/projects/${projectId}/contact-properties/${propertyId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

  end
end
