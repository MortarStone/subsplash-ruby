# frozen_string_literal: true

require_relative '../../spec_helper'

RSpec.describe Subsplash::Endpoints::Funds, vcr: true do
  let(:client) { FactoryBot.build(:client) }

  context 'funds' do
    before do
      @response = client.funds
    end

    it 'should have basic information' do
      funds = @response.body['_embedded']['funds']
      expect(funds.is_a?(Array)).to be_truthy
      expect(funds.first.include?('id')).to be_truthy
    end
  end

  context 'fund' do
    before do
      @response = client.fund('3de245a4-a292-45be-b5fe-33d0e348d4fd')
    end

    it 'should have basic information' do
      fund = @response.body
      expect(fund.is_a?(Hash)).to be_truthy
      expect(fund['id']).to eq('3de245a4-a292-45be-b5fe-33d0e348d4fd')
    end
  end
end
