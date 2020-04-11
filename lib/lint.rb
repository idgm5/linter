class Check
  attr_reader :doc, :max

  def initialize(doc, max = 0)
    @doc = doc
    @max = max
  end

  def code_length
    i = 0
    doc = @doc
    max = @max
    check = "Length of the code. Check"
    File.readlines(doc).each do
      i += 1
    end
    return "More than #{max} lines is not allowed." if i > max
    check
  end

  def extra_space
    i = 0
    doc = @doc
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

  def empty_line
    i = 0
    doc = @doc
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

  def line_length
    check = "Length of each line. Check"
    i = 0
    doc = @doc
    max = @max
    File.readlines(doc).each do |line|
      i += 1
      if line.to_s.size > max
        puts "More than #{max} characters per line is not allowed. Line: " + i.to_s
      end
    end
    check
  end

  def space_between
    check = "Deleted spaces between objects. Check"
    i = 0
    doc = @doc
    new_lines = []
    File.readlines(doc).each do |line|
      line = line.squeeze(" ")
      new_lines << line
    end
  
    File.open(doc, 'w').write(new_lines.join(""))
    check
  end

  def comparison_operator
    check = "Comparison operators. Check"
    i = 0
    doc = @doc
    File.readlines(doc).each do |line|
      i += 1
      alternative_operator = " "
      response = "Change operator on line #{i.to_s}, use "
      if line.include? "!="
        alternative_operator = "'!' instead."
        puts response + alternative_operator
      elsif line.include? "=="
        alternative_operator = "'equal? or include?' instead."
        puts response + alternative_operator
      end
    end
    check
  end

  def logical_operator
    check = "Logical operators. Check"
    i = 0
    doc = @doc
    File.readlines(doc).each do |line|
      i += 1
      alternative_operator = " "
      response = "Change operator on line #{i.to_s}, use "
      if line.include? "and"
        alternative_operator = "'&&' instead."
        puts response + alternative_operator
      elsif line.include? "or"
        alternative_operator = "'||' instead."
        puts response + alternative_operator
      end
    end
    check
  end
end

