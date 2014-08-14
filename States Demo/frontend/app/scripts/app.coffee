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

#        Bar Chart States
            .state 'bar.loadall',
                url: '/loadall'
                templateUrl: 'views/loading.html'
                controller: 'BarLoadAllCtrl'

            .state 'bar.all',
                url: '/all'
                templateUrl: 'views/barchart.html'
                controller: 'BarAllChartCtrl'

            .state 'bar.loadyear',
                url: '/loadyear/:year'
                templateUrl: 'views/loading.html'
                controller: 'BarLoadYearCtrl'

            .state 'bar.year',
                url: '/year/:year'
                templateUrl: 'views/barchart.html'
                controller: 'BarYearChartCtrl'

            .state 'bar.loadmonth',
                url: '/loadmonth/:year/:month'
                templateUrl: 'views/loading.html'
                controller: 'BarLoadMonthCtrl'

            .state 'bar.month',
                url: '/month/:year/:month'
                templateUrl: 'views/barchart.html'
                controller: 'BarMonthChartCtrl'

            .state 'bar.loadweek',
                    url: '/loadmonth/:year/:month/:week'
                    templateUrl: 'views/loading.html'
                    controller: 'BarLoadWeekCtrl'

            .state 'bar.week',
                url: '/month/:year/:month/:week'
                templateUrl: 'views/barchart.html'
                controller: 'BarWeekChartCtrl'

#        Updating Stacked Bar Chart States
            .state 'updating',
                url: '/updating'
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

            .state 'updating.chart',
                url: '/chart'
                templateUrl: 'views/updatingbarchart.html'
                controller: 'UpdatingBarChartCtrl'



