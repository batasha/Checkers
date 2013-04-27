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
    set_pieces(:black, @size - 3)
  end


  def set_pieces(color, row)
    3.times do |x|
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


  def get_piece(pos)
    x, y = pos
    @squares[x][y]
  end


  def black_square?(pos)
    x, y = pos
    if (x % 2 == 0 && y % 2 == 1) || (x % 2 == 1 && y % 2 == 0)
      true
    else
      false
    end
  end


  def dup
    new_board = Board.new(@size)
    @squares.flatten.compact.each do |piece|
      piece.dup(new_board)
    end
    new_board
  end

  def winner?(color)
    moves = []
    pieces = @squares.flatten.compact.select {|piece| piece.color == color}

    pieces.each do |piece|
      moves << piece.slide_moves
      moves << piece.jump_moves
    end

    moves.empty?
  end


end