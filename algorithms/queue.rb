class Queue
  def initialize
    @store = Array.new
  end

  def dequeue
    @store.pop
  end

  def enqueue(element)
    @store.unshift(element)
    self
  end

  def size
    @store.size
  end
end

class StaticQueue
  def initialize(size)
  end

  def dequeue
  end

  def enqueue(element)
  end

  def size
  end

  private

  def full?
  end

  def empty?
  end
end
