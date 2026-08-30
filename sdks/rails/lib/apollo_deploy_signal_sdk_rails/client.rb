# frozen_string_literal: true

require_relative "transport"
require_relative "resources/emails"
require_relative "resources/metrics"
require_relative "resources/suppressions"
require_relative "resources/segments"
require_relative "resources/topics"
require_relative "resources/contact-properties"
require_relative "resources/contacts"
require_relative "resources/webhooks"
require_relative "resources/api-keys"
require_relative "resources/projects"
require_relative "resources/sending-domains"

module ApolloDeploySignalSdkRails
  # Configuration for the Apollo Signal API SDK client.
  class Config
    # @return [String] the base URL for API requests
    attr_accessor :base_url
    # @return [Integer] request timeout in seconds
    attr_accessor :timeout
    # @return [Hash] retry configuration
    attr_accessor :retries
    # @return [Hash] default headers sent with every request
    attr_accessor :default_headers
    # @return [Boolean] whether POST/PATCH requests may be retried without an idempotency key
    attr_accessor :retry_unsafe_requests

    # @param base_url [String] the base URL for API requests
    # @param timeout [Integer] request timeout in seconds (default: 15)
    # @param retries [Hash] retry configuration
    # @param default_headers [Hash] headers sent with every request
    def initialize(
      base_url: "https://api.signal.apollodeploy.com",
      timeout: 15,
      retries: { attempts: 3, backoff: 0.4, jitter: true, max_backoff: 30.0 },
      default_headers: {},
      retry_unsafe_requests: false,
      **_
    )
      @base_url = base_url
      @timeout = timeout
      @retries = retries
      @default_headers = default_headers
      @retry_unsafe_requests = retry_unsafe_requests
    end
  end

  # Main client for the Apollo Signal API API.
  #
  # Provides access to all API domains as instance methods.
  class Client
    # @return [ApolloDeploySignalSdkRails::Emails]
    attr_reader :emails
    # @return [ApolloDeploySignalSdkRails::Metrics]
    attr_reader :metrics
    # @return [ApolloDeploySignalSdkRails::Suppressions]
    attr_reader :suppressions
    # @return [ApolloDeploySignalSdkRails::Segments]
    attr_reader :segments
    # @return [ApolloDeploySignalSdkRails::Topics]
    attr_reader :topics
    # @return [ApolloDeploySignalSdkRails::ContactProperties]
    attr_reader :contactProperties
    # @return [ApolloDeploySignalSdkRails::Contacts]
    attr_reader :contacts
    # @return [ApolloDeploySignalSdkRails::Webhooks]
    attr_reader :webhooks
    # @return [ApolloDeploySignalSdkRails::ApiKeys]
    attr_reader :apiKeys
    # @return [ApolloDeploySignalSdkRails::Projects]
    attr_reader :projects
    # @return [ApolloDeploySignalSdkRails::SendingDomains]
    attr_reader :sendingDomains

    # @return [ApolloDeploySignalSdkRails::Config] the client configuration
    attr_reader :config

    # @return [ApolloDeploySignalSdkRails::Transport] the underlying HTTP transport
    attr_reader :transport

    # Create a new API client.
    #
    # @param config [ApolloDeploySignalSdkRails::Config, Hash, nil]
    #   Either a Config instance or keyword arguments matching Config#initialize.
    def initialize(config = nil)
      @config = if config.is_a?(Config)
                  config
                elsif config.is_a?(Hash)
                  Config.new(**config)
                else
                  Config.new
                end

      @transport = Transport.new(@config)

      @emails = ApolloDeploySignalSdkRails::Emails.new(@transport)
      @metrics = ApolloDeploySignalSdkRails::Metrics.new(@transport)
      @suppressions = ApolloDeploySignalSdkRails::Suppressions.new(@transport)
      @segments = ApolloDeploySignalSdkRails::Segments.new(@transport)
      @topics = ApolloDeploySignalSdkRails::Topics.new(@transport)
      @contactProperties = ApolloDeploySignalSdkRails::ContactProperties.new(@transport)
      @contacts = ApolloDeploySignalSdkRails::Contacts.new(@transport)
      @webhooks = ApolloDeploySignalSdkRails::Webhooks.new(@transport)
      @apiKeys = ApolloDeploySignalSdkRails::ApiKeys.new(@transport)
      @projects = ApolloDeploySignalSdkRails::Projects.new(@transport)
      @sendingDomains = ApolloDeploySignalSdkRails::SendingDomains.new(@transport)
    end
  end
end
