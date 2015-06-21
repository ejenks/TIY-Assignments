require 'rspec'
require './card'

describe Card do

  before :each do
    @card = Card.new(5, "Clubs")
  end

  it "should initialize with a value and suit" do
    expect(@card.suit).to eq("Clubs")
    expect(@card.value).to eq(5)
  end

  it "should have a value of 10 for face cards" do
    face_cards = ["King", "Queen", "Jack"]
    face_cards.each do |face|
      card = Card.new("Spades", face)
      expect(card.value).to eq(10)
    end
  end

  it "should display nicely" do
    expect(@card.to_s).to eq("5 of Clubs")
  end

end
