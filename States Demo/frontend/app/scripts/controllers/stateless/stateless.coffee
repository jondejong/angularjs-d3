angular.module('frontendApp')
.controller 'StatelessChartCtrl', ($scope, BarChartService, data) ->

    setSelections = (d) ->
        $scope.selections = (s[0] for s in d[0].values)

    $scope.data = data
    setSelections(data)

    $scope.state = {
        year: undefined,
        month: undefined,
        week: undefined
    }

    $scope.showAllStateless = () ->
        $scope.state = {}
        BarChartService.getYearTotals().then (data) ->
            $scope.data = data
            setSelections(data)

    $scope.showYearStateless = () ->
        $scope.state.month = undefined
        $scope.state.week = undefined
        BarChartService.getMonthTotals($scope.state.year).then (data) ->
            setSelections(data)
            $scope.data = data

    $scope.showMonthStateless = () ->
        $scope.state.week = undefined
        BarChartService.getWeekTotals($scope.state.year, $scope.state.month).then (data) ->
            setSelections(data)
            $scope.data = data

    $scope.showWeekStateless = () ->
        BarChartService.getDayTotals($scope.state.year, $scope.state.month, $scope.state.week).then (data) ->
            $scope.selections = undefined
            $scope.data = data

    $scope.transition = (selector) ->
        if !$scope.state.year
            $scope.state.year = selector
            $scope.showYearStateless()
        else if !$scope.state.month
            $scope.state.month = selector
            $scope.showMonthStateless()
        else
            $scope.state.week = selector
            $scope.showWeekStateless()
