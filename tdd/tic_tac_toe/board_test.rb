require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './board'

class BoardTest < MiniTest::Test

  def setup
    @board = Board.new
  end

  def test_board_exists
    assert Board
  end

  def test_instance_of_board
    assert @board
  end

  def test_board_can_be_printed_with_9_spaces
    assert @board.size
  end

  def test_board_has_three_rows
    assert_equal 3, @board.size
  end

end
