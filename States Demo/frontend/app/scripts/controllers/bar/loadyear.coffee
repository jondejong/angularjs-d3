'use strict'

angular.module('frontendApp')
.controller 'BarLoadYearCtrl', ($scope, BarChartService, DataHolderService, $state, $stateParams) ->

    BarChartService.getMonthTotals($stateParams.year).then (data)->
        DataHolderService.setCurrentData(data)
        $state.go("bar.year", {year: $stateParams.year})