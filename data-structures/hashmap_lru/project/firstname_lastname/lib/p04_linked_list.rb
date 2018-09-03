require "byebug"

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    node = @head.next
    until node == @tail
      if node.key == key
        return node.val
      end
      node = node.next
    end

    return nil
  end

  def include?(key)
    node = @head.next
    until node == @tail
      if node.key == key
        return true
      end
      node = node.next
    end

    return false
  end

  def append(key, val)
    new_node = Node.new(key, val)

    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev = new_node

    return new_node
  end

  def update(key, val)
    node = @head.next
    until node == @tail
      if node.key == key
        node.val = val
        return node
      end
      node = node.next
    end
  end

  def remove(key)
    node = @head.next
    until node == @tail
      if node.key == key
        node.remove
        return node.val
      end
      node = node.next
    end
  end

  def each
    current_node = @head.next
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
