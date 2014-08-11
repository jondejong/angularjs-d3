'use strict'

angular.module('frontendApp')
  .service 'DataHolderService', ->

    currentData = undefined
    header = {
        year: undefined
        month: undefined
    }

    {
        getHeaderData: () -> header

        setHeaderData: (year, month)->
            header.year = year
            header.month = month

        getCurrentData: ()-> currentData

        setCurrentData: (data)-> currentData = data


    }