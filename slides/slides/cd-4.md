### Define the labels
    texts = chart.selectAll("text").data(scope.data)

    texts.enter().append("text").text( (d) -> d[0])
    .attr {
        y: (d, i) ->
            ((i + 1) * 26) - 8
        ,
        x: 0,
        fill: "black"
    }
