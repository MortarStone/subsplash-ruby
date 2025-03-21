# frozen_string_literal: true

require_relative 'endpoint_helper'

response = @client.campaign('7b0faac4-3b12-4889-af9a-491feaaf3ef2')
print_campaign(response)
