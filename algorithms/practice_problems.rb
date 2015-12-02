require "byebug"

# digital_root

# Write a method, digital_root(num). It should sum the digits of a positive integer. If it is greater than or equal to 10, sum the digits of the resulting number. Keep repeating until there is only one digit in the result, called the "digital root". Do not use string conversion within your method.

def digital_root_helper(num)
  result = 0
  while num > 0
    result += (num % 10)
    num = num / 10
  end
  result
end

def digital_root(num)
  while num >= 10
    num = digital_root_helper(num)
  end
  num
end

# a = Time.now
# p digital_root(1463848348)
# b = Time.now
# p b - a

def recursive_digital_root(num)
  return num if num < 10
  recursive_digital_root((num / 10) + (num % 10))
end

# c = Time.now
# p recursive_digital_root(1463848348)
# d = Time.now
# p d - c

# recursive method seems to be faster in all scenarios

# **************************************************************************** #

# caesar_cipher

# Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet. Assume lowercase and no punctuation. Preserve spaces.

def caesar_cipher(str, shift)
  dict = ("a".."z").to_a
  str.each_char.with_index do |char, idx|
    next if char == " "
    dict_idx = dict.index(char)
    str[idx] = dict[(dict_idx + shift) % dict.length]
  end
  str
end

# p caesar_cipher("abc xyz", 3)

# **************************************************************************** #

# common_substrings

# Write a function, common_substrings(str1, str2) that takes two strings and returns the longest common substring.
# Time complexity: O(m * n**2).

def common_substrings(str1, str2)
  result = ""
  i = 0

  while i < str1.length
    j = result.length + 1
    while (i + j) < str1.length
      substring = str1[i..(i + j)]
      if str2.include?(substring)
        result = substring
      end
      j += 1
    end
    i += 1
  end

  result
end

# p common_substrings("abdcged", "gedbdcg")

# **************************************************************************** #

# sum_rec

# Write a function that takes an array of integers and returns their sum. Use recursion.

def sum_rec(nums)
  return 0 if nums.empty?
  nums.pop + sum_rec(nums)
end

# non-mutating version below

# def sum_rec(nums)
#   return 0 if nums.empty?
#   nums[0] + sum_rec(nums.drop(1))
# end

# p sum_rec([1,2,3,4,5])

# **************************************************************************** #

# fibs

# Write a function, fibs(num) which returns the first n elements from the fibonnacci sequence, given n.
# Time complexity: 0(n)

def fibs(num)
  return [] if num == 0
  return [0] if num == 1
  return [0, 1] if num == 2
  fibs(num - 1) + [fibs(num - 1)[-1] + fibs(num - 1)[-2]]
end

# iterative solution below

# def fibs(num)
#   return [] if num == 0
#   return [0] if num == 1
#
#   result = [0, 1]
#   while result.size < num
#     result << result[-1] + result[-2]
#   end
#
#   result
# end

# p fibs(10)

# **************************************************************************** #

# isPalindrome

# Write a JavaScript function that takes a string and returns true if it's a palindrome, false if it's not. Use Javascript.
# This solution takes less time and memory than rebuilding the string backward and comparing the two.
# Time complexity: O(n)
# Space complexity: O(1)

def is_palindrome?(str)
  i = 0
  j = str.length - 1
  while i < str.length.fdiv(2)
    return false if str[i] != str[j]
    i += 1
    j -= 1
  end
  return true
end

# p is_palindrome?("abcba")

# **************************************************************************** #

# valid_ip?

# Write a method that takes a string as input. It should return true if the input is a valid IPv4 address (ie. anything between 0.0.0.0 and 255.255.255.255 is valid).

def valid_ip?(str)
  str.split(".").all? { |num| num.to_i.between?(0, 255) }
end

# p valid_ip?("1743.174.174.174")

# **************************************************************************** #

# sum_from_file

# Write a method that reads in a file of integers, one per line, and sums them. Skip the line if it begins with a "#".

def sum_from_file(file)
  sum = 0
  File.foreach(file) do |line|
    next if line[0] == "#"
    sum += line.to_i
  end
  sum
end

# **************************************************************************** #

# shuffle

# You are given an array and a random number generator. Shuffle the array.
# Time complexity: O(n)

