### Angular Controller
&nbsp;

    function BarChartCtrl($scope, $http) {
      $http.get('/d3demo/module/list/').success(function (data) {
          $scope.modules = data.modules;
          $scope.chart = createChart($scope.modules.length);

          $scope.$watch('modules', function() {
              refreshBarChart($scope.chart, $scope.modules);
          }, true);
      });
    }
