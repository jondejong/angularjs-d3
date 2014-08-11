'use strict'

angular.module('frontendApp')
  .controller 'AllChartCtrl', ($scope, DataHolderService, $state) ->

    loadYear = (year)->
        $state.go("workout.loadyear", {year: year})


    $scope.data = DataHolderService.getCurrentData()

    $scope.tooltip = ()->
        (key, x, y) ->
            "<p>#{key}: #{y} miles in #{x}</p>"

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
                (d) ->
                    loadYear(d[0])
            )

    if !$scope.data
        $state.go('workout.loadall')
