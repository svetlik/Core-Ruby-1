require_relative 'vector_solution'

class Vector3D < Vector
  attr_accessor :x, :y, :z
  def initialize(x, y, z)
    @components = [x, y, z]
  end
end
