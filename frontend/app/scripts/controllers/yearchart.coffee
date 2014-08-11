angular.module('frontendApp')
.controller 'YearChartCtrl', ($scope, DataHolderService, $state, $stateParams) ->

    $scope.data = DataHolderService.getCurrentData()

    $scope.tooltip = ()->
        (key, x, y) ->
            "<p>#{key}: #{y} miles in #{x}</p>"

    $scope.callback = ()->
        ()->
            d3.selectAll(".nv-bar").on('click',
            (d) ->
                console.log("clicked got passed in:", d)
            )

    if !$scope.data
        $state.go('workout.loadyear', {year: $stateParams.year})