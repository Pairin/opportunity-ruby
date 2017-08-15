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
        expected_resource_url = "/v1/#{Util.underscore(subject.class.class_name).plural}"
        expect(subject.class.resource_url).to eq(expected_resource_url)
      end
    end

    describe ".object_key" do
      it "should return underscored and downcased representation of class" do
        expect(subject.class.object_key).to eq(Util.underscore(subject.class.class_name))
      end
    end

  end
end
