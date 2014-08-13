'use strict'

describe 'Controller: LoadmonthCtrl', ->

  # load the controller's module
  beforeEach module 'frontendApp'

  LoadmonthCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LoadmonthCtrl = $controller 'LoadmonthCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
