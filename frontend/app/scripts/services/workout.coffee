'use strict'

angular.module('frontendApp')
  .service 'WorkoutService', ($http) ->


    {
        getYearTotals: ->
            $http.get("http://localhost:8080/distance-data/workout/").then (response)->
                years = response.data.years
                totals =
                {
                    key: "Totals",
                    values: years.map (year)->
                        [year.year - 2010, year.total]
                }

                bikeTotals =
                {
                    key: "Totals",
                    values: years.map (year)->
                        [year.year - 2010, year.bikeTotal]
                }

                runTotals =
                {
                    key: "Totals",
                    values: years.map (year)->
                        [year.year - 2010, year.runTotal]
                }

                [totals, bikeTotals, runTotals]
        }