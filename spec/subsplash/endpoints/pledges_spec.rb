# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe Subsplash::Endpoints::Pledges, vcr: true do
  let(:client) { FactoryBot.build(:client) }

  context 'pledges' do
    before do
      @response = client.pledges
    end

    it 'should have basic information' do
      pledges = @response.body['_embedded']['pledges']
      expect(pledges.is_a?(Array)).to be_truthy
      expect(pledges.first.include?('id')).to be_truthy
    end
  end

  context 'pledge' do
    before do
      @response = client.pledge('31f5c6bc-1a96-4fca-bff0-c83eb0f82b3b')
    end

    it 'should have basic information' do
      pledge = @response.body
      expect(pledge.is_a?(Hash)).to be_truthy
      expect(pledge['id']).to eq('31f5c6bc-1a96-4fca-bff0-c83eb0f82b3b')
    end
  end
end
