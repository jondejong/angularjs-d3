'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $state, DataHolderService) ->

    $scope.header = DataHolderService.getHeaderData()

    $scope.showAll = () ->
        DataHolderService.setHeaderData(undefined, undefined)
        $state.go('workout.loadall')

    $scope.showYear = (year) ->
        $state.go("workout.loadyear", {year: year})

    $scope.tooltip = ()->
        (key, x, y) ->
            "<p><strong>#{key}:</strong> #{y} miles in #{x}</p>"