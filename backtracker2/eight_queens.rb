require_relative 'board'
require_relative 'queen'

class Game
  attr_accessor :board

  def initialize
    b = Board.new
    @board_obj = b
    @board = b.board
  end

  def solution
    @queens = []
    r = 7
    init = 0
    while @queens.length < 7
      search(r, init)
      init += 1
    end
    show_board
  end

  def show_board
    @queens.each { |q| @board[q[0]][q[1]] = Queen.new }
    @board_obj.show
  end

  def search(r, init)
    if r == 0
      return
    else
      (init..7).to_a.each do |i|
        @queens << [r, i]
        if in_check? == false
          break # not return, right?
        else
          @queens.pop
        end
      end
      if r < 7 then init = 0 end
      search(r -= 1, init)
    end
  end

  def in_check?
    sums = []
    @queens.each do |pos|
      sums << pos[1]
    end
    if sums.length != sums.uniq.length
      return true
    end

    sums = []
    @queens.each do |pos|
      sums << (pos[0] + pos[1])
    end
    if sums.length != sums.uniq.length
      return true
    end

    sums = []
    @queens.each do |pos|
      sums << (pos[0] - pos[1])
    end
    if sums.length != sums.uniq.length
      return true
    end
    false
  end
end

game = Game.new
game.solution