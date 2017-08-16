require 'spec_helper'

module Opportunity
  module APIActions
    shared_examples 'it is evaluatable' do

      describe "#evaluate" do
        let(:subject_stub) { subject.class.new({id: 1}) }
        let(:body) { {}.to_json }
        let(:response_stub) { OpenStruct.new(body: body) }

        before do
          allow(subject_stub.class).to receive(:request).and_return(response_stub)
        end

        it "class should receive post request" do
          expect(subject_stub.class).to receive(:request).with(
            :post,
            subject_stub.evaluation_url, anything
          ).and_return(response_stub)

          subject_stub.evaluate
        end

        it "should return true" do
          expect(subject_stub.evaluate).to eq(true)
        end

      end
    end
  end
end
