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

    until game_over?
      @board.display
      piece = @player1.get_piece
      moves = @player2.get_moves


    end

end

def game_over?


end