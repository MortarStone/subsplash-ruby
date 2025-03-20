module Subsplash
  module Endpoints
    module RecurringDonations
      def recurring_donations(params = {})
        get(
          "/donations/v1/recurring-donations",
          params.deep_merge({ filter: { org_key: @org_key } })
        )
      end

      def recurring_donation(id, params = {})
        get("/donations/v1/recurring-donations/#{id}", params)
      end
    end
  end
end
