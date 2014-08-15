###  NVD3 Bar Chart

    nv.addGraph(function() {
      var chart = nv.models.discreteBarChart()
        .x(function(d) { return d.label })    //Specify the data accessors.
        .y(function(d) { return d.value })
        .showValues(true)
        .transitionDuration(350);

      d3.select('#chart svg')
        .datum(exampleData())
        .call(chart);

      nv.utils.windowResize(chart.update);

      return chart;
    });
