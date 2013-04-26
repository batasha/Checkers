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
  end

  def remove_piece(piece)
    x, y = piece.pos
    @squares[x][y] = nil

  def move_piece(from_pos, to_pos)
    x, y = from_pos
    dx, dy = to_pos




  end

  def black_square?(pos)
    x, y = pos
    if x % 2 == 0 && y % 2 == 1 || x % 2 == 1 && y % 2 == 0
      true
    else
      false
    end
  end



end