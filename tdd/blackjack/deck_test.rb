require 'minitest'
require 'minitest/autorun'
require "./deck"


class DeckTest < MiniTest::Test


  def setup
    @deck = Deck.new
  end

  def test_deck_exists
    assert Deck
  end

  def test_deck_is_initialized_with_cards_in_it
    assert @deck
  end

  def test_deck_has_52_unique_cards
    assert_equal 52, @deck.cards.length
    assert_equal 52, @deck.cards.uniq.length
    assert @deck.cards.all?{|card| card.is_a?(Card)}
  end

  def test_deck_is_shuffled
    unshuffled_cards = Card.all
    shuffled_cards = @deck.cards
    refute_equal unshuffled_cards, shuffled_cards
  end

  def test_deck_deal_a_card
    card = @deck.deal
    assert card.is_a?(Card)
  end

  def test_card_is_removed_after_dealt
    card = @deck.deal
    assert_equal 51, @deck.cards.length
  end
end

require 'minitest'
require "minitest/autorun"
require "./card"

class CardTest < MiniTest::Test

  def setup
    @card = Card.new(2, "Spades")
  end

  def test_a_card_exists
    assert Card
  end

  def test_card_can_be_initialized_with_a_value_and_a_suit
    assert @card
  end

  def test_card_can_have_a_value
    assert_equal 2, @card.value
  end

  def test_card_has_a_suit
    assert_equal "Spades", @card.suit
  end

  def test_king_value_is_10
    @king = Card.new(:King, "Spades")
    assert_equal @king.value, 10
  end

  def test_there_are_52_unique_cards
    assert_equal 52, Card.all.length
    assert_equal 52, Card.all.uniq.length
  end

  def test_card_displays_nicely
    assert_equal "2 of Spades", @card.to_s
  end

  def test_ace_base_value_is_1
    @ace = Card.new(:Ace, "Spades")
    assert @ace
  end

end

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
