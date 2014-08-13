##  Creating Circles

<pre><code>
svg.selectAll("circle")
    .data(data)
  .enter().append("circle")
    .attr("cx", function(d) { return d.x; })
    .attr("cy", function(d) { return d.y; })
    .attr("r", 2.5);

</code></pre>
