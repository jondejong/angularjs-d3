###  Set up D3 helper functions

    scale = d3.scale.linear().domain([0, 10]).range([0, 500]);
    color = d3.scale.category20();

### Describe the chart
    chart = d3.select("##{attrs.id}").append("svg")
    .attr {
        class: "chart",
        width: 500,
        height: 500
    }
