class Node
  attr_accessor :row, :col_num, :parent, :id

  def initialize(row, col_num, parent)
    @row = row
    @col_num = col_num
    @parent = parent
    @id = [@col_num, @parent]
  end
end