function graph2js(graph; colors = fill("lightgray",nv(graph)), titles = nothing)
    x,y = 1000 .* spring_layout(graph)
    graph2js(graph, x, y; colors, titles) 
end

function graph2js(graph, x, y; colors = fill("lightgray",nv(graph)), titles = nothing)
join(
["""
<html>
    <head>
        <title>NDTbx Visualizer: Graph</title>
        <script type="text/javascript" src="https://unpkg.com/vis-network/standalone/umd/vis-network.min.js"></script>            
        <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js"></script>
        <style type="text/css">
            #mynetwork {
                width: 100%;
                height: 100%;
                border: 1px solid lightgray;
            }
        </style>
    </head>
    <body>
    <div id="mynetwork"></div>
    <script type="text/javascript">
""",
definegraph(graph, x, y, colors, titles),
"""
            // provide the data in the vis format
            var data = {nodes: nodes, edges: edges};
            var options = {
                edges: {
                    color: { inherit: false, highlight: "red"},
                    width: 1,
                    smooth: {type: "straightCross", roundness: 1},
                },
                nodes:{borderWidth: 3},
                layout: {improvedLayout: false},
                physics: false,
                interaction: { multiselect: true},
                manipulation: {
                    enabled: true,
                    initiallyActive: true,
                    addNode: false,
                    addEdge: false,
                    editEdge: true,
                    deleteNode: true,
                    deleteEdge: true,
                    controlNodeStyle:{
                    // all node options are valid.
                    }
                }
            };

            // initialize network
            container.getElementsByClassName('vis-button vis-delete');
            var network = new vis.Network(container, data, options);
        </script>
    </body>
</html>
"""],"\n")
end