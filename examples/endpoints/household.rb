require_relative 'endpoint_helper'

response = @client.household('1a514dbf-d708-406a-a337-9ad09d893d7b')
print_household(response)
