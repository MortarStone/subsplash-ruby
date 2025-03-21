# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe Subsplash::Endpoints::Households, vcr: true do
  let(:client) { FactoryBot.build(:client) }

  context 'households' do
    before do
      @response = client.households
    end

    it 'should have basic information' do
      households = @response.body['_embedded']['households']
      expect(households.is_a?(Array)).to be_truthy
      expect(households.first.include?('id')).to be_truthy
    end
  end

  context 'household' do
    before do
      @response = client.household('1a514dbf-d708-406a-a337-9ad09d893d7b')
    end

    it 'should have basic information' do
      household = @response.body
      expect(household.is_a?(Hash)).to be_truthy
      expect(household['id']).to eq('1a514dbf-d708-406a-a337-9ad09d893d7b')
    end
  end
end
