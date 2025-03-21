# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe Subsplash::Endpoints::Donations, vcr: true do
  let(:client) { FactoryBot.build(:client) }

  context 'donations' do
    before do
      @response = client.donations
    end

    it 'should have basic information' do
      donations = @response.body['_embedded']['donations']
      expect(donations.is_a?(Array)).to be_truthy
      expect(donations.first.include?('id')).to be_truthy
    end
  end

  context 'donation' do
    before do
      @response = client.donation('8b84f2ce-11ef-4c1b-ab67-7a76687b5945')
    end

    it 'should have basic information' do
      donation = @response.body
      expect(donation.is_a?(Hash)).to be_truthy
      expect(donation['id']).to eq('8b84f2ce-11ef-4c1b-ab67-7a76687b5945')
    end
  end
end
