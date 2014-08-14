### Define the directive

    angular.module('customdApp').directive 'barChart', ->
      restrict: 'E'
      scope: {data: '='}
      link: (scope, element, attrs) ->
