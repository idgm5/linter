document = "./examples/bubble_sort.rb"

def line_length(doc, max)
  i = 0
  File.readlines(doc).each do
    i += 1
  end
  return "Too large" if i > max
end



puts line_length(document, 10)
