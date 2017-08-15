require 'spec_helper'

module Opportunity
  module APIActions
    shared_examples 'it is creatable' do

      describe "#create" do
        context "when param format not defined" do
          before { allow(subject.class).to receive(:creation_format).and_return(nil) }

          it "should raise OpportunityError" do
            expect{ subject.class.create }.to raise_error(OpportunityError)
          end
        end

        context  "when invalid params" do
          let(:params) { {"#{Random.rand}" => Random.rand } }

          it "should raise invalid format error" do
            expect{ subject.class.create(params) }.to raise_error(InvalidParametersError)
            expect{ subject.class.create }.to raise_error(InvalidParametersError)
          end
        end

        context "when valid params" do
          let(:params) { {id: 1} }
          let(:body) { { "#{subject.class.object_key}": params }.to_json }
          let(:response_stub) { OpenStruct.new(body: body) }

          before do
            allow(subject.class).to receive(:validate_param_format!).and_return(true)
            allow(subject.class).to receive(:request).and_return(response_stub)
          end

          it "class should receive post request" do
            expect(subject.class).to receive(:request).with(
              :post,
              subject.class.resource_url, anything
            ).and_return(response_stub)

            subject.class.create(params)
          end

          it "should return a new instance of the object" do
            creation = subject.class.create(params)
            expect(creation.class).to eq(subject.class)
          end

        end

      end
    end
  end
end
