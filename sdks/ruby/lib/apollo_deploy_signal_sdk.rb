# frozen_string_literal: true

require_relative "apollo_deploy_signal_sdk/version"
require_relative "apollo_deploy_signal_sdk/errors"
require_relative "apollo_deploy_signal_sdk/transport"
require_relative "apollo_deploy_signal_sdk/types"
require_relative "apollo_deploy_signal_sdk/client"
require_relative "apollo_deploy_signal_sdk/resources/emails"
require_relative "apollo_deploy_signal_sdk/resources/metrics"
require_relative "apollo_deploy_signal_sdk/resources/suppressions"
require_relative "apollo_deploy_signal_sdk/resources/segments"
require_relative "apollo_deploy_signal_sdk/resources/topics"
require_relative "apollo_deploy_signal_sdk/resources/contact-properties"
require_relative "apollo_deploy_signal_sdk/resources/contacts"
require_relative "apollo_deploy_signal_sdk/resources/webhooks"
require_relative "apollo_deploy_signal_sdk/resources/api-keys"
require_relative "apollo_deploy_signal_sdk/resources/projects"
require_relative "apollo_deploy_signal_sdk/resources/sending-domains"

module ApolloDeploySignalSdk
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
  # @return [ApolloDeploySignalSdk::Client]
  def self.create_client(
    base_url: "https://api.signal.apollodeploy.com",
    timeout: 15,
    retries: { attempts: 3, backoff: 0.4, jitter: true, max_backoff: 30.0 },
    sse_client: nil,
    **extra
  )
    ApolloDeploySignalSdk::Client.new(
      base_url: base_url,
      timeout: timeout,
      retries: retries,
      sse_client: sse_client,
      **extra
    )
  end
end
