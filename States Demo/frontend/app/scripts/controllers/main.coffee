'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $state) ->

    checkChartType = ()->
    $scope.bar = $state.current.name.indexOf('bar') != -1
    $scope.stacked = $state.current.name.indexOf('updating') != -1
    $scope.stateless = $state.current.name.indexOf('stateless') != -1

    $scope.state= {}

    $scope.loadBar = () ->
        $state.go('bar.all')

    $scope.loadStacked = () ->
        $state.go('updating.chart')

    $scope.loadStateless = () ->
        $state.go('stateless.chart')

    $scope.showAll = () ->
        $state.go('bar.all')

    $scope.showYear = () ->
        $state.go("bar.year", {year: $scope.state.year})

    $scope.showMonth = ()->
        $state.go("bar.month", {year: $scope.state.year, month: $scope.state.month})

    $scope.tooltip = ()->
        (key, x, y) ->
            "<p><strong>#{key}:</strong> #{y} miles in #{x}</p>"

    checkChartType($state)

    $scope.$on '$stateChangeSuccess', (event, state, params) ->
        $scope.state = params
        checkChartType()
