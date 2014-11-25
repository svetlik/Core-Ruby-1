require 'minitest/autorun'

require_relative 'solution'

class ArrayTest < Minitest::Test
  def test_to_hash
    assert_equal({ one: 1, two: 2 }, [[:one, 1], [:two, 2]].to_hash)
    assert_equal({ 1 => 2, 3 => 4 }, [[1, 2], [3, 4]].to_hash)
    assert_equal({ 1 => 3 }, [[1, 2], [1, 3]].to_hash)
    assert_equal({}, [].to_hash)
  end

  def test_index_by
    words_length = { 3 => 'bar', 6 => 'larodi' }
    einstein = { 'Einstein' => 'Albert Einstein' }
    ein_array = ['Albert Einstein', 'Albert Einstein']
    names = { 'Coltrane' => 'John Coltrane', 'Davis' => 'Miles Davis' }
    names_array = ['John Coltrane', 'Miles Davis']
    assert_equal(words_length, %w(foo larodi bar).index_by(&:length))
    assert_equal(einstein, ein_array.index_by { |name| name.split(' ').last })
    assert_equal(names, names_array.index_by { |name| name.split(' ').last })
  end

  def test_occurrences_count
    hash = { 'a' => 3, 'b' => 2, 'c' => 1 }
    assert_equal({ foo: 2, bar: 1 }, [:foo, :bar, :foo].occurrences_count)
    assert_equal(hash, %w(a a b c b a).occurrences_count)
  end

  def test_subarray_count
    assert_equal 2, [1, 2, 3, 2, 3, 1].subarray_count([2, 3])
    assert_equal 3, [1, 2, 2, 2, 2, 1].subarray_count([2, 2])
    assert_equal 2, [1, 2, 2, 2, 2, 1].subarray_count([2, 2, 2])
    assert_equal 3, [1, 1, 2, 2, 1, 1, 1].subarray_count([1, 1])
  end
end
