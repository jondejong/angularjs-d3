'use strict'

describe 'Controller: YearchartctrlCtrl', ->

  # load the controller's module
  beforeEach module 'frontendApp'

  YearchartctrlCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    YearchartctrlCtrl = $controller 'YearchartctrlCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
