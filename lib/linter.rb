module Linter
  class Parameters
    def initialize(file)
      @doc = file
      @indentation = 2 # Amount of spaces for indentation
      @code_length = 120 # Max length of code allowed in a single rb file
      @line_length = 80 # Max length in characters for a single line
    end
  end

  class Check < Parameters
    def code_length
      i = 0
      check = "Length of the code. Check"
      File.readlines(@doc).each do
        i += 1
      end
      return "More than #{@code_length} lines is not allowed." if i > @code_length
      check
    end

    def extra_space
      i = 0
      check = "Extra spaces at end of line. Check"
      File.readlines(@doc).each do |line|
        i += 1
        spaces_count = line.count(' ') - line.rstrip.count(' ')
        if spaces_count > @indentation
          puts "You have extra spaces at the end of the line: " + i.to_s
        end
      end
      check
    end

    def empty_line
      i = 0
      empty_lines = []
      check = "Extra blank lines. Check"
      File.readlines(@doc).each do |line|
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
      File.readlines(@doc).each do |line|
        i += 1
        if line.to_s.size > @line_length
          puts "More than #{@line_length} characters per line is not allowed. Line: " + i.to_s
        end
      end
      check
    end

    def comparison_operator
      check = "Comparison operators. Check"
      i = 0
      File.readlines(@doc).each do |line|
        i += 1
        alternative_operator = " "
        response = "Change operator on line #{i.to_s}, use "
        if line.include? " != "
          alternative_operator = "'!' instead."
          puts response + alternative_operator
        elsif line.include? " == "
          alternative_operator = "'equal? or include?' instead."
          puts response + alternative_operator
        end
      end
      check
    end

    def logical_operator
      check = "Logical operators. Check"
      i = 0
      File.readlines(@doc).each do |line|
        i += 1
        alternative_operator = " "
        response = "Change operator on line #{i.to_s}, use "
        if line.include? " and "
          alternative_operator = "'&&' instead."
          puts response + alternative_operator
        elsif line.include? " or "
          alternative_operator = "'||' instead."
          puts response + alternative_operator
        end
      end
      check
    end

    def space_between
      check = "Deleted spaces between objects. Check"
      i = 0
      new_lines = []
      File.readlines(@doc).each do |line|
        line = line.squeeze(" ")
        new_lines << line
      end
      File.open(doc, 'w').write(new_lines.join(""))
      check
    end

    def current_file
      name = File.basename(@doc)
      return "Checking any broken rules in file: " + name
    end
  end
end