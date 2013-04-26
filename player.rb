require_relative "piece"
#require_relative "checkers"

class Player

  def get_piece
    print "What piece would you like to move? (x,y) "
    piece = gets.chomp.split(",").map {|el| el.to_i}
  end


  def get_moves
    done = false
    moves = []

    loop do
      print "Please enter next move (x,y) or 'ok' when finished: "
      input = gets.chomp
      return moves if input == "ok"

      moves << input.split(",").map {|el| el.to_i}
    end
  end


  def take_turn(board)
    piece = board.get_piece(self.get_piece)
    moves = self.get_moves

    piece.perform_moves(moves)
  end

end