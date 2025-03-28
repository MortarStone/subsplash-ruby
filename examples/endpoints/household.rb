# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.household(
  '691a4752-a9b4-44d6-ab45-ac0774b227bb',
  include: 'address'
)
print_household(response)
