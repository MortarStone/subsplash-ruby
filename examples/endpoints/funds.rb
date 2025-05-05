# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.funds(
  page: { size: 100, number: 1 },
  include: 'unpublished-funds,unpublished-campuses'
)
print_funds(response)
