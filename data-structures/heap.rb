class MinHeap
  def initialize(arr = [])
    @store = []
    arr.each { |el| insert(el) }
  end

  def min
    @store[0]
  end

  def children(idx)
    [idx * 2 + 1, idx * 2 + 2]
  end

  def parent(idx)
    (idx - 1) / 2
  end

  def insert(val)
    @store.push(val)
    heapify_up!
    val
  end

  def pop_min
    return nil if @store.empty?
    min = self.min
    return @store.pop if @store.length == 1
    @store[0] = @store.pop
    heapify_down!
    min
  end

  def heapify_up!
    current_idx = @store.length - 1
    while current_idx > 0
      par_idx = self.parent(current_idx)
      if @store[par_idx] > @store[current_idx]
        self.swap!(par_idx, current_idx)
      else
        break
      end
    end
  end

  def heapify_down!
    current_idx = 0
    while current_idx < @store.length - 1
      children_idx = self.children(current_idx)
      children_idx.select! { |n| n < @store.length }
      break if children_idx.empty?
      min_child_idx = children_idx.min_by { |i| @store[i] }
      if @store[current_idx] > @store[min_child_idx]
        swap!(current_idx, min_child_idx)
      else
        break
      end
    end
  end

  private
  def swap!(idx1, idx2)
    idx1, idx2 = idx2, idx1
  end
end

class MaxHeap
  def initialize(arr = [])
    @store = []
    arr.each { |el| insert(el) }
  end

  def max
    @store[0]
  end

  def children(idx)
    [idx * 2 + 1, idx * 2 + 2]
  end

  def parent(idx)
    (idx - 1) / 2
  end

  def insert(val)
    @store.push(val)
    heapify_up!
    val
  end

  def pop_max
    return nil if @store.empty?
    max = self.max
    return @store.pop if @store.length == 1
    @store[0] = @store.pop
    heapify_down!
    max
  end

  def heapify_up!
    current_idx = @store.length - 1
    while current_idx > 0
      par_idx = self.parent(current_idx)
      if @store[par_idx] < @store[current_idx]
        self.swap!(par_idx, current_idx)
      else
        break
      end
    end
  end

  def heapify_down!
    current_idx = 0
    while current_idx < @store.length - 1
      children_idx = self.children(current_idx)
      children_idx.select! { |n| n < @store.length }
      break if children_idx.empty?
      max_child_idx = children_idx.max_by { |i| @store[i] }
      if @store[current_idx] < @store[max_child_idx]
        self.swap!(current_idx, max_child_idx)
      else
        break
      end
    end
  end

  private
  def swap!(idx1, idx2)
    idx1, idx2 = idx2, idx1
  end
end

class Heap
  def initialize(arr = [], type = :min)
    @store = []
    @type = type
    arr.each { |el| self.insert(el) }
  end

  def min
    @type == :min ? @store[0] : nil
  end

  def max
    @type == :max ? @store[0] : nil
  end

  def children_idx(idx)
    [idx * 2 + 1, idx * 2 + 2]
  end

  def parent_idx(idx)
    (idx - 1) / 2
  end

  def insert(val)
    @store.push(val)
    heapify_up!
    val
  end

  def pop
    return nil if self.empty?
    root = @store[0]
    return @store.pop if self.length == 1
    @store[0] = @store.pop
    heapify_down!
    root
  end

  def heapify_up!
    current_idx = self.length - 1
    while current_idx > 0
      parent_idx = self.parent_idx(current_idx)
      if @type == :min
        if @store[parent_idx] > @store[current_idx]
          self.swap!(current_idx, parent_idx)
        else
          break
        end
      else
        if @store[parent_idx] < @store[current_idx]
          self.swap!(current_idx, parent_idx)
        else
          break
        end
      end
    end
  end

  def heapify_down!
    current_idx = 0
    while current_idx < self.length - 1
      children_idx = self.children_idx(current_idx)
      children_idx.select! { |idx| idx < self.length }
      break if children_idx.empty?
      if @type == :min
        best_child_idx = children_idx.min_by { |idx| @store[idx] }
      else
        best_child_idx = children_idx.max_by { |idx| @store[idx] }
      end
      if @type == :min
        if @store[current_idx] > @store[best_child_idx]
          self.swqp!(current_idx, parent_idx)
        else
          break
        end
      else
        if @store[current_idx] < @store[best_child_idx]
          self.swap!(current_idx, parent_idx)
        else
          break
        end
      end
    end
  end

  private
  def swap!(idx1, idx2)
    idx1, idx2 = idx2, idx1
  end
end
