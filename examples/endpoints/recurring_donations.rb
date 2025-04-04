# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.recurring_donations(
  filter: {
    status: 'active,canceled,failed'
  },
  include: 'profiles'
)
print_recurring_donations(response)
