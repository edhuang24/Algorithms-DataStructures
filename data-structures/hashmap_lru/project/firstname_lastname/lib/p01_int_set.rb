class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length - 1)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new() }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num

    return num
  end

  def remove(num)
    self[num].each_with_index do |el, idx|
      if el === num
        self[num][idx] = nil
      end
    end
  end

  def include?(num)
    self[num].each do |el|
      if el === num
        return true
      end
    end
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    @count += 1
    if count == num_buckets
      resize!
    end

    return num
  end

  def remove(num)
    self[num].each_with_index do |el, idx|
      if el === num
        self[num][idx] = nil
      end
    end
  end

  def include?(num)
    self[num].each do |el|
      if el === num
        return true
      end
    end
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    # no need to re-define num_buckets because @store has already changed
    # num_buckets = num_buckets * 2
    old_store.each do |arr|
      arr.each do |num|
        self[num] << num
      end
    end
  end
end
