require_relative "piece"

class Board
  attr_accessor :grid, :size

  def initialize(size = 8)
    @size = size
    @grid = Array.new(@size) {Array.new(@size)}


  end



  def set_board
    2.times do |x|
      @size.times do |y|
        Piece.new([x, y], :white, self) if black_square?([x, y])
      end
    end

    2.times do |x|
      @size.times do |y|
        Piece.new([(@size - 1 - x), y], :black, self) if black_square?([x, y])
      end
    end
  end

  def place_piece(piece, pos)
    x, y = pos
    @grid[x][y] = piece
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