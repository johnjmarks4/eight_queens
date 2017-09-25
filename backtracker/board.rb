require_relative 'queen'

class Board
  attr_accessor :board

  def initialize(n)
    @board = Array.new(n).map { Array.new(n) }
    @board.each { |rows| rows.map! { |squares| squares = " " } }
  end
  
  def show
    #NOTE: requires unicode-supported font to display pieces. For Windows, try DejaVu Sans Mono.
    print "\n\n  "
    (1..@board.length).to_a.reverse.each do |i|
      r = @board[i-1][0..@board.length - 1].map! { |square| square != " " ? square = square.unicode : square }
      ((4 * @board.length) + 1).times { print "-" }
      puts "\n" + "#{i}".ljust(2) + "| " + r.join(" | ") + " |" + "\n"
      print "  "
    end
    ((4 * @board.length) + 1).times { print "-" }
    puts "\n"
    print "    "
    alph = ("a".."z").to_a
    @board.length.times do |i|
      print alph[i]
      print "   " unless i == @board.length
    end
  end
end