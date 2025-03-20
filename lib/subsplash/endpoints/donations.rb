module Subsplash
  module Endpoints
    module Donations
      def donations(params = {})
        get(
          "/donations/v1/donations",
          params.deep_merge({ filter: { org_key: @org_key } })
        )
      end

      def donation(id, params = {})
        get("/donations/v1/donations/#{id}", params)
      end
    end
  end
end
