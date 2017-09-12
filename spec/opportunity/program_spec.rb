require 'spec_helper'

module Opportunity
  describe Program do
    it_behaves_like "an APIResource"
    it_behaves_like "it has a list"
    it_behaves_like "it is retrievable"
  end
end
