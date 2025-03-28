# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.pledges(
  include: 'profiles,campaigns'
)
print_pledges(response)
