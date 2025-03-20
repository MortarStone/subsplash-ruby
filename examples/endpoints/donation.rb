require_relative 'endpoint_helper'

response = @client.donation('8b84f2ce-11ef-4c1b-ab67-7a76687b5945')
print_donation(response)
