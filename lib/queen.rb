require_relative 'preferences'

class Queen
  attr_accessor :row, :column, :type, :color, :unicode

  def initialize(row, column)
    # Color is displayed as white by default unless set to black by colorize method
    case Preferences.set_color
    when :none then   @unicode = "\u265B"
    when :white then  @unicode = "\u265B"
    when :black then  @unicode = "\u2655"
    end
    @row = row
    @column = column
  end

  def colorize(color)
    color.downcase!
    if color == "white"
      @unicode = "\u265B"
    elsif color == "black"
      @unicode = "\u2655"
    else
      print "Your color choice could not be recognized.
            Please select either black or white."
      colorize(gets.chomp!)
    end
  end

  def show_moves(game)
    container = []

    #Bishop-like moves

    #descending-right

    row = @row + 1
    column = @column + 1
    while row <= 7 && column <= 7 && game.board[row][column] == " " || row <= 7 && column <= 7 && game.board[row][column].class != String && game.board[row][column].color != @color
      container << [row, column]
      break if game.board[row][column].class != String && game.board[row][column].color != @color
      column += 1
      row += 1
    end

    #descending-left

    row = @row + 1
    column = @column - 1
    while row <= 7 && column >= 0 && game.board[row][column] == " " || row <= 7 && column >= 0 && game.board[row][column].class != String && game.board[row][column].color != @color
      container << [row, column]
      break if game.board[row][column].class != String && game.board[row][column].color != @color
      column -= 1
      row += 1
    end

    #ascending-left

    row = @row - 1
    column = @column - 1
    while row >= 0 && column >= 0 && game.board[row][column] == " " || row >= 0 && column >= 0 && game.board[row][column].class != String && game.board[row][column].color != @color
      container << [row, column]
      break if game.board[row][column].class != String && game.board[row][column].color != @color
      column -= 1
      row -= 1
    end

    #ascending-right

    row = @row - 1
    column = @column + 1
    while row >= 0 && column <= 7 && game.board[row][column] == " " || row >= 0 && column <= 7 && game.board[row][column].class != String && game.board[row][column].color != @color
      container << [row, column]
      break if game.board[row][column].class != String && game.board[row][column].color != @color
      column += 1
      row -= 1
    end

    #Rook-like moves

    column = @column + 1
    while column <= 7 && game.board[@row][column] == " " || column <= 7 && game.board[@row][column].class != String && game.board[@row][column].color != @color
      container << [@row, column]
      break if game.board[@row][column].class != String && game.board[@row][column].color != @color
      column += 1
    end

    column = @column - 1
    while column >= 0 && game.board[@row][column] == " " || column >= 0 && game.board[@row][column].class != String && game.board[@row][column].color != @color
      container << [@row, column]
      break if game.board[@row][column].class != String && game.board[@row][column].color != @color
      column -= 1
    end

    row = @row + 1
    while row <= 7 && game.board[row][@column] == " " || row <= 7 && game.board[row][@column].class != String && game.board[row][@column].color != @color
      container << [row, @column]
      break if game.board[row][@column].class != String && game.board[row][@column].color != @color
      row += 1
    end

    row = @row - 1
    while row >= 0 && game.board[row][@column] == " " || row >= 0 && game.board[row][@column].class != String && game.board[row][@column].color != @color
      container << [row, @column]
      break if game.board[row][@column].class != String && game.board[row][@column].color != @color
      row -= 1
    end

    container
  end
end