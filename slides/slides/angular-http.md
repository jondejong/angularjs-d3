### Many provided services

    angular.module('myApp').service('MyService', function() {
      var data = undefined;
      return {
          data : data,
          fetchThings: function () {
            $http.get('http://www.restapi.com/endpoint').then(function(response){
                data = response.data;
              });
          }
        }
      });