def shuffle(arr)
  i = 0
  while i < arr.length
    # notice how each time it moves the number at `index` out of the way so it may be sampled later.
    j = i + rand(arr.length - i)
    arr[i], arr[j] = arr[j], arr[i]
    i += 1
  end
  arr
end

# non-mutating solution below

# def shuffle(arr)
#   array = arr.dup
#   while i < array.length
#     # notice how each time it moves the number at `index` out of the way so it may be sampled later.
#     j = i + rand(array.length - i)
#     array[i], array[j] = array[j], array[i]
#     i += 1
#   end
#   array
# end

# **************************************************************************** #

# myMap

# Implement the Array#map function in JavaScript.

class Array
  def my_map(&prc)
    result = []
    self.each { |el| result << prc.call(el) }
    result
  end
end

# p [1,2,3,4,5].my_map { |x| 2**x }

# **************************************************************************** #

# Employees Query

# In a SQL db, you have two tables, an employees table and a departments table. Employees belong to only one department. Write a SQL query that, given a department name, finds all the employees in that department.

# select
#   employees.*
# from
#   employees
# join
#   departments on employees.dept_id = departments.id
# where
#   department.name = ?;

# **************************************************************************** #

# SQL + ActiveRecord

# (from InstaCart) Write the following queries in SQL and in Rails:
# "count all users",
# "count all active users (you define what active means)",
# "count all users who visited the site within a certain time period".

# 1.
# select
#   count(*)
# from
#   users;

# User.count

# 2.
# select
#   count(*)
# from
#   users
# where
#   users.active = true;

# User.where(active: true).count

# 3.
# select
#   count(*)
# from
#   users
# join
#   visits on users.id = visits.user_id
# where
#   visits.date BETWEEN ? and ? ;

# User.includes(:visits).where(visits: (start..end))

# **************************************************************************** #

# folding_cipher

# Implement the Folding Cipher. It folds the alphabet in half and uses the adjacent letter. Ie. a <=> z, b <=> y, c <=> x, m <=> n.

def folding_cipher(str)
  dict = ("a".."z").to_a.zip(("a".."z").to_a.reverse).to_h
  str.each_char.with_index { |char, idx| str[idx] = dict[char] }
  str
end

# p folding_cipher("abc")

# **************************************************************************** #

# uniq_subs

# Write a method that finds all the unique substrings for a word. A results array and the include? method can be used to enforce uniqueness, but it adds the time cost of iterating through that array to check for inclusion. Keeping track of substrings in a hash is more efficient.
# Time complexity: O(n^2)

def uniq_subs(str)
  h = {}
  i = 0
  while i < str.length - 1
    j = i + 1
    while j < str.length
      h[str[i..j]] = true
      j += 1
    end
    i += 1
  end
  h.keys
end

# **************************************************************************** #

# largest_contiguous_subsum

# Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
#
# You can solve this trivially in O(n**2) time by considering all subarrays. Try to solve it in O(n) time with O(1) memory.
#
# Hint:
#
# Say for an array of n elements you know:
#
# The largest contiguous subsum, AND
# The largest contiguous subsum ending at the last of n elements.
# Now, say that you extend the n elements with an n+1th element. How does the largest contiguous subsum ending at the n+1th element change?
#
# How does the largest contiguous subsum change?
#
# Illustration:
#
# Suppose your array is [5, 3, -7, 6], then:
#
# * The largest subsum is 8 with subarray [5, 3].
# * The largest subsum ending at the last element is 7 with subarray [5, 3, -7, 6].
#
# Say that you push 4 to the array to get [5, 3, -7, 6, 4].
#
# * The largest subsum ending at the last element is 11 with subarray [5, 3, -7, 6, 4].
# * The largest subsum overall is the max of the old largest subsum AND the new largest subsum.
# In other words, the new largest sum is 11 because [8, 11].max = 11.












# **************************************************************************** #

# silly_years

# Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition: the first two digits summed with the last two digits are equal to the middle two digits. E.g.,
# 1978 => 19 + 78 = 97
# 2307 => 23 + 07 = 30

def silly_years(year)
  year = year.to_i + 1
  result = []

  while result.size < 10
    if year.to_s[0..1].to_i + year.to_s[-2..-1].to_i == year.to_s[1..-2].to_i
      result << year
    end
    year += 1
  end

  result
