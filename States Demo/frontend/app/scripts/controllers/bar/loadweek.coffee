'use strict'

angular.module('frontendApp')
  .controller 'BarLoadWeekCtrl', ($scope, DataHolderService, $stateParams, BarChartService, $state) ->
    BarChartService.getDayTotals($stateParams.year, $stateParams.month, $stateParams.week).then (data)->
        DataHolderService.setCurrentData(data)
        $state.go("bar.week", {year: $stateParams.year, month: $stateParams.month, week: $stateParams.week})
