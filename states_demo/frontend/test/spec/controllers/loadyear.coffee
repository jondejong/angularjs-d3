'use strict'

describe 'Controller: LoadyearCtrl', ->

  # load the controller's module
  beforeEach module 'frontendApp'

  LoadyearCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    LoadyearCtrl = $controller 'LoadyearCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
