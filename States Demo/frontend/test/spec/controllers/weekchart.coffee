'use strict'

describe 'Controller: WeekchartCtrl', ->

  # load the controller's module
  beforeEach module 'frontendApp'

  WeekchartCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    WeekchartCtrl = $controller 'WeekchartCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
