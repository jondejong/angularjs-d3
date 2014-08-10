'use strict'

angular.module('frontendApp')
  .controller 'LoadYearCtrl', ($scope, WorkoutService, DataHolderService, $state) ->
    console.log("In LoadYearCtrl")

    WorkoutService.getYearTotals().then (data)->
        console.log("Done loading data", data)
        DataHolderService.setCurrentData(data)
        $state.go("")


