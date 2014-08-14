'use strict'

describe 'Directive: hello', ->

  # load the directive's module
  beforeEach module 'customdApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<hello></hello>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the hello directive'
