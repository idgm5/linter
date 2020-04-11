require './lib/linter.rb'

document = "./examples/bubble_sort.rb"
check = Linter::Check.new(document)

RSpec.describe Linter do
	describe '.code_length' do
		context 'when receive a file' do
			it 'compares the amount of lines in the file with the max amount of lines allowed' do
				result = check.code_length
				expect(puts check.code_length).to eq(false)
	      	end
	  	end
	end

	describe '.line_length' do
		context 'when receive a file' do
			it 'compares the amount of characters in a single line with the max amount of characters allowed' do
				puts check.line_length
				expect(puts check.code_length).to eq(false)
	      	end
	  	end
	end

	describe '.extra_space' do
		context 'when receive a file' do
			it 'look for extra spaces at the end of each line' do
				puts check.extra_space
				expect(puts check.code_length).to eq(false)
	      	end
	  	end
	end

	describe '.empty_line' do
		context 'when receive a file' do
			it 'look for consecutive empty lines' do
				puts check.empty_line
				expect(puts check.code_length).to eq(false)
	      	end
	  	end
	end

	describe '.comparison_operator' do
		context 'when receive a file' do
			it 'look for negative operator and returns better alternative' do
				puts check.comparison_operator
	      	end

	      	it 'look for equal operator and returns better alternative' do
				puts check.comparison_operator
	      	end
	  	end
	end

	describe '.logical_operator' do
		context 'when receive a file' do
			it 'look for AND operator and returns better alternative' do
				puts check.logical_operator
	      	end

	      	it 'look for OR operator and returns better alternative' do
				puts check.logical_operator
	      	end
	  	end
	end

	describe '.space_between' do
		context 'when receive a file' do
			it 'deletes extra spaces between objects and update file' do
				puts space_between(document)
	      	end
	  	end
	end
end
