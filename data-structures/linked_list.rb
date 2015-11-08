class LinkedList
  def initialize(head)
    @head = Link.new(head)
  end

  def move_to_tail(node)
    current_node = @head

    until current_node.next == node
      current_node = current_node.next
    end

    current_node.next = node.next
    node.next = nil

    until current_node.next.nil?
      current_node = current_node.next
    end

    current_node.next = node
  end
end

class Link
  attr_accessor :val, :next

  def initialize(val, next = nil)
    @val = val
    @next = next
  end
end
