require_relative "player"
require_relative "board"
require_relative "piece"

class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    @board.set_board

    @player1 = Player.new
    @player2 = Player.new
  end

  def run
    puts "Welcome to Checkers!"

    # Need to add methods to parse user input into arrays and call
    # move methods from Board class.
    until game_over?
      @board.display
      piece = @player1.get_piece
      moves = @player1.get_moves

      @board.display
      piece = @player2.get_piece
      moves = @player2.get_moves
    end
  end


  def game_over?
    false

  end

end

def game_over?
  false

end