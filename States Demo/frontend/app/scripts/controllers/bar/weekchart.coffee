'use strict'

angular.module('frontendApp')
  .controller 'BarWeekChartCtrl', ($scope, BarChartService, $stateParams) ->

    BarChartService.getDayTotals($stateParams.year, $stateParams.month, $stateParams.week).then (data) ->
        $scope.data = data

