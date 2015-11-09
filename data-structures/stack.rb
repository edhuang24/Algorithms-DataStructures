class Stack
  def initialize(arr = [])
    @store = arr
  end

  def push(val)
    @store.push(val)
  end

  def pop(val)
    @store.pop
  end

  def clear
    @store = []
  end

  def empty?
    @store.empty?
  end

  def size
    @store.size
  end

  def inspect
    @store
  end

  def to_s
    @store.to_s
  end

  alias_method :length, :size
end

a = Stack.new([1,2,3,4])
p a
p a.to_s
