class ArraySet
  def initialize
    @store = []
  end

  # O(n)
  def include?(el)
    @store.any? { |x| x == el }
  end

  # O(n)
  def insert(el)
    return false if include?(el)
    @store << el
    true
  end

  # O(n)
  def delete(el)
    @store.each_with_index do |x, idx|
      if x == el
        @store.delete_at(idx)
        return true
      end
    end
    false
  end
end

class MaxIntSet
  # Space complexity: O(max)
  # This is not ideal
  def initialize(max)
    @store = Array.new(max, false)
  end

  # O(1)
  def include?(num)
    @store[num]
  end

  # O(1)
  def insert(num)
    @store[num] = true
  end

  # O(1)
  def delete(num)
    @store[num] = false
  end
end

class IntSet
  # Space complexity: O(n)
  def initialize
    @buckets = Array.new(8) { [] }
  end

  # O(n)
  def include?(num)
    bucket = @buckets[num % @buckets.length]
    bucket.include?(num)
  end

  # O(n)
  def insert(num)
    return false if include?(num)
    bucket = @buckets[num % @buckets.length]
    bucket << num
    true
  end

  # O(n)
  def delete(num)
    return false unless include?(num)
    bucket = @buckets[num % @buckets.length]
    bucket.delete(num)
    true
  end
end

class ResizingIntSet
  # Space complexity: O(n)
  def initialize
    @buckets = Array.new(8) { [] }
    @num_elements = 0
  end

  # O(1) average
  def include?(num)
    bucket = @buckets[num % @buckets.length]
    bucket.include?(num)
  end

  # O(1) amortized
  def insert(num)
    return false if include?(num)
    bucket = @buckets[num % @buckets.length]
    bucket << num

    @num_elements += 1
    resize! if @num_elements == @buckets.length
    true
  end

  # O(1) amortized
  def delete(num)
    return false unless include?(num)
    bucket = @buckets[num % @buckets.length]
    bucket.delete(num)
    @num_elements -= 1
    true
  end

  protected
  # O(n)
  def resize!
    old_buckets = @buckets
    @buckets = Array.new(@buckets.length * 2) { [] }
    @num_elements = 0
    old_buckets.each do |bucket|
      bucket.each { |el| insert(el) }
    end
  end
end
