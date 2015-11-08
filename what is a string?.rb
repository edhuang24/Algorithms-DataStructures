what is a string?

-at some point, it will be beneficial to understand how it works in C code.

class String

	def initialize(string)
		@length = 0
	end

end

String.new("abc") is the same as calling "abc".dup

strings are immutable in Python

in ruby, strings are kind of like arrays

C uses a null terminator to designate when a string ends

P string (used in Pascal)

Ruby uses a string buffer
	it is a higher level abstraction of a string
	for concatentation, Ruby stores each string into an array
	Ruby stores a length attribute as an instance variable to make the length method faster
	advantages:



	disadvantages:


originally, the way that strings were encoded was with ASCII
every letter corresponds to a number

UTF-8 was developed to permit symbols and letters from other languages to be represented in a computer
ASCII is a subset of UTF-8

variable length encoding permits symbols like chinese characters to take up multiple bytes/spots in memory
this means you cannot find the length of an array/string very easily because one character may take up more than one spot
this means byte length could be different from character/string length

