document = "./examples/bubble_sort.rb"

def line_length(doc, max)
  i = 0
  File.readlines(doc).each do
    i += 1
  end
  return "Too large" if i > max
end


def extra_space(doc)
  i = 0
  File.readlines(doc).each do |line|
    i += 1
    if line[/\A */].size > 2
      return "Indentation shouldn't be more than two spaces in line: " + i.to_s
    end
  end
end


puts line_length(document, 10)
puts extra_space(document)
