require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './player'
require './board'


class PlayerTest < MiniTest::Test

  def setup
    @board = Board.new
    @player = Player.new("Erik")
  end

  def test_player_exists
    assert Player
  end

  def test_player_can_be_initialized_with_name
    assert_equal "Erik", @player.name
  end

end
