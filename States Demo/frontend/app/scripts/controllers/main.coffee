'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $state) ->

    $scope.line = false
    $scope.updating = false

    checkChartType = ()->
    $scope.bar = $state.current.name.indexOf('bar') != -1
    $scope.stacked = $state.current.name.indexOf('updating') != -1

    $scope.state= {}


    $scope.loadBar = () ->
        $state.go('bar.loadall')

    $scope.loadStacked = () ->
        $state.go('updating.chart')

    $scope.showAll = () ->
        $state.go('bar.loadall')

    $scope.showYear = () ->
        $state.go("bar.loadyear", {year: $scope.state.year})

    $scope.showMonth = ()->
        $state.go("bar.loadmonth", {year: $scope.state.year, month: $scope.state.month})

    $scope.tooltip = ()->
        (key, x, y) ->
            "<p><strong>#{key}:</strong> #{y} miles in #{x}</p>"

    checkChartType($state)

    $scope.$on '$stateChangeSuccess', (event, state, params) ->
        $scope.state = params
        checkChartType()