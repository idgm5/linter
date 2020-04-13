# rubocop:disable Style/Copyright
# rubocop:disable Style/MethodCallWithArgsParentheses

# spec :linter_spec.rb

require './lib/linter.rb'

document = './examples/bubble_sort.rb'
check = Linter::Check.new(document)

RSpec.describe Linter::Check do
  describe '.code_length' do
    context 'when receive a file' do
      it 'compares the amount of lines in the file with the max amount of lines allowed' do
        expect(check.code_length).to eq(false)
      end
    end
  end

  describe '.line_length' do
    context 'when receive a file' do
      it 'compares the amount of characters in a single line with the max amount of characters allowed' do
        expect(check.line_length).to eq(false)
      end
    end
  end

  describe '.extra_space' do
    context 'when receive a file' do
      it 'look for extra spaces at the end of each line' do
        expect(check.extra_space).to eq(false)
      end
    end
  end

  describe '.empty_line' do
    context 'when receive a file' do
      it 'look for consecutive empty lines' do
        expect(check.empty_line).to eq(false)
      end
    end
  end

  describe '.comparison_operator' do
    context 'when receive a file' do
      it 'look for negative operator and returns better alternative' do
        expect(check.comparison_operator).to eq(false)
      end

      it 'look for equal operator and returns better alternative' do
        expect(check.comparison_operator).to eq(false)
      end
    end
  end

  describe '.logical_operator' do
    context 'when receive a file' do
      it 'look for AND operator and returns better alternative' do
        expect(check.logical_operator).to eq(false)
      end

      it 'look for OR operator and returns better alternative' do
        expect(check.logical_operator).to eq(false)
      end
    end
  end
end

# rubocop:enable Style/Copyright
# rubocop:enable Style/MethodCallWithArgsParentheses
