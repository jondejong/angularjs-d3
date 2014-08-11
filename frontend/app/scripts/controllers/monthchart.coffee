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
                console.log("clicked got passed in:", d)
            )

    if !$scope.data
        $state.go('workout.loadmonth', {year: $scope.year, month: $scope.month})
