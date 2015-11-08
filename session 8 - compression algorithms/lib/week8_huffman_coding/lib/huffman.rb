require_relative 'heap'

class HuffmanNode
  include Comparable
  attr_reader :letters, :count

  def initialize(letters, count)
    # letters should be an array of the letter(s) this node represents
    @letters = Array(letters)
    # count should be the combined number of instances of these letter(s)
    @count = count
  end

  def <=>(other_huffman_node)
    if self.count > other_huffman_node.count
      return 1
    elsif self.count == other_huffman_node.count
      return 0
    else
      return -1
    end
  end

  def combine(other_huffman_node)
    HuffmanNode.new((self.letters + other_huffman_node.letters), (self.count + other_huffman_node.count))
  end

  def inspect
    "#{@letters} => #{@count}"
  end
end

class HuffmanCode < String
  attr_reader :codes
  def encode!
    # fail
    # should turn this into a Huffman Code (and store the code in an ivar)
    letter_count = Hash.new{ |h,k| h[k] = 0 }

    self.each_char do |char|
      letter_count[char] += 1
    end

    heap = Heap.new
    letter_count.each do |letter, count|
      heap.insert(HuffmanNode.new(letter,count))
    end

    @codes = Hash.new{ |h,k| h[k] = ""}

    while(heap.size > 1)
      node1 = heap.pop_min
      node2 = heap.pop_min
      node1.letters.each do |char|
        @codes[char] = "0" + @codes[char]
      end
      node2.letters.each do |char|
        @codes[char] = "1" + @codes[char]
      end
      heap.insert(node1.combine(node2))
    end

    result = ""

    self.each_char do |char|
      result += @codes[char]
    end


    self.replace(result)

  end

  def decode!
    # fail
    # should turn this back into the original message
    raise RuntimeError if @codes.nil?
    curr_str = ""
    @inverted = @codes.invert
    results = ""
    self.each_char do |char|
      curr_str += char
      unless @inverted[curr_str].nil?
        results += @inverted[curr_str]
        curr_str = ""
      end
    end
    self.replace(results)
  end

  def fixed_compression_factor
    # calculate the compression savings compared to fixed-length encoding
    len = self.split("").uniq.count

    num = 1
    count = 0
    while(num < len)
      num *= 2
      count += 1
    end
    count += 1
    fc = len*count
    enc = self.encode!.length
    (enc/fc.to_f* 100).round(0).to_s + ".0%"
  end

  def ascii_compression_factor
    org = self.length * 7
    enc = self.encode!.length
    (enc.to_f/org.to_f * 100).round(0).to_s + ".0%"
    # calculate the compression savings compared to ASCII encoding
  end
end
