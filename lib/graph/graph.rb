class Vertex
  attr_accessor :value, :edges

  def initialize
    self.value = nil
    self.edges = []
  end
end

class Edge
  attr_accessor :vertex1, :vertex2

  def get_first
    self.vertex1.value
  end

  def get_second
    self.vertex2.value
  end

  def initialize
    self.vertex1 = nil
    self.vertex2 = nil
  end
end

class Graph
  attr_accessor :vertexes, :size, :complexity

  def initialize
    self.vertexes = []
    self.size = 0
    self.complexity = 0
  end

  def depth_traversal
    vertex_order = []
    helper = populate_helper_array
    depth_recursive(0, helper, vertex_order)
    vertex_order
  end

  def depth_recursive(index, helper, vertex_order)
    if helper[index][1] == false
      vertex = get_vertex(index)
      helper[index][1] = true
      vertex_order << vertex.value
      vertex.edges.each do |edge|
        if edge.get_first == vertex.value
          depth_recursive(edge.get_second, helper, vertex_order)
        else
          depth_recursive(edge.get_first, helper, vertex_order)
        end
      end
    else
      return vertex_order
    end
  end

  def breadth_traversal
    vertex_order = []
    helper = populate_helper_array
    breadth_recursive(0, helper, vertex_order)
    vertex_order.uniq
  end

  def breadth_recursive(index, helper, vertex_order)
    if helper[index][1] == false
      vertex = get_vertex(index)
      helper[index][1] = true
      vertex.edges.each do |edge|
        vertex_order << edge.get_first
        vertex_order << edge.get_second
      end
      print get_neighbours(vertex)
      vertex.edges.each do |edge|
        if edge.get_first == vertex.value
          breadth_recursive(edge.get_second, helper, vertex_order)
        else
          breadth_recursive(edge.get_first, helper, vertex_order)
        end
      end
    else
      vertex_order
    end
  end

  def get_neighbours(vertex)
    edges = vertex.edges
    neighbours = []
    edges.each do |edge|
      if edge.get_first == vertex.value
        neighbours << edge.get_second
      else
        neighbours << edge.get_first
      end
    end
    neighbours
  end

  def populate_helper_array
    i = 0
    helper =[]
    while i < self.size do
      helper << [self.vertexes[i],false]
      i += 1
    end
    helper
  end

  def populate_vertexes(vertexes)
    i = 0
    while i < vertexes.length do
      add_vertex
      set_vertex_value(i, vertexes[i])
      i += 1
    end
  end

  def populate_edges(edges)
    i = 0
      while i < edges.length do
        add_edge(edges[i][0], edges[i][1])
        i += 1
      end
  end

  private

  def add_vertex_edge(index, edge)
    vertex = get_vertex(index)
    vertex.edges << edge
  end

  def add_vertex
    vertex = Vertex.new
    self.vertexes[self.size] = vertex
    self.size += 1
  end

  def set_vertex_value(index, value)
    vertex = get_vertex(index)
    vertex.value = value
  end

  def get_vertex(index)
    self.vertexes[index]
  end

  def add_edge(vertex1, vertex2)
    edge = create_edge(vertex1, vertex2)
    add_vertex_edge(vertex1, edge)
    add_vertex_edge(vertex2, edge)
  end

  def create_edge(vertex1, vertex2)
    edge = Edge.new
    edge.vertex1 = get_vertex(vertex1)
    edge.vertex2 = get_vertex(vertex2)
    self.complexity += 1
    edge
  end
end
