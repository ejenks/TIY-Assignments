require './deck'

class Player
  attr_reader :cards

  def initialize(card_1, card_2)
    @cards = []
    @cards << card_1
    @cards << card_2
  end

  def hand_value
    value = @cards.inject(0) {|sum, card| sum + card.value}
    handle_aces(value)
  end

  def aces
    @cards.count {|card| card.value == 1}
  end

  def handle_aces(v)
    if aces >= 1
      v += 10 unless v + 10 > 21
    end
    v
  end

  def hit(card)
    @cards << card
  end

  def to_s
    @cards.map { |card| card.to_s }.join(", ")
  end

end
