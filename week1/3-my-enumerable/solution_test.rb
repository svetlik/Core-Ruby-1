require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  class Collection
    include MyEnumerable

    def initialize(*data)
      @data = data
    end

    def each(&block)
      @data.each(&block)
    end
  end

  def test_map
    collection = Collection.new(*1..5)

    assert_equal [2, 3, 4, 5, 6], collection.map(&:succ)
    assert_equal true, collection.map.is_a?(Enumerator)
  end

  def test_filter
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.filter(&:odd?)
    assert_equal true, collection.filter.is_a?(Enumerator)
  end

  def test_reject
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.reject(&:even?)
    assert_equal true, collection.reject.is_a?(Enumerator)
  end

  def test_reduce
    collection = Collection.new(*1..10)

    assert_equal 55, collection.reduce(0) { |sum, n| sum + n }
  end

  def test_any?
    collection = Collection.new(*1..10)

    assert_equal true, collection.any?(&:odd?)
    assert_equal false, collection.any? { |element| element > 11 }
    assert_equal true, collection.any?
  end

  def test_all?
    collection = Collection.new(*1..10)
    false_collection = Collection.new(nil, false, 99)

    assert_equal false, collection.all?(&:odd?)
    assert_equal true, collection.all? { |element| element < 11 }
    assert_equal false, collection.all? { |element| element > 20 }
    assert_equal false, false_collection.all?
  end

  def test_each_cons
    array = [1, 2, 3, 1, 5, 7]
    hash = { '3' => '3', '4' => '4', '5' => '5' }

    con_array = array.each_cons(2).all? { |x, y| x < y }
    con_hash = hash.each_cons(2).all? { |(_, x_value), (_, y_value)|  x_value < y_value }

    assert_equal false, con_array
    assert_equal true, con_hash
    # assert_equal true, collection.each_cons.is_a?(Enumerator)
  end

  def test_include?
    collection = Collection.new(*1..10)

    assert_equal true, collection.include?(5)
  end

  def test_count
    collection = Collection.new(*1..10)

    assert_equal 1, collection.count(4)
    assert_equal 0, collection.count(19)
    assert_equal 5, collection.count(&:odd?)
  end

  def test_size
    collection = Collection.new(*1..10)

    assert_equal 10, collection.size
  end

  def test_group_by
    collection = Collection.new(*1..6)
    assert_equal({ 0 => [3, 6], 1 => [1, 4], 2 => [2, 5] }, collection.group_by { |i| i % 3 })

    assert_equal true, collection.group_by.is_a?(Enumerator)
  end

  def test_min
    collection = Collection.new(*1..10)
    word_collection = %w(albatross dog horse)

    assert_equal 'dog', word_collection.min { |a, b| a.length <=> b.length }
    assert_equal 1, collection.min
  end

  def test_min_by
    collection = %w(albatross dog horse)

    assert_equal 'dog', collection.min_by(&:length)
  end

  def test_max
    collection = Collection.new(*1..10)
    word_collection = %w(albatross dog horse)
    assert_equal 'albatross', word_collection.max { |a, b| a.length <=> b.length }
    assert_equal 10, collection.max
  end

  def test_max_by
    collection = Collection.new(*1..10)
    word_collection = %w(albatross dog horse)

    assert_equal 'albatross', word_collection.max_by(&:length)
    assert_equal true, collection.max_by.is_a?(Enumerator)
  end

  def test_minmax
    collection = Collection.new(*1..10)
    word_collection = %w(albatross dog horse)
    assert_equal %w(dog albatross), word_collection.minmax { |a, b| a.length <=> b.length }
    assert_equal [1, 10], collection.minmax
  end

  def test_minmax_by
    collection = Collection.new(*1..10)
    word_collection = %w(albatross dog horse)

    assert_equal %w(dog albatross), word_collection.minmax_by(&:length)
    assert_equal true, collection.minmax_by.is_a?(Enumerator)
  end

  def test_take
    collection = Collection.new(*1..10)

    assert_equal [1, 2, 3], collection.take(3)
  end

  def test_take_while
    collection = [1, 2, 3, 4, 5, 0]

    assert_equal [1, 2], collection.take_while { |i| i < 3 }
    assert_equal true, collection.take_while.is_a?(Enumerator)
  end

  def test_drop
    collection = Collection.new(*1..10)

    assert_equal [9, 10], collection.drop(8)
  end

  def test_drop_while
    collection = [1, 2, 3, 4, 5, 0]

    assert_equal [3, 4, 5, 0], collection.drop_while { |i| i < 3 }
    assert_equal true, collection.drop_while.is_a?(Enumerator)
  end
end
