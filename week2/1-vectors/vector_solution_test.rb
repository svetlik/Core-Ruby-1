class Vector
  def initialize(*components)
    # Let's make it more interesting here. I wanna initialize the vector with
    # `Vector.new(1, 2, 3, 4)` and `Vector.new([1, 2, 3, 4])` and expect the
    # same vector.
  end

  def dimension
    # Your code goes here
  end

  def length
    # Your code goes here.
  end

  def magnitute
    # The same as #length. Can we implement it without duplicating or calling
    # the #length method?
  end

  def normalize
    # Your code goes here.
  end

  def [](index)
    # Your code goes here.
  end

  def []=(index)
    # Your code goes here.
  end

  def ==(other)
    # Your code goes here.
  end

  def +(vector_of_same_dimension_or_scalar)
    # Your code goes here.
  end

  def -(vector_of_same_dimension_or_scalar)
    # Your code goes here.
  end

  def *(scalar)
    # Your code goes here.
  end

  def /(scalar)
    # Your code goes here.
  end

  def to_s
    # Your code goes here.
  end

  def inspect
    # Your code goes here.
  end
end