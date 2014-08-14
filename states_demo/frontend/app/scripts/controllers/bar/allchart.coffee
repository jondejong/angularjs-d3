'use strict'

angular.module('frontendApp')
  .controller 'BarAllChartCtrl', ($scope, $state, BarChartService, data) ->

    $scope.data = data

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
                (d) ->
                    $state.go("bar.year", {year: d[0]})
            )



