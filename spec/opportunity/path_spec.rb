require 'spec_helper'

module Opportunity
  describe Path do
    it_behaves_like "an APIResource"
    it_behaves_like "it is retrievable"
    it_behaves_like "it is creatable"
  end
end
