require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  # sorted = []
  # queue = []
  #
  # vertices.each do |vertex|
  #   queue.push(vertex) if vertex.in_edges.empty?
  # end
  #
  # until queue.empty?
  #   current = queue.shift
  #   sorted.push(current)
  #   out_edges = current.out_edges.dup
  #
  #   out_edges.each do |edge|
  #     to_vertex = edge.to_vertex
  #     edge.destroy!
  #     queue.push(to_vertex) if to_vertex.in_edges.empty?
  #   end
  # end
  #
  # return sorted

  tarjan_topological_sort(vertices)
end

def tarjan_topological_sort(vertices)
  $sorted = []
  $visited = []
  leafs = []

  vertices.each do |vertex|
    leafs.push(vertex) if vertex.in_edges.empty?
  end

  until leafs.empty?
    current = leafs.pop
    value = visit(current, [])
    if value == "cycle"
      return []
    end
  end

  return $sorted
end

# TODO: try to speed this up by using a hash for a stack instead of an array
def visit(vertex, stack)
  if stack.include?(vertex)
    return "cycle"
  end

  stack.push(vertex)

  return if $visited.include?(vertex)

  $visited.push(vertex)
  out_edges = vertex.out_edges
  value = nil

  vertex.out_edges.each do |edge|
    value = visit(edge.to_vertex, stack)
    if value == "cycle"
      stack.pop
      return "cycle"
    end
  end

  stack.pop
  $sorted.unshift(vertex)
  return
end
#
# vertices = []
#
# v1 = Vertex.new("Wash Markov")
# v2 = Vertex.new("Feed Markov")
# v3 = Vertex.new("Dry Markov")
# v4 = Vertex.new("Brush Markov")
# v5 = Vertex.new("Cuddle Markov")
# v6 = Vertex.new("Walk Markov")
# v7 = Vertex.new("Teach Markov")
# v8 = Vertex.new("Worship Markov")
#
# vertices.push(v1, v2, v3, v4, v5, v6, v7, v8)
#
# Edge.new(v1, v2)
# Edge.new(v1, v3)
# Edge.new(v2, v4)
# Edge.new(v3, v4)
# Edge.new(v2, v5)
# Edge.new(v4, v6)
# Edge.new(v5, v6)
# Edge.new(v6, v7)
# Edge.new(v7, v8)
#
# Edge.new(v1, v2)
# Edge.new(v1, v3)
# Edge.new(v2, v4)
# Edge.new(v3, v4)
# Edge.new(v2, v5)
# Edge.new(v4, v6)
# Edge.new(v5, v6)
# Edge.new(v6, v7)
# Edge.new(v7, v8)
# Edge.new(v8, v2)
#
# p topological_sort(vertices)

# out_edges.map {|x| [x.from_vertex.value, x.to_vertex.value]}
