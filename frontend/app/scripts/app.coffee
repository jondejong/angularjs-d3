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

        $urlRouterProvider.otherwise("/bar/loadall")

        $stateProvider
            .state 'bar',
                url: '/bar'
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

            .state 'bar.loadall',
                url: '/loadall'
                templateUrl: 'views/loading.html'
                controller: 'LoadAllCtrl'

            .state 'bar.all',
                url: '/all'
                templateUrl: 'views/barchart.html'
                controller: 'AllChartCtrl'

            .state 'bar.loadyear',
                url: '/loadyear/:year'
                templateUrl: 'views/loading.html'
                controller: 'LoadYearCtrl'

            .state 'bar.year',
                url: '/year/:year'
                templateUrl: 'views/barchart.html'
                controller: 'YearChartCtrl'

            .state 'bar.loadmonth',
                url: '/loadmonth/:year/:month'
                templateUrl: 'views/loading.html'
                controller: 'LoadMonthCtrl'

            .state 'bar.month',
                url: '/month/:year/:month'
                templateUrl: 'views/barchart.html'
                controller: 'MonthChartCtrl'

            .state 'bar.loadweek',
                    url: '/loadmonth/:year/:month/:week'
                    templateUrl: 'views/loading.html'
                    controller: 'LoadweekCtrl'

            .state 'bar.week',
                url: '/month/:year/:month/:week'
                templateUrl: 'views/barchart.html'
                controller: 'WeekChartCtrl'

