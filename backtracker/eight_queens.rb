require_relative 'board'
require_relative 'queen'
require 'benchmark'

def solution(n)
  queens = []
  solutions = []
  possible = solution_size(n)
  return error_message if !possible.is_a?(Integer)
  while solutions.length < possible
    queens = []
    while queens.length < n
      queens = []
      queens = search(n-1, n-1, queens)
    end
    solutions << queens
    solutions.uniq!
  end
  solutions.each { |s| show_board(s) }
end

def search(r, c, queens)
  if r < 0
    return queens
  else
    (0..c).to_a.shuffle.each do |i|
      queens << [r, i]
      if in_check?(queens) == false
        break
      else
        queens.pop
      end
    end
    search(r -= 1, c, queens)
  end
end

def solution_size(n)
  sizes = { 
    1 => 1,
    4 => 2,
    5 => 10,
    6 => 4,
    7 => 40,
    8 => 92,
    9 => 352,
    10 => 724,
    11 => 2680,
    12 => 14200,
    13 => 73712,
    14 => 365596,
    15 => 2279184
  }
  if sizes.key?(n)
    sizes[n]
  else
    "N/A"
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

def show_board(queens)
  board_obj = Board.new(queens.length)
  board = board_obj.board

  queens.each { |q| board[q[0]][q[1]] = Queen.new }
  board_obj.show
end

def benchmark(run)
  value = Benchmark.measure { run.times { solution } }
  avg_run_time = value / num
end

def error_message
  puts "This program can only calculate boards up to 15 squares in length."
  puts "In addition, there are no solutions for the numbers 2 and 3."
end

loop do
  puts "\nSelect board-size:"
  puts "\n"
  solution(gets.chomp!.to_i)
end