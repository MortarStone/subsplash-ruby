require_relative 'endpoint_helper'

response = @client.recurring_donations
print_recurring_donations(response)
