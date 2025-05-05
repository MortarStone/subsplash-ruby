# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.fund('9571d3ae-8860-4b6b-a101-43e00e1cf358')
print_fund(response)
