class HashGraph < Graph
  # Extends Graph
  # for dealing with hash graphs

  def import_hash_graph(graph)
    serialized_hash = serialize_hash(graph)
    populate_vertexes(serialized_hash[0])
    populate_edges(serialized_hash[1])
  end

  def serialize_hash(graph)
    serialized_hash = []
    serialized_hash << graph.keys
    serialized_hash << extract_edges(graph, serialized_hash[0])
    serialized_hash[1] = hash_filter_edges(serialized_hash[1])
    serialized_hash
  end

  def extract_edges(graph, keys)
    i = 0
    pairs = []
    while i < keys.length do
      j = 0
      while j < graph[i].length do
        pairs << [keys[i],graph[i][j]]
        j += 1
      end
      i += 1
    end
    pairs
  end

  def hash_filter_edges(edges)
    unique_edges = []
    filter_edges_recursive(edges, edges[0], unique_edges)
    unique_edges
  end

  def filter_edges_recursive(edges, edge, unique_edges)
    if edges.length > 0
      edge_nuker = check_array_for_duplicate_edges(edges, edge)
      if edge_nuker.length > 0
        i = 0
        while i < edge_nuker.length do
          edges.delete_at(edge_nuker[i])
          i += 1
        end
        unique_edges << edges.shift
      else
        unique_edges << edges.shift
      end
      filter_edges_recursive(edges, edges[0], unique_edges) if edges.length > 0
    else
      unique_edges
    end
  end

  def check_array_for_duplicate_edges(array, edge)
    i = 1
    indexes_for_deletion = []
    while i < array.length do
      if hash_edge_duplicate(edge, array[i])
        indexes_for_deletion << i
      end
      i += 1
    end
    indexes_for_deletion
  end

  def hash_edge_duplicate(edge1, edge2)
    if edge1[0] == edge2[1] && edge1[1] == edge2[0] || edge1[0] == edge2[0] && edge1[1] == edge2[1]
      return true
    else
      return false
    end
  end
end

 # usage of depth first traversal on a graph hash
 #  hash_graph = HashGraph.new
 #  hash_graph.import_hash_graph(graph)
 #  hash_graph.depth_traversal

 # usage of breadth first traversal on a graph hash
 #  hash_graph = HashGraph.new
 #  hash_graph.import_hash_graph(graph)
 #  hash_graph.breadth_traversal
