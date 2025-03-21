# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.pledge('31f5c6bc-1a96-4fca-bff0-c83eb0f82b3b')
print_pledge(response)
