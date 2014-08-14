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
                resolve: {
                    data: (BarChartService) ->
                        BarChartService.getYearTotals()
                }

            .state 'bar.year',
                url: '/year/:year'
                templateUrl: 'views/barchart.html'
                controller: 'BarYearChartCtrl'
                resolve: {
                    data: (BarChartService, $stateParams) ->
                        BarChartService.getMonthTotals($stateParams.year)
                }

            .state 'bar.month',
                url: '/month/:year/:month'
                templateUrl: 'views/barchart.html'
                controller: 'BarMonthChartCtrl'
                resolve: {
                    data: (BarChartService, $stateParams) ->
                        BarChartService.getWeekTotals($stateParams.year, $stateParams.month)
                }

            .state 'bar.week',
                url: '/month/:year/:month/:week'
                templateUrl: 'views/barchart.html'
                controller: 'BarWeekChartCtrl'
                resolve: {
                    data: (BarChartService, $stateParams) ->
                        BarChartService.getDayTotals($stateParams.year, $stateParams.month, $stateParams.week)
                }

#        Stateless Bar Chart States

            .state 'stateless',
                url: '/stateless'
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

            .state 'stateless.chart',
                url: '/chart'
                templateUrl: 'views/statelesschart.html'
                controller: 'StatelessChartCtrl'
                resolve: {
                    data: (BarChartService) ->
                        BarChartService.getYearTotals()
                }

#        Updating Stacked Bar Chart States

            .state 'updating',
                url: '/updating'
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

            .state 'updating.chart',
                url: '/chart'
                templateUrl: 'views/updatingbarchart.html'
                controller: 'UpdatingBarChartCtrl'




