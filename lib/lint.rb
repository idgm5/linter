document = "./examples/bubble_sort.rb"

  def line_length(doc, max)
    i = 0
    check = "Length of code check"
    File.readlines(doc).each do
      i += 1
    end
    return "More than #{max} lines is not allowed." if i > max
    check
  end

  def extra_space(doc) #method for lint.rb
    i = 0
    check = "Extra Spaces At End Line Check"
    File.readlines(doc).each do |line|
      i += 1
      spaces_count = line.count(' ') - line.rstrip.count(' ')
      if spaces_count > 2
        puts "You have extra spaces at the end of the line: " + i.to_s
      end
    end
    check
  end

  # def space_between(doc)
  #   i = 0
  #   warning = []
  #   File.readlines(doc).each do |line|
  #     i += 1
  #     if line.gsub(/\n\s+/, " ")
  #       warning.push(i)
  #     end
  #   end
  #   return "Deleted extra between spaces in lines: " + warning.to_i
  # end


puts line_length(document, 1000)
puts extra_space(document)
# puts space_between(document)
