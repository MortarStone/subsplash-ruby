require_relative 'endpoint_helper'

response = @client.funds
print_funds(response)
