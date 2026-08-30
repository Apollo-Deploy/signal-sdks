# frozen_string_literal: true

require_relative "../transport"
require_relative "../errors"

module ApolloDeploySignalSdkRails
  # webhooks API domain
  class Webhooks
    attr_reader :transport

    def initialize(transport)
      @transport = transport
    end

    # @param project_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [WebhookPageResponse]
    def list_webhooks(project_id:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/webhooks",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param endpoint_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [WebhookResponse]
    def get_webhook(project_id:, endpoint_id:)
      path_params = {
        "projectId" => project_id,
        "endpointId" => endpoint_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/webhooks/${endpointId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param endpoint_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [WebhookDeliveryPageResponse]
    def list_webhook_deliveries(project_id:, endpoint_id:)
      path_params = {
        "projectId" => project_id,
        "endpointId" => endpoint_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param endpoint_id [String]
    # @param delivery_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [WebhookDeliveryResponse]
    def get_webhook_delivery(project_id:, endpoint_id:, delivery_id:)
      path_params = {
        "projectId" => project_id,
        "endpointId" => endpoint_id,
        "deliveryId" => delivery_id,
      }

      transport.request(
        method: :get,
        path: "/v1/projects/${projectId}/webhooks/${endpointId}/deliveries/${deliveryId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param body [CreateWebhookBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [WebhookCreateResponse]
    def create_webhook(project_id:, body:)
      path_params = {
        "projectId" => project_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/webhooks",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param endpoint_id [String]
    # @param body [UpdateWebhookBody] request body
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [WebhookResponse]
    def update_webhook(project_id:, endpoint_id:, body:)
      path_params = {
        "projectId" => project_id,
        "endpointId" => endpoint_id,
      }

      transport.request(
        method: :patch,
        path: "/v1/projects/${projectId}/webhooks/${endpointId}",
        path_params: path_params,
        body: body,
        content_type: "application/json",
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param endpoint_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def delete_webhook(project_id:, endpoint_id:)
      path_params = {
        "projectId" => project_id,
        "endpointId" => endpoint_id,
      }

      transport.request(
        method: :delete,
        path: "/v1/projects/${projectId}/webhooks/${endpointId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param endpoint_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [WebhookDeliveryResponse]
    def test_webhook(project_id:, endpoint_id:)
      path_params = {
        "projectId" => project_id,
        "endpointId" => endpoint_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/webhooks/${endpointId}/test",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

    # @param project_id [String]
    # @param endpoint_id [String]
    # @param delivery_id [String]
    # @raise [ApolloDeploySignalSdkRails::SDKError]
    # @return [nil]
    def replay_webhook_delivery(project_id:, endpoint_id:, delivery_id:)
      path_params = {
        "projectId" => project_id,
        "endpointId" => endpoint_id,
        "deliveryId" => delivery_id,
      }

      transport.request(
        method: :post,
        path: "/v1/projects/${projectId}/webhooks/${endpointId}/replay/${deliveryId}",
        path_params: path_params,
        timeout_ms: nil,
      )
    end

  end
end
