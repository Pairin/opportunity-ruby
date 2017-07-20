require 'spec_helper'

module Opportunity
  shared_examples 'an APIResource' do

    describe ".class_name" do
      it "should return the correct class name" do
        expected_class_name = subject.class.name.split("::")[-1]
        expect(subject.class.class_name).to eq(expected_class_name)
      end
    end

    describe ".resource_url" do
      it "should return the correct resource url" do
        expected_resource_url = "/v1/#{Util.underscore(subject.class.class_name)}s"
        expect(subject.class.resource_url).to eq(expected_resource_url)
      end
    end

    describe "#resource_url" do
      let(:resource_id) { 1 }
      let(:subject_stub) { subject.class.new({id: resource_id}) }

      it "should return the resource url with an appended resource id" do
        expect(subject_stub.resource_url).to eq("#{subject.class.resource_url}/#{resource_id}")
      end
    end

    describe "#retrieve" do
      let(:subject_stub) { subject.class.new({id: 1}) }

      it "should initialize a resource and then refresh it" do
        expect(subject.class).to receive(:new).and_return(subject_stub)
        expect(subject_stub).to receive(:refresh)
        subject.class.retrieve(1)
      end
    end

    describe "#refresh" do
      let(:response_body) { {'id' => 1, 'name' => "1", 'overview' => "1"} }
      let(:response) { OpenStruct.new(body: response_body.to_json) }

      before do
        allow(subject.class).to receive(:request).and_return(response)
      end

      it "should initialize a new resource with request response" do
        subject_stub = subject.class.new(id: 1)

        expect(subject.class).to receive(:new).with(response_body)
        subject_stub.refresh
      end
    end

  end
end
