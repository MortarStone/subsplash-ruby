# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.pledges
print_pledges(response)
