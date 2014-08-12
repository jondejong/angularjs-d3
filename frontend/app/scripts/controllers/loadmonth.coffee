'use strict'

angular.module('frontendApp')
  .controller 'LoadMonthCtrl', ($scope, BarChartService, DataHolderService, $state, $stateParams) ->

    BarChartService.getWeekTotals($stateParams.year, $stateParams.month).then (data)->
        DataHolderService.setCurrentData(data)
        $state.go("bar.month", {year: $stateParams.year, month: $stateParams.month})
