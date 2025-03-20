require_relative 'endpoint_helper'

response = @client.donations
print_donations(response)
