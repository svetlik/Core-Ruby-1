require 'minitest/autorun'

require_relative 'vector3_solution'

class SolutionTest < Minitest::Test
  def test_length
    vector = Vector3D.new(3, 4, 5)

    assert_equal 5 * (2**0.5), vector.length
  end

  def test_magnitude
    vector = Vector3D.new(3, 4, 5)

    assert_equal 5 * (2**0.5), vector.magnitude
  end

  def test_normalize
    vector = Vector3D.new(3, 4, 5)

    assert_equal [
      Rational(3, 5 * (2**0.5)),
      Rational(2 * (2**0.5), 5),
      Rational(1, 2**0.5)
    ], vector.normalize
  end

  def test_equal
    vector = Vector3D.new(3, 4, 5)
    another_vector = Vector3D.new(3, 4, 5)
    unequal_vector = Vector3D.new(4, 5, 6)

    assert_equal true, vector == another_vector
    assert_equal false, vector == unequal_vector
  end

  def test_add
    vector = Vector3D.new(3, 4, 5)
    number = 5
    another_vector = Vector3D.new(4, 5, 6)

    assert_equal [8, 9, 10], vector + number
    assert_equal [7, 9, 11], vector + another_vector
  end

  def test_subtract
    vector = Vector3D.new(3, 4, 5)
    number = 3
    another_vector = Vector3D.new(4, 5, 6)

    assert_equal [0, 1, 2], vector - number
    assert_equal [-1, -1, -1], vector - another_vector
  end

  def test_multiply
    vector = Vector3D.new(3, 4, 5)
    number = 3

    assert_equal [9, 12, 15], vector * number
  end

  def test_divide
    vector = Vector3D.new(3, 4, 5)
    number = 3

    assert_equal [1, 4 / 3, 5 / 3], vector / number
  end

  def test_to_s
    vector = Vector3D.new(3, 4, 5)
    string = "Vector3D ([3, 4, 5]) with object_id: #{vector.object_id}"
    assert_equal string, vector.to_s
  end

  def test_inspect
    vector = Vector3D.new(3, 4, 5)

    assert_equal true, vector.inspect.include?(vector.object_id)
  end
end
