module MyEnumerable
  def map
    return to_enum(:map) unless block_given?
    result = []
    each { |element| result << yield(element) }
    result
  end

  def filter
    return to_enum(:filter) unless block_given?
    result = []
    each { |element| result << element if yield(element) }
    result
  end

  def reject
    return to_enum(:reject) unless block_given?
    result = []
    each { |element| result << element unless yield(element) }
    result
  end

  def reduce(initial = nil)
    each do |element|
      if initial.nil?
        initial = element
      else
        initial = yield(initial, element)
      end
    end
    initial
  end

  def any?
    result = false
    if block_given?
      each { |element| yield(element) ? result = true : false }
    else
      each { |element| element != false ? result = true : false }
    end
    result
  end

  def all?
    result = true
    if block_given?
      each { |element| yield(element) == false ? result = false : true }
    else
      each { |element| element == false ? result = false : true }
    end
    result
  end

  def each_cons(n)
    result = []
    return to_enum(:each_cons) unless block_given?
    each do |element|
      n.times { result << yield(element) }
    end
    result
  end

  def include?(element)
    result = false
    each { |item| item == element ? result = true : false }
    result
  end

  def count(element = nil)
    if block_given?
      filter { |item| yield(item) == true }.size
    else
      filter { |item| item == element }.size
    end
  end

  def size
    each { 1 }.reduce(0) { |number| number + 1 }
  end

  # (1..6).group_by { |i| i%3 }   #=> {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}
  # Groups the collection by result of the block.
  # Returns a hash where the keys are the evaluated
  # result from the block and the values are arrays
  # of elements in the collection that correspond to
  # the key.
  def group_by
    return to_enum(:group_by) unless block_given?
    hash = {}
    each do |element|
      if hash.key?(yield(element))
        hash[yield(element)] << element
      else hash[yield(element)] = ([] << element)
      end
    end
    hash
  end

  def min
    result = 1.0 / 0.0
    if block_given?
      each { |item| yield(item) < result ? result = item : nil }
    else
      each { |item| item < result ? result = item : nil }
    end
    result
  end

  def min_by
    return to_enum(:min_by) unless block_given?
    result = 1.0 / 0.0
    each { |item| yield(item) < result ? result = item : nil }
    result
  end

  def max
    result = -1.0 / 0.0
    if block_given?
      each { |item| yield(item) > result ? result = item : nil }
    else
      each { |item| item > result ? result = item : nil }
    end
    result
  end

  def max_by
    return to_enum(:max_by) unless block_given?
    each { |item| yield(item) > result ? item : nil }
    result
  end

  def minmax
    [min, max]
  end

  def minmax_by
    return to_enum(:minmax_by) unless block_given?
    [min_by, max_by]
  end

  def take(n)
    result = []
    each do |element|
      result << element
      if result.size == n
        return result
      end
    end
    result
  end

  def take_while
    return to_enum(:take_while) unless block_given?
    result = []
    each { |element| yield(element) ? result << element : nil }
    result
  end

  def drop(n)
    result = []
    counter = 0
    each do |element|
      counter += 1
      counter > n ? result << element : nil
    end
    result
  end

  def drop_while
    return to_enum(:drop_while) unless block_given?
    result = []
    each { |element| yield(element) != true ? result << element : nil }
    result
  end
end
