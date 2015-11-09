require "byebug"

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
#         current_idx = self.parent_idx(current_idx)
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
#         current_idx = best_child_idx
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
  def heapsort!
    return self if self.length < 2
    self.heapify!
    self.unheapify!
    # you would need to return self.reverse if using a min heap instead of a max heap
    self
  end

  def parent_idx(idx)
    (idx - 1) / 2
  end

  def children_idx(idx, len)
    [idx * 2 + 1, idx * 2 + 2].select do |child_idx|
      child_idx < len
    end
  end

  def need_to_heapify_up?(idx)
    # the first inequality would be reversed if using a min heap
    self[self.parent_idx(idx)] < self[idx] && idx > 0
  end

  def need_to_heapify_down?(idx, len)
    children_idx = self.children_idx(idx, len)
    # the inequality in the block would be reversed if using a min heap
    children_idx.any? { |child_idx| self[idx] < self[child_idx] }
  end

  def heapify!
    self.each_index do |current_idx|
      while need_to_heapify_up?(current_idx)
        self.swap!(current_idx, parent_idx(current_idx))
        current_idx = self.parent_idx(current_idx)
      end
    end
  end

  # def unheapify!
  #   swap_count = 0
  #   current_idx = 0
  #   while swap_count < self.size
  #     heap_len = self.length - 1 - swap_count
  #     self.swap!(0, heap_len)
  #     swap_count += 1
  #     while self.need_to_heapify_down?(current_idx, heap_len)
  #       best_child_idx = children_idx(current_idx, heap_len).max_by { |child_idx| self[child_idx] }
  #       self.swap!(current_idx, best_child_idx)
  #       current_idx = best_child_idx
  #     end
  #     current_idx = 0
  #   end
  # end

  def unheapify!
    self.each_index do |current_idx|
      heap_len = self.length - 1 - current_idx
      self.swap!(0, heap_len)
      current_idx = 0
      while self.need_to_heapify_down?(current_idx, heap_len)
        best_child_idx = children_idx(current_idx, heap_len).max_by { |child_idx| self[child_idx] }
        self.swap!(current_idx, best_child_idx)
        current_idx = best_child_idx
      end
    end
  end

  protected
  def swap!(idx1, idx2)
    self[idx1], self[idx2] = self[idx2], self[idx1]
  end
end

class Array
  def heap_sort!
    return self if self.size < 2

    # heapify
    self.each_index do |idx|

    end
  end
end

time = Time.now
p [32,6,17,2,42,1,23,11].heapsort!
p Time.now - time
