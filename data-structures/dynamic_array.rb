class DynamicArray
  def initialize(size = 8)
    @store = StaticArray.new(size)
    @start_idx = 0
    @count = 0
    @cap = size
  end

  def idx(i)
    (@start_idx + i) % @cap
  end

  def [](i)
    @store[idx(i)]
  end

  def []=(i, val)
    @store[idx(i)] = val
  end

  def push(val)
    resize! if @count == @cap
    @store[last_el_idx] = val
    @count += 1
    @store
  end

  def pop
    val = self[last_el_idx]
    @count -= 1
    val
  end

  def shift
    val = self[@start_idx]
    @start_idx += 1
    @count -= 1
    val
  end

  def unshift(val)
    resize! if @count == @cap
    i = (@start_idx - 1) % @cap
    @store[i] = val
    @count += 1
    @start_idx = i
    @store
  end

  def resize!
    new_store = StaticArray.new(@cap * 2)
    @cap.times do |i|
      new_store[i] = self[i]
    end
    @cap = @cap * 2
    @store = new_store
    @start_idx = 0
  end

  private
  def last_el_idx
    (@start_idx + @count) % @cap
  end
end
