require './lib/linter.rb'

directories = Dir[Dir.pwd + "/**/*.rb"]

def inspect_files(directory)
	directory.each do |file|
		check = Linter::Check.new(file)
		puts check.current_file
		puts "====================================================================="
		puts check.code_length
		puts check.extra_space
		puts check.empty_line
		puts check.line_length
		# puts space_between
		puts check.comparison_operator
		puts check.logical_operator
		puts "====================================================================="
	end
end

puts inspect_files(directories)