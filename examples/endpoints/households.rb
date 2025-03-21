# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.households
print_households(response)
