require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_length
    vector = Vector2D.new(3, 4)

    assert_equal 5, vector.length
  end

  def test_magnitude
    vector = Vector2D.new(3, 4)

    assert_equal 5, vector.magnitude
  end

  def test_normalize
    # TODO
    vector = Vector2D.new(3, 4)

    assert_equal true, true
  end

  def test_equal
    vector = Vector2D.new(3, 4)
    another_vector = Vector2D.new(3, 4)
    unequal_vector = Vector2D.new(4, 5)

    assert_equal true, vector == another_vector
    assert_equal false, vector == unequal_vector
  end

  def test_add
    vector = Vector2D.new(3, 4)
    number = 5
    another_vector = Vector2D.new(4, 5)

    assert_equal [8, 9], vector + number
    assert_equal [7, 9], vector + another_vector
  end

  def test_subtract
    vector = Vector2D.new(3, 4)
    number = 3
    another_vector = Vector2D.new(4, 5)

    assert_equal [0, 1], vector - number
    assert_equal [-1, -1], vector - another_vector
  end

  def test_multiply
    vector = Vector2D.new(3, 4)
    number = 3

    assert_equal [9, 12], vector * number
  end

  def test_divide
    vector = Vector2D.new(3, 4)
    number = 3

    assert_equal [1, 4 / 3], vector / number
  end

  def test_to_s
    vector = Vector2D.new(3, 4)

    assert_equal "Vector (3, 4) with object_id: #{vector.object_id}",\
    vector.to_s 
  end

  def test_inspect
    vector = Vector2D.new(3, 4)

    assert_equal true, vector.inspect.include?(vector.object_id)
  end
end
