'use strict'

angular.module('customdApp').directive 'barChart', ->
    restrict: 'E'
    scope: {data: '='}
    link: (scope, element, attrs) ->

        scale = d3.scale.linear().domain([0, 10]).range([0, 500]);
        color = d3.scale.category20();

        chart = d3.select("##{attrs.id}").append("svg")
        .attr {
            class: "chart",
            width: 500,
            height: 500
        }

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

        texts = chart.selectAll("text").data(scope.data)

        texts.enter().append("text").text( (d) -> d[0])
        .attr {
            y: (d, i) ->
                ((i + 1) * 26) - 8
            ,
            x: 0,
            fill: "black"
        }
