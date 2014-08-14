###  Create the chart
    var chart = d3.select("#container").append("svg")
        .attr("class", "chart")
        .attr("width", 420)
        .attr("height", 26 * dataCount);
&nbsp;
### Create a scale funtion
    var levels = getLevels(modules);
    var scale = d3.scale.linear()
        .domain([0, d3.max(levels)])
        .range([0, 420]);
