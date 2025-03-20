module Subsplash
  module Endpoints
    module Funds
      def funds(params = {})
        get(
          "/donations/v1/funds",
          params.deep_merge({ filter: { org_key: @org_key } })
        )
      end

      def fund(id, params = {})
        get("/donations/v1/funds/#{id}", params)
      end
    end
  end
end
