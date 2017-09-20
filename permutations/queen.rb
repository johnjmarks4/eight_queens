class Queen
  attr_accessor :row, :column, :unicode

  def initialize(row, column)
    @unicode = "\u265B" #display color as white
    # @unicode = "\u2655" #display color as black
    @row = row
    @column = column
  end
end