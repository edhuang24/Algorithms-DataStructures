require_relative "static_array"
require "byebug"

class DynamicArray
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.length = 0
    self.capacity = 8
  end

  # O(1)
  def [](index)
    check_index(index)
    self.store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    self.store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" unless self.length > 0

    val = self[length - 1]
    self[length - 1] = nil
    self.length -= 1

    return val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if self.length == self.capacity
    self.length += 1
    self[length - 1] = val

    return nil
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" unless self.length > 0

    val = self[0]
    (1..self.length - 1).each do |i|
      self[i - 1] = self[i]
    end
    self[self.length - 1] = nil
    self.length -= 1

    return val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if self.length == self.capacity
    self.length += 1
    (self.length - 2).downto(0).each do |i|
      self[i + 1] = self[i]
    end
    self[0] = val

    return nil
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index < self.length
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end
