'use strict'

angular.module('frontendApp')
  .controller 'BarAllChartCtrl', ($scope, DataHolderService, $state) ->

    loadYear = (year)->
        $state.go("bar.loadyear", {year: year})

    $scope.data = DataHolderService.getCurrentData()

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
                (d) ->
                    loadYear(d[0])
            )

    if !$scope.data
        $state.go('bar.loadall')
