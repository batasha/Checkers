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
    slide_moves = []
    case @color

    when :white
      deltas = king? ? DELTAS : DELTAS[0..1]

    when :black
      deltas = king? ? DELTAS : DELTAS[2..3]
    end

    x, y = @pos
    deltas.each do |dx, dy|
      to_pos = [x + dx, y + dy]
      slide_moves << to_pos if @board.get_piece(to_pos).nil?
    end

    slide_moves
  end


  def jump_moves
    jump_moves = []
    jump_deltas = DELTAS.map {|x, y| [x * 2, y * 2]}

    case @color
    when :white
      deltas = king? ? jump_deltas : jump_deltas[0..1]
    when :black
      deltas = king? ? jump_deltas : jump_deltas[2..3]
      x, y = @pos
    end

    deltas.each do |dx, dy|
      to_pos = [x + dx, y + dy]
      jump_pos = [x + (dx / 2), y + (dy / 2)]

      if @board.get_piece(to_pos).nil? &&
        @board.get_piece(jump_pos) && @board.get_piece(jump_pos).color != @color
        jump_moves << to_pos
      end
    end

  jump_moves
  end



  def display
    @color == :white ? "W" : "B"
  end


end