# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.donations(
  filter: {
    hidden: 'true,false',
    # auth_date: '>2025-01-17T00:00:00Z'
    'auth_date.min': '2025-03-17T00:00:00Z',
    'auth_date.max': '2025-04-18T00:00:00Z',
    refunded: false
    # refunded: 'true,false'
  },
  sort: 'auth_date',
  include: 'profile,recurring',
  page: {
    size: 100
  }
)
print_donations(response)
