'use strict'

angular.module('frontendApp')
  .controller 'BarMonthChartCtrl', ($scope, $stateParams, $state, data) ->
    $scope.data = data

    $scope.year = $stateParams.year
    $scope.month = $stateParams.month

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
            (d) ->
                $state.go('bar.week', {year: $scope.year, month: $scope.month, week: d[0]})
            )
