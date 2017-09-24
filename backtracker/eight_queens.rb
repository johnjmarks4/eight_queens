require_relative 'board'
require_relative 'queen'
require 'benchmark'

class Game
  attr_accessor :board

  def initialize
    b = Board.new
    @board_obj = b
    @board = b.board
  end

  def solution
    queens = []
    solutions = []
    r = 7
    while solutions.length < 92
      init = 0
      queens = []
      while queens.length < 7
        queens = []
        queens = search(r, init, queens)
        init += 1
      end
      solutions << queens
      solutions.uniq!
    end
    solutions.each { |s| show_board(s) }
  end

  def search(r, init, queens)
    if r < 0
      return queens
    else
      (init..7).to_a.shuffle.each do |i|
        queens << [r, i]
        if in_check?(queens) == false
          break
        else
          queens.pop
        end
      end
      init = 0
      search(r -= 1, init, queens)
    end
  end

  def in_check?(queens)
    cols, nw_diag, se_diag = [], [], []

    queens.each do |pos|
      cols << pos[1]
      nw_diag << (pos[0] + pos[1])
      se_diag << (pos[0] - pos[1])
    end

    [cols, nw_diag, se_diag].any? do |ary|
      ary.length != ary.uniq.length
    end
  end

  def clear_board
    @board.each { |rows| rows.map! { |squares| squares = " " } }
  end

  def show_board(queens)
    clear_board
    queens.each { |q| @board[q[0]][q[1]] = Queen.new }
    @board_obj.show
  end

  def benchmark(num)
    value = Benchmark.measure { num.times { solution } }
    avg_run_time = value / num
  end
end

game = Game.new
game.solution