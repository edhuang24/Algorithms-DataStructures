class Array
  def bubble_sort(&prc)
    arr = self.dup
    prc ||= Proc.new { |x, y| x <=> y }

    sorted = false
    until sorted
      i = 0
      sorted = true

      while i < arr.length - 1
        if prc.call(arr[i], arr[i + 1]) == 1
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
          sorted = false
        end
        i += 1
      end

    end
    arr
  end
end
