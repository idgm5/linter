require './lib/linter.rb'

directories = Dir[Dir.pwd + "/**/*.rb"]

def inspect_files(directory)
	directory.each do |file|
		check = Linter::Check.new(file)
		puts check.current_file
		puts "====================================================================="
		if check.code_length.equal? false
			puts "Respected max length for code. Check"
		end
		if check.extra_space.equal? false
			puts "No extra spaces at the end of lines. Check"
		end
	 	if check.empty_line.equal? false
			puts "Extra blank lines. Check"
		end
		if check.line_length.equal? false
			puts "Length of each line. Check"
		end
		if check.comparison_operator.equal? false
			puts "Comparison operators. Check"
		end
		if check.logical_operator.equal? false
			puts "Logical operators. Check"
		end
		puts "====================================================================="
	end
end

puts inspect_files(directories)
