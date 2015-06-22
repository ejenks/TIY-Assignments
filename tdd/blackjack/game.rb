require './deck'


class Game

  attr_reader :deck, :winner, :players_hand, :dealers_hand

  def initialize
    @deck = Deck.new
    @winner = nil
    @players_hand = Player.new(@deck.deal, @deck.deal)
    @dealers_hand = Player.new(@deck.deal, @deck.deal)
    puts opening_hand
  end

  def opening_hand
    puts "You drew " + @players_hand.to_s + " for a total of: #{@players_hand.hand_value}\n"
    puts "The dealer drew " + @dealers_hand.to_s + " for a total of: #{@dealers_hand.hand_value}\n"
    print "Would you like to hit or stand? Use h for hit and s for stand: "

    loop do
      hit_or_stand = gets().downcase.strip
      case
      when hit_or_stand == "s"
        stand
        break if winner?
      when hit_or_stand == "h"
        hit!
        break if winner?
      end
    end
  end

  def hit!
    @players_hand.hit(@deck.deal)
    print_updated_value
  end

  def stand
    dealers_turn(@dealers_hand)
    print_updated_value
  end

  def dealers_turn(dealers_hand)
    dealer_hit = @dealers_hand.hit(@deck.deal) if dealers_hand.hand_value < 17
    if dealer_hit
      print "Dealer hits!"
      print_updated_value
    else
      print "Dealer stays"
    end
    winner?(@players_hand, @dealers_hand)
    dealer_hit
  end

  def print_updated_value
    print "Player's hand: " + @players_hand.to_s + " for a total of:  #{players_hand.hand_value}\n"
    print "Dealer's hand: " + @dealers_hand.to_s + " for a total of:  #{dealers_hand.hand_value}\n"
    print "Would you like to hit or stand? Use h for hit and s for stand: "
  end

  def winner?(players_hand, dealers_hand)
    if players_hand.hand_value == 21
      print "BlackJack!"
      if players_hand.hand_value < 21
        @winner = "You"
      elsif dealers_hand.hand_value == 21
        @winner = "Tie"
        print "Push"
      end
    end

    if players_hand.hand_value < 21
      if dealers_hand.hand_value < players_hand.hand_value && dealers_hand.hand_value <= 21
        @winner = "Dealer"
        print "Dealer Wins"
      elsif dealers_hand.hand_value < players_hand.hand_value && dealers_hand.hand_value <= 21
        @winner = "You"
        print "You Win!"
      end
    end

    if players_hand.hand_value > 21
      @winner = "Dealer"
      print "You Bust... Dealer Wins"
    end

    if dealers_hand.hand_value > 21
      @winner = "You"
      print "Dealer Busts... You Win"
    end
  end

  # def game_loop
  #   loop do
  #     puts "Would you like to Hit(h) or Stand(s) ? "
  #     response = gets().downcase.strip
  #     case
  #     when response == "s"
  #       winner?
  #       rotate
  #     when response == "h"
  #       hit!
  #     end
  #   end
  # end
end
