'use strict'

angular.module('frontendApp')
.controller 'LoadYearCtrl', ($scope, WorkoutService, DataHolderService, $state, $stateParams) ->

    WorkoutService.getMonthTotals($stateParams.year).then (data)->
        DataHolderService.setCurrentData(data)
        DataHolderService.setHeaderData($stateParams.year, undefined, undefined)
        $state.go("workout.year", {year: $stateParams.year})