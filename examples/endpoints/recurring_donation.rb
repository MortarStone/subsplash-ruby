# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.recurring_donation(
  'f93b7057-0f78-44d4-917a-9898cd337dac'
)
print_recurring_donation(response)
