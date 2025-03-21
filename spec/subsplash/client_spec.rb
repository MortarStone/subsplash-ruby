# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Subsplash::Client, vcr: true do
  describe 'with valid credentials' do
    it 'with valid org_key and access_token' do
      client = FactoryBot.build(:client)
      expect(client).to be_a(Subsplash::Client)
      expect { client.funds }.not_to raise_error
    end
  end

  describe 'with invalid credentials' do
    it 'with invalid org_key raises an error' do
      client = FactoryBot.build(:client, org_key: 'TEST')
      expect { client.funds }.to raise_error Subsplash::Exceptions::BadRequestError
    end

    it 'with invalid access_token raises an error' do
      client = FactoryBot.build(:client,
                                access_token: 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImRjM2YyYWRlLTBkYmUtNDczMi1iYzJlLTc5ZTUxMmY4YzNmNCIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NDI1MDE4ODMsImlhdCI6MTc0MjQ5MTA3OCwiaXNzIjoiaHR0cHM6Ly9jb3JlLnN1YnNwbGFzaC5jb20vdG9rZW5zIiwic3ViIjoiMWQyOTAwZTQtNjMzZS00Njc4LWFiZjctMzlmMDkyNDA4YTU5IiwiYXBwcyI6eyJNT1JUQVIiOnsicm9sZXMiOlsiN2Q0MjM1YWMtMzM2MC00YjE5LTkwOWQtZDNkMTkwYjMwY2IzIl19fSwib3JncyI6eyJLNVJaVzlGUyI6eyJyb2xlcyI6WyI3ZDQyMzVhYy0zMzYwLTRiMTktOTA5ZC1kM2QxOTBiMzBjYjMiXX19LCJyYXRlIjp7ImludCI6NjAsImxpbSI6MTAwMDAwMCwiYnVyIjoxNTAwMDAwfX0.iT4fqTebZDgdoLmcjQaOOQU98BJ5x15DZScJx622WfCLLOK-8Mb6agP7UHq8V3nYqaQ7voOwrHaM8BPQ7gDYwEfsoo-fL_DDjBwjG7kGTHRQE2WYpC0PKwZ48pLKnByv3xq2_YJGRFqgT1RJUQPg5cYS6EKCU5mDOhj5hEYuYT-Q61LUsfnMSpHLSK6xOzq_Aoidl-itkFWNE78-fK4h05W8GqdHMzKDXAmxQoYhztMHMd7f6i9BnkMDpecSpisSV3IUNjXwH2j15tYhMegwleu7Nbg0hnAt7TiYWFieJMs8LVyVS0VN9y9KiM37-n_5RoAkK8OHnfBnWpYcVGSgdQ')
      expect { client.funds }.to raise_error Subsplash::Exceptions::UnauthorizedError
    end
  end
end
