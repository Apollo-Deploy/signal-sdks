# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdkRails
  # emails API domain
  class Emails
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param body [SendEmailRequest] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [SendEmailResponse]
    def send_email(body:)

      transport.request(
        method: :post,
        path: "/v1/emails",
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param email_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [EmailDetailResponse]
    def get_email(email_id:)
      path_params = {
        "emailId" => email_id,
      }

      transport.request(
        method: :get,
        path: "/v1/emails/${emailId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param body [BatchSendRequest] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [BatchSendResponse]
    def batch_send_emails(body:)

      transport.request(
        method: :post,
        path: "/v1/emails/batch",
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param email_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [CancelResponse]
    def cancel_email(email_id:)
      path_params = {
        "emailId" => email_id,
      }

      transport.request(
        method: :delete,
        path: "/v1/emails/${emailId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [BulkCancelResponse]
    def bulk_cancel_emails()

      transport.request(
        method: :delete,
        path: "/v1/emails",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [StreamTokenResponse]
    def issue_stream_token(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :post,
        path: "/v1/emails/${projectId}/stream/token",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [Enumerator<SSEEvent>]
    def stream_email_events()

      transport.stream(
        method: :get,
        path: "/v1/emails/stream",
        timeout_ms: nil,
      )
    end

    # @param body [ValidateLinksRequest] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [ValidateLinksResponse]
    def validate_links(body:)

      transport.request(
        method: :post,
        path: "/v1/emails/validate",
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

  end
end
