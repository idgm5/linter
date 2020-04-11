require './lib/lint.rb'

document = "./examples/bubble_sort.rb"
check = Check.new(document, 1000)

puts check.code_length
puts check.extra_space
puts check.empty_line
puts check.line_length
# puts space_between(document)
puts check.comparison_operator
puts check.logical_operator