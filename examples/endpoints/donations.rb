# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.donations(
  filter: {
    hidden: 'true,false',
    # auth_date: '>2025-01-17T00:00:00Z'
    'auth_date.min': '2025-01-17T00:00:00Z',
    'auth_date.max': '2025-01-18T00:00:00Z'
  },
  sort: 'auth_date'
)
print_donations(response)
