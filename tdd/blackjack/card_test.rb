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
