require_relative 'queen'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8).map { Array.new(8) }
    @board.each { |rows| rows.map! { |squares| squares = " " } }
  end
  
  def show
    #NOTE: requires unicode-supported font to display pieces. For Windows, try DejaVu Sans Mono.
    print "\n\n  "
    (1..8).to_a.reverse.each do |i|
      r = @board[i-1][0..7].map! { |square| square != " " ? square = square.unicode : square }
      33.times { print "-" }
      puts "\n" + "#{i} " + "| " + r.join(" | ") + " |" + "\n"
      print "  "
    end
    33.times { print "-" }
    puts "\n"
    print "    a   b   c   d   e   f   g   h"
  end
end