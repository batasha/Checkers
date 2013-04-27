require_relative "player"
require_relative "board"


class Game
  attr_accessor :board, :player1, :player2

  def initialize
    @board = Board.new
    @board.set_board
    @board.display

    @player1 = Player.new
    @player2 = Player.new
  end

  def run
    puts "Welcome to Checkers!"

    until self.game_over?
      @player1.take_turn(@board)
      @board.display

      @player2.take_turn(@board)
      @board.display
    end
  end


  def game_over?
    @board.winner?(:white) || @board.winner?(:black)
  end

end

a = Game.new
a.run
