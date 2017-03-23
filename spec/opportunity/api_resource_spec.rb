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
        expected_resource_url = "/v1/#{subject.class.class_name.downcase}s"
        expect(subject.class.resource_url).to eq(expected_resource_url)
      end
    end

    describe "#resource_url" do
      it "should return the resource url with an appended resource id" do
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
      let(:response_params) { {id: 1, name: "1", overview: "1"} }
      let(:subject_stub) { subject.class.new(response_params) }

      before do
        stubs = Faraday::Adapter::Test::Stubs.new do |stub|
          stub.get(subject.class.resource_url) { |env| [200, {}, subject_stub]}
        end
        allow(Faraday).to receive(:new).and_return(faraday(stubs))
      end

      it "should initialize a new resource with request response" do
        # expect(subject.class).to receive(:new).with(response_params)
        # subject_stub.refresh
      end
    end

  end
end
