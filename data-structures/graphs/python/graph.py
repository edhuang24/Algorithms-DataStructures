from vertex import *
import pdb

class Graph(object):
    def __init__(self):
        self.vertices = {}

    def add_vertex(self, vertex):
        self.vertices[vertex.key] = vertex

    def get_vertex(self, key):
        try:
            return self.vertices[key]
        except KeyError:
            return None

    def __contains__(self, key):
        return key in self.vertices

    def add_edge(self, from_key, to_key, weight = 0):
        if from_key not in self.vertices:
            self.add_vertex(Vertex(from_key))
        if to_key not in self.vertices:
            self.add_vertex(Vertex(to_key))
        self.vertices[from_key].add_neighbor(self.vertices[to_key], weight)

    def get_vertices(self):
        return self.vertices.keys()

    def __iter__(self):
        return iter(self.vertices.values())

g = Graph()
for i in range(6):
    g.add_vertex(Vertex(i))

g.add_edge(0, 1, 5)
g.add_edge(0, 5, 2)
g.add_edge(1, 2, 4)
g.add_edge(2, 3, 9)
g.add_edge(3, 4, 7)
g.add_edge(3, 5, 3)
g.add_edge(4, 0, 1)
g.add_edge(5, 4, 8)
g.add_edge(5, 2, 1)

for v in g:
    for w in v.get_connections():
        print(str(w))

json_graph = {}
for key, vertex in g.vertices.iteritems():
    for neighbor, weight in vertex.neighbors.iteritems():
        # pdb.set_trace()
        if json_graph.get(key) is None:
            json_graph[key] = {}
        json_graph[key][neighbor.key] = weight

json_graph2 = {outer_k: {inner_k.key: inner_v for inner_k, inner_v in outer_v.neighbors.iteritems()} for outer_k, outer_v in g.vertices.iteritems()}

print(json_graph)
print(json_graph2)
