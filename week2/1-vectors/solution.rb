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

  alias_method :magnitude, :length

  def normalize
    [@x, @y].map { |component| component / length }
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def +(other)
    if other.is_a? Numeric
      [@x, @y].map { |component| component + other }
    else
      @x, @y = @x + other.x, @y + other.y
    end
  end

  def -(other)
    if other.is_a? Numeric
      [@x, @y].map { |component| component - other }
    else
      @x, @y = @x - other.x, @y - other.y
    end
  end

  def *(other)
    [@x, @y].map { |component| component * other }
  end

  def /(other)
    [@x, @y].map { |component| component / other }
  end

  def to_s
    "Vector (#{@x}, #{@y}) with object_id: #{object_id}"
  end

  def inspect
    [[@x, @y], object_id]
  end
end
