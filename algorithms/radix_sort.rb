def radix_sort(strings, length)
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

p radix_sort(["abce", "ewnf", "bnem", "dnew", "aedv", "abdb"], 4)
