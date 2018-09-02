require_relative "static_array"
require "byebug"

class DynamicArray
  attr_reader :length
  attr_accessor :capacity, :store

  def initialize
    self.length = 0
    self.capacity = 8
    self.store = []
  end

  # O(1)
  def [](index)
    check_index(index)
    return store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if length == 0

    val = self[length - 1]
    self[length - 1] = nil
    self.length -= 1

    return val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if length == capacity
      resize!
    end

    self.length += 1
    store[length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if length == 0

    val = store[0]
    (1...length).each do |i|
      store[i - 1] = store[i]
    end
    store[length - 1] = nil

    self.length -= 1

    return val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if length == capacity
      resize!
    end

    i = length
    while i > 0
      store[i] = store[i - 1]
      i -= 1
    end

    self.length += 1

    store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    if index < 0 || index >= length
      raise "index out of bounds"
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    self.capacity = capacity * 2

    self.store = []
    store.each_with_index do |el, idx|
      self.store[idx] = el
    end
  end
end
