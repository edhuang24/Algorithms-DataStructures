require "byebug"

$invs = 0
$comps = 0

def merge_sort(arr)
  return arr if arr.length < 2

  middle = arr.length / 2
  left = arr[0...middle]
  right = arr[middle..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  merged = []

  while left.length > 0 && right.length > 0
    if left[0] <= right[0]
      merged << left.shift
    else
      merged << right.shift
      # $invs += left.length
    end
  end

  merged + left + right
end

# nums = [1,5,3,2,4]
# numbers = []
#
# File.foreach("numbers.txt") do |line|
#   numbers << line.to_i
# end
#
# merge_sort(numbers)
#
# p $invs

example = [3,9,8,4,6,10,2,5,7,1]

def quicksort!(arr)
  return arr if arr.length < 2

  pivot_idx = partition!(arr, 0, arr.length - 1)

  quicksort!(arr[0...pivot_idx]) + [arr[pivot_idx]] + quicksort!(arr[pivot_idx + 1..-1])
end

def partition!(arr, start_idx, end_idx)
  # for using the last element as the pivot
  # arr[0], arr[-1] = arr[-1], arr[0]

  # for using the median of 3 numbers as the pivot
  # if arr.length.even?
  #   middle_idx = arr.length / 2 - 1
  # else
  #   middle_idx = arr.length / 2
  # end
  #
  # temp = [arr[0], arr[middle_idx], arr[-1]]
  # median = temp.sort {|x, y| x <=> y}[1]
  # if arr[0] == median
  #   median_idx = 0
  # elsif arr[middle_idx] == median
  #   median_idx = middle_idx
  # else
  #   median_idx = -1
  # end
  # arr[0], arr[median_idx] = arr[median_idx], arr[0]

  swap_idx = start_idx + 1
  j = start_idx + 1
  while j <= end_idx
    if arr[0] > arr[j]
      arr[swap_idx], arr[j] = arr[j], arr[swap_idx]
      swap_idx += 1
    end
    j += 1
  end
  arr[0], arr[swap_idx - 1] = arr[swap_idx - 1], arr[0]
  pivot_idx = swap_idx - 1

  # $comps += arr.length - 1
  return pivot_idx
end

# numbers = []
#
# File.foreach("quicksort.txt") do |line|
#   numbers << line.to_i
# end
#
# quicksort!(numbers)
# p $comps

def quickselect(arr, n)
  return arr[0] if arr.length == 1

  pivot_idx = rand(arr.length)
  arr[0], arr[pivot_idx] = arr[pivot_idx], arr[0]

  # i = 1
  # pivot_idx = 1
  #
  # while i < arr.length
  #   if arr[i] < arr[0]
  #     arr[i], arr[pivot_idx] = arr[pivot_idx], arr[i]
  #     pivot_idx += 1
  #   end
  #   i += 1
  # end
  # arr[0], arr[pivot_idx - 1] = arr[pivot_idx - 1], arr[0]
  # pivot_idx -= 1

  pivot_idx = partition!(arr, 0, arr.length - 1)

  return arr[pivot_idx] if pivot_idx + 1 == n
  if pivot_idx + 1 > n
    quickselect(arr[0...pivot_idx], n)
  else
    quickselect(arr[pivot_idx + 1..-1], n - (pivot_idx + 1))
  end
end

p quickselect(example, 6)
