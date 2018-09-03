require "byebug"

class LinkedList
  attr_reader :head

  def initialize(head)
    # @head = Link.new(head)
    @head = head
  end

  def shift(node)
    node.nxt = head
    @head = node
  end

  def push(node)
    current_node = head

    until current_node.nxt == node
      current_node = current_node.nxt
    end

    current_node.nxt = node
  end

  def insert_after(target_node, new_node)
    current_node = head

    until current_node == target_node
      current_node = current_node.nxt
    end

    new_node.nxt = current_node.nxt
    current_node.nxt = new_node
  end

  def remove_after(target_node)
    current_node = head

    until current_node == target_node
      current_node = current_node.nxt
    end

    next_node = current_node.nxt
    current_node.nxt = next_node.nxt
    next_node.nxt = nil
  end

  def move_to_tail(node)
    current_node = head

    until current_node.nxt == node
      current_node = current_node.nxt
    end

    current_node.nxt = node.nxt
    node.nxt = nil

    until current_node.nxt.nil?
      current_node = current_node.nxt
    end

    current_node.nxt = node
  end
end

class Link
  attr_accessor :val, :nxt

  def initialize(val, nxt = nil)
    @val = val
    @nxt = nxt
  end
end

link5 = Link.new(5, nil)
link4 = Link.new(4, link5)
link3 = Link.new(3, link4)
link2 = Link.new(2, link3)
link1 = Link.new(1, link2)
list = LinkedList.new(link1)

list.move_to_tail(link2)
values = []
node = list.head
while node.nxt
  values << node.val
  node = node.nxt
end
values << node.val
p values

list.remove_after(link3)
values = []
node = list.head
while node.nxt
  values << node.val
  node = node.nxt
end
values << node.val
p values

list.insert_after(link5, link4)
values = []
node = list.head
while node.nxt
  values << node.val
  node = node.nxt
end
values << node.val
p values

link6 = Link.new(6, nil)
list.shift(link6)
values = []
node = list.head
while node.nxt
  values << node.val
  node = node.nxt
end
values << node.val
p values
