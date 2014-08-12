'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $state, DataHolderService) ->
    $scope.state= {}

    $scope.showAll = () ->
        $state.go('bar.loadall')

    $scope.showYear = () ->
        $state.go("bar.loadyear", {year: $scope.state.year})

    $scope.showMonth = ()->
        $state.go("bar.loadmonth", {year: $scope.state.year, month: $scope.state.month})

    $scope.tooltip = ()->
        (key, x, y) ->
            "<p><strong>#{key}:</strong> #{y} miles in #{x}</p>"

    $scope.$on '$stateChangeSuccess', (event, state, params) ->
        $scope.state = params