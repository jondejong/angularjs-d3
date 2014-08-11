'use strict'

angular.module('frontendApp')
  .controller 'LoadAllCtrl', ($scope, WorkoutService, DataHolderService, $state) ->

    WorkoutService.getYearTotals().then (data)->
        DataHolderService.setCurrentData(data)
        $state.go("workout.all")


