'use strict'

angular.module('customdApp').directive 'barChart', ->
#    template: '<div></div>'
    restrict: 'E'
    scope: {data: '='}
    link: (scope, element, attrs) ->

        scale = d3.scale.linear().domain([0, 10]).range([0, 500]);
        color = d3.scale.category20();

        chart = d3.select("##{attrs.id}").append("svg").attr("class", "chart").attr("width", 500).attr("height", 500)

        rects = chart.selectAll("rect").data(scope.data)

        rects.enter().append("rect")
        .attr("y", (d, i) ->
            i * 26
        ).attr("width", (d, i) ->
            scale(d[1])
        ).attr("height", 20)
        .attr("fill", (d, i) ->
            color(i)
        )

        texts = chart.selectAll("text").data(scope.data)

        texts.enter().append("text").attr "y", (d, i) ->
                ((i + 1) * 26) - 8;
        .attr("x", 0)
        .attr("fill", "black")
        .text (d, i) ->
            d[0]