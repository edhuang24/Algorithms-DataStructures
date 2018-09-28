# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require 'bst_node'
require 'byebug'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if empty?
      @root = BSTNode.new(value)
    else
      @root.insert(value)
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    if value < tree_node.value
      find(value, tree_node.left)
    elsif value > tree_node.value
      find(value, tree_node.right)
    else
      return tree_node
    end
  end

  def delete(value)
    node = find(value)
    return nil if node.nil?
    # debugger
    if node.left && node.right
      node_to_switch = maximum(node.left)
      node.value = node_to_switch.value
      node_to_switch.value += 0.5
      delete(node_to_switch.value)
    elsif node.left || node.right
      parent = node.parent
      child = node.left || node.right
      if parent.left == node
        parent.left = child
        child.parent = node
      else
        parent.right = child
        child.parent = node
      end
    elsif !node.left && !node.right
      if node.parent && node.parent.left && node.parent.left == node
        node.parent.left = nil
      end
      if node.parent && node.parent.right && node.parent.right == node
        node.parent.right = nil
      end
      node = nil
      @root = nil if node = @root
    end
    node
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if !tree_node.right
    return maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?

    right = depth(tree_node.right)
    left = depth(tree_node.left)

    bigger = [right, left].max

    return bigger + 1
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    balanced = (depth(tree_node.left) - depth(tree_node.right)).abs <= 1
    balanced && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
  end


  private
  # optional helper methods go here:
  def empty?
    return @root.nil?
  end

  def delete_from_tree(tree_node, value)
    return nil if tree_node.nil?

    if tree_node.value == value
      tree_node = remove(tree_node)
    elsif value <= tree_node.value
      tree_node.left = delete_from_tree(tree_node.left, value)
    else
      tree_node.right = delete_from_tree(tree_node.right, value)
    end

    tree_node
  end
end
