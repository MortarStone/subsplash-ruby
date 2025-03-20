require_relative 'endpoint_helper'

response = @client.profile('aeae49a0-53df-4af9-b467-e9e3e8e84469')
print_profile(response)
