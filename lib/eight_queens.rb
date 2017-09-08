require_relative 'chess_board'
require_relative 'queen'

board = ChessBoard.new

public

def permutations_strategy
  queens = 0
  (0..7).to_a.permutation.to_a.shuffle.each do |ary|
    ary.each_with_index do |num, i|
      board[i][num] = Queen.new(i, num)
      queens += 1
    end
    if queens == 8 && checked? == false
      show
      return board 
    else
      queens = 0
      board.each { |row| row.map! { |square| square = " " } }
    end
  end
end

def checked?
  board.each do |row|
    row.each do |square|
      if square.class == Queen
        # descending-right: 
        r = square.row + 1
        c = square.column + 1
        while r <= 7 && c <= 7
          return true if board[r][c].class == Queen
          c += 1
          r += 1
        end
        # ascending-left:
        r = square.row + 1
        c = square.column - 1
        while r <= 7 && c >= 0
          return true if board[r][c].class == Queen
          c -= 1
          r += 1
        end
        # descending-left:
        r = square.row - 1
        c = square.column - 1
        while r >= 0 && c >= 0
          return true if board[r][c].class == Queen
          c -= 1
          r -= 1
        end
        # descending-right]
        r = square.row - 1
        c = square.column + 1
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

board.permutations_strategy