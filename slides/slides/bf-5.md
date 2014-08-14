###  Angular Routes
&nbsp;

    var demo = angular.module('d3demo', ['ui', 'demoResources']);

    demo.config(['$routeProvider', function ($routeProvider) {
        $routeProvider.
          when('/barchart', {templateUrl: '/d3demo/partial/module/list',
            controller: BarChartCtrl}).
          when('/tbarchart', {templateUrl: '/d3demo/partial/module/list',
            controller: TransitionalBarChartCtrl}).
          otherwise({redirectTo: '/barchart'});
    }]);
