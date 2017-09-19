require_relative 'chess_board'
require_relative 'queen'

class Game
  attr_accessor :board

  def initialize
    cb = ChessBoard.new
    @queens = []
    @board_obj = cb
    @board = cb.board
    @s_row = @board[0]
  end

  def print_board
    @board_obj.show
  end

  def permutations_strategy
    @queens = []
    (0..7).to_a.permutation.to_a.shuffle.each do |ary|
      ary.each_with_index do |num, i|
        @board[i][num] = Queen.new(i, num, self)
        @queens << @board[i][num]
      end
      if @queens.length == 8 && in_check? == false
        print_board
        return @board 
      else
        @queens = []
        @board.each { |row| row.map! { |square| square = " " } }
      end
    end
  end

  def start
    c = 7
    @r = 0
    while @r < 7
      rec_search(c)
    end
  end

  def rec_search(c)
    if c < 0
      @s_row = @board[@r -= 1]
    else
      @s_row[c] = Queen.new(@r, c, self)
      @board[@r] = @s_row
      if in_check?
        @board[@r][c] = " "
        @s_row = @board[@r]
        rec_search(c - 1)
      else
        @queens << @s_row[c]
        @s_row = @board[@r += 1]
      end
    end
  end

  def perm_in_check?
    @board.each do |row|
      row.each do |square|
        if square.class == Queen
          # descending-right: 
          r = square.r + 1
          c = square.c + 1
          while r <= 7 && c <= 7
            return true if board[r][c].class == Queen
            c += 1
            r += 1
          end
          # ascending-left:
          r = square.r + 1
          c = square.c - 1
          while r <= 7 && c >= 0
            return true if board[r][c].class == Queen
            c -= 1
            r += 1
          end
          # descending-left:
          r = square.r - 1
          c = square.c - 1
          while r >= 0 && c >= 0
            return true if board[r][c].class == Queen
            c -= 1
            r -= 1
          end
          # descending-right]
          r = square.r - 1
          c = square.c + 1
          while r >= 0 && c <= 7
            return true if board[r][c].class == Queen
            c += 1
            r -= 1
          end
        end
      end
    end
    return false
  end

  def in_check?
    @queens.each do |q|
      return true if q.can_take_piece? == true
    end
    false
  end
end

game = Game.new
#game.permutations_strategy
game.start
game.print_board