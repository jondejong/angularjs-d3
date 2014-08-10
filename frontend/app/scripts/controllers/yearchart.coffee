'use strict'

angular.module('frontendApp')
  .controller 'YearChartCtrl', ($scope, DataHolderService) ->
    $scope.data = DataHolderService.getCurrentData()
    console.log("Got some data: ", $scope.data)
    $scope.message = 'Jon was here'