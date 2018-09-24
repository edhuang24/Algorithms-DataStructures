# Implement merge sort.
def mergesort(arr)
  return arr if arr.length < 2

  midpoint = arr.length / 2
  left = arr[0...midpoint]
  right = arr[midpoint..-1]

  merge(mergesort(left), mergesort(right))
end

def merge(left, right)
  merged = []

  while left.length > 0 && right.length > 0
    if left[0] <= right[0]
      merged.push(left.shift)
    else
      merged.push(right.shift)
    end
  end

  return merged + left + right
end

def quicksort(arr)
  return arr if arr.length < 2

  rand_idx = rand(arr.length)
  until rand_idx != 0
    rand_idx = rand(arr.length)
  end
  arr[0], arr[rand_idx] = arr[rand_idx], arr[0]

  pivot = arr.shift
  left, right = []

  arr.each do |num|
    if num < pivot
      left.push(num)
    else
      right.push(num)
    end
  end

  return quicksort(left) + [pivot] + quicksort(right)
end

class Array
  def quicksort!(start_idx = 0, len = self.length)
    return self if len < 2

    self.swap!(start_idx, start_idx + rand(len))

    pivot_idx = partition!(start_idx, len)
    quicksort!(start_idx, pivot_idx - start_idx)
    quicksort!(pivot_idx + 1, len - (pivot_idx + 1) - start_idx)
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
    return pivot_idx
  end

  protected
  def swap!(idx1, idx2)
    self[idx1], self[idx2] = self[idx2], self[idx1]
  end
end

class Stack

end
