function edgelist(graph)
    l = map(edges(graph)) do e
        string("  {from: ", e.src, ", to: ", e.dst, "}")
    end
    "var edges = new vis.DataSet([\n"*join(l,",\n")*",\n]);"
end

function vertexlist(graph, x, y, colors, titles::Nothing)
    l = map(1:nv(graph)) do i
        string("  {id: ", i, ", "," x:", x[i], ", y:", y[i], ", color: {border: '", colors[i], "', background: '", colors[i], "'}}")
    end
    "var nodes = new vis.DataSet([\n"*join(l,",\n")*",\n]);"
end

function vertexlist(graph, x, y, colors, titles)
    l = map(1:nv(graph)) do i
        string("  {id: ", i, ", title: '",sanitizestring(titles[i]),"', x:", x[i], ", y:", y[i], ", color: {border: '", colors[i], "', background: '", colors[i], "'}}")
    end
    "var nodes = new vis.DataSet([\n"*join(l,",\n")*",\n]);"
end

function nodelabel(g::SimpleGraph, i)
    string("Node ", i)
end

function definegraph(graph, x, y, colors, titles)
join([vertexlist(graph, x, y, colors, titles),
    edgelist(graph),
    """
        var container = document.getElementById("mynetwork");
        var data = {
          nodes: nodes,
          edges: edges,
        };
    """], "\n")
end


function sanitizestring(s::String)
    map(s) do ch 
        ch == '\'' && return('\"')
        ch == '\`' && return('\"')
        ch 
    end
end
