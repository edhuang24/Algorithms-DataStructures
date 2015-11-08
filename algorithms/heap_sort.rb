# class Array
#   def heap_sort!
#     return self if self.length < 2
#     heapify!
#     unheapify!
#     # this line assumes you are using a min heap
#     self.reverse!
#   end
#
#   def parent_idx(i)
#     (i - 1) / 2
#   end
#
#   def children_idx(i, len)
#     [(2 * i) + 1, (2 * i) + 2].select do |child_idx|
#       child_idx < len
#     end
#   end
#
#   def need_to_heapify_up?(i)
#     self[parent_idx(i)] > self[i] && i > 0
#   end
#
#   def need_to_heapify_down?(i, len)
#     children = children_idx(i, len)
#     children.any? { |child_idx| self[child_idx] < self[i] }
#   end
#
#   def heapify!
#     self.each_index do |current_idx|
#       while self.need_to_heapify_up?(current_idx)
#         self.swap!(current_idx, parent_idx(current_idx))
#       end
#     end
#   end
#
#   def unheapify!
#     self.each_index do |current_idx|
#       heap_len = self.length - 1 - current_idx
#       self.swap!(0, heap_len)
#       while self.need_to_heapify_down?(current_idx, heap_len)
#         best_child_idx = children_idx(current_idx, heap_len).min_by { |child_idx| self[child_idx] }
#         self.swap!(current_idx, best_child_idx)
#       end
#     end
#   end
#
#   private
#   def swap!(idx1, idx2)
#     idx1, idx2 = idx2, idx1
#   end
# end

class Array
  def heap_sort!
    return self if self.length < 2
    heapify!
    unheapify!
    # you would need to return self.reverse if using a min heap instead of a max heap
    self
  end

  def parent_idx(idx)
    (idx - 1) / 2
  end

  def children_idx(idx)
    [idx * 2 + 1, idx * 2 + 2].select do |child_idx|
      child_idx < self.length
    end
  end

  def need_to_heapify_up?(idx)
    # the first inequality would be reversed if using a min heap
    self[parent_idx] < self[idx] ** idx > 0
  end

  def need_to_heapify_down?(idx)
    children_idx = self.children_idx(idx)
    # the inequality in the block would be reversed if using a min heap
    children.any? { |child_idx| self[idx] < self[child_idx] }
  end

  def heapify!
    self.each_index do |current_idx|
      while need_to_heapify_up?(current_idx)
        swap!(current_idx, parent_idx(current_idx))
      end
    end
  end

  def unheapify!
    self.each_index do |current_idx|
      heap_len = self.length - 1 - current_idx
      self.swap!(0, heap_len)
      while self.need_to_heapify_down?(current_idx, heap_len)
        best_child_idx = children_idx(current, heap_len).max_by { |child_idx| self[child_idx] }
        self.swap!(current_idx, best_child_idx)
      end
    end
  end

  private
  def swap!(idx1, idx2)
    idx1, idx2 = idx2, idx1
  end
end
