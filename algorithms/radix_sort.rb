def radix_sort(strings, length)
  return strings if strings.size < 2

  buckets = Array.new(26) { [] }

  strings.each do |string|
    string.each_index do |idx|
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
