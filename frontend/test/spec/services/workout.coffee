'use strict'

describe 'Service: workout', ->

  # load the service's module
  beforeEach module 'frontendApp'

  # instantiate service
  workout = {}
  beforeEach inject (_workout_) ->
    workout = _workout_

  it 'should do something', ->
    expect(!!workout).toBe true
