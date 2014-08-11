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

        $urlRouterProvider.otherwise("/workout/loadall")

        $stateProvider
            .state 'workout',
                url: '/workout'
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

            .state 'workout.loadall',
                url: '/loadall'
                templateUrl: 'views/loading.html'
                controller: 'LoadAllCtrl'

            .state 'workout.all',
                url: '/all'
                templateUrl: 'views/barchart.html'
                controller: 'AllChartCtrl'

            .state 'workout.loadyear',
                url: '/loadyear/:year'
                templateUrl: 'views/loading.html'
                controller: 'LoadYearCtrl'

            .state 'workout.year',
                url: '/year/:year'
                templateUrl: 'views/barchart.html'
                controller: 'YearChartCtrl'

            .state 'workout.loadmonth',
                url: '/loadmonth/:year/:month'
                templateUrl: 'views/loading.html'
                controller: 'LoadMonthCtrl'

            .state 'workout.month',
                url: '/month/:year/:month'
                templateUrl: 'views/barchart.html'
                controller: 'MonthChartCtrl'

