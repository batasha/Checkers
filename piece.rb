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


  def slide_moves
    if self.king?

    else
      slide_moves = []
      case @color

      when :white
        deltas = king? ? DELTAS : deltas = DELTAS[0..1]

      when :black
        deltas = king? ? DELTAS : deltas = DELTAS[2..3]
      end

      x, y = @pos
      deltas.each do |dx, dy|
        slide_moves << [x + dx, y + dy] if @board.squares[x + dx][y + dy].nil?
      end
     end

    slide_moves
  end

  def jump_moves
      case @color

      when :white
        deltas = king? ? DELTAS : deltas = DELTAS[0..1]
        x, y = @pos

        deltas.each do |dx, dy|
          slide_moves << [x + dx, y + dy] if @board.squares[x + dx][y + dy].nil?
        end

      when :black
        deltas = king? ? DELTAS : deltas = DELTAS[2..3]
        x, y = @pos

        deltas.each do |dx, dy|
          slide_moves << [x + dx, y + dy] if @board.squares[x + dx][y + dy].nil?
        end
      end
    end

    slide_moves
  end



# elsif @board.get_piece([x + dx, y + dy]).color != @color
#   jumps << [x + (2*dx), y + (2*dy)]


  def display
    @color == :white ? "W" : "B"
  end


end