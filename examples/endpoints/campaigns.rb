# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.campaigns
print_campaigns(response)
