# frozen_string_literal: true

module Subsplash
  module Endpoints
    module Funds
      def funds(params = {})
        # only the terminal endpoint returns sub-funds
        get(
          '/donations/v1/terminals',
          params.deep_merge({ filter: { short_code: @app_key } })
        )
      end

      def fund(id, params = {})
        # Cannot request a sub-fund - you'll only get a 403 error.
        # Cannot use terminals endpoint (above) to retrieve funds and/or their sub-funds.
        get("/donations/v1/funds/#{id}", params)
      end
    end
  end
end