end

# p silly_years(1956)

# **************************************************************************** #

# pair_sum

# Given an array of integers, return all pairs that sum up to a specified value k. List the pairs in [min, max] order.
# Time complexity: O(n)

# require 'set'

def pair_sum(arr, k)
  seen = {}
  pairs = {}

  arr.each do |num|
    target = k - num
    if seen[target]
      pairs[[[num, target].min, [num, target].max]] = true
    end
    seen[num] = true
  end

  pairs.keys
end

# p pair_sum([-2, 2, -1, -1, 1], 0)

# **************************************************************************** #

# matrix_region_sum

# Given a matrix of integers and coordinates of a rectangular region within the matrix, find the sum of numbers falling inside the rectangle.
# Time complexity: O(n*m) where n = # rows and m = # columns

def matrix_region_sum(matrix, coordinates)
  # we know what n2 > n1 & m2 > m1 for all n, m
  n1 = coordinates[0][0]
  n2 = coordinates[1][0]
  m1 = coordinates[0][1]
  m2 = coordinates[1][1]

  i = n1

  sum = 0

  while i <= n2
    j = m1
    while j <= m2
      sum += matrix[i][j]
      j += 1
    end
    i += 1
  end

  sum
end

# p matrix_region_sum(
#   [
#     [1, 2, 3],
#     [4, 5, 6],
#     [7, 8, 9]
#   ],
#   [
#     [0, 0],
#     [2, 2]
#   ]
# )

# **************************************************************************** #

# merge_sort

# Implement merge sort.
# Time complexity: O(n*log(n))

def merge_sort(arr)
  return arr if arr.size < 2

  midpoint = arr.size / 2
  left = arr.take(midpoint)
  right = arr.drop(midpoint)

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  merged = []

  until left.empty? || right.empty?
    if left[0] <= right[0]
      merged << left.shift
    else
      merged << right.shift
    end
  end

  merged + left + right
end

# class Array
#   def merge_sort(&prc)
#     arr = self.dup
#     return arr if arr.length < 2
#
#     prc ||= Proc.new { |x, y| x <=> y }
#
#     middle = arr.length / 2
#     left = arr.take(middle)
#     right = arr.drop(middle)
#     # middle = arr[arr.length / 2]
#     #
#     # left, right = arr.partition { |el| prc.call(middle, el) == 1}
#
#     self.class.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
#   end
#
#   private
#   def self.merge(left, right, &prc)
#     merged = []
#
#     until left.empty? || right.empty?
#       case prc.call(left.first, right.first)
#       when 1
#         merged << right.shift
#       when 0
#         merged << right.shift
#       when -1
#         merged << left.shift
#       end
#     end
#
#     merged + left + right
#   end
# end

# p merge_sort([9,3,6,43,23,13,320])

# **************************************************************************** #

# binary_search

# Implement binary search

def binary_search(arr, target)
  return nil if arr.size == 0

  midpoint = arr.size / 2

  if target == arr[midpoint]
    return midpoint
  elsif target < arr[midpoint]
    binary_search(arr.take(midpoint, target))
  else
    binary_search(arr.drop(midpoint + 1, target)) ? midpoint + 1 + binary_search(arr.drop(midpoint + 1, target)) : nil
  end
end

# **************************************************************************** #

# productify

# Given a list of numbers in an array, replace all the numbers with the product of all other numbers. Do this in O(n) time without using division.
# Time complexity: O(n)

def productify(arr)
  # Build two arrays
  # * `left_arr[i]` is the product of all `arr[j]` for `j < i`
  # * `right_arr` is the product of all `arr[j]` for `j > i`
  products = Array.new(arr.length, 1)

  lower_product = 1
  0.upto(arr.size - 1) do |i|
    products[i] = products[i] * lower_product
    lower_product = lower_product * arr[i]
  end

  upper_product = 1
  (arr.size - 1).downto(0) do |i|
    products[i] = products[i] * upper_product
    upper_product = upper_product * arr[i]
  end

  products
end

# p productify([1,4,2,9])

# **************************************************************************** #

# subsets

# Write a function that takes an array and returns all of its subsets. How many sets will it return?

def subsets(arr)
  return [[]] if arr.empty?
  subsets(arr.drop(1)) + subsets(arr.drop(1)).map { |subs| subs + [arr[0]] }
