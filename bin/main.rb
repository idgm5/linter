# rubocop:disable Metrics/CyclomaticComplexity
require './lib/linter.rb'

directories = Dir[Dir.pwd + '/**/*.rb']

def inspect_files(directory)
  directory.each do |file|
    check = Linter::Check.new(file)
    puts check.current_file
    puts '====================================================================='
    puts 'Respected max length for code. Check' if check.code_length.equal? false
    puts 'No extra spaces at the end of lines. Check' if check.extra_space.equal? false
    puts 'Extra blank lines. Check' if check.empty_line.equal? false
    puts 'Length of each line. Check' if check.line_length.equal? false
    puts 'Comparison operators. Check' if check.comparison_operator.equal? false
    puts 'Logical operators. Check' if check.logical_operator.equal? false
    puts '====================================================================='
  end
end

puts inspect_files(directories)
# rubocop:enable Metrics/CyclomaticComplexity
