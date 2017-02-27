require 'spec_helper'

module Opportunity
  describe Util do

    describe ".parameterize_hash" do

      context "when given hash" do
        it "is empty" do
          expect(Util.parameterize_hash({})).to eq("")
        end

        context "has a single key value pair" do
          let(:hash) { {test: "1"} }

          it "should return the correct string representation" do
            expected_string = "?test=1"
            expect(Util.parameterize_hash(hash)).to eq(expected_string)
          end
        end

        context "has multiple key value pairs" do
          let(:hash) { {test: "1", test_2: "2"} }

          it "should return the correct string representation" do
            expected_string = "?test=1&test_2=2"
            expect(Util.parameterize_hash(hash)).to eq(expected_string)
          end
        end
      end
    end

  end
end