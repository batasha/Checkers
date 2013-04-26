class Board
  attr_accessor :grid, :size

  def initialize(size = 8)
    @grid = Array.new(8) {Array.new(8)}


  end

  def set_board
    2.times do [x]
      (@size).times do [y]
        @grid[x][y] = Piece.new([x, y], :white, self) if black_square?([x, y])
      end
    end

    2.times do [x]
      (@size).times do [y]
        @grid[@size - 1 - x][y] = Piece.new([x, y], :black, self) if black_square?([x, y])
      end
    end
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