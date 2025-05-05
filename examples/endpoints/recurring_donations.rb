# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.recurring_donations(
  filter: {
    status: 'active,canceled,failed'
  },
  include: 'profile'
)
print_recurring_donations(response)
