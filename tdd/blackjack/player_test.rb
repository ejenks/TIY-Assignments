require 'minitest'
require 'minitest/autorun'
require './player'

class PlayerTest < MiniTest::Test

  def setup
    @player = Player.new(Card.new(5, "Hearts"), Card.new(6, "Spades"))
  end

  def test_player_exists
    assert Player
  end

  def test_new_player_has_two_cards
    assert_equal 2, @player.cards.length
    assert @player.cards.all?{|card| card.is_a?(Card)}
  end

  def test_5_and_6_have_value_of_11
    assert_equal 11, @player.hand_value
  end

  def test_value_should_be_15_with_face_and_5
    @player = Player.new(Card.new(:King, "Clubs"), Card.new(5, "Spades"))
    assert_equal 15, @player.hand_value
  end

  def test_value_should_be_16_with_ace_and_5
    @player = Player.new(Card.new(:Ace, "Clubs"), Card.new(5, "Spades"))
    assert_equal 16, @player.hand_value
  end

  def test_value_2_if_opening_hand_is_two_aces
    @player = Player.new(Card.new(:Ace, "Clubs"), Card.new(:Ace, "Spades"))
    assert_equal 12, @player.hand_value
  end

  def test_player_can_hit
    assert @player.hit(Card.new(2, "Diamonds"))
  end

  def test_5_6_and_ace_will_equal_12
    @player = Player.new(Card.new(:Ace, "Clubs"), Card.new(5, "Spades"))
    @player.hit(Card.new(6, "Diamonds"))
    assert_equal 12, @player.hand_value
  end

  def test_ace_ace_ace_ace_will_equal_14
    @player = Player.new(Card.new(:Ace, "Clubs"), Card.new(:Ace, "Spades"))
    @player.hit(Card.new(:Ace, "Diamonds"))
    @player.hit(Card.new(:Ace, "Spades"))
    assert_equal 14, @player.hand_value
  end

  def test_player_cards_will_be_displayed
    assert @player.hand_value.to_s
  end

end
