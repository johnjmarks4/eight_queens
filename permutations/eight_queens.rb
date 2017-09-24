require_relative 'board'
require_relative 'queen'

def permutations_strategy
  chess = Board.new
  queens = []

  (0..7).to_a.permutation.to_a.shuffle.each do |ary|
    ary.each_with_index do |num, i|
      chess.board[i][num] = Queen.new(i, num)
      queens << [i, num]
    end
    if queens.length == 8 && in_check?(queens) == false
      chess.show
    else
      queens = []
      chess.board.each { |row| row.map! { |square| square = " " } }
    end
  end
end

def in_check?(queens)
  nw_diag, se_diag = [], []

  queens.each do |pos|
    nw_diag << (pos[0] + pos[1])
    se_diag << (pos[0] - pos[1])
  end

  [nw_diag, se_diag].any? do |ary|
    ary.length != ary.uniq.length
  end
end

permutations_strategy