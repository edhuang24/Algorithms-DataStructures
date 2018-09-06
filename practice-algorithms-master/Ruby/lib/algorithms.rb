require 'byebug'

# Write a method that will sum the digits of a positive integer.
# If it is greater than or equal to 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result.
# The result is called a 'digital root'.
# Do not use string conversion within your method.
def digital_root(number)
  return number if number < 10

  digital_root((number / 10) + (number % 10))
end

# Write a function that takes a message and an increment amount.
# Output the same letters shifted by that amount in the alphabet.
# Assume lowercase and no punctuation.
# Preserve spaces.
def caesar_cipher(string, shift)
  alphabet = ("a".."z").to_a

  result = ""
  string.each_char do |char|
    if char == " "
      result += " "
    else
      result += alphabet[(alphabet.index(char) + shift) % 26]
    end
  end

  return result
end

# Write a function that takes two strings.
# Return the longest common substring.
def make_matrix(str1, str2)
  matrix = Array.new(str1.length + 1) { Array.new(str2.length + 1, 0) }

  str1.chars.each_with_index do |el1, idx1|
    str2.chars.each_with_index do |el2, idx2|
      if el1 == el2
        matrix[idx1 + 1][idx2 + 1] = matrix[idx1][idx2] + 1
      else
        matrix[idx1 + 1][idx2 + 1] = 0
      end
    end
  end

  matrix
end

def common_substrings(str1, str2)
  matrix = make_matrix(str1, str2)
  greatest_substring = ""
  matrix.each_with_index do |row, idx1|
    row.each_with_index do |length, idx2|
      if length > greatest_substring.length
        greatest_substring = str2[idx2 - length...idx2]
      end
    end
  end

  greatest_substring
end

# def common_substrings(string_one, string_two)
#   hash = Hash.new(0)
#
#   i = 0
#   while i < string_one.length
#     j = i + 1
#     while i + j < string_one.length
#       hash[string_one[i..j]] += 1
#       j += 1
#     end
#     i += 1
#   end
#
#   i = 0
#   while i < string_two.length
#     j = i + 1
#     while i + j < string_two.length
#       hash[string_two[i..j]] += 1
#       j += 1
#     end
#     i += 1
#   end
#
#   p hash.keys.select { |key| hash[key] == 2 }
#   return hash.keys.select { |key| hash[key] == 2 }.max_by { |key| key.length }
# end

# Write a function that takes an array of integers and returns their sum.
# Use recursion.
def sum_rec(numbers)
  return numbers[0] if numbers.length == 1
  numbers[0] + sum_rec(numbers.drop(1))
end

