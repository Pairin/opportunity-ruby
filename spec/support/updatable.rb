require 'spec_helper'

module Opportunity
  module APIActions
    shared_examples 'it is updatable' do
      before { allow(subject).to receive(:id).and_return(Random.rand(1..100)) }

      describe "#update" do
        context "when param format not defined" do
          before { allow(subject.class).to receive(:update_format).and_return(nil) }

          it "should raise OpportunityError" do
            expect{ subject.update }.to raise_error(OpportunityError)
          end
        end

        context  "when invalid params" do
          let(:params) { {"#{Random.rand}" => Random.rand } }

          it "should raise invalid format error" do
            expect{ subject.update(params) }.to raise_error(InvalidParametersError)
            expect{ subject.update }.to raise_error(InvalidParametersError)
          end
        end

        context "when valid params" do
          let(:params) { {id: 1} }
          let(:body) { { "#{subject.class.object_key}": params }.to_json }
          let(:response_stub) { OpenStruct.new(body: body) }

          before do
            allow(subject).to receive(:validate_param_format!).and_return(true)
            allow(subject).to receive(:request).and_return(response_stub)
          end

          it "class should receive put request" do
            expect(subject).to receive(:request).with(
              :put,
              subject.class.singular_resource_url(subject.id), anything
            ).and_return(response_stub)

            subject.update(params)
          end

          it "should return a new instance of the object" do
            update = subject.update(params)
            expect(update.class).to eq(subject.class)
          end

        end

      end
    end
  end
end
