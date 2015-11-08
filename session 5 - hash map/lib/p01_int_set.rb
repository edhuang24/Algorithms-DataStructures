class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
  	if @store[num] == false && num <= @store.length && num > 0
  		@store[num] = true
  	else
  		raise "Out of bounds"
  	end
  end

  def remove(num)
  	@store[num] = false
  end

  def include?(num)
  	@store[num]
  end
end


class IntSet
  def initialize(length = 20)
    @store = Array.new(length) { Array.new }
  end

  def insert(num)
  	@store[num % @store.length] << num
  end

  def remove(num)
  	@store[num % @store.length].delete(num)
  end

  def include?(num)
  	spot = num % @store.length
  	@store[spot].include?(num)
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(length = 20)
  	@store = Array.new(length) { Array.new }
  	@count = 0
  end

  def insert(num)
  	@store[num % @store.length] << num
  	@count += 1
  end

  def remove(num)
  	@store[num % @store.length].delete(num)
  	@count -= 1
  end

  def include?(num)
  	spot = num % @store.length
  	@store[spot].include?(num)
  end

  private

  def resize!
  	if @count == @store.length
  		@old_store = @store
		@store = ResizingIntSet.new(@count * 2) { Array.new }
	end
  end
end
