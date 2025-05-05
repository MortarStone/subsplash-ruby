# frozen_string_literal: true

require "#{File.dirname(__FILE__)}/auto_load"

module Subsplash
  class Client
    include Subsplash::Endpoints::Campaigns
    include Subsplash::Endpoints::Donations
    include Subsplash::Endpoints::Funds
    include Subsplash::Endpoints::Households
    include Subsplash::Endpoints::Pledges
    include Subsplash::Endpoints::Profiles
    include Subsplash::Endpoints::RecurringDonations

    attr_accessor :access_token, :org_key, :app_key

    def initialize(access_token:, org_key:, app_key:)
      @access_token = access_token
      @org_key = org_key
      @app_key = app_key
    end

    def url
      'https://core.subsplash.com'
    end

    def get(path, params = {})
      request(method: :get, path: path, params: params)
    end

    def request(path:, method: :get, params: {}, body: nil)
      http_response = connection.public_send(method) do |req|
        req.url path
        req.params = params
        req.body = body
        req.options.timeout = 60 # 1 minute
      end
      # puts "#{method.upcase} #{http_response.env.url} #{params.inspect} #{body.inspect}"
      # p http_response

      ResponseHandler.new(http_response).call
    end

    private

    def connection
      @connection ||= Faraday.new(url, request: { timeout: 300_000 }) do |conn|
        conn.request :authorization, 'Bearer', access_token
      end
    end
  end
end
