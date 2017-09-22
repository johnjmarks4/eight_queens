require_relative 'board'
require_relative 'queen'

class Game
  attr_accessor :queens

  def initialize
    @board_obj = Board.new
    @board = @board_obj.board
    @queens = []

    #@board[7][1] = Queen.new(7, 1)
    #@queens << Queen.new(7, 1)
    #@board[6][1] = Queen.new(6, 1)
    #@queens << Queen.new(6, 1)
  end

  def solution
    @r = 7
    #while @r > 0
    2.times do
      success = search
      if success == true
        @r -= 1
      else
        @r += 1
      end
    end
  end

  def search#(row)
    8.times do |c|
      @board[@r][c] = Queen.new(@r, c)
      @queens << Queen.new(@r, c)
      if in_check? != true
        return true
      end
    end
    false
  end

  def print_board
    @board_obj.show
  end

  def in_check?
    queen = @queens.last
    if queen.in_check?(@queens)
      remove(queen)
      true
    else
      false
    end
  end

  def remove(queen)
    @queens.pop
    @board[queen.r][queen.c] = " "
  end
end

game = Game.new
game.print_board
game.solution
game.print_board