import random

class Node:
    def __init__(self, id):
        self.id = id
        self.edges = {}
    def add(self, id, num):
        if id != self.id:
            self.edges[id] = self.edges.get(id, 0) + num
    def remove(self, id):
        try:
            del self.edges[id]
        except KeyError:
            pass
    def merge(self, id1, id2):
        if id2 in self.edges:
            self.edges[id1] = self.edges.get(id1, 0) + self.edges[id2]
            self.remove(id2)
    def size(self):
        return sum(self.edges.values())
    def copy(self):
        node = Node(self.id)
        node.edges = dict(self.edges)
        return node
    def __equals__(self, other):
        return self.id == other.id
    def __str__(self):
        return str({self.id : self.edges})


class graph:
    def __init__(self, nodes):
        self.nodes = {node.id : node.copy() for node in nodes}
    def combine(self, id1, id2):
        if id1 not in self.nodes or id2 not in self.nodes[id1].edges:
            return
        for id in self.nodes[id2].edges:
            self.nodes[id1].add(id, self.nodes[id2].edges[id])
        try:
            del self.nodes[id2]
            del self.nodes[id1].edges[id2]
        except KeyError:
            pass
        for id in self.nodes:
            self.nodes[id].merge(id1, id2)
    def randomCombine(self):
        node1 = random.choice(self.nodes.values())
        id1 = node1.id
        id2 = random.choice(node1.edges.keys())
        self.combine(id1, id2)
    def size(self):
        return len(self.nodes)
    def __str__(self):
        return '\n'.join([str(node) for node in self.nodes.values()])


f = open('./kargerMinCut.txt', 'r')
lines = f.readlines()
n = len(lines)
nodes = []
for line in lines:
    ids = [int(id) for id in line.split()]
    node = Node(ids[0])
    for id in ids[1:]:
        node.add(id,1)
    nodes.append(node)

rawSet = graph(nodes)
# print rawSet

cuts = []
for i in range(n**2):
    rawSet = graph(nodes)
    while rawSet.size() > 2:
        rawSet.randomCombine()
    id1 = rawSet.nodes.keys()[0]
    id2 = rawSet.nodes.keys()[1]
    size1 = rawSet.nodes[id1].size()
    size2 = rawSet.nodes[id2].size()
    assert size1 == size2, "Node size not equal: %d and %d" % (size1, size2)
    cuts.append(size1)

print min(cuts)

# import random, copy
# fin= open("kargerAdj.txt")
#
# G={}
# for line in fin: # load data, create adj lists
#     lst=[]
#     size= len(line)
#     i=0
#     while (i<size):
#         if line[i] in ' \t\r\n': pass
#         else:
#             lst.append(int(line[i:i+2].strip()))
#             i=i+1
#         i=i+1
#     G[lst[0] ]=lst[1:]
#
#
# def chooseRandomEdge(G): #return an edge represented by 2 ints
#     v1= G.keys() [random.randint(0,len(G)-1)]
#     v2= G[v1] [random.randint(0,len(G[v1])-1)]
#     return v1, v2
#
#
# def kargerStep(G):
#     v1,v2= chooseRandomEdge(G)
#     #1. attach v2's list to v1
#     G[v1].extend(G[v2])
#     #2. replace all appearance of v2 as v1
#     for x in G[v2]:
#         lst=G[x]
#         for i in range(0,len(lst)):
#             if lst[i]==v2: lst[i]=v1
#     #3.remove self-loop
#     while v1 in G[v1]:
#         G[v1].remove(v1)
#     #4. remove v2's list
#     del G[v2]
#
# def karger(G):
#     while len(G)>2: kargerStep(G)
#     return len(G[G.keys()[0]])
#
# min=karger(copy.deepcopy(G))
# for i in range(0,1000): # run many tests
#     instance=karger(copy.deepcopy(G))
#     if instance<min: min=instance
# print 'Finally:',min