end

# p subsets([3,4,6])

# **************************************************************************** #

# longest_palindrome

# Write a function that will take a string and return the indices of the start/end of the longest palindrome it contains.
# Your palindrome checker could reverse the string and compare it to the original, but that takes extra memory (that takes O(n) extra memory). Instead, you should be able to solve the problem with O(1) memory.

def longest_palindrome(str)
  return [0, 0] if str.length < 2

  start = 0
  len = 0
  i = 0

  while i < str.length - 1
    j = i + len
    while j < str.length
      if is_palindrome?(str[i..j]) && (j - i) > len
        start = i
        len = j - i
      end
      j += 1
    end
    i += 1
  end

  str[start..start + len]
end

def is_palindrome?(str)
  i = 0
  while i <= str.length / 2
    if str[i] != str[str.length - 1 - i]
      return false
    end
    i += 1
  end
  true
end

# p longest_palindrome("abcbcbd")

# **************************************************************************** #

# fast_intersection

# Given arr1 and arr2, find the intersection of both sets. It should be trivial to write an O(n**2) solution. Use sorting to solve in O(nlog(n)). Next, improve this to O(n) time (maybe use a non-array datastructure).

def fast_intersection(arr1, arr2)
  seen = {}
  intersection = []
  arr1.each { |el| seen[el] = true }
  arr2.each do |el|
    if seen[el]
      intersection << el
    end
  end
  intersection
end

# p fast_intersection([1,2,3], [2,3,4])

# **************************************************************************** #

# common_subsets

# Write a function that takes two arrays (arr1 and arr2) of integers and returns an array with all the subsets commmon to both.
#
# Don't generate all subsets of arr1 and arr2, which would take time exponential in the size of arr1/arr2 (and take O(2**n) memory as well). Instead, directly generate the subsets of both.

def subsets(arr)
  return [[]] if arr.empty?
  val = arr[0]
  subs = subsets(arr.drop(1))
  subs + subs.map { |el| el + [val] }
end

def common_subsets(arr1, arr2)
  # subsets(arr1 & arr2)
  subsets(fast_intersection(arr1, arr2))
end

# p common_subsets([1,2,3],[2,3,4])

# **************************************************************************** #

# can_win

# Given an array and index, find if it's possible to reach 0 by starting at the index and repeatedly moving left/right by the distance found at array[index].
#
# Hint: Use memoization to record where you've been.

def can_win(arr, idx)
  distance = arr[idx]
  h = {}
  until h.keys.length == arr.length
    if arr[(idx + distance) % arr.length] == 0 || arr[(idx - distance) % arr.length] == 0
      return true
    elsif h[(idx + distance) % arr.length] || h[(idx - distance) % arr.length]
      return false
    else
      h[(idx + distance) % arr.length] = true
      h[(idx - distance) % arr.length] = true
      distance += distance
    end
  end
  return false
end

# p can_win([1,2,3,4,5,6], 2)

# **************************************************************************** #

# non-comparison sorts

# Part 1: Say that I gave you an array of length n, containing the numbers 1..n in jumbled order. "Sort" this array in O(n) time. You should be able to do this without looking at the input.
#
# Part 2: Say that I give you an array of length n with numbers in the range 1..N (N >= n). Sort this array in O(n + N) time. You may use O(N) memory.
#
# Part 3: Say I give you an array of n strings, each of length k. I claim that, using merge sort, you can sort this in O(knlog(n)), since comparing a pair of strings takes O(k) time.
#
# I want you to beat that. Sort the strings in O(kn). Hint: do not compare any two strings. You may assume all strings contain only lowercase letters a..z without whitespace or punctuation.

def sort1(arr)
  (1..n).to_a
end

def sort2(arr, max)
  counts = Array.new(max + 1, 0)
  arr.each { |el| counts[el] += 1 }

  result = []
  counts.each_with_index do |el, idx|
    el.times { arr << idx }
  end
  result
end

def sort2(arr, max)
  counts = Hash.new { |h, k| h[k] = 0 }
  arr.each { |el| counts[el] += 1}

  result = []
  counts.each do |k, v|
    v.times { result << k }
  end
  result
end