# Write a function that takes n, the length of the sequence.
# Return the first n elements from the Fibonacci sequence as an array.
def fibs(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  prev_fibs = fibs(n - 1)
  prev_fibs.push(prev_fibs[-1] + prev_fibs[-2])

  prev_fibs
end

# Write a function that takes a string.
# Return true if the string is a palindrome, otherwise return false.
# It should take less time and memory than reversing the string.
def is_palindrome?(string)
  i = 0

  while i < string.length / 2
    if string[i] != string[string.length - 1 - i]
      return false
    end
    i += 1
  end

  return true
end

# Write a method that takes a string as input.
# It should return true if the input is a valid IPv4 address.
# Valid IPs are anything between '0.0.0.0' and '255.255.255.255'.
def valid_ip?(string)
  return false unless string =~ /\d{0,3}\.\d{0,3}\.\d{0,3}\.\d{0,3}/

  string.split(".").each do |sub_str|
    if !sub_str.to_i.between?(0, 255)
      return false
    end
  end

  return true
end

# Implement the Folding Cipher.
# It folds the alphabet in half and uses the adjacent letter.
# a -> z, b -> y, c -> x, m -> n, etc...
def folding_cipher(string)
  alphabet = ("a".."z").to_a
  hash = {}

  alphabet.each_with_index do |letter, idx|
    hash[letter] = alphabet[25 - idx]
  end

  string.chars.map! do |char|
    hash[char]
  end.join("")
end

# Write a method that finds all the unique substrings for a word.
def uniq_subs(string)
  hash = {}

  i = 0
  while i < string.length
    j = i + 1
    while j <= string.length
      hash[string[i...j]] = true unless hash[string[i...j]]
      j += 1
    end
    i += 1
  end

  return hash.keys
end

# Given an array of integers find the largest contiguous subsum.
# You can solve this trivially in O(n**2) time by considering all subarrays.
# Try to solve it in O(n) time with O(1) memory.
def lcs(array)
  current_sum = 0
  max = array[0] || 0

  array.each do |el|
    current_sum += el
    if current_sum > max
      max = current_sum
    end
    if current_sum < 0
      current_sum = 0
    end
  end

  return max
end

# Write a function that takes a year as a four digit integer.
# Returns an array of the 10 closest subsequent silly years.
# A silly year's first two digits plus the last two digits equal the middle two.
def silly_years(year)
  silly_years = []
  year = year + 1

  while silly_years.length != 10
    year_str = year.to_s
    if year_str[0..1].to_i + year_str[2..3].to_i == year_str[1..2].to_i
      silly_years.push(year)
    end
    year += 1
  end

  return silly_years
end

# Take an array of integers, and integer k.
# Return all pairs that sum to k exactly.
# List the pairs in [min, max] order.
# Time complexity: O(n).
# Return a set.
def pair_sum(array, k)
  hash = {}
  pairs = Set.new

  array.each do |num|
    if hash[num]
      pair = [num, hash[num]]
      pairs.add([pair.min, pair.max])
    else
      hash[k - num] = num
    end
  end

  return pairs
end

# Take a matrix of integers and coordinates.
# The coordinates represent a rectangular region within the matrix
# Find the sum of numbers falling inside the rectangle.
# Time complexity: O(number of rows * number of columns).
def matrix_region_sum(matrix, top_left_coords, bottom_right_coords)

end

# Implement Merge Sort
# Hint: This typically involves a helper function.
def merge_sort(array)
  return array if array.length < 2

  midpoint = array.length / 2
  left = array[0...midpoint]
  right = array[midpoint..-1]

  return merge(merge_sort(left), merge_sort(right))
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

# Extra problem added by Ed
def quicksort(arr)
  return arr if length < 2

  rand_idx = rand(arr.length)
  arr[0], arr[rand_idx] = arr[rand_idx], arr[0]

  pivot = arr.shift
  left, right = [], []

  arr.each do |num|
    if num < pivot
      left.push(num)
    else
      right.push(num)
    end
  end

  return quicksort(left) + [pivot] + quicksort(right)
end

# Implement binary search.
# Return nil if the target isn't found.
def binary_search(array, target)
  mid = array.length / 2

  if value < array[mid]
    binary_search(array[0...mid], target)
  elsif value > array[mid]
    function = binary_search(array[mid + 1..-1], target)
    function.nil? ? nil : function + mid + 1
  else
    return mid
  end
end

# You are given a list of numbers in an array.
# Replace all the numbers with the product of all other numbers.
# Do this in O(n) time without using division.
def productify(array)

end

# Write a function that takes an array and returns all of its subsets.
def subsets(array)

end

# Return the indices of the start/end of the longest palindrome in the string.
# You could reverse the string and compare it to the original, but that is slow.
# Instead, you should be able to solve the problem with O(1) memory.
def longest_palindrome(string)

end

# Given two arrays, find the intersection of both sets.
# It should be trivial to write an O(n**2) solution.
# Use sorting to solve in O(nlog(n)).
# Next, improve this to O(n) time (maybe use a non-array datastructure).
def fast_intersection(array_one, array_two)

end

# Write a function that takes two arrays of integers
# Returns an array with all the subsets commmon to both arrays.
# Don't generate all subsets of both arrays, which would be exponential time.
# Instead, directly generate the subsets of both.
def common_subsets(array_one, array_two)

end

# You are given an array and index.
# Find if it's possible to reach 0 by starting at the index.
# You can only move left or right by the distance found at array[index].
def can_win?(array, index)

end

# Assume an array of length n, containing the numbers 1..n in jumbled order.
# "Sort" this array in O(n) time.
# Hint: You should be able to do this without looking at the input.
def sort1(array)

end

# Assume an array of length n with numbers in the range 1..N (N >= n).
# Sort this array in O(n + N) time.
# You may use O(N) memory.
def sort2(array, max_value)

end

# Say I give you an array of n strings, each of length k.
# Merge sort can sort this in O(knlog(n)).
# Sort the strings in O(kn).
# Hint: Do not compare any two strings.
# All strings contain only lowercase letters without whitespace or punctuation.
def sort3(array, length)

end

# Given an array, write a function that will return a random index of the array.
# The chance of returning a given index will vary with the value of the element.
# Probability of i should be the ith element divided by the sum of all elements.
def weighted_random_index(array)

end

# Given an array, move all zeros to the end.
# The order of non-zero elements does not matter.
# Try to accomplish this in O(n) time and O(1) space.
def move_zeros(array)

end

# Implement the 'look and say' function.
#'Look and say' takes an input array and outputs an array.
# The output describes the count of the elements in the input.

def look_and_say(array)

end

# I give you a scrambled list of n unique integers between 0 and n.
# Tell me what number is missing?
# How could you solve the problem in O(n), and also O(1) space?
def sum_upon_sums(array)

end

# Implement a stack with a max method that returns the maximum value.
# It should run in O(1) time.
class MaxStack

end

# Implement a queue using stacks.
# That is, write enqueue and dequeue using only push and pop operations.
# In terms of performance, enqueue should be O(1).
# Dequeue may be worst-case O(n).
# In terms of ammortized time, dequeue should be O(1).
# Prove that your solution accomplishes this.
class StackQueue

end

# Take an array, and a window size w.
# Find the maximum max - min within a range of w elements.
# First solve MaxStack.
# Write a MinMaxStack to track both the min and the max in a stack.
# Next, solve StackQueue.
# Write a MinMaxStackQueue which tracks both the min and max.
# Last, use MinMaxStackQueue to solve the problem.
class MinMaxStack

end

class MinMaxStackQueue

end

def windowed_max_range(array, w)

end

# Suppose a hash representing a directory.
# All keys are strings with names for either folders or files.
# Keys that are folders point to nested hashes.
# Keys that are files point to "true".
# Write a function that takes such a hash.
# Return an array of strings with the path to each file in the hash.
def file_list(hash)

end

# Assume an array of non-negative integers.
# A second array is made by shuffling the first and deleting a random element.
# Given these two arrays, find which element is missing in the second array.
# Do this in linear time with constant memory use.
def find_missing_number(array_one, array_two)

end

# Create a function that takes three strings.
# Return whether the third is an interleaving of the first two.
# Interleaving means it contains the same characters and preserves their order.
def is_shuffle?(string_one, string_two, string_three)

end

# Write a function that takes an integer and returns it in binary form.
def binary(integer)

end

# Write a recursive function that takes a number and returns its factorial.
def recursive_factorial(number)

end

# Write an iterative function that takes a number and returns its factorial.
def iterative_factorial(number)

end

# Write a method that takes an array and returns all its permutations.
def permutations(array)

end
