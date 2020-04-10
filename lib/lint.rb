document = "./examples/bubble_sort.rb"

  def code_length(doc, max)
    i = 0
    check = "Length of the code. Check"
    File.readlines(doc).each do
      i += 1
    end
    return "More than #{max} lines is not allowed." if i > max
    check
  end

  def extra_space(doc)
    i = 0
    check = "Extra spaces at the end of the line. Check"
    File.readlines(doc).each do |line|
      i += 1
      spaces_count = line.count(' ') - line.rstrip.count(' ')
      if spaces_count > 2
        puts "You have extra spaces at the end of the line: " + i.to_s
      end
    end
    check
  end

  def empty_line(doc)
    i = 0
    empty_lines = []
    check = "Extra blank lines. Check"
    File.readlines(doc).each do |line|
      i += 1
      if line.gsub("\n","").length == 0
        empty_lines.push(i)
      end
    end
    (empty_lines.length - 1).times  do |x|
      if empty_lines[x + 1] - empty_lines[x] == 1
        puts "You have more than one empty line: " + empty_lines[x].to_s
      end
    end
    check
  end

  def line_length(doc, max)
    check = "Length of each line. Check"
    i = 0
    File.readlines(doc).each do |line|
      i += 1
      if line.to_s.size > max
        puts "More than #{max} characters per line is not allowed. Line: " + i.to_s
      end
    end
    check
  end

  def space_between(doc)
    check = "Spaces between objects. Check"
    i = 0
    File.write(doc, File.readlines(doc).reject { |line| line.strip.empty? }.join)
    check
  end


puts code_length(document, 1000)
puts extra_space(document)
puts empty_line(document)
puts line_length(document, 1000000)
puts space_between(document)
# puts space_between(document)
