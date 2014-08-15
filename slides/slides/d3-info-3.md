###  DOM Manipulation
&nbsp;

    d3.select(".content").style("width", "500");
    d3.select(".content").style("width", function(d) {
        return 2 * d;
    });
