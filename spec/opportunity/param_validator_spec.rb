require 'spec_helper'

module Opportunity
  describe ParamValidator do
    subject(:pv) { ParamValidator }

    describe '.validate_against_hash' do
      let(:expectation) { {} }

      def expect_result(result)
        expect(pv.validate_hash(attempt, expectation)).to eq(result)
      end

      context 'when attempt is not a hash' do
        let(:attempt) { 1 }

        it 'equals false' do
          expect_result(false)
        end
      end

      context 'when attempt is empty hash' do
        let(:attempt) { {} }

        context 'and is required' do
          let(:expectation) { {'!something' => {}} }

          it 'equals false' do
            expect_result(false)
          end
        end

        context 'and isn\'t required' do
          let(:expectation) { {'something' => {}} }

          it 'equals true' do
            expect_result(true)
          end
        end
      end

      context 'when attempt doesn\'t have keys in expectation' do
        let(:attempt) { {'something' => 1, 'something else' => 1} }

        context 'and keys are required' do
          let(:expectation) { {'!something' => 1, '!something more' => 1} }

          it 'equals false' do
            expect_result(false)
          end
        end

        context 'and keys are not required' do
          let(:expectation) { {'something' => 1, 'something more' => 1} }

          context 'and are missing' do
            it 'equals true' do
              expect_result(true)
            end
          end

          context 'and are incorrect type' do
            let(:attempt) { {'something' => '1'} }
            let(:expectation) { {'something' => 1} }

            it 'equals false' do
              expect_result(false)
            end

          end
        end
      end

      context 'when attempt value isn\'t same class as expectation value' do
        let(:attempt) { {'something' => 1, 'something else' => '1'} }
        let(:expectation) { {'something' => 1, 'something else' => 1 } }

        it 'equals false' do
          expect_result(false)
        end
      end

    end

    context '.validate_simple_value' do

      def expect_result(result)
        expect(pv.validate_simple_value(attempt, expectation)).to eq(result)
      end

      context 'when classes don\'t match' do
        let(:attempt) { 1 }
        let(:expectation) { '1' }

        it 'equals false' do
          expect_result(false)
        end
      end

      context 'when classes match' do
        let(:attempt) { 1 }
        let(:expectation) { 2 }

        it 'equals true' do
          expect_result(true)
        end
      end

    end

    context '.validate_value' do

      def expect_result(result)
        expect(pv.validate_value(attempt, expectation)).to eq(result)
      end

      context 'when classes don\'t match' do
        let(:attempt) { [] }
        let(:expectation) { {} }

        it 'equals false' do
          expect_result(false)
        end
      end

      context 'when classes match' do
        context 'and are hashes' do
          let(:attempt) { {something: 1} }
          let(:expectation) { {something: 2} }

          it 'should call validate_hash' do
            expect(pv).to receive(:validate_hash).with(attempt, expectation).and_return(true)
            expect_result(true)
          end
        end

        context 'and are arrays' do
          let(:attempt) { [1] }
          let(:expectation) { [1] }

          it 'should call validate_array' do
            expect(pv).to receive(:validate_array).with(attempt, expectation).and_return(true)
            expect_result(true)
          end
        end

        context 'and are not hashes or arrays' do
          let(:attempt) { 1 }
          let(:expectation) { 1 }

          it 'should call validate_simple_value' do
            expect(pv).to receive(:validate_simple_value).with(attempt, expectation).and_return(true)
            expect_result(true)
          end
        end
      end
    end

  end
end
