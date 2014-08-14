'use strict'

describe 'Directive: BarChart', ->

  # load the directive's module
  beforeEach module 'customdApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<-bar-chart></-bar-chart>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the BarChart directive'
