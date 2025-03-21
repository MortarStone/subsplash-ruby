# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

SimpleCov.at_exit do
  SimpleCov.minimum_coverage 98
end

require 'rubygems'
require 'vcr'
require 'pry'
require 'factory_bot'
require 'dotenv/load'

require File.expand_path("#{File.dirname(__FILE__)}/../lib/subsplash.rb")

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :faraday
  c.default_cassette_options = { record: :once, match_requests_on: [:method] }
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = 'random'
end
