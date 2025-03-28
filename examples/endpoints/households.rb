# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.households(
  filter: { status: 'active,archived' },
  include: 'address'
)
print_households(response)
