require_relative 'chess_board'
require_relative 'queen'
require_relative 'queue'
require_relative 'node'

class Game
  attr_accessor :board

  def initialize
    cb = ChessBoard.new
    @queue = Queue.new
    @board_obj = cb
    @board = cb.board
    @r = 7
    @node_values = []
    @current_child = []
    @current_child = make_child
  end

  def print_board
    @board_obj.show
  end

  def search
    # Is this depth first? If it was depth first, wouldn't you backtrack after a single check?
    # Gets stuck in certain places. Need to record node values in own variable.
    until @current_child.empty?
      node = @current_child.pop
      @node_values << node.id
      @board[@r] = node.row
      if @board[@r][node.col_num].can_take_piece?(@r, node.col_num, self) == false
        if @r == 0
          print_board
          return @board
        else
          forward
        end
      end
    end
    backtrack
    search
  end

  def backtrack
    @board[@r] = Array.new(8).map! { |s| s = " " }
    until @current_child.empty? == false
      if @queue.queue.empty?
        child = make_child
        @current_child = child.select { |r| !@node_values.include?(r.id) }
      else
        @current_child = @queue.dequeue
      end
    end
    @r += 1
  end

  def forward
    @queue.enqueue(@current_child)
    child = make_child
    @current_child = child.select { |r| !@node_values.include?(r.id) }
    @r -= 1
  end

  def make_child
    8.times do |i|
      ary = Array.new(8).map! { |s| s = " " }
      ary[i] = Queen.new
      parent = []
      @board.each { |r| parent << r }
      node = Node.new(ary, i, parent)
      @current_child << node
      @current_child = @current_child.shuffle
    end
    @current_child
  end
end

game = Game.new
game.search