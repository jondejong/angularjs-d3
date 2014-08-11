'use strict'

angular.module('frontendApp')
  .controller 'WeekChartCtrl', ($scope, DataHolderService, $state, $stateParams) ->
    $scope.data = DataHolderService.getCurrentData()

    if !$scope.data
        $state.go('workout.loadweek', {year: $stateParams.year, month: $stateParams.month, week: $stateParams.week})
