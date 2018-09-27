# Implement merge sort.
def mergesort(arr)
  return arr if arr.length < 2

  midpoint = arr.length / 2
  left = arr[0...midpoint]
  right = arr[midpoint..-1]

  merge(mergesort(left), mergesort(right))
end

def merge(left, right)
  merged = []

  while left.length > 0 && right.length > 0
    if left[0] <= right[0]
      merged.push(left.shift)
    else
      merged.push(right.shift)
    end
  end

  return merged + left + right
end

def quicksort(arr)
  return arr if arr.length < 2

  rand_idx = rand(arr.length)
  until rand_idx != 0
    rand_idx = rand(arr.length)
  end
  arr[0], arr[rand_idx] = arr[rand_idx], arr[0]

  pivot = arr.shift
  left, right = []

  arr.each do |num|
    if num < pivot
      left.push(num)
    else
      right.push(num)
    end
  end

  return quicksort(left) + [pivot] + quicksort(right)
end

class Array
  def quicksort!(start_idx = 0, len = self.length)
    return self if len < 2

    self.swap!(start_idx, start_idx + rand(len))

    pivot_idx = partition!(start_idx, len)
    quicksort!(start_idx, pivot_idx - start_idx)
    quicksort!(pivot_idx + 1, len - (pivot_idx + 1) - start_idx)
  end

  def partition!(start_idx, len)
    pivot_idx = start_idx
    i = pivot_idx + 1
    while i < start_idx + len
      if self[i] < self[pivot_idx]
        self.swap!(i, pivot_idx + 1)
        self.swap!(pivot_idx, pivot_idx + 1)
        pivot_idx += 1
      end
      i += 1
    end
    return pivot_idx
  end

  protected
  def swap!(idx1, idx2)
    self[idx1], self[idx2] = self[idx2], self[idx1]
  end
end

class StackNode
  attr_accessor :data, :next

  def initialize(data = nil, next = nil)
    @data = data
    @next = next
  end
end

class Stack
  attr_accessor :top

  def initialize(top = nil)
    @top = top
  end

  def empty?
    return top.nil?
  end

  def peek
    raise "empty Stack" if empty?
    return top.data
  end

  def push(node)
    top.next = node
    top = node
  end

  def pop
    raise "empty Stack" if empty?
    data = top.data
    top = top.next
    return data
  end
end

class QueueNode
  attr_accessor :data, :next

  def initialize(data = nil, next = nil)
    @data = data
    @next = next
  end
end

class Queue
  attr_accessor :first, :last

  def initialize(first = nil, last = nil)
    @first = first
    @last = last
  end

  def empty?
    return first.nil?
  end

  def peek
    raise "empty Queue" if empty?
    return first.data
  end

  def push(node)
    if last
      last.next = node
    end
    last = node
    if first.nil?
      first = last
    end
  end

  def shift
    raise "empty Queue" if empty?
    data = first.data
    first = first.next
    if first.nil?
      last = nil
    end
    return data
  end
end

# def mergesort(arr)
#   return arr if arr.length < 2
#
#   midpt = arr.length / 2
#   left = arr[0...midpt]
#   right = arr[midpt..-1]
#
#   return merge(mergesort(left), mergesort(right))
# end
#
# def merge(left, right)
#   merged = []
#
#   while left.length > 0 && right.length > 0
#     if left[0] < right[0]
#       merged.push(left.shift)
#     else
#       merged.push(right.shift)
#     end
#   end
#
#   return merged + left + right
# end

# class array
#   def quicksort!(start_idx = 0, len = self.length)
#     return self if len < 2
#
#     swap!(start_idx, start_idx + rand(len))
#     pivot_idx = partition!(start_idx, len)
#
#     quicksort!(start_idx, pivot_idx)
#     quicksort!(pivot_idx + 1, len - (pivot_idx + 1) - start_idx)
#   end
#
#   def partition!(start_idx, len)
#     pivot_idx = start_idx
#     i = pivot_idx + 1
#     while i < start_idx + len
#       if self[i] < self[pivot_idx]
#         swap!(i, pivot_idx + 1)
#         swap!(pivot_idx, pivot_idx + 1)
#         pivot_idx += 1
#       end
#       i += 1
#     end
#     return pivot_idx
#   end
#
#   def swap!(idx1, idx2)
#     self[idx1], self[idx2] = self[idx2], self[idx1]
#   end
# end

