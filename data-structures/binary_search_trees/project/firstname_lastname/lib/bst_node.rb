class BSTNode
  attr_accessor :value, :left, :right, :parent, :depth

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end

  def insert(value)
    if value < self.value
      if self.left
        @left.insert(value)
      else
        @left = BSTNode.new(value)
        @left.parent = self
      end
    else
      if self.right
        @right.insert(value)
      else
        @right = BSTNode.new(value)
        @right.parent = self
      end
    end
  end
end
