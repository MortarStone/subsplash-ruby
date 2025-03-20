module Subsplash
  module Endpoints
    module Households
      def households(params = {})
        get(
          "/people/v1/households",
          params.deep_merge({ filter: { org_key: @org_key } })
        )
      end

      def household(id, params = {})
        get("/people/v1/households/#{id}", params)
      end
    end
  end
end
