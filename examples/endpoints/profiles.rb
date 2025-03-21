# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.profiles
print_profiles(response)
