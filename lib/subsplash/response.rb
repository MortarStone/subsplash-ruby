# frozen_string_literal: true

module Subsplash
  class Response
    include ActiveModel::Attributes
    include ActiveModel::Model

    attr_accessor :code, :headers, :body, :success, :failure,
                  :status, :reason

    def self.from_http_response(http_response)
      obj = new(
        code: http_response.status,
        # need a hash object rather than Faraday::Utils::Header
        headers: http_response.headers.to_h,
        body: parse_body(http_response.body),
        reason: http_response.reason_phrase,
        success: http_response.success?,
        failure: !http_response.success?,
        status: determine_status(http_response)
      )
      obj.parse_error_details
      obj
    end

    def self.parse_body(response_body)
      return if response_body.empty?

      begin
        JSON.parse(response_body)
      rescue StandardError
        response_body
      end
    end

    def self.determine_status(http_response)
      http_response.success? ? :success : :failure
    end

    def error_message
      "#{code} #{reason}"
    end

    def parse_error_details
      return unless body.key?('errors')

      @reason = (reason.blank? ? '' : ': ') + error_list.join('; ')
    end

    def error_list
      body['errors'].each_with_object([]) do |err, arr|
        arr << "#{err['code']} (#{err['detail']})"
      end
    end
  end
end
