'use strict'

angular.module('frontendApp')
  .service 'BarChartService', ($http) ->

    {
        getDayTotals: (year, month, week) ->
            $http.get("http://localhost:8080/distance-data/workout/#{year}/#{month}/#{week}").then (response)->
                days = response.data.week.days

                total =
                {
                    key: "Total",
                    values: days.map (day)->
                        [day.dayName, day.total]
                }

                bikeTotal =
                {
                    key: "Bike",
                    values: days.map (day)->
                        [day.dayName, day.bikeTotal]
                }

                runTotal =
                {
                    key: "Run",
                    values: days.map (day)->
                        [day.dayName, day.runTotal]
                }
                [total, bikeTotal, runTotal]


        getWeekTotals: (year, month)->
            $http.get("http://localhost:8080/distance-data/workout/#{year}/#{month}").then (response)->
                weeks = response.data.month.weeks
                total =
                {
                    key: "Total",
                    values: weeks.map (week)->
                        [week.week, week.total]
                }

                bikeTotal =
                {
                    key: "Bike",
                    values: weeks.map (week)->
                        [week.week, week.bikeTotal]
                }

                runTotal =
                {
                    key: "Run",
                    values: weeks.map (week)->
                        [week.week, week.runTotal]
                }
                [total, bikeTotal, runTotal]

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