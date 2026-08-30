# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdkRails
  # contacts API domain
  class Contacts
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ContactPageResponse]
    def list_contacts(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/contacts",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ContactResponse]
    def get_contact(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/contacts/${contactId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ListContactSegmentsResponse]
    def list_contact_segments(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/contacts/${contactId}/segments",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [GetContactTopicsResponse]
    def get_contact_topics(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/contacts/${contactId}/topics",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param body [CreateContactBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ContactResponse]
    def create_contact(project_id:, body:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/contacts",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @param body [UpdateContactBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ContactResponse]
    def update_contact(project_id:, contact_id:, body:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :patch,
        path: "/v1/projects/${projectId}/contacts/${contactId}",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def delete_contact(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :delete,
        path: "/v1/projects/${projectId}/contacts/${contactId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ContactResponse]
    def upload_contact_image(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/contacts/${contactId}/image",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @param body [SetImageUrlBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ContactResponse]
    def set_contact_image_url(project_id:, contact_id:, body:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :put,
        path: "/v1/projects/${projectId}/contacts/${contactId}/image",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def delete_contact_image(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :delete,
        path: "/v1/projects/${projectId}/contacts/${contactId}/image",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @param body [AddToSegmentBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def add_contact_to_segment(project_id:, contact_id:, body:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/contacts/${contactId}/segments",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @param segment_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def remove_contact_from_segment(project_id:, contact_id:, segment_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
        "segmentId" => segment_id,
      }

      transport.request(
        method: :delete,
        path: "/v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @param body [UpdateTopicsBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def update_contact_topics(project_id:, contact_id:, body:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :patch,
        path: "/v1/projects/${projectId}/contacts/${contactId}/topics",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [GetContactActivityResponse]
    def get_contact_activity(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/contacts/${contactId}/activity",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [EngagementScoreResponse]
    def get_contact_engagement_score(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/contacts/${contactId}/engagement",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [EmailValidationStatusResponse]
    def get_contact_email_validation_status(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/contacts/${contactId}/email-validation",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [EngagementScoreResponse]
    def refresh_contact_engagement_score(project_id:, contact_id:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/contacts/${contactId}/engagement/refresh",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param contact_id [String]
    # @param body [RecordValidationBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def record_contact_email_validation(project_id:, contact_id:, body:)
      path_params = {
        "projectId" => project_id,
        "contactId" => contact_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/contacts/${contactId}/email-validation",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

  end
end
