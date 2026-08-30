# frozen_string_literal: true

module ApolloDeploySignalSdkRails
  class << self
    # Mutable application-level defaults. Rails applications may configure
    # these values in environment configuration or an initializer.
    def configuration
      @configuration ||= Config.new
    end

    def configure
      yield(configuration)
    end

    # Resolve a fresh client so long-lived processes observe current settings.
    def rails_client
      Client.new(configuration)
    end
  end
end
