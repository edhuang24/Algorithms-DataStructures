class Array
  def bsearch(target)
    arr = self.dup

    return nil if arr.empty?
    mid = arr.length / 2

    # remember to do arr[mid], not mid!!!!
    case arr[mid] <=> target
      when 0
        return mid
      when 1
        # remember the three dots!!
        arr[0...mid].bsearch(target)
      when -1
        function = arr[mid + 1..-1].bsearch(target)
        function.nil? ? nil : function + mid + 1
    end
  end
end

p [1,2,4,6,9,13,18,21].bsearch(6)

def binary_search(array, value)
    mid = array.length / 2

    if value < array[mid]
        return binary_search(array[0...mid], value)
    elsif value > array[mid]
        function = binary_search(array[mid + 1..-1], value)
        function.nil? ? nil : function + mid + 1
    else
        return mid
    end
end
