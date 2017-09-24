require_relative 'chess_board'
require_relative 'queen'

board = ChessBoard.new

public

def permutations_strategy
  queens = []
  (0..7).to_a.permutation.to_a.shuffle.each do |ary|
    ary.each_with_index do |num, i|
      board[i][num] = Queen.new(i, num)
      queens << [i, num]
    end
    if queens.length == 8 && in_check?(queens) == false
      show
      return board 
    else
      queens = []
      board.each { |row| row.map! { |square| square = " " } }
    end
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
  return false
end

board.permutations_strategy