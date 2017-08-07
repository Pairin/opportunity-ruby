require 'spec_helper'

module Opportunity
  module APIActions
    shared_examples 'it is evaluatable' do

      describe "#evaluate!" do
        let(:subject_stub) { subject.class.new({id: 1}) }

        context "when invalid params" do
          def expect_error
            expect{ subject_stub.evaluate!(params)}.to raise_error(InvalidParametersError)
          end

          context "when params isn't an array" do
            let(:params) { {} }

            it "should raise error" do
              expect_error
            end
          end

          context "when params is an empty array" do
            let(:params) { [] }

            it "should raise error" do
              expect_error
            end
          end

          context "when params is an array" do
            context "and doesn't have a valid entry" do
              let(:params) { [{}, {'id' => 1}, {'score' => 1}] }

              it "should raise error" do
                expect_error
              end
            end
          end
        end

        context "when valid params" do
          let(:params) { [{'id' => 1, 'score' => 1}] }

          it "should return 1" do
            expect(subject_stub.evaluate!(params)).to eq(1)
          end
        end

      end
    end
  end
end
