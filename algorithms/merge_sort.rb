class Array
  def merge_sort(&prc)
    # REMEMBER THE BASE CASE!!!!
    arr = self.dup
    return arr if arr.length < 2

    prc ||= Proc.new { |x, y| x <=> y }

    middle = arr.length / 2
    left = arr.take(middle)
    right = arr.drop(middle)
    # middle = arr[arr.length / 2]

    # left, right = arr.partition { |el| prc.call(middle, el) == 1}

    self.class.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when 1
        merged << right.shift
      when 0
        merged << right.shift
      when -1
        merged << left.shift
      end
    end

    merged + left + right
  end
end
