require_relative 'game'
require_relative 'chess_board'
require_relative 'queen'

board = ChessBoard.new
board.add_piece
pieces = []
board.board.each_with_index do |row, r|
  row.each_with_index do |square, s|
    if square.class != String
      pieces << [r, s]
    end
  end
end
puts pieces.any? { |piece| board.checked?(board, piece) }
#pieces.map! { |square| board.output(square) }
#puts pieces.inspect
board.show