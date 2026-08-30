# frozen_string_literal: true

require_relative "lib/apollo_deploy_signal_sdk/version"

Gem::Specification.new do |spec|
  spec.name          = "apollo-deploy-signal-sdk"
  spec.version       = ApolloDeploySignalSdk::VERSION
  spec.authors       = ["Apollo Deploy"]

  spec.summary       = "Ruby SDK for Apollo Signal API"
  spec.description   = "A Ruby client library for the Apollo Signal API."
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/Apollo-Deploy/signal-sdks"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Apollo-Deploy/signal-sdks"
  spec.metadata["bug_tracker_uri"] = "https://github.com/Apollo-Deploy/signal-sdks/issues"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.files = Dir.glob("lib/**/*.rb") + Dir.glob("docs/**/*.md") + %w[README.md LICENSE Gemfile]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.0"
end
