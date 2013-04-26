class Piece
  attr_accessor :color, :pos, :deltas, :king, :board

  # alias_method king?, :king

  DELTAS = [1, 1], [1, -1]

  def initialize(pos, color, board)
    @pos = pos
    @king = false
    @color = color
    @board = board

    @board.place_piece(self, pos)

  end

  def display
    @color == :white ? "W" : "B"
  end


end