'use strict'

angular.module('frontendApp')
  .controller 'LoadAllCtrl', ($scope, BarChartService, DataHolderService, $state) ->

    BarChartService.getYearTotals().then (data)->
        DataHolderService.setCurrentData(data)
        $state.go("bar.all")


