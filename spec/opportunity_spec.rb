require 'spec_helper'

describe Opportunity do

  it 'has a version number' do
    expect(Opportunity::VERSION).not_to be nil
  end

  describe '#auth_token=' do
    it 'unsets client' do
      Opportunity.auth_token = 1
      expect(Opportunity.client).to_not eq(nil)

      Opportunity.auth_token = 2
      expect(Opportunity.instance_variable_get("@client")).to eq(nil)
    end
  end

  describe '#api_base' do
    context 'when production isn\'t set' do
      it 'equals STAGING_OPPORTUNITY_URL' do
        expect(Opportunity.api_base).to eq(Opportunity::STAGING_OPPORTUNITY_URL)
      end
    end

    context 'when production doesn\'t evaluate to true' do
      let(:untrue_values) { [nil, false] }

      it 'equals STAGING_OPPORTUNITY_URL' do
        untrue_values.each do |uv|
          Opportunity.production = uv
          expect(Opportunity.api_base).to eq(Opportunity::STAGING_OPPORTUNITY_URL)
        end
      end
    end

    context 'when production evaluates to true' do
      let(:true_values) { [1, true, 'yay'] }

      it 'equals PRODUCTION_OPPORTUNITY_URL' do
        true_values.each do |tv|
          Opportunity.production = tv
          expect(Opportunity.api_base).to eq(Opportunity::PRODUCTION_OPPORTUNITY_URL)
        end
      end
    end
  end
end
