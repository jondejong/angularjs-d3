'use strict'

angular.module('frontendApp')
  .service 'DataHolderService', ->

    currentData = undefined

    {
        getCurrentData: ()->
            currentData

        setCurrentData: (data)->
            currentData = data
    }