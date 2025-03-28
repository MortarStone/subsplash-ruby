# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.campaigns(include: 'funds')
print_campaigns(response)
