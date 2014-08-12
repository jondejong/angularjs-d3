'use strict'

angular.module('frontendApp')
.controller 'LoadYearCtrl', ($scope, BarChartService, DataHolderService, $state, $stateParams) ->

    BarChartService.getMonthTotals($stateParams.year).then (data)->
        DataHolderService.setCurrentData(data)
        $state.go("workout.year", {year: $stateParams.year})