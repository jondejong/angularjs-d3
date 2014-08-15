###  service

      angular.module('myApp').service('MyService', function() {
        return {
          message: "Hello World"
        }
      });

### controller
      angular.module('myApp').controller('HelloWorldCtrl', function($scope, MyService) {
          $scope.message = MyService.message;
      });
