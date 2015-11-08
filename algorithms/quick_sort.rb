require "byebug"

# this implementation is egregiously space intensive, with new arrays being created in each recursive call
class Array
  def quicksort
    return self if self.size < 2

    rand_idx = rand(self.size)
    until rand_idx != 0
      rand_idx = rand(self.size)
    end

    self[0], self[rand_idx] = self[rand_idx], self[0]

    pivot = self.shift
    left, right = [], []

    self.each do |el|
      if el < pivot
        left << el
      else
        right << el
      end
    end

    left.quicksort + [pivot] + right.quicksort
  end
end

time = Time.now
p [32,6,17,2,42,1,23,11].quicksort
p Time.now - time

# this implementation removes the unnecessary new arrays being created in each recursive step
class Array
  def quicksort!
    return self if self.size < 2

    rand_idx = rand(self.size)
    until rand_idx != 0
      rand_idx = rand(self.size)
    end

    self.swap!(0, rand_idx)

    pivot_idx = self.partition!(0, self.size)

    self[0...pivot_idx].quicksort! + [self[pivot_idx]] + self[pivot_idx + 1..-1].quicksort!
  end

  def partition!(start_idx, len)
    pivot_idx = start_idx
    i = pivot_idx + 1
    while i < start_idx + len
      if self[i] < self[pivot_idx]
        self.swap!(i, pivot_idx + 1)
        self.swap!(pivot_idx, pivot_idx + 1)
        pivot_idx += 1
      end
      i += 1
    end
    pivot_idx
  end

  protected
  def swap!(idx1, idx2)
    self[idx1], self[idx2] = self[idx2], self[idx1]
  end
end

time = Time.now
p [32,6,17,2,42,1,23,11].quicksort!
p Time.now - time

class Array
  def in_place_quicksort!(start_idx = 0, len = self.size)
    return self if len < 2

    self.swap!(start_idx, rand(len) + start_idx)

    pivot_idx = partition!(start_idx, len)
    self.in_place_quicksort!(start_idx, pivot_idx - start_idx)
    self.in_place_quicksort!(pivot_idx + 1, len - pivot_idx - start_idx - 1)
  end
end

time = Time.now
p [32,6,17,2,42,1,23,11].quicksort!
p Time.now - time
