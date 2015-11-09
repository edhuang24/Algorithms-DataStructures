class Queue
  # we will assume that we are using static arrays, which don't have O(1) #shift methods
  def initialize(arr = [])
    @in, @out = arr, []
  end

  def enqueue(val)
    @in.push(val)
  end

  # this #dequeue method is O(1) amortized and O(n) worst case
  def dequeue
    if @out.empty?
      @out.push(@in.pop) until @in.empty?
    end

    @out.pop
  end

  def clear
    @in, @out = [], []
  end

  def empty?
    @in.empty? && @out.empty?
  end

  def size
    @in.size + @out.size
  end

  def inspect
    @out.reverse + @in
  end

  def to_s
    (@out.reverse + @in).to_s
  end

  alias_method :length, :size
  alias_method :push, :enqueue
  alias_method :shift, :dequeue
end

a = Queue.new([1,2,3,4])
a.dequeue
p a
p a.to_s
