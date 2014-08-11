'use strict'

angular.module('frontendApp')
  .controller 'LoadMonthCtrl', ($scope, WorkoutService, DataHolderService, $state, $stateParams) ->

    WorkoutService.getWeekTotals($stateParams.year, $stateParams.month).then (data)->
        DataHolderService.setCurrentData(data)
        DataHolderService.setHeaderData($stateParams.year, $stateParams.month, undefined)
        $state.go("workout.month", {year: $stateParams.year, month: $stateParams.month})
