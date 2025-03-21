# frozen_string_literal: true

require 'faraday'
require 'json'

module Subsplash
  class AccessToken
    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
      request_new_token
      @expiry = Time.now + 10_800 # expires in 3 hours
    end

    def token
      request_new_token if expired?
      @token
    end

    def expired?
      Time.now > @expiry
    end

    private

    def request_body
      {
        client_id: @client_id,
        client_secret: @client_secret,
        grant_type: 'client_credentials'
      }
    end

    def token_endpoint
      'https://core.subsplash.com/tokens/v1/token'
    end

    def request_new_token
      http_response = Faraday.post(token_endpoint, request_body)
      response = ResponseHandler.new(http_response).call

      @token = response.body['access_token']
    end
  end
end
