require 'spec_helper'

module Opportunity
  describe SkillSet do
    it_behaves_like "an APIResource"
    it_behaves_like "it is retrievable"
    it_behaves_like "it is creatable"
    it_behaves_like "it is evaluatable"
  end
end
