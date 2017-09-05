class Game

  def checked?(board, piece)
    board.board.each_with_index do |row, r|
      row.each_with_index do |square, s|
        if square.class != String && [r, s] != piece
          return true
        end
      end
    end
    return false
  end
end