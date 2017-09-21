require_relative 'board'
require_relative 'queen'

class Game
  attr_accessor :queens

  def initialize
    @board_obj = Board.new
    @board = @board_obj.board
    @queens = []

    @board[7][1] = Queen.new(7, 1)
    @queens << Queen.new(7, 1)
    @board[6][1] = Queen.new(6, 1)
    @queens << Queen.new(6, 1)
  end

  def print_board
    @board_obj.show
  end

  def in_check?
    queen = @queens.last
    remove(queen) if queen.in_check?(@queens)
  end

  def remove(queen)
    @queens.pop
    @board[queen.r][queen.c] = " "
  end
end

game = Game.new
game.print_board
game.in_check?
game.print_board