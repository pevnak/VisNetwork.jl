# VisNetwork.jl
A simple api to viznetwork javascript library for visualizing graphs

A work in progress...

currently, it is not hooked to julia display system, but produces a valid html
```
julia> open("/tmp/test.html","w") do fio
          write(fio, graph2js(g; colors, titles))
       end
```
where `g` is a graph, `colors` are colors of nodes and `titles` are their descriptions.  
