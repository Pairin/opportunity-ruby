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
          let(:score) { 1 }
          let(:body) { {'evaluation' => {'score' => score}}.to_json }
          let(:response_stub) { OpenStruct.new(body: body) }

          before do
            allow(subject_stub.class).to receive(:request).and_return(response_stub)
          end

          it "class should receive post request" do
            expect(subject_stub.class).to receive(:request).with(
              :post,
              Evaluatable::EVALUATION_URL, anything
            ).and_return(response_stub)

            subject_stub.evaluate!(params)
          end

          it "should return the score" do
            expect(subject_stub.evaluate!(params)).to eq(score)
          end

          it "should define match method on object" do
            subject_stub.evaluate!(params)
            expect(subject_stub.match).to eq(score)
          end
        end

      end
    end
  end
end
