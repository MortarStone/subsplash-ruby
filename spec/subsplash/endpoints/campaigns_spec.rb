# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe Subsplash::Endpoints::Campaigns, vcr: true do
  let(:client) { FactoryBot.build(:client) }

  context 'campaigns' do
    before do
      @response = client.campaigns
    end

    it 'should have basic information' do
      campaigns = @response.body['_embedded']['campaigns']
      expect(campaigns.is_a?(Array)).to be_truthy
      expect(campaigns.first.include?('id')).to be_truthy
    end
  end

  context 'campaign' do
    before do
      @response = client.campaign('7b0faac4-3b12-4889-af9a-491feaaf3ef2')
    end

    it 'should have basic information' do
      campaign = @response.body
      expect(campaign.is_a?(Hash)).to be_truthy
      expect(campaign['id']).to eq('7b0faac4-3b12-4889-af9a-491feaaf3ef2')
    end
  end
end
