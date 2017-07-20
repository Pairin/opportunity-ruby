require 'spec_helper'
require_relative './api_resource_spec.rb'
require_relative './api_actions/list_spec.rb'

module Opportunity
  describe Occupation do
    it_behaves_like "an APIResource"
    it_behaves_like "it has a list"
  end
end
