'use strict'

angular.module('frontendApp', [
        'ngCookies',
        'ngResource',
        'ngSanitize',
        'ngRoute',
        'ui.bootstrap',
        'ui.router'
    ]).config ($stateProvider, $urlRouterProvider, $httpProvider) ->

        $urlRouterProvider.otherwise("/workout/loadyear")

        $stateProvider
            .state 'workout',
                url: '/workout'
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

            .state 'workout.loadyear',
                url: '/loadyear'
                templateUrl: 'views/loading.html'
                controller: 'LoadYearCtrl'
            .state 'workout.year',
                url: '/year'
                templateUrl: 'views/year.html'
                controller: 'YearChartCtrl'


