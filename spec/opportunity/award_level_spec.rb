require 'spec_helper'

module Opportunity
  describe AwardLevel do
    it_behaves_like "an APIResource"
    it_behaves_like "it has a list"
  end
end
