require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    self[key.hash] << key
    @count += 1
    if count == num_buckets
      resize!
    end
    
    return key
  end

  def include?(key)
    self[key.hash].each do |el|
      if el === key
        return true
      end
    end
    return false
  end

  def remove(key)
    self[key.hash].each_with_index do |el, idx|
      if el === key
        self[key.hash][idx] = nil
      end
    end
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
      arr.each do |key|
        self[key.hash] << key
      end
    end
  end
end
