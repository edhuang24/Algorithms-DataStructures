require "byebug"

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

  def partition!(start, len)
    pivot_idx = start
    i = pivot_idx + 1
    while i < start + len
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
