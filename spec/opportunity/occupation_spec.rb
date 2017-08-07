require 'spec_helper'

module Opportunity
  describe Occupation do
    it_behaves_like "an APIResource"
    it_behaves_like "it is retrievable"
    it_behaves_like "it has a list"
    it_behaves_like "it is evaluatable"

    describe "#programs" do
      subject(:occupation) { Occupation.new(id: 1) }

      context "when no additional params" do
        let(:expected_params) { {occupation_id: occupation.id} }

        it "should pass institution_id into Program.list" do
          expect(Program).to receive(:list).with(expected_params)
          occupation.programs
        end
      end

      context "with additional params" do
        let(:expected_params) { {occupation_id: occupation.id, level_id: 1} }

        it "should include additional params" do
          expect(Program).to receive(:list).with(expected_params)
          occupation.programs(level_id: 1)
        end
      end
    end

  end
end
