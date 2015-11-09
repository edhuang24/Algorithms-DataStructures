require "byebug"

class BSTNode
  attr_accessor :val, :left, :right, :parent, :depth

  def initialize(val, parent = nil)
    @val = val
    @left = nil
    @right = nil
    @parent = parent
    @depth = 1 || @parent.depth + 1
  end

  def find_root
    current_node = self

    until current_node.parent.nil?
      current_node = current_node.parent
    end

    current_node
  end

  def find(val)
    current_node = self.find_root

    until current_node.val == val
      if current_node.val < val
        current_node = current_node.right
      else
        current_node = current_node.left
      end
    end

    current_node
  end

  def max
    current_node = self

    until current_node.right.nil?
      current_node = current_node.right
    end

    current_node
  end

  def min
    current_node = self

    until current_node.left.nil?
      current_node = current_node.left
    end

    current_node
  end

  def max_depth
    queue = []
    max_depth = 0
    current_node = self
    queue << current_node

    until queue.empty?
      current_node = queue[0]
      queue << current_node.left if current_node.left
      queue << current_node.right if current_node.right
      max_depth = current_node.depth if current_node.depth > max_depth
      queue.shift
    end

    max_depth
  end

  def insert(val)
    current_node = self.find_root

    until (val < current_node.val && current_node.left.nil?) || (val > current_node.val && current_node.right.nil?)
      if val < current_node.val
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end

    new_node = BSTNode.new(val, parent = current_node)
    val < current_node.val ? current_node.left = new_node : current_node.right = new_node

    new_node
  end

  def delete(val, node = nil)
    node ? current_node = node : current_node = self.find(val)

    # if the current node has two branches, replace the current node with the proper node
    # then recursively call delete on the
    if current_node.left && current_node.right
      left_depth = current_node.left.max_depth
      right_depth = current_node.right.max_depth
      # check depth to pick proper node to switch to keep the node balanced
      # EDIT: this is incorrect!!! balance should be used instead of depth!!!
      if left_depth > right_depth
        # this finds the immediate predecessor
        node_to_switch = current_node.left.max
      else
        # this finds the immediate successor
        node_to_switch = current_node.right.min
      end
      current_node.val = node_to_switch.val
      self.delete(node_to_switch.val, node_to_switch)
    elsif current_node.left || current_node.right
      parent = current_node.parent
      child = current_node.left || current_node.right
      if parent.left.val == current_node.val
        parent.left = child
        child.parent = parent
      else
        parent.right = child
        child.parent = parent
      end
    else current_node.left.nil? && current_node.right.nil?
      parent = current_node.parent

      if parent.left && parent.left.val == current_node.val
        parent.left = nil
      end
      if parent.right && parent.right.val == current_node.val
        parent.right = nil
      end

      current_node.parent = nil
    end
    current_node
  end

  # this method outputs an array representation of the tree to make it easier to visualize it
  def all
    result = []

    queue = []
    current_node = self.find_root
    queue << current_node

    until queue.empty?
      current_node = queue[0]
      result << current_node.val
      # use empty nodes to maintain two-childs for each node so it's easier to read the array output
      if current_node.val != "E"
        if current_node.left
          queue << current_node.left
        else
          # only insert an empty node when the other branch exists
          # prevents excessive empty nodes for external nodes
          queue << BSTNode.new("E", parent = current_node) if current_node.right
        end
        if current_node.right
          queue << current_node.right
        else
          # only insert an empty node when the other branch exists
          # prevents excessive empty nodes for external nodes
          queue << BSTNode.new("E", parent = current_node) if current_node.left
        end
      end
      queue.shift
    end

    result
  end
end

a = BSTNode.new(5)
a.insert(3)
a.insert(7)
a.insert(1)
a.insert(2)
a.insert(6)
a.insert(8)
a.insert(4)
a.insert(9)
p a.all
a.delete(5)
p a.all