def sort3(strings, length)
  return strings if strings.size < 2

  (length - 1).downto(0) do |idx|
    buckets = Array.new(26) { [] }
    strings.each do |string|
      letter = string[idx]
      buckets[letter.ord - "a".ord] << string
    end

    strings = []
    buckets.each do |bucket|
      bucket.each { |string| strings << string }
    end
  end

  strings
end

# p sort3(["abce", "ewnf", "bnem", "dnew", "aedv", "abdb"], 4)


# **************************************************************************** #

# weighted_random_index

# Given an array, write a function that will return a random index of the array. The probability of an index being returned is weighted by the value at that index against the sum of the array values. For example, for the array [4, 6, 8], index 0 should be returned with 4 in 18 odds, index 1 should be returned with 6 in 18 odds, and index 2 should be return with 8 in 18 odds. Implement this in O(n) time.

def weighted_random_index(arr)
  num = rand(arr.inject(:+))

  sum = 0
  arr.each_with_index do |n, idx|
    sum += n
    return idx if num < sum
  end
end

# p weighted_random_index([1,10,50])

# **************************************************************************** #

# move_zeros

# Given an array, move all zeros to the end. The order of non-zero elements does not matter. Ex:
# move_zeros([1, 2, 0, 3, 4, 0, 5, 6, 0]) == [1, 2, 6, 3, 4, 5, 0, 0, 0]
# Algorithm should be O(n); use O(1) extra space.

def move_zeros(arr)
  i = 0
  swap_idx = arr.length - 1
  swap_count = 0
  while i < arr.length
    # debugger
    if arr[i] == 0 && i < swap_idx
      until arr[swap_idx] != 0
        swap_idx -= 1
      end
      arr[i], arr[swap_idx] = arr[swap_idx], arr[i]
      swap_idx -= 1
      swap_count += 1
    end
    i += 1
  end
  arr
end

# p move_zeros([1, 2, 0, 3, 0, 0, 5, 6, 0])

# **************************************************************************** #

# look_and_say

# Implement the 'look and say' function. 'Look and say' takes an input array and outputs an array that describes the count of the elements in the input array as they appear in order.

=begin
def look_and_say(arr)
  return [] if arr.empty?

  hash_counter = Hash.new { |h, k| h[k] = 0 }

  arr.each do |el|
    hash_counter[el] += 1
  end

  result = []

  hash_counter.each do |k, v|
    result << [k, v]
  end

  result
end
=end

def look_and_say(arr)
  return [] if arr.empty?

  result = []
  count = 1

  arr.each_with_index do |el, idx|
    if arr[idx + 1] != arr[idx] || idx = arr.length - 1
      result << [arr[idx], count]
      count = 1
    else
      count += 1
    end
  end

  result
end

# p look_and_say([1, 2, 1, 1])

# **************************************************************************** #

# sums upon sums

# I give you a scrambled list of n unique integers between 0 and n. Tell me what number is missing?
#
# If I let you use O(nlog(n)) time, what is a naive way of doing this?
#
# Next, what if I require that you solve the problem in O(n) time? What datastructure might you use?
#
# Finally, how could you solve the problem in O(n), and also O(1) space?

# a) sort and look for gap

# b) use a hash and set value to true if the key exists in the array

# c) either (0..n).inject(:+) - arr.inject(:+) or n * (n + 1) / 2 - arr.inject(:+)

# **************************************************************************** #

# bonus_stack

# Implement a stack with a method max that returns the maximum value of the stack. max should run in O(1) time.

class MaxStack
  def initialize
    @store = []
    @max = 0
  end

  def push(val)
    @max = val if val > self.max
    @store << [val, @max]
    val
  end

  def pop
    value = @store.pop[0]
    @max = @store[-1][1]
    value
  end

  def max
    @max
  end
end

# **************************************************************************** #

# StackQueue

# Implement a queue using stacks. That is, write enqueue and dequeue using only push and pop operations.
#
# In terms of performance, enqueue should be O(1), but dequeue may be worst-case O(n). In terms of ammortized time, dequeue should be O(1). Prove that your solution accomplishes this.

class StackQueue
  def initialize
    @in, @out = [], []
  end

  def enqueue(val)
    @in << val
  end

  def dequeue
    if @out.empty?
      until @in.empty?
        @out << @in.pop
      end
    end

    @out.pop
  end

  def inspect
    @out.reverse + @in
  end
