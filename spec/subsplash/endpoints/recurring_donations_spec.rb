# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe Subsplash::Endpoints::RecurringDonations, vcr: true do
  let(:client) { FactoryBot.build(:client) }

  context 'recurring_donations' do
    before do
      @response = client.recurring_donations
    end

    it 'should have basic information' do
      recurring_donations = @response.body['_embedded']['recurring-donations']
      expect(recurring_donations.is_a?(Array)).to be_truthy
    end
  end

  # context 'recurring_donation' do
  #   before do
  #     @response = client.recurring_donation('aeae49a0-53df-4af9-b467-e9e3e8e84469')
  #   end

  #   it 'should have basic information' do
  #     recurring_donation = @response.body
  #     expect(recurring_donation.is_a?(Hash)).to be_truthy
  #     expect(recurring_donation['id']).to eq('aeae49a0-53df-4af9-b467-e9e3e8e84469')
  #   end
  # end
end
