'use strict'

describe 'Service: LaodYear', ->

  # load the service's module
  beforeEach module 'frontendApp'

  # instantiate service
  LaodYear = {}
  beforeEach inject (_LaodYear_) ->
    LaodYear = _LaodYear_

  it 'should do something', ->
    expect(!!LaodYear).toBe true
