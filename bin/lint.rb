document = "./examples/bubble_sort.rb"

def line_length(doc, max)
  i = 0
  File.readlines(doc).each do
    i += 1
  end
  return "Too large" if i > max
end


def extra_space(doc)
  line_with_spaces = []
  File.readlines(doc).each do
    line_with_spaces(|line|[/\A */].size).push
  end
  line_with_spaces
end


puts line_length(document, 10)
puts extra_space(document)
