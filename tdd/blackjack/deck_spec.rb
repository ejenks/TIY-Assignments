require 'rspec'
require './deck'

describe Deck do

  before :each do
    @deck = Deck.new
  end

  it "should be initialized with 52 cards" do
    expect(@deck)
  end

  it "should be initialized with 52 unique cards" do
    expect(@deck.cards.length).to eq(52)
    expect(@deck.cards.uniq.length).to eq(52)
    expect @deck.cards.all?{|card| card.is_a?(Card)}
  end

  it "should include a shuffled deck" do
    unshuffled_deck = Card.all
    shuffled_deck = @deck.cards
    expect(shuffled_deck != unshuffled_deck)
  end

  it "should deal a card" do
    card = @deck.deal
    expect(card).is_a?(Card)
  end

  it "should remove a card after dealt" do
    card = @deck.deal
    expect(@deck.cards.length).to eq(51)
  end
end
