###  Control of labels

    var texts = chart.selectAll("text").data(modules).text(function (d, i) {
        return d.name + ": " + d.level;
    });

    texts.enter()
        .append("text")
        .attr("y", function (d, i) {
            return ((i + 1) * 26) - 8;
        })
        .attr("x", 0)
        .text(function (d, i) {
            return d.name + ": " + d.level;
        })
        .attr("fill", "black");
