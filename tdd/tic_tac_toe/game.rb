require './player'

class Game

  attr_accessor :board

  def initialize
    @board = (1..9).to_a
  end

  def display
    puts "Here is the game board:"
    puts "#{@board[0]}|#{@board[1]}|#{@board[2]}\n#{@board[3]}|#{@board[4]}|#{@board[5]}\n#{@board[6]}|#{@board[7]}|#{@board[8]}"
  end
end