end

# **************************************************************************** #

# Windowed Max Range

# Given an array, and a window size w, find the maximum max - min within a range of w elements.
#
# For instance:
#
# windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# # still 6!
# windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
# You can write a naive version that considers all subarrays of size w. However, if w = n/2 then there are n/2 subarrays of length n/2 to consider. Therefore, I would call this solution quadratic. Write it anyway :-)
#
# Let's improve it to O(n). Here are some hints:
#
# First solve MaxStack. Could you write simply a MinMaxStack to track both the min and the max in a stack?
# Next, solve StackQueue. Could you use your MinMaxStack to write a MinMaxStackQueue which tracks both the min and max.
# Last, can you use your MinMaxStackQueue to solve the problem?
























# **************************************************************************** #

# Hash Dictionary

# Suppose a hash representing a directory. All keys are strings with names for either folders or files. Keys that are folders point to nested hashes. Keys that are files point to "true". Write a function that takes such a hash and returns an array of strings with the path to each file in the hash.

def file_paths(directory)
  result = []

  directory.each do |k, v|
    # debugger
    if v.is_a?(Hash)
      file_paths(v).each { |file| result << k + "/" + file }
    else
      result << k
    end
  end

  result
end

files = {
  'a' => {
    'b' => {
      'c' => {
        'd' => {
          'e' => true
        },

        'f' => true
      }
    }
  }
}

# p file_paths(files)

# **************************************************************************** #

# find_missing_number

# Assume an array of non-negative integers. A second array is formed by shuffling the elements of the first array and deleting a random element. Given these two arrays, find which element is missing in the second array. Do this in linear time with constant memory use.

def find_missing_number(arr1, arr2)
  arr1.inject(:+) - arr2.inject(:+)
end

# p find_missing_number([1,2,3,4], [4,1,2])

# **************************************************************************** #

# is_shuffle?

# Given three strings, return whether the third is an interleaving of the first two. Interleaving means it only contains characters from the other two, no more no less, and preserves their character ordering. "abdecf" is an interleaving of "abc" and "def". Note that the first two strings needn't be in alphabetical order like these.
#
# You may assume that the first two strings do not contain any characters in common.

def is_shuffle?(str1, str2, str3)
  i = 0
  j = 0

  str3.each_char.with_index do |letter, idx|
    if letter == str1[i]
      i += 1
    elsif letter == str2[j]
      j += 1
    else
      return false
    end
  end

  true
end

# p is_shuffle?("abc", "def", "abdcef")

# Next, relax the assumption that the first two strings contain no overlap. Analyze the time-complexity of your solution. You may wish to view this problem recursively.

def is_shuffle?(str1, str2, str3)
  i = 0
  j = 0

  str3.each_char.with_index do |letter, idx|
    if letter == str1[i] && letter == str2[j]
      return is_shuffle?(str1[i + 1..-1], str2[j..-1], str3[idx + 1..-1]) || is_shuffle?(str1[i..-1], str2[j + 1..-1], str3[idx + 1..-1])
    elsif letter == str1[i]
      i += 1
    elsif letter == str2[j]
      j += 1
    else
      return false
    end
  end

  true
end

=begin
def is_shuffle?(str1, str2, str3)
  return str1.empty? && str2.empty? if str3.empty?

  if str1[0] == str3[0]
    return true if is_shuffle?(str1[1..-1], str2, str3[1..-1])
  end

  if str2[0] == str3[0]
    return true if is_shuffle?(str1, str2[1..-1], str3[1..-1])
  end

  false
end
=end

# p is_shuffle?("abd", "def", "abdedf")

# Our previous is_shuffle solution runs in O(2**n) time because each step might involve 2 solutions of a subproblem of size n-1.
#
# That is a terrible time complexity. First, let's change our solution to an iterative solution using breadth first search, rather than a recursive depth first search.

def is_shuffle?(str1, str2, str3)
  queue = []
  queue << [0, 0]

  until queue.empty?
    current = queue[0]
    idx = current[0] + current[1]

    if idx == str3.length
      return true
    end

    if str1[current[0]] == str3[idx]
      queue << [current[0] + 1, current[1]]
    end

    if str2[current[1]] == str3[idx]
      queue << [current[0], current[1] + 1]
    end

    queue.shift
  end

  false
