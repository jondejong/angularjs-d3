###  Angular controller
&nbsp;

    angular.module('customdApp').controller 'MainCtrl', ($scope) ->

    $scope.data = {
        values: [
            ["Day 1",2],
            ["Day 2",6],
            ["Day 3",3],
            ["Day 4",5]
        ]
    }
