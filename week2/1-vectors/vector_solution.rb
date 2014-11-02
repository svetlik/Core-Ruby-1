class Vector
  def initialize(*components)
    @components = []
    components.flatten.each { |component| @components << component }
  end

  def dimension
    @components.size
  end

  def length
    @components.map { |component| component**2 }.reduce(:+)**0.5
  end

  alias_method :magnitude, :length

  def normalize
    @components.map { |component| component / length }
  end

  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
  end

  def ==(other)
    dimension.times.all? { |index| self[index] == other[index] }
  end

  def +(other)
    if other.is_a? Numeric
      @components.map { |component| component + other }
    else
      dimension.times.map { |index| self[index] + other[index] }
    end
  end

  def -(other)
    if other.is_a? Numeric
      @components.map { |component| component - other }
    else
      dimension.times.map { |index| self[index] - other[index] }
    end
  end

  def *(other)
    @components.map { |component| component * other }
  end

  def /(other)
    @components.map { |component| component / other }
  end

  def to_s
    "Vector (#{@components}) with object_id: #{object_id}"
  end

  def inspect
    [@components, object_id]
  end
end
