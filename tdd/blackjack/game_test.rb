require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './game'
require './deck'
require './player'
require './card'

class GameTest < MiniTest::Test

  def setup
    @game = Game.new
  end

  def test_game_exists
    assert Game
  end

  def test_game_can_be_created
    @game = Game.new
    assert @game
  end

  def test_game_has_a_deck
    assert @game.deck
    assert_equal Deck, @game.deck.class
  end

  def test_game_has_no_winner_yet
    refute @game.winner
  end

  def test_player_can_have_initial_hand
    assert @game.players_hand
    assert_equal Player, @game.players_hand.class
  end

  def test_dealer_can_have_initial_hand
    assert @game.dealers_hand
    assert_equal Player, @game.dealers_hand.class
  end

  def test_player_can_hit
    assert @game.hit!
  end

  def test_player_can_stand
    assert @game.stand
  end

end
