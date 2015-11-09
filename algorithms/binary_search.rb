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
