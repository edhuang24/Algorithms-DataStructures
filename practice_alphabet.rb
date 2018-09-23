# Implement merge sort.
def merge_sort(arr)
  return arr if arr.length < 2

  midpoint = arr.length / 2
  left = arr[0...midpoint]
  right = arr[midpoint..-1]

  merge(merge_sort(left), merge_sort(right))
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

end
