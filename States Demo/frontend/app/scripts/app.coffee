'use strict'

angular.module('frontendApp', [
        'ngCookies',
        'ngResource',
        'ngSanitize',
        'ngRoute',
        'ui.bootstrap',
        'ui.router',
        'nvd3ChartDirectives'
    ]).config ($stateProvider, $urlRouterProvider) ->

        $urlRouterProvider.otherwise("/bar/all")

        $stateProvider
            .state 'bar',
                url: '/bar'
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

#        Stateful Bar Chart States

            .state 'bar.all',
                url: '/all'
                templateUrl: 'views/barchart.html'
                controller: 'BarAllChartCtrl'

            .state 'bar.year',
                url: '/year/:year'
                templateUrl: 'views/barchart.html'
                controller: 'BarYearChartCtrl'

            .state 'bar.month',
                url: '/month/:year/:month'
                templateUrl: 'views/barchart.html'
                controller: 'BarMonthChartCtrl'

            .state 'bar.week',
                url: '/month/:year/:month/:week'
                templateUrl: 'views/barchart.html'
                controller: 'BarWeekChartCtrl'

#        Stateless Bar Chart States

            .state 'stateless',
                url: '/stateless'
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

            .state 'stateless.chart',
                url: '/chart'
                templateUrl: 'views/statelesschart.html'
                controller: 'StatelessChartCtrl'

#        Updating Stacked Bar Chart States

            .state 'updating',
                url: '/updating'
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

            .state 'updating.chart',
                url: '/chart'
                templateUrl: 'views/updatingbarchart.html'
                controller: 'UpdatingBarChartCtrl'



