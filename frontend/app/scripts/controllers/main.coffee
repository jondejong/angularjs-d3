'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $state, DataHolderService) ->

    $scope.header = DataHolderService.getHeaderData()

    $scope.showAll = () ->
        DataHolderService.setHeaderData(undefined, undefined, undefined)
        $state.go('workout.loadall')

    $scope.showYear = () ->
        $state.go("workout.loadyear", {year: $scope.header.year})

    $scope.showMonth = ()->
        $state.go("workout.loadmonth", {year: $scope.header.year, month: $scope.header.month})

    $scope.tooltip = ()->
        (key, x, y) ->
            "<p><strong>#{key}:</strong> #{y} miles in #{x}</p>"