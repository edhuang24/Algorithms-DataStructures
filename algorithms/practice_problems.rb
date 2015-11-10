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

p weighted_random_index([1,10,50])

# **************************************************************************** #

# move_zeros

# Given an array, move all zeros to the end. The order of non-zero elements does not matter. Ex:
# move_zeros([1, 2, 0, 3, 4, 0, 5, 6, 0]) == [1, 2, 6, 3, 4, 5, 0, 0, 0]
# Algorithm should be O(n); use O(1) extra space.
