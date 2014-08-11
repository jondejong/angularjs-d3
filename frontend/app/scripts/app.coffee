'use strict'

angular.module('frontendApp', [
        'ngCookies',
        'ngResource',
        'ngSanitize',
        'ngRoute',
        'ui.bootstrap',
        'ui.router',
        'nvd3ChartDirectives'
    ]).config ($stateProvider, $urlRouterProvider, $httpProvider) ->

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


