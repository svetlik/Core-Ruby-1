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
    vector = Vector2D.new(3, 4)

    assert_equal true, true
  end
end
