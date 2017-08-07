require 'spec_helper'

module Opportunity
  module APIActions
    shared_examples 'it is retrievable' do

      describe "#singular_resource_url" do
        let(:resource_id) { 1 }

        it "should return the resource url with an appended resource id" do
          expect(subject.class.singular_resource_url(resource_id)).to eq("#{subject.class.resource_url}/#{resource_id}")
        end
      end

      describe "#retrieve" do
        let(:subject_stub) { subject.class.new({id: 1}) }

        before do
          allow(subject.class).to receive(:request_resource).and_return({'occupation' => {'id' => subject_stub.id}})
        end

        it "should initialize a resource" do
          expect(subject.class).to receive(:new).and_return(subject_stub)
          subject.class.retrieve(1)
        end
      end

    end
  end
end
