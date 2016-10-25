def bfs(target_value)
  queue = []
  queue << self
  until queue.empty?
    current = queue.shift
    if current.value == target_value
      return current
    else
      # we need to use += instead of shovel, otherwise we are passing in an entire array into the queue
      queue += current.children
    end
  end
  nil
end
