require_relative 'game'
require_relative 'chess_board'
require_relative 'queen'

board = ChessBoard.new
board.place_queens
board.show