class Node
  attr_accessor :value, :parent, :left_child, :right_child
  
  def initialize(row, column, parent, left_child, right_child)
    @value = value
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end
  
  def value
    @value
  end
  
  def parent
    @parent
  end
  
  def left_child
    @left_child
  end
  
  def right_child
    @right_child
  end

end