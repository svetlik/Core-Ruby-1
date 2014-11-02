require 'minitest/autorun'

require_relative 'vector_solution'

class SolutionTest < Minitest::Test
  def test_length
    vector = Vector.new(3, 4, 5, 6)

    assert_equal 86**0.5, vector.length
  end

  def test_magnitude
    vector = Vector.new(3, 4, 5, 6)

    assert_equal 86**0.5, vector.magnitude
  end

  def test_normalize
    vector = Vector.new(3, 4, 5, 6)

    assert_equal [
      Rational(3, 86**0.5),
      2 * (Rational(2, 43)**0.5),
      Rational(5, 86**0.5),
      3 * (Rational(2, 43)**0.5)
    ], vector.normalize
  end

  def test_equal
    vector = Vector.new(3, 4, 5, 6)
    another_vector = Vector.new(3, 4, 5, 6)
    unequal_vector = Vector.new(4, 5, 6, 7)

    assert_equal true, vector == another_vector
    assert_equal false, vector == unequal_vector
  end

  def test_add
    vector = Vector.new(3, 4, 5, 6)
    number = 5
    another_vector = Vector.new(4, 5, 6, 7)

    assert_equal [8, 9, 10, 11], vector + number
    assert_equal [7, 9, 11, 13], vector + another_vector
  end

  def test_subtract
    vector = Vector.new(3, 4, 5, 6)
    number = 3
    another_vector = Vector.new(4, 5, 6, 7)

    assert_equal [0, 1, 2, 3], vector - number
    assert_equal [-1, -1, -1, -1], vector - another_vector
  end

  def test_multiply
    vector = Vector.new(3, 4, 5, 6)
    number = 3

    assert_equal [9, 12, 15, 18], vector * number
  end

  def test_divide
    vector = Vector.new(3, 4, 5, 6)
    number = 3

    assert_equal [1, 4 / 3, 5 / 3, 2], vector / number
  end

  def test_to_s
    vector = Vector.new(3, 4, 5, 6, 7)
    string = "Vector ([3, 4, 5, 6, 7]) with object_id: #{vector.object_id}"
    assert_equal string, vector.to_s
  end

  def test_inspect
    vector = Vector.new(3, 4, 5, 6)

    assert_equal true, vector.inspect.include?(vector.object_id)
  end
end
