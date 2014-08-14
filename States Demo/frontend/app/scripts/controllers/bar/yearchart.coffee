angular.module('frontendApp')
.controller 'BarYearChartCtrl', ($scope, $state, $stateParams, BarChartService) ->

    BarChartService.getMonthTotals($stateParams.year).then (data) ->
        $scope.data = data

    $scope.year = $stateParams.year

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
            (d) ->
                $state.go('bar.month', {year: $scope.year, month: d[0]})
            )

