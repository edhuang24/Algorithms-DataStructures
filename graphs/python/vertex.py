class Vertex(object):
    def __init__(self, value):
        self.value = value
        self.neighbors = {}

    def add_neighbor(self, neighbor, weight = 0):
        self.neighbors[neighbor] = weight

    def __str__(self):
        return '{} neighbors: {}'.format(
            self.value,
            [x.value for x in self.neighors]
        )

    def get_connections(self):
        return self.neighbors.values()

    def get_weight(self, neighbor):
        return self.neighbors[neighbor]
