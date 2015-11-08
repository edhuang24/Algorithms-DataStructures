require 'byebug'

class LZString < String
  def self.ascii_dictionary
    Array.new(128) { |i| [i.chr, i.chr] }.to_h
  end

  def initialize(*args)
    @dictionary = LZString.ascii_dictionary
    super(*args)
  end

  def encode!
    current = ""
    result = ""
    idx = 0
    while idx < self.length do
      current = self[idx]
      jdx = idx
      while @dictionary.has_key?(current) && jdx < self.length-1 do
        current += self[jdx+1]
        jdx += 1
      end
      if @dictionary.has_key?(current) && jdx == self.length - 1
        result += @dictionary[current]
        idx += current.length
      else
        @dictionary[current] = @dictionary.keys.length.chr
        result += @dictionary[current[0..current.length - 2]]
        idx += current[0..current.length-2].length
      end
    end
    self.replace(result)
    self
  end

  def decode!
    # you may or may not know what to do
  end
end
