class BSTNode
  attr_accessor :val, :left, :right, :parent, :depth

  def initialize(val, parent = nil)
    @val = val
    @left = nil
    @right = nil
    @parent = parent
    @depth = 1
  end

  def find_root
    current_node = self
    until current_node.parent.nil?
      current_node = current_node.parent
    end
    current_node
  end

  def find(node)
    current_node = self.find_root
    if node.val == current_node.val
      return current_node
    elsif node.val > current_node.val
      current_node = current_node.right
    else node.val < current_node.val
      current_node = current_node.left
    end
  end

  def max
    current_node = self.find_root
    until current_node.right.nil?
      current_node = current_node.right
    end
    current_node
  end

  def min
    current_node = self.find_root
    until current_node.left.nil?
      current_node = current_node.left
    end
    current_node
  end

  def delete(node)
    current_node = self.find_root
    if node.val == current_node.val
      delete current_node
      # need to finish this method
    elsif node.val > current_node.val
      current_node = current_node.right
    else node.val < current_node.val
      current_node = current_node.left
    end
  end
end
