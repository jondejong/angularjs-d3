'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $state) ->

    $scope.showAll = () ->
        $state.go('workout.loadall')

    $scope.tooltip = ()->
        (key, x, y) ->
            "<p><strong>#{key}:</strong> #{y} miles in #{x}</p>"