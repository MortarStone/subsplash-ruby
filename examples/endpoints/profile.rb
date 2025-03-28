# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.profile(
  '217fb512-d349-4ae5-853f-54da0ca9a3fc',
  include: 'address'
)
print_profile(response)
