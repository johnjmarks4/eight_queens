require_relative 'queen'

class ChessBoard < Game
  attr_accessor :board

  def initialize
    @board = Array.new(8).map { Array.new(8) }
    @board.each { |rows| rows.map! { |squares| squares = " " } }
  end
  
  def show
    #NOTE: requires unicode-supported font to display pieces. For Windows, try DejaVu Sans Mono.
    row1 = @board[0][0..7].map! { |square| square != " " ? square = square.unicode : square }
    row2 = @board[1][0..7].map! { |square| square != " " ? square = square.unicode : square }
    row3 = @board[2][0..7].map! { |square| square != " " ? square = square.unicode : square }
    row4 = @board[3][0..7].map! { |square| square != " " ? square = square.unicode : square }
    row5 = @board[4][0..7].map! { |square| square != " " ? square = square.unicode : square }
    row6 = @board[5][0..7].map! { |square| square != " " ? square = square.unicode : square }
    row7 = @board[6][0..7].map! { |square| square != " " ? square = square.unicode : square }
    row8 = @board[7][0..7].map! { |square| square != " " ? square = square.unicode : square }
    print "\n\n  "
    33.times { print "-" }
    puts "\n" + "8 " + "| " + row8.join(" | ") + " |" + "\n"
    print "  "
    33.times { print "-" }
    puts "\n" + "7 " + "| " + row7.join(" | ") + " |" + "\n"
    print "  "
    33.times { print "-" }
    puts "\n" + "6 " + "| " + row6.join(" | ") + " |" + "\n"
    print "  "
    33.times { print "-" }
    puts "\n" + "5 " + "| " + row5.join(" | ") + " |" + "\n"
    print "  "
    33.times { print "-" }
    puts "\n" + "4 " + "| " + row4.join(" | ") + " |" + "\n"
    print "  "
    33.times { print "-" }
    puts "\n" + "3 " + "| " + row3.join(" | ") + " |" + "\n"
    print "  "
    33.times { print "-" }
    puts "\n" + "2 " + "| " + row2.join(" | ") + " |" + "\n"
    print "  "
    33.times { print "-" }
    puts "\n" + "1 " + "| " + row1.join(" | ") + " |" + "\n"
    print "  "
    33.times { print "-" }
    puts "\n"
    print "    a   b   c   d   e   f   g   h"
  end

  def search
    queens = 0
    (0..7).to_a.permutation.to_a.each do |ary|
      # check each permutation for diagonals
      ary.each_with_index do |num, i|
        @board[i][num] = Queen.new(i, num)
        queens += 1
      end
      if queens == 8 && checked? == false
        show
        return @board 
      else
        queens = 0
        @board.each { |row| row.map! { |square| square = " " } }
      end
    end
  end

  def checked?
    @board.each do |row|
      row.each do |square|
        if square.class == Queen
          # descending-right: 
          r = square.row + 1
          c = square.column + 1
          while r <= 7 && c <= 7
            return true if @board[r][c].class == Queen
            c += 1
            r += 1
          end
          # ascending-left:
          r = square.row + 1
          c = square.column - 1
          while r <= 7 && c >= 0
            return true if @board[r][c].class == Queen
            c -= 1
            r += 1
          end
          # descending-left:
          r = square.row - 1
          c = square.column - 1
          while r >= 0 && c >= 0
            return true if @board[r][c].class == Queen
            c -= 1
            r -= 1
          end
          # descending-right]
          r = square.row - 1
          c = square.column + 1
          while r >= 0 && c <= 7
            return true if @board[r][c].class == Queen
            c += 1
            r -= 1
          end
        end
      end
    end
    return false
  end
end