'use strict'

angular.module('frontendApp')
  .controller 'LoadweekCtrl', ($scope, DataHolderService, $stateParams, WorkoutService, $state) ->
    WorkoutService.getDayTotals($stateParams.year, $stateParams.month, $stateParams.week).then (data)->
        DataHolderService.setCurrentData(data)
        DataHolderService.setHeaderData($stateParams.year, $stateParams.month, $stateParams.week)
        $state.go("workout.week", {year: $stateParams.year, month: $stateParams.month, week: $stateParams.week})
