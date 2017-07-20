require 'spec_helper'

module Opportunity
  module APIActions
    shared_examples 'it has a list' do

      describe "#list" do
        context "when response is empty" do
          before do
            response_stub = Struct.new(:body)
            response = response_stub.new(JSON.unparse({'subject_class' => []}))
            allow(subject.class).to receive(:request).and_return(response)
          end

          it "should return an array" do
            expect(subject.class.list.is_a?(Array)).to eq(true)
          end
        end

        context "when response isn't empty" do
          let(:response) {
            OpenStruct.new(body: {
                'subject_class' => [
                  {id: 1, name: "1", overview: "1"},
                  {id: 2, name: "2", overview: "2"}
                ]
              }.to_json
            )
          }

          before do
            allow(subject.class).to receive(:request).and_return(response)
          end

          it "should return the correct object type" do
            expect(subject.class.list.empty?).to eq(false)
            subject.class.list.each do |list_object|
              expect(list_object.class).to eq(subject.class)
            end
          end
        end
      end

      describe "#accepted_params" do
        context "when no params" do
          it "should return empty hash if no params" do
            expect(subject.class.accepted_params({})).to eq({})
          end
        end

        context "when params given" do
          let(:params) { {hi: 'yo', page: 1} }

          it "should remove unaccepted params" do
            acceptable_params = {page: 1}
            expect(subject.class.accepted_params(params)).to eq(acceptable_params)
          end
        end

        context "when custom accepted params given" do
          let(:params) { {hi: 'yo', page: 1} }

          before do
            allow(subject.class).to receive(:custom_accepted_params).and_return(['hi'])
          end

          it "should not remove custom accepted params" do
            expect(subject.class.accepted_params(params)).to eq(params)
          end
        end
      end

    end
  end
end
