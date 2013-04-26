require_relative "player"
require_relative "board"
require_relative "piece"

class Game
  attr_accessor :board

  def initialize


    @board = Board.new
    @board.set_board
  end

  def run
    puts "Welcome to Checkers!"

    until game_over?
      @board.display


    end

end

def game_over?


end