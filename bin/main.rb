require './lib/linter.rb'

directories = Dir[Dir.pwd + "/**/*.rb"]

def inspect_files(directory)
	directory.each do |file|
		check = Linter::Check.new(file)
		puts check.current_file
		puts "====================================================================="
		if check.code_length == false
			puts "Respected max length for code. Check"
		end
		if check.extra_space == false
			puts "No extra spaces at the end of lines. Check"
		end
	 	if check.empty_line == false
			puts "Extra blank lines. Check"
		end
		if check.line_length == false
			puts "Length of each line. Check"
		end
		# if check.space_between == true
		# 	puts "Deleted spaces between objects. Check"
		# end
		if check.comparison_operator == false
			puts "Comparison operators. Check"
		end
		if check.logical_operator == false
			puts "Logical operators. Check"
		end
		puts "====================================================================="
	end
end

puts inspect_files(directories)
