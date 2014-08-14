angular.module('frontendApp')
.controller 'UpdatingBarChartCtrl', ($scope, DataHolderService, $state, $stateParams) ->
    $scope.data = [
        {
            key: "Things",
            values: [
                [0, 4],
                [1, 6],
                [2, 10],
                [3, 3]
            ]
        },
        {
            key: "Others",
            values: [
                [0, 5],
                [1, 2],
                [2, 1],
                [3, 6]
            ]
        }
    ]

    $scope.new = {
        things: 0,
        others: 0
    }

    $scope.addNew = () ->
        console.log("Adding new: ", $scope.new)

        i = $scope.data[0].values.length
#
        $scope.data[0].values.push([i, $scope.new.things])
        $scope.data[1].values.push([i, $scope.new.others])
#
#        $scope.apply()
        $scope.clearNew()

    $scope.clearNew = () ->
        $scope.new = {
                things: 0,
                others: 0
            }

