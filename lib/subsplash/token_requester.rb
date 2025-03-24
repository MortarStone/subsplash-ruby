# frozen_string_literal: true

# Simply requests a new token.

require 'faraday'
require 'json'

module Subsplash
  class TokenRequester
    attr_accessor :client_id, :client_secret

    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end

    def new_token
      response.body
    end

    private

    def request_body
      {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: 'client_credentials'
      }
    end

    def token_endpoint
      'https://core.subsplash.com/tokens/v1/token'
    end

    def http_response
      Faraday.post(token_endpoint, request_body)
    end

    def response
      ResponseHandler.new(http_response).call
    end
  end
end
