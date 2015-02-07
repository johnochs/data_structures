##Simple implementation of an unbalanced binary tree

class Node
  attr_accessor :parent, :l_child, :r_child
  
  def initialize(options = {})
    @value = options[:value]
    @parent = options[:parent]
    @l_child = options[:l_child]
    @r_child = options[:r_child]
  end
  
end

class BinaryTree
  
  def initialize(value)
    if value.is_a?(Array)
      @root = Node.new(value: value.first)
      value[1..-1].each { |val| insert(val) }
    else
      @root
    end
    @root
  end
  
  def insert(value)
    
  end
  
  
end