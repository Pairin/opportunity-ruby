require 'spec_helper'


module Opportunity
  describe Institution do
    it_behaves_like "an APIResource"
    it_behaves_like "it has a list"

    describe "#programs" do
      subject(:institution) { Institution.new(id: 1) }

      context "when no additional params" do
        let(:expected_params) { {institution_id: institution.id} }

        it "should pass institution_id into Program.list" do
          expect(Program).to receive(:list).with(expected_params)
          institution.programs
        end
      end

      context "with additional params" do
        let(:expected_params) { {institution_id: institution.id, level_id: 1} }

        it "should include additional params" do
          expect(Program).to receive(:list).with(expected_params)
          institution.programs(level_id: 1)
        end
      end
    end

  end
end
