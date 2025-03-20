require_relative 'endpoint_helper'

response = @client.profiles
print_profiles(response)
