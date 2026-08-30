# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdkRails
  # segments API domain
  class Segments
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [SegmentPageResponse]
    def list_segments(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/segments",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param segment_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [SegmentResponse]
    def get_segment(project_id:, segment_id:)
      path_params = {
        "projectId" => project_id,
        "segmentId" => segment_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/segments/${segmentId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param segment_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [CursorPage]
    def list_contacts_in_segment(project_id:, segment_id:)
      path_params = {
        "projectId" => project_id,
        "segmentId" => segment_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/segments/${segmentId}/contacts",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param body [CreateSegmentBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [SegmentResponse]
    def create_segment(project_id:, body:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/segments",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param segment_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def delete_segment(project_id:, segment_id:)
      path_params = {
        "projectId" => project_id,
        "segmentId" => segment_id,
      }

      transport.request(
        method: :delete,
        path: "/v1/projects/${projectId}/segments/${segmentId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

  end
end
