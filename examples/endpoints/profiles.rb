# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.profiles(
  # filter: { first_name: 'Christine', last_name: 'Adams' },
  include: 'address'
)
print_profiles(response)
