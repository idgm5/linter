# rubocop:disable Style/Copyright
# rubocop:disable Style/DocumentationMethod
# rubocop:disable Style/InlineComment

class Parameters
  attr_reader :code_length, :line_length
  def initialize(file)
    @doc = file
    @indentation = 2 # Amount of spaces for indentation
    @code_length = 140 # Max length of code allowed in a single rb file
    @line_length = 100 # Max length in characters for a single line
  end
end

# rubocop:enable Style/Copyright
# rubocop:enable Style/DocumentationMethod
# rubocop:enable Style/InlineComment
