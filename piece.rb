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

  #REV the new line between the case and the whens is a little weird.
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
    end

    x, y = @pos

    deltas.each do |dx, dy|
      to_pos = [x + dx, y + dy]
      jumped_pos = self.between(to_pos)

      if @board.get_piece(to_pos).nil? &&
        @board.get_piece(jumped_pos) &&
        @board.get_piece(jumped_pos).color != @color
        
        jump_moves << to_pos
      end
    end

  jump_moves
  end

  #REV this seems more convoluted than it needs to be.
  #    if king is a bool, we don't need to check if itss true before we set it to true
  #    again.
  def king_check
    @king = @king == false && ((@color == :white && @pos[0] == 7) ||
            (@color == :black && @pos[0] == 0))
  end

  def perform_slide(to_pos)
    p "slide_move"
    if self.slide_moves.include?(to_pos)
      @board.remove_piece(@pos)
      @board.place_piece(self, to_pos)
      king_check

    else
      raise InvalidMoveError.new("That is not a valid slide move!")
      p "That is not a valid slide move!"
    end
  end



  def perform_jump(to_pos)
    if self.jump_moves.include?(to_pos)
      jumped_pos = self.between(to_pos)

      @board.remove_piece(@pos)
      @board.remove_piece(jumped_pos)
      @board.place_piece(self, to_pos)
      king_check

    else
      raise InvalidMoveError.new("That is not a valid jump move!")
      p "That is not a valid jump move!"
    end
  end


  def perform_moves(moves)
    self.perform_moves!(moves) if valid_move_seq?(moves)
  end


  def perform_moves!(moves)
    king_crowned = false
 
    if moves.count == 1
      move = moves.flatten

       if (move[0] - @pos[0]).abs == 1
        self.perform_slide(move)
      else
        self.perform_jump(move)
      end

    else
      moves.each do |to_pos|
        if king_crowned # => Tests whether piece was promoted on previous turn
          raise InvalidMoveError.new("You can't move a king after he's crowned!")
        else
          king_crowned = self.perform_jump(to_pos)
        end
      end
    end
  end

  def valid_move_seq?(moves)
    test_board = @board.dup
    test_piece = test_board.get_piece(@pos)
 
    begin
      test_piece.perform_moves!(moves)
      return true
    rescue InvalidMoveError => e
      return false
    end
  end


  def dup(board)
    self.class.new(@pos, @color, board)
  end


  def between(to_pos)
    between_pos = []
    2.times {|i| between_pos << (@pos[i] + to_pos[i]) / 2}
    between_pos
  end


  def display
    @color == :white ? "W" : "B"
  end



end

class InvalidMoveError < ArgumentError

end
