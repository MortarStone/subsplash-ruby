# frozen_string_literal: true

FactoryBot.define do
  factory :client, class: Subsplash::Client do
    org_key { ENV.fetch('ORG_KEY', nil) }
    app_key { ENV.fetch('APP_KEY', nil) }
    access_token { ENV.fetch('ACCESS_TOKEN', nil) }

    initialize_with do
      new(
        org_key: org_key,
        app_key: app_key,
        access_token: access_token
      )
    end
  end

  factory :invalid_client, class: Subsplash::Client do
    org_key { 'Fake' }
    app_key { 'Fake' }
    access_token { 'Credentials' }

    initialize_with do
      new(
        org_key: org_key,
        app_key: app_key,
        access_token: access_token
      )
    end
  end
end
