angular.module('frontendApp')
.controller 'YearChartCtrl', ($scope, DataHolderService, $state, $stateParams) ->

    $scope.data = DataHolderService.getCurrentData()
    $scope.year = $stateParams.year

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
            (d) ->
                console.log("clicked got passed in:", d)
                $state.go('bar.loadmonth', {year: $scope.year, month: d[0]})
            )

    if !$scope.data
        $state.go('bar.loadyear', {year: $scope.year})