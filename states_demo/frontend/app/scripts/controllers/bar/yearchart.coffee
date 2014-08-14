angular.module('frontendApp')
.controller 'BarYearChartCtrl', ($scope, $state, $stateParams, data) ->

    $scope.year = $stateParams.year
    $scope.data = data

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
            (d) ->
                $state.go('bar.month', {year: $scope.year, month: d[0]})
            )

