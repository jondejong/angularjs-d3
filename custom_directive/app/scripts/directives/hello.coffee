'use strict'

angular.module('customdApp').directive('hello', ->
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'Hello World'
  )
