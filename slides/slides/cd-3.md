### Define the rects

    rects = chart.selectAll("rect").data(scope.data)

    rects.enter().append("rect")
    .attr {
        y: (d, i) ->
            i * 26
        ,
        width: (d) ->
            scale(d[1])
        ,
        height: 20,
        fill: (d, i) -> color(i)
    }
