###  Joins
&nbsp;

    var data = [1, 2, 3, 4, 5];

    var div = d3.select("body").selectAll(".content")
      .data(data);

    div.enter().append("div").attr("class”, "content”);

    div.style("width", function(d){
      return 2 * d;
    });

    div.exit().remove();
