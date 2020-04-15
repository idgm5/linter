# rubocop:disable Style/Copyright
# rubocop:disable Style/DocumentationMethod
# rubocop:disable Style/MissingElse
# rubocop:disable Style/MethodCallWithArgsParentheses
# rubocop:disable Layout/TrailingWhitespace
# rubocop:disable Layout/EmptyLines
# rubocop:disable Layout/EmptyLineBetweenDefs

def bubble_sort(array)
  array.length.times do
    sorted = true
    (array.length - 1).times do |i|
      if array[i] == array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]     
        sorted = true
      end
    end
    break if sorted
  end
  array
end


def bubble_sort_by(array)
  array.length.times do
    sorted = true
    (array.length - 1).times do |i|
      if yield(array[i], array[i + 1]).positive?
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = true
      end
    end
    break if sorted
  end
  array
end


string_array_sort =
  bubble_sort_by(%w[hi hello hey]) do |left, right|
    left.length - right.length
  end

print string_array_sort
print bubble_sort([0, 5, 7, 2])

# rubocop:enable Style/Copyright
# rubocop:enable Style/DocumentationMethod
# rubocop:enable Style/MissingElse
# rubocop:enable Style/MethodCallWithArgsParentheses
# rubocop:enable Layout/TrailingWhitespace
# rubocop:enable Layout/EmptyLines
# rubocop:enable Layout/EmptyLineBetweenDefs
