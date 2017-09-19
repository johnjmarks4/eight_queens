require_relative 'chess_board'
require_relative 'queen'
require_relative 'queue'
require_relative 'node'

class Game
  attr_accessor :board

  def initialize
    cb = ChessBoard.new
    @queens = []
    @queue = Queue.new
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
    # Too many nested loops - how to use recursion to fix?
    make_row
    @r = 7
    while @r >= 0
      print_board
      search
    end
  end

  def search
    node = @queue.dequeue
    c = node.col_num
    @board[@r] = node.row
    until in_check?(@r, c) == false
      node = @queue.dequeue
      @board[@r] = node.row
      c += 1
      if c > 7
        return @r += 1
      end
    end
    make_row
    @r -= 1
  end

  def make_row
    8.times do |i|
      ary = Array.new(8).map! { |s| s = " " }
      ary[i] = Queen.new(self)
      node = Node.new(ary, i)
      @queue.enqueue(node)
    end
  end

  def perm_in_check?
    @board.each_with_index do |_, x|
      row.each_with_index do |_, y|
        if board[r][c] == "Q"
          # descending-right: 
          r = x + 1
          c = y + 1
          while r <= 7 && c <= 7
            return true if board[r][c] == "Q"
            c += 1
            r += 1
          end
          # ascending-left:
          r = x + 1
          c = u=y - 1
          while r <= 7 && c >= 0
            return true if board[r][c] == "Q"
            c -= 1
            r += 1
          end
          # descending-left:
          r = x - 1
          c = y - 1
          while r >= 0 && c >= 0
            return true if board[r][c] == "Q"
            c -= 1
            r -= 1
          end
          # descending-right]
          r = x - 1
          c = y + 1
          while r >= 0 && c <= 7
            return true if board[r][c] == "Q"
            c += 1
            r -= 1
          end
        end
      end
    end
    return false
  end

  def in_check?(r, c)
    if @board[r][c].can_take_piece?(r, c)
      true
    else
      false
    end
  end
end

game = Game.new
#game.permutations_strategy
game.start