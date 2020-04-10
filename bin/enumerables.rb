# rubocop:disable Metrics/BlockNesting
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/ModuleLength
# rubocop:disable Style/IfInsideElse
# rubocop:disable Style/CaseEquality

module Enumerable
  def my_each
    i = 0
    array = *self

    while i < size
      return to_enum unless block_given?

      yield(array[i])
      i += 1
    end
  end

  def my_each_with_index(argv = 0)
    i = 0
    i = 0 + argv if argv.positive?
    array = *self

    while i < size
      return to_enum unless block_given?

      yield(array[i], i)
      i += 1
    end
  end

  def my_select
    obj = *self
    array = []
    obj.length.times { |i| array.push(obj[i]) if block_given? && yield(obj[i]) }
    return to_enum unless block_given?

    array
  end

  def my_all?(argv = nil)
    array = *self
    memo = true
    if block_given?
      array.my_each { |x| memo = false unless yield(x) }
    elsif argv.nil?
      array.my_each { |x| memo = false unless x }
    else
      array.my_each { |x| memo = false unless argv === x }
    end
    memo
  end

  def my_any?(argv = nil)
    array = *self
    memo = false
    if block_given?
      array.my_each { |x| memo = true if yield(x) }
    elsif argv.nil?
      array.my_each { |x| memo = true if x }
    else
      array.my_each { |x| memo = true if argv === x }
    end
    memo
  end

  def my_none?(argv = nil)
    array = *self
    memo = true
    if block_given?
      array.my_each { |x| memo = false if yield(x) }
    elsif argv.nil?
      array.my_each { |x| memo = false if x }
    else
      array.my_each { |x| memo = false if argv === x }
    end
    memo
  end

  def my_count(argv = nil)
    i = 0
    j = 0
    o = 0
    while i < size
      if block_given?
        j += 1 if yield(self[i])
      else
        if argv.is_a? Numeric
          j += 1 if self[i] == argv
        elsif argv.nil?
          j += 1
          o += 1 unless self[i]
        end
      end
      i += 1
    end
    return o if o.positive?

    j
  end

  def my_map(_argv = 0)
    i = 0
    array = *self
    result = []
    while i < size
      if block_given?
        result.push(yield(array[i]))
      else
        result = to_enum
      end
      i += 1
    end
    result
  end

  def my_inject(argv = nil, argv2 = nil)
    array = *self
    memo = 0 if array[0].is_a? Numeric
    memo = '' if array[0].is_a? String
    memo = argv2 if argv2.is_a? Numeric
    memo = argv if argv.is_a? Numeric
    if block_given?
      array.my_each { |x| memo = yield(memo, x) }
    elsif argv2.nil?
      array.my_each { |x| memo = memo.send(argv, x) }
    else
      array.my_each { |x| memo = memo.send(argv2, x) }
    end
    memo
  end
end

def multiply_els(array)
  # array = *array
  array.my_inject(1, :*)
end

# rubocop:enable Metrics/BlockNesting
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Style/IfInsideElse
# rubocop:enable Style/CaseEquality
