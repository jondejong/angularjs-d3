'use strict'

angular.module('frontendApp')
  .service 'DataHolderService', ->

    currentData = undefined
    header = {
        year: undefined,
        month: undefined,
        week: undefined
    }

    {
        getHeaderData: () -> header

        setHeaderData: (year, month, week)->
            header.year = year
            header.month = month
            header.week = week

        getCurrentData: ()-> currentData

        setCurrentData: (data)-> currentData = data


    }