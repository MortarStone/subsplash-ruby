# frozen_string_literal: true

module Subsplash
  module Endpoints
    module Profiles
      def profiles(params = {})
        get(
          '/people/v1/profiles',
          params.deep_merge({ filter: { org_key: @org_key } })
        )
      end

      def profile(id, params = {})
        get("/people/v1/profiles/#{id}", params)
      end
    end
  end
end
