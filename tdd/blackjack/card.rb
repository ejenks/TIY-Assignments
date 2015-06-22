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

  def all
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
