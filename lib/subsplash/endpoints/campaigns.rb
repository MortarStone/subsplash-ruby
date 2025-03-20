module Subsplash
  module Endpoints
    module Campaigns
      def campaigns(params = {})
        get(
          "/donations/v1/campaigns",
          params.deep_merge({ filter: { org_key: @org_key } })
        )
      end

      def campaign(id, params = {})
        get("/donations/v1/campaigns/#{id}", params)
      end
    end
  end
end
