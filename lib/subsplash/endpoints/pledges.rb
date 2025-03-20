module Subsplash
  module Endpoints
    module Pledges
      def pledges(params = {})
        get(
          "/donations/v1/pledges",
          params.deep_merge({ filter: { org_key: @org_key } })
        )
      end

      def pledge(id, params = {})
        get("/donations/v1/pledges/#{id}", params)
      end
    end
  end
end
