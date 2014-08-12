'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $state, DataHolderService) ->
    $scope.state= {}

    $scope.showAll = () ->
        $state.go('workout.loadall')

    $scope.showYear = () ->
        $state.go("workout.loadyear", {year: $scope.state.year})

    $scope.showMonth = ()->
        $state.go("workout.loadmonth", {year: $scope.state.year, month: $scope.state.month})

    $scope.tooltip = ()->
        (key, x, y) ->
            "<p><strong>#{key}:</strong> #{y} miles in #{x}</p>"

    $scope.$on '$stateChangeSuccess', (event, state, params) ->
        $scope.state = params