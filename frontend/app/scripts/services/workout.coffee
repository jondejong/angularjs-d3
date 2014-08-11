'use strict'

angular.module('frontendApp')
  .service 'WorkoutService', ($http) ->


    {
        getMonthTotals: (year) ->
            $http.get("http://localhost:8080/distance-data/workout/#{year}").then (response)->
                months = response.data.year.months
                total =
                {
                    key: "Total",
                    values: months.map (month)->
                        [month.month, month.total]
                }

                bikeTotal =
                {
                    key: "Bike",
                    values: months.map (month)->
                        [month.month, month.bikeTotal]
                }

                runTotal =
                {
                    key: "Run",
                    values: months.map (month)->
                        [month.month, month.runTotal]
                }
                [total, bikeTotal, runTotal]

        getYearTotals: ->
            $http.get("http://localhost:8080/distance-data/workout/").then (response)->
                years = response.data.years
                total =
                {
                    key: "Total",
                    values: years.map (year)->
                        [year.year, year.total]
                }

                bikeTotal =
                {
                    key: "Bike",
                    values: years.map (year)->
                        [year.year, year.bikeTotal]
                }

                runTotal =
                {
                    key: "Run",
                    values: years.map (year)->
                        [year.year, year.runTotal]
                }

                [total, bikeTotal, runTotal]
        }