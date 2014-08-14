'use strict'

describe 'Service: LoadMonth', ->

  # load the service's module
  beforeEach module 'frontendApp'

  # instantiate service
  LoadMonth = {}
  beforeEach inject (_LoadMonth_) ->
    LoadMonth = _LoadMonth_

  it 'should do something', ->
    expect(!!LoadMonth).toBe true
