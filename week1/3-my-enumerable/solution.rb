module MyEnumerable
  def map
    result = []
    each { |element| result << yield(element) }
    result
  end

  def filter
    result = []
    each { |element| result << element if yield(element)}
    result
  end

  def reject
    result = []
    each { |element| result << element unless yield(element)}
    result
  end

  def reduce(initial = nil)
    remaining = dup
    
    unless remaining.empty? 
      buffer = yield buffer, remaining.shift
    end
    buffer
  end

  def any?
    
  end

  def all?
    # Your code goes here.
  end

  def each_cons(n)
    # Your code goes here.
  end

  def include?(element)
    # Your code goes here.
  end

  def count(element = nil)
    # Your code goes here.
  end

  def size
    # Your code goes here.
  end

  # Groups the collection by result of the block.
  # Returns a hash where the keys are the evaluated
  # result from the block and the values are arrays
  # of elements in the collection that correspond to
  # the key.
  def group_by
  end

  def min
    # Your code goes here.
  end

  def min_by
    # Your code goes here.
  end

  def max
    # Your code goes here.
  end

  def max_by
    # Your code goes here.
  end

  def minmax
    # Your code goes here.
  end

  def minmax_by
    # Your code goes here.
  end

  def take(n)
    # Your code goes here.
  end

  def take_while
    # Your code goes here.
  end

  def drop(n)
    # Your code goes here.
  end

  def drop_while
    # Your code goes here.
  end
end
