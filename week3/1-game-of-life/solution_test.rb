require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_board_initialization
    # board = GameOfLife::Board.new [1, 2], [1, 3], [5, 6]

    # assert true,
  end

  def test_is_alive?
    board = GameOfLife::Board.new [1, 2], [1, 3], [5, 6]

    assert_equal true, board[1, 2]
    assert_equal false, board[0, 2]
  end

  def test_is_enumerable?
    board = GameOfLife::Board.new [1, 2]
    alive_result = 'The cell at ([1, 2]) is alive'
    alive_data = ''
    board.each do |x|
      alive_data = "The cell at (#{x[0]}) is alive"
    end
    assert_equal alive_result, alive_data
  end

  def test_count
    board = GameOfLife::Board.new [1, 2], [1, 3], [5, 6]

    assert_equal 3, board.count
  end

  def test_next_generation
    board    = GameOfLife::Board.new [1, 2], [1, 3], [1, 4]
    next_gen = board.next_generation

    assert_equal false, next_gen[1, 2]
    assert_equal true, next_gen[0, 3]
    assert_equal true, next_gen[2, 3]
  end
end
