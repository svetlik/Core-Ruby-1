require_relative 'vector_solution'

class Vector3D < Vector
  def initialize(x, y, z)
    @components = [x, y, z]
  end
end