end

# p is_shuffle?("abd", "def", "abdedf")

# This still sucks. It still searches the entire tree, branching out as much as twice at every step. This will use tons of memory, too, because it is breadth first.
#
# You can improve it:

=begin
def is_shuffle?(str1, str2, str3)
  seen = {}
  queue = []
  queue << [0, 0]

  until queue.empty?
    current = queue[0]
    idx = current[0] + current[1]

    if idx == str3.length
      return true
    end

    # this method of using the hash is suboptimal - you don't even want to push into the queue if seen[current] is true
    if seen[current]
      queue.shift
    else
      if str1[current[0]] == str3[idx]
        queue << [current[0] + 1, current[1]]
      end

      if str2[current[1]] == str3[idx]
        queue << [current[0], current[1] + 1]
      end

      seen[queue.shift] == true
    end
  end

  false
end
=end

def is_shuffle?(str1, str2, str3)
  seen = {}
  queue = []
  queue << [0, 0]

  until queue.empty?
    current = queue[0]
    idx = current[0] + current[1]

    if idx == str3.length
      return true
    end

    # this method of using the hash is suboptimal - you don't even want to push into the queue if seen[current] is true

    if str1[current[0]] == str3[idx]
      unless seen[[current[0] + 1, current[1]]]
        queue << [current[0] + 1, current[1]]
      end
    end

    if str2[current[1]] == str3[idx]
      unless seen[[current[0], current[1] + 1]]
        queue << [current[0], current[1] + 1]
      end
    end

    seen[queue.shift] == true
  end

  false
end

# p is_shuffle?("abd", "def", "abdedf")

# **************************************************************************** #

# binary

# Write a function that takes an integer and returns it in binary form.

def binary(int)
  result = []

  while int > 0
    result << (int % 2)
    int = int / 2
  end

  result.empty? ? "0" : result.reverse.join("")
end

# p binary(12)

# 0 -> 0
# 1 -> 1
# 2 -> 10
# 3 -> 11
# 4 -> 100
# 5 -> 101
# 6 -> 110
# 7 -> 111
# 8 -> 1000
# 9 -> 1001
# 10 -> 1010
# 11 -> 1011
# 12 -> 1100
# 13 -> 1101
# 14 -> 1110
# 15 -> 1111

# **************************************************************************** #

# factorial

# Implement factorial with and without recursion. What is a potential disadvantage of the recursive way?
#
# What is tail-recursion? Does Ruby have tail-call optimization? Pretend it did; write a tail-recursive version of rec_fac.

def factorial(num)
  result = 1

  while num > 0
    result = result * num
    num -= 1
  end

  result
end

def factorial_rec(num)
  return num if num == 1
  factorial_rec(num - 1) * num
end

def factorial_rec(num, prod = 1)
  return prod if num == 1
  factorial_rec(num - 1, prod * num)
end

# p factorial(4)
# p factorial_rec(4)

# **************************************************************************** #

# max_unique_psub

# This is a hard one! Enjoy the challenge!
#
# Let's define a pseudo-substring: psub is a pseudo-substring of str if there exists some [i_0, i_1, ..., i_n] such that:
#
# i_0, ..., i_n is an increasing sequence; i_l < i_m for l < m.
# psub[l] == str[i_l]
# For example:
# "abc" is a psub of "abcdef"
# "ace" is a psub of "abcdef"
# "cdf" is a psub of "abcdef"
#
# "fed" is _not_ a psub of "abcdef" (letters are out of order)
#
# psubs("abcd") == [
#   "a",
#   "ab",
#   "abc",
#   "abcd",
#   "ac",
#   "acd",
#   "ad",
#   "b",
#   "bc",
#   "bcd",
#   "bd",
#   "c",
#   "cd",
#   "d"
# ]
# Next, recall the definition of lexicographical order:
#
# str1 > str2 IF
# (a) str1 != str2 AND EITHER
# (b1) str2 is a prefix of str1 OR
# (b2) at the first position at which str1 and str2 differ (say i), str1[i] > str2[i].
# For instance: "abc" > "ab" and "acb" > "abc".
#
# Given a string str, find the lexicographical greatest psubstring. Solve it first by generating all psubstrings and picking the greatest (in Big-Oh, how many are there?).
#
# Next, improve your algorithm to do this in O(n) time.




























