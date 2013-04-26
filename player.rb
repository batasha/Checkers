class Player

  def get_piece
    print "What piece would you like to move? (x,y) "
    input = gets.chomp
    piece = input.split(",").map {|el| el.to_i}
  end

  def get_moves
    done = false
    moves = []

    loop do
      print "Please enter next move (x,y) or 'ok' when finished: "
      input = gets.chomp
      return if input == "ok"

      moves << input.split(",").map {|el| el.to_i}
    end
  end

end