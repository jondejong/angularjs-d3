'use strict'

angular.module('frontendApp')
  .controller 'BarMonthChartCtrl', ($scope, DataHolderService, $stateParams, $state) ->
    $scope.data = DataHolderService.getCurrentData()
    $scope.year = $stateParams.year
    $scope.month = $stateParams.month

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
            (d) ->
                $state.go('bar.loadweek', {year: $scope.year, month: $scope.month, week: d[0]})
            )

    if !$scope.data
        $state.go('bar.loadmonth', {year: $scope.year, month: $scope.month})
