require_relative "linked_list"

class LRUCache
  def initialize(prc, size = 8)
    @prc = prc
    @size = size
    @count = 0
    @map = {}
    @list = LinkedList.new
  end

  def get(input)
    if @map[input]
      @list.move_to_tail(@map[input])
      return @map[input].val
    else
      eject! if @count == @size
      new_link = @list.push(@prc.call(input))
      @map[input] = new_link
      @count += 1
      return new_link.val
    end
  end

  def eject!
    oldest = @list.shift
    @map.delete(oldest.val)
    @count -= 1
  end
end
