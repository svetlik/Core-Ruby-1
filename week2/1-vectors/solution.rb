class Vector2D
  attr_accessor :x, :y

  # The unit vector (1, 0).
  def self.e
    @x, @y = 1, 0
  end

  # The unit vector (0, 1).
  def self.j
    @x, @y = 0, 1
  end

  def initialize(x, y)
    @x, @y = x, y
  end

  def length
    [@x, @y].map { |component| component**2 }.reduce(:+)**0.5
  end

  alias magnitude length

  def normalize
    [@x, @y].map { |component| component / length } 
  end

  def ==(vector_or_scalar)
    # Your code goes here.
  end

  def +(vector_or_scalar)
    # Your code goes here.
  end

  def -(vector_or_scalar)
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