def BSTNode
  attr_accessor :val, :left, :right, :parent, :depth

  def initialize(val, parent = nil)
    @val = val
    @left = nil
    @right = nil
    @parent = parent
    @depth = @parent? @parent.depth + 1 : 1
  end

  def find_root
    current_node = self

    until current_node.parent.nil?
      current_node = current_node.parent
    end

    return current_node
  end

  def find(val)
    current_node = find_root

    until current_node.val == val
      if current_node.val < val
        current_node = current_node.right
      else
        current_node - current_node.left
      end
    end

    return current_node
  end

  def min
    current_node = self

    until current_node.left.nil?
      current_node = current_node.left
    end

    return current_node
  end

  def max
    current_node = self

    until current_node.right.nil?
      current_node = current_node.right
    end

    return current_node
  end

  def max_depth
    queue = []
    max_depth = 0
    current_node = self
    queue.push(current_node)

    until queue.empty?
      current_node = queue[0]
      queue.push(current_node.left) if current_node.left
      queue.push(current_node.right) if current_node.right
      if current_node.depth > max_depth
        max_depth = current_node.depth
      end
      queue.shift
    end

    max_depth
  end

  def insert(val)
    current_node = find_root

    until (val < current_node.val && current_node.left.nil?) || (val > current_node.val && current_node.right.nil?)
      if val < current_node.val
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end

    new_node = BSTNode.new(val)
    val < current_node.val ? current_node.left = new_node : current_node.right = new_node

    return new_node
  end

  def delete(val)

  end
end

def HashMap
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def num_buckets
    @store.length
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end

  def include?(key)
    bucket(key).include?(key)

    # LinkedList.include?(key):
    # bucket_list = bucket(key)
    # node = bucket_list.head
    # until node == bucket_list.tail
    #   if node.key == key
    #     return true
    #   end
    #   node = node.next
    # end
    # return false
  end

  def set(key, val)
    resize! if @count >= num_buckets

    bucket_list = bucket(key)
    if bucket_list.include?(key)
      bucket_list.update(key, val)
    else
      bucket_list.append(key, val)
      @count += 1
    end

    # LinkedList.update(key, val):
    # node = bucket_list.head
    # until node == bucket_list.tail
    #   if node.key == key
    #     node.val = val
    #     return node
    #   end
    #   node = node.next
    # end

    # LinkedList.append(key, val):
    # new_node = Node.new(key, val)
    # new_node.prev = tail.prev
    # tail.prev.next = new_node
    # new_node.next = tail
    # tail.prev = new_node
  end

  def get(key)
    bucket(key).get(key)

    # LinkedList.get(key):
    # bucket_list = bucket(key)
    # node = bucket_list.head
    # until node == tail
    #   if node.key == key
    #     return val
    #   end
    #   node = node.next
    # end
    # return nil
  end

  def delete(key)
    removed_key = bucket(key).delete(key)
    count -= 1
    return removed_key

    # LinkedList.delete(key):
    # bucket_list = bucket(key)
    # node = bucket_list.head
    # until node = tail
    #   if node.key == key
    #     node.prev.next = node.next if node.prev
    #     node.next.prev = node.prev if node.next
    #     node.prev = nil
    #     node.next = nil
    #     return node
    #   end
    #   node = node.next
    # end
    # return nil
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { LinkedList.new }

    old_store.each do |bucket_list|
      bucket_list.each do |node|
        set(node.key, node.val)
      end
    end
  end

  alias_method :[], :get
  alias_method :[]=, :set
end
