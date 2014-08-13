'use strict'

describe 'Controller: MonthchartCtrl', ->

  # load the controller's module
  beforeEach module 'frontendApp'

  MonthchartCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MonthchartCtrl = $controller 'MonthchartCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
