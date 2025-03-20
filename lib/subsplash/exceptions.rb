# frozen_string_literal: true

module Subsplash
  module Exceptions
    class SStandardError < StandardError
      attr_reader :response

      def initialize(response)
        super
        @response = response
      end
    end

    class BadRequestError < SStandardError
    end

    class UnauthorizedError < SStandardError
    end

    class ForbiddenError < SStandardError
    end

    class NotFoundError < SStandardError
    end

    class ConnectionError < SStandardError
    end

    class ResponseError < SStandardError
    end

    class InvalidInputError < SStandardError
    end

    class TimeoutError < SStandardError
    end
  end
end
