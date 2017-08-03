require 'spec_helper'

module Opportunity
  describe ResultSet do

    context "when no results" do
      subject(:set) { ResultSet.new([]) }

      describe "#next" do
        it "should return empty array" do
          expect(set.next).to eq([])
        end
      end

      describe "#next!" do
        it "should return empty array" do
          expect(set.next!).to eq([])
        end
      end

      describe "#previous" do
        it "should return empty array" do
          expect(set.previous).to eq([])
        end
      end

      describe "#prevous!" do
        it "should return empty array" do
          expect(set.previous!).to eq([])
        end
      end
    end

    context "when page not set" do
      subject(:set) { ResultSet.new([]) }

      it "should return List default" do
        expect(set.page).to eq(APIActions::List::PAGE_DEFAULT)
      end
    end

    context "when limit not set" do
      subject(:set) { ResultSet.new([]) }

      it "should return List default" do
        expect(set.limit).to eq(APIActions::List::LIMIT_DEFAULT)
      end
    end


  end
end
