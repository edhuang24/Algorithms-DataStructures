require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []

  vertices.each do |vertex|
    queue.push(vertex) if vertex.in_edges.empty?
  end

  until queue.empty?
    current = queue.shift
    sorted.push(current)

    current.out_edges.each do |edge|
      to_vertex = edge.to_vertex
      edge.destroy!
      queue.push(to_vertex) if to_vertex.in_edges.empty?
    end
  end

  return sorted
end

vertices = []

v1 = Vertex.new("Wash Markov")
v2 = Vertex.new("Feed Markov")
v3 = Vertex.new("Dry Markov")
v4 = Vertex.new("Brush Markov")
v5 = Vertex.new("Cuddle Markov")
v6 = Vertex.new("Walk Markov")
v7 = Vertex.new("Teach Markov")
v8 = Vertex.new("Worship Markov")

vertices.push(v1, v2, v3, v4, v5, v6, v7, v8)

Edge.new(v1, v2)
Edge.new(v1, v3)
Edge.new(v2, v4)
Edge.new(v3, v4)
Edge.new(v2, v5)
Edge.new(v4, v6)
Edge.new(v5, v6)
Edge.new(v6, v7)
Edge.new(v7, v8)

topological_sort(vertices)
