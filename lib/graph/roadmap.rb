/Vertex/
/value/
/edges/

/Edge/
/vertex1/
/vertex2/

Graph
/vertexes/
/edges/
/size/
/complexity/

adjacent?
neighbours
/add_vertex/
/add_vertex_edge/
remove_vertex
/add_edge/
/create_edge/
remove_edge
/get_vertex_value/
/set_vertex_value/

/populate vertexes/
/populate edges/

/HashGraph/
/import hash graph/
/serialize hash/
/extract edges/
/filter_edges/

/filter_edges:/
/edge_exists/
/delete_edge/



/extract_edges:/
/get key /
/pair key with values/
/return pair1, pair2, ... pairn/

def depth_first_search(graph)
  hash_graph = HashGraph.new
  hash_graph.import_hash_graph(graph)
  #hash_graph.depth_traversal
end

def breadth_first_search(graph)
  hash_graph = HashGraph.new
  hash_graph.import_hash_graph(graph)
  #hash_graph.breadth_traversal
end
