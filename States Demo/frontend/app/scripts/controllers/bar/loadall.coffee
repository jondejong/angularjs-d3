'use strict'

angular.module('frontendApp')
  .controller 'BarLoadAllCtrl', ($scope, BarChartService, DataHolderService, $state) ->

    BarChartService.getYearTotals().then (data)->
        DataHolderService.setCurrentData(data)
        $state.go("bar.all")


