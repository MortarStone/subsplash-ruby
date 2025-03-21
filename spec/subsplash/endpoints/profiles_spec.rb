# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe Subsplash::Endpoints::Profiles, vcr: true do
  let(:client) { FactoryBot.build(:client) }

  context 'profiles' do
    before do
      @response = client.profiles
    end

    it 'should have basic information' do
      profiles = @response.body['_embedded']['profiles']
      expect(profiles.is_a?(Array)).to be_truthy
      expect(profiles.first.include?('id')).to be_truthy
    end
  end

  context 'profile' do
    before do
      @response = client.profile('aeae49a0-53df-4af9-b467-e9e3e8e84469')
    end

    it 'should have basic information' do
      profile = @response.body
      expect(profile.is_a?(Hash)).to be_truthy
      expect(profile['id']).to eq('aeae49a0-53df-4af9-b467-e9e3e8e84469')
    end
  end
end
