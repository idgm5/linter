# rubocop:disable Style/Copyright
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Style/DocumentationMethod
# rubocop:disable Style/MethodCallWithArgsParentheses

require_relative '../lib/linter.rb'
require_relative '../lib/parameters.rb'

directories = Dir[Dir.pwd + '/**/*.rb']

def inspect_files(directory)
  directory.each do |file|
    check = Linter::Check.new(file)
    param = Parameters.new(file)
    puts check.current_file
    puts '====================================================================='
    puts "Respected max length for code. Check [#{param.code_length}]" if check.code_length.equal? false
    puts 'No extra spaces at the end of lines. Check' if check.extra_space.equal? false
    puts 'Extra blank lines. Check' if check.empty_line.equal? false
    puts "Length of each line. Check [#{param.line_length}]" if check.line_length.equal? false
    puts 'Comparison operators. Check' if check.comparison_operator.equal? false
    puts 'Negative operators. Check' if check.negative_operator.equal? false
    puts 'Logical (&&) operators. Check' if check.logical_AND_operator.equal? false
    puts 'Logical (||) operators. Check' if check.logical_OR_operator.equal? false
    puts '====================================================================='
  end
end

inspect_files(directories)

# rubocop:enable Style/Copyright
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Style/DocumentationMethod
# rubocop:enable Style/MethodCallWithArgsParentheses
