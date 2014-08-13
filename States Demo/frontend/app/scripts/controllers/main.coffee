'use strict'

angular.module('frontendApp')
  .controller 'MainCtrl', ($scope, $state) ->

    $scope.bar = false
    $scope.line = false
    $scope.pie = false

    checkChartType = (state)->
        if $state.current.name.indexOf('bar') != -1
            $scope.bar = true
            $scope.line = false
            $scope.pie = false
        else if $state.current.name.indexOf('line') != -1
            $scope.line = true
            $scope.bar = false
            $scope.pie = false
        else if $state.current.name.indexOf('pie') != -1
            $scope.pie = true
            $scope.line = false
            $scope.bar = false

    $scope.state= {}

    $scope.loadBar = () ->
        console.log "Loading bar chart"

    $scope.loadLine = () ->
        console.log "Loading line graph"

    $scope.loadPie = () ->
        console.log "Loading Pie Chart"

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
        checkChartType(state)