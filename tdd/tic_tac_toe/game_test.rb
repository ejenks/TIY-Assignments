require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './game'


class GameTest < MiniTest::Test

  def setup  ### setup new game. Game is initialized with @board, @players
    @game = Game.new
  end

  def test_game_exists
    assert Game
  end

  def test_game_can_be_created
    assert Game.new
  end

  def test_game_has_board
    assert @board.is_a?(Array)
  end


end
