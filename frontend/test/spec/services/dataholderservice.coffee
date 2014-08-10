'use strict'

describe 'Service: DataHolderService', ->

  # load the service's module
  beforeEach module 'frontendApp'

  # instantiate service
  DataHolderService = {}
  beforeEach inject (_DataHolderService_) ->
    DataHolderService = _DataHolderService_

  it 'should do something', ->
    expect(!!DataHolderService).toBe true
