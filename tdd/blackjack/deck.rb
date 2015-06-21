class Deck

  def initialize
    @cards = Card.all.shuffle!
  end

  def cards
    @cards
  end

  def deal
    @cards.shift
  end

end


class Card

  attr_reader :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def value
    if @value.is_a?(Integer)
      @value
    else
      if @value == :Ace
        1
      else
        10
      end
    end
  end

  def self.all
    nested_cards = [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10 , :Jack, :Queen, :King].map do |value|
                    ["Spades", "Clubs", "Hearts", "Diamonds"].map do |suit|
                      Card.new(value, suit)
      end
    end
    nested_cards.flatten
  end

  def to_s
    "#{@value} of #{@suit}"
  end
end

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
