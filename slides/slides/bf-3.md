### Append rects to your chart

    var rects = chart.selectAll("rect").data(modules)
    .attr("width", function (d, i) {
        return scale(d.level);
    });

    rects.enter()
        .append("rect")
        .attr("y", function (d, i) {
            return i * 26;
        })
        .attr("width", function (d, i) {
            return scale(d.level);
        })
        .attr("height", 20);
