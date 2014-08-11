'use strict'

angular.module('frontendApp')
  .controller 'MonthChartCtrl', ($scope, DataHolderService, $stateParams, $state) ->
    $scope.data = DataHolderService.getCurrentData()
    $scope.year = $stateParams.year
    $scope.month = $stateParams.month

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
            (d) ->
                $state.go('workout.loadweek', {year: $scope.year, month: $scope.month, week: d[0]})
            )

    if !$scope.data
        $state.go('workout.loadmonth', {year: $scope.year, month: $scope.month})
