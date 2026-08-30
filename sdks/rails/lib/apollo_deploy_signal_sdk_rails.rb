# frozen_string_literal: true

require_relative "apollo_deploy_signal_sdk_rails/version"
require_relative "apollo_deploy_signal_sdk_rails/errors"
require_relative "apollo_deploy_signal_sdk_rails/transport"
require_relative "apollo_deploy_signal_sdk_rails/types"
require_relative "apollo_deploy_signal_sdk_rails/client"
require_relative "apollo_deploy_signal_sdk_rails/configuration"
require_relative "apollo_deploy_signal_sdk_rails/railtie" if defined?(Rails::Railtie)
require_relative "apollo_deploy_signal_sdk_rails/resources/emails"
require_relative "apollo_deploy_signal_sdk_rails/resources/metrics"
require_relative "apollo_deploy_signal_sdk_rails/resources/suppressions"
require_relative "apollo_deploy_signal_sdk_rails/resources/segments"
require_relative "apollo_deploy_signal_sdk_rails/resources/topics"
require_relative "apollo_deploy_signal_sdk_rails/resources/contact-properties"
require_relative "apollo_deploy_signal_sdk_rails/resources/contacts"
require_relative "apollo_deploy_signal_sdk_rails/resources/webhooks"
require_relative "apollo_deploy_signal_sdk_rails/resources/api-keys"
require_relative "apollo_deploy_signal_sdk_rails/resources/projects"
require_relative "apollo_deploy_signal_sdk_rails/resources/sending-domains"

module ApolloDeploySignalSdkRails
  # Factory method to create a new client instance.
  #
  # @param base_url [String] the base URL for the API
  # @param timeout [Integer] request timeout in seconds (default: 15)
  # @param retries [Hash] retry configuration
  # @option retries [Integer] :attempts (3)
  # @option retries [Float] :backoff (0.4)
  # @option retries [Boolean] :jitter (true)
  # @option retries [Float] :max_backoff (30.0)
  # @param sse_client [Object, nil] optional SSE client implementation
  # @return [ApolloDeploySignalSdkRails::Client]
  def self.create_client(
    base_url: "https://signal.apollodeploy.com",
    timeout: 15,
    retries: { attempts: 3, backoff: 0.4, jitter: true, max_backoff: 30.0 },
    sse_client: nil,
    **extra
  )
    ApolloDeploySignalSdkRails::Client.new(
      base_url: base_url,
      timeout: timeout,
      retries: retries,
      sse_client: sse_client,
      **extra
    )
  end
end
