'use strict'

describe 'Controller: WorkoutCtrl', ->

  # load the controller's module
  beforeEach module 'frontendApp'

  WorkoutCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    WorkoutCtrl = $controller 'WorkoutCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
