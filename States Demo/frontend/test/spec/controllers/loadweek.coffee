'use strict'

describe 'Controller: LoadweekCtrl', ->

  # load the controller's module
  beforeEach module 'frontendApp'

  LoadweekCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LoadweekCtrl = $controller 'LoadweekCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
