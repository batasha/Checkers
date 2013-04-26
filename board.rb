require_relative "piece"

class Board
  attr_accessor :squares, :size

  def initialize(size = 8)
    @size = size
    @squares = Array.new(@size) {Array.new(@size)}
  end

  def display
    @size.times do |x|
      @size.times do |y|
        if @squares[x][y].nil?
          print "_ "
        else
          print @squares[x][y].display + " "
        end
      end
      print "\n"
    end
  end

  def set_board
    set_pieces(:white, 0)

    set_pieces(:black, @size - 2)
  end

  def set_pieces(color, row)
    2.times do |x|
      @size.times do |y|
        Piece.new([(row + x), y], color, self) if black_square?([(row + x), y])
      end
    end
  end

  def place_piece(piece, pos)
    x, y = pos
    @squares[x][y] = piece
    piece.pos = pos
  end

  def remove_piece(pos)
    x, y = pos
    @squares[x][y] = nil
  end

  # def move_piece(from_pos, to_pos)
  #   piece = get_piece(from_pos)
  #   place_piece(piece, to_pos)
  #   remove_piece(from_pos)
  # end


  def get_piece(pos)
    x, y = pos
    @squares[x][y]
  end

  def black_square?(pos)
    x, y = pos
    if x % 2 == 0 && y % 2 == 1 || x % 2 == 1 && y % 2 == 0
      true
    else
      false
    end
  end

  def dup
    new_board = Board.new(@size)
    self.squares.flatten.compact.each do |piece|
      piece.dup(new_board)
    end
    new_board
  end

end