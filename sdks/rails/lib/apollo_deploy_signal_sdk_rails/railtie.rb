# frozen_string_literal: true

require "rails/railtie"
require "active_support/ordered_options"

module ApolloDeploySignalSdkRails
  class Railtie < Rails::Railtie
    config.apollo_deploy_signal_sdk_rails = ActiveSupport::OrderedOptions.new

    initializer "apollo-deploy-signal-sdk-rails.configure", after: :load_config_initializers do |app|
      rails_config = app.config.apollo_deploy_signal_sdk_rails
      ApolloDeploySignalSdkRails.configure do |sdk_config|
        value = rails_config.base_url
        sdk_config.public_send("base_url=", value) unless value.nil?
        value = rails_config.timeout
        sdk_config.public_send("timeout=", value) unless value.nil?
        value = rails_config.retries
        sdk_config.public_send("retries=", value) unless value.nil?
        value = rails_config.default_headers
        sdk_config.public_send("default_headers=", value) unless value.nil?
        value = rails_config.retry_unsafe_requests
        sdk_config.public_send("retry_unsafe_requests=", value) unless value.nil?
      end
    end
  end
end