# **************************************************************************** #

# permutations

# Write a method that takes an array and returns all its permutations. Time/memory complexity should be proportional to the number of permutations; what is this?

def permutations(arr)
  return [[]] if arr.empty?

  result = []
  arr.length.times do |i|
    el = arr[i]
    rest = arr.take(i).concat(arr.drop(i + 1))

    new_perms = permutations(rest).map { |perm| perm.unshift(el) }
    result.concat(new_perms)
  end

  result
end

p permutations([1,2,3])

# **************************************************************************** #

# truckin'

# Given a fleet of 50 trucks, each with a full fuel tank and a range of 100 miles, how far can you deliver a payload? You can transfer the payload from truck to truck, and you can transfer fuel from truck to truck. Assume all the payload will fit in one truck.

# First, note that we have enough fuel for 50 * 100 == 5,000 truck miles. Our problem is that we can't put all the fuel on a single truck.
#
# Instead, begin by driving all 50 trucks simultaneously. After two miles, we will have burned 50 * 2 = 100 miles worth of fuel. This is one trucks worth of fuel. Because we only have 49 trucks worth of fuel left, it is unnecessary to drive all 50 trucks any more, because we can fit all the fuel in 49 trucks.
#
# Therefore, at the two mile mark, transfer all the fuel from one truck to the other trucks. Leave an empty truck at the two mile mark. All the other trucks are totally full of fuel.
#
# Next, drive the remaining 49 trucks for 100/49 miles. After 100/49 miles, we'll have burned another 100 miles worth of fuel, so we can fit all the fuel in the remaining 48 trucks.
#
# Continue like this until there is only one truck left, and it runs out of fuel.
#
# Let's calculate how many miles we can drive:
#
# 50 trucks of fuel: 100/50 miles
# 49 trucks of fuel: 100/49 miles
# 48 trucks of fuel: 100/48 miles
# ...
# 1 truck of fuel: 100/1 miles
# Thus, you can then add up 100/50 + 100/49 + 100/48 + ... + 100/1. This is ~449.9.

# **************************************************************************** #

# cyclic

# Consider a linked list. Each link in the list holds a next reference to the next item in the list, except for the final link, which points to nil.
#
# It is possible to have a "list" without any end, which loops back on itself. Possibilities:
#
# A -> B -> C -> A -> ...
# A -> B -> C -> B -> ...
#
# Write a method cyclic?(first_link), which will return true if a list is cyclic. Your first version may use O(n) memory. Next, write a version which uses O(1) memory; you'll probably need a different approach.

def cyclic?(first_link)
  seen = {}
  seen[first_link] = true

  current_link = first_link
  until current_link.next == nil
    current_link = current_link.next
    if seen[current_link]
      return true
    else
      seen[current_link] = true
    end
  end

  false
end

def cyclic?(first_link)
  slow_link = first_link
  fast_link = first_link

  until fast_link == nil || slow_link == nil
    slow_link = slow_link.next
    fast_link = fast_link.next.next
    return true if slow_link == fast_link
  end

  false
end

# Given two singly-linked lists of (possibly) differing lengths that converge at some point, find the node at which they converge.

# Imagine two runners, running at the same speed across the linked lists. If one list is longer than the other, the shorter list's runner will reach the end first. The difference between the two runners' times is the difference in length between the two lists. Knowing this, we can give one runner a head-start of a distance equivalent to the difference in length between the two lists. Then traversing both lists at equal speed will result in the two runners colliding at the intersection point.

# **************************************************************************** #

# next_largest

# Given a node in a Binary Search Tree, find the node with the next largest value. Assume you don't have the root of the tree, just a single node from it.

def next_largest(node)
  current = node

  if current.right
    current = current.right
    until current.left == nil
      current = current.left
    end
    return current
  end

  while current
    parent = current.parent
    if parent == nil
      return nil
    elsif parent.left == current
      return parent
    else
      current = parent
    end
  end
end

# **************************************************************************** #

# isBalancedTree

# Write a JavaScript function to check if a binary tree is balanced. A tree is balanced if, at every node, the depth of subtree on the left hand side is equal to the depth of the subtree on the right (plus or minus one).

def is_balanced_tree(node)
  
end
