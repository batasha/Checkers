class Piece
  attr_accessor :color, :pos, :deltas, :king, :board

  alias :king? :king

  DELTAS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def initialize(pos, color, board)
    @pos = pos
    @king = false
    @color = color
    @board = board

    @board.place_piece(self, pos)
  end


  def poss_moves
    if self.king?

    else
      case @color
      when :white
        deltas = DELTAS[0..1]
        moves = []
        x, y = @pos

        deltas.each do |dx, dy|
          moves << [x + dx, y + dy] if @board.squares[x + dx][y + dy].nil?
        end
      when :black
        deltas = DELTAS[2..3]
        moves = []
        x, y = @pos

        deltas.each do |dx, dy|
          moves << [x + dx, y + dy] if @board.squares[x + dx][y + dy].nil?
          moves << [x + (2*dx), y + (2*dy)] if @board.squares[x + dx][y + dy].color != @color
        end
      end
    end
    moves
  end

  def display
    @color == :white ? "W" : "B"
  end


end