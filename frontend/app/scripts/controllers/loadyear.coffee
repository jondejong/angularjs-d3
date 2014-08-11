'use strict'

angular.module('frontendApp')
.controller 'LoadYearCtrl', ($scope, WorkoutService, DataHolderService, $state, $stateParams) ->

    WorkoutService.getMonthTotals($stateParams.year).then (data)->
        DataHolderService.setCurrentData(data)
        $state.go("workout.year", {year: $stateParams.year})