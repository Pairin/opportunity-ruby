require 'spec_helper'

describe Opportunity do

  it 'has a version number' do
    expect(Opportunity::VERSION).not_to be nil
  end

  describe 'auth_token=' do
    it 'unsets client' do
      Opportunity.auth_token = 1
      expect(Opportunity.client).to_not eq(nil)

      Opportunity.auth_token = 2
      expect(Opportunity.instance_variable_get("@client")).to eq(nil)
    end

  end
end
