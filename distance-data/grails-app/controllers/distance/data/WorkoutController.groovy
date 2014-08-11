package distance.data

import com.jondejong.fitness.DayDistanceTotal
import com.jondejong.fitness.ListWorkoutsCommand
import com.jondejong.fitness.MonthDistanceTotal
import com.jondejong.fitness.WeekDistanceTotal
import com.jondejong.fitness.YearDistanceTotal

import java.text.SimpleDateFormat


class WorkoutController {

    static responseFormats = ['json']

    static months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

    def workoutService

    def list(ListWorkoutsCommand command) {

        def responseJSON = [message: "SUCCESS"]

        if(!command.year) {
            def yearMap = [:]
            def workouts = Workout.findAll()

            workouts.each {workout->
                YearDistanceTotal yearTotal = yearMap."${workout.year}"

                if(!yearTotal){
                    yearTotal = new YearDistanceTotal(year: workout.year, runTotal: 0, bikeTotal: 0, total: 0)
                    yearMap."${workout.year}" =  yearTotal
                }

                yearTotal.total += workout.distance
                if("Run".equals(workout.type)) {
                    yearTotal.runTotal += workout.distance
                } else {
                    yearTotal.bikeTotal += workout.distance
                }
            }

            responseJSON.years = yearMap.values().sort {YearDistanceTotal a, YearDistanceTotal b ->
                a.year <=> b.year
            }
        } else if(!command.month) {
            def monthMap = [:]
            def workouts = Workout.findAll {
                year == command.year
            }

            workouts.each {workout->
                MonthDistanceTotal monthTotal = monthMap."${workout.month}"

                if(!monthTotal){
                    monthTotal = new MonthDistanceTotal(order: workout.month, month: months[workout.month], runTotal: 0, bikeTotal: 0, total: 0)
                    monthMap."${workout.month}" =  monthTotal
                }

                monthTotal.total += workout.distance
                if("Run".equals(workout.type)) {
                    monthTotal.runTotal += workout.distance
                } else {
                    monthTotal.bikeTotal += workout.distance
                }
            }

            responseJSON.year = [
                    year :  command.year,
                    months: monthMap.values().sort {MonthDistanceTotal a, MonthDistanceTotal b ->
                        a.order <=> b.order
                    }
            ]

        } else if(!command.week) {
            def monthName= command.month
            def month = months.indexOf(monthName)
            def weekMap = [:]
            def workouts = Workout.findAll {
                year == command.year
                month == month
            }

            workouts.each {workout->
                WeekDistanceTotal weekTotal = weekMap."${workout.weekInMonth}"

                if(!weekTotal){
                    weekTotal = new WeekDistanceTotal(week: workout.weekInMonth, runTotal: 0, bikeTotal: 0, total: 0)
                    weekMap."${workout.weekInMonth}" =  weekTotal
                }

                weekTotal.total += workout.distance
                if("Run".equals(workout.type)) {
                    weekTotal.runTotal += workout.distance
                } else {
                    weekTotal.bikeTotal += workout.distance
                }
            }

            responseJSON.month = [
                    year :  command.year,
                    month : month,
                    monthName: monthName,
                    weeks: weekMap.values().sort {WeekDistanceTotal a, WeekDistanceTotal b ->
                        a.week <=> b.week
                    }
            ]
        } else {
            def monthName = command.month
            def month = months.indexOf(monthName)

            def dayMap = [:]
            def workouts = Workout.findAll {
                year == command.year
                month == month
                weekInMonth == command.week
            }

            def dayNameFormat = new SimpleDateFormat('EEEE')

            workouts.each { workout ->
                DayDistanceTotal dayTotal = dayMap."${workout.dayInWeek}"
                def dayName = dayNameFormat.format(workout.date)

                if (!dayTotal) {
                    dayTotal = new DayDistanceTotal(day: workout.dayInWeek, dayName: dayName, runTotal: 0, bikeTotal: 0, total: 0)
                    dayMap."${workout.dayInWeek}" = dayTotal
                }

                dayTotal.total += workout.distance
                if ("Run".equals(workout.type)) {
                    dayTotal.runTotal += workout.distance
                } else {
                    dayTotal.bikeTotal += workout.distance
                }
            }

            responseJSON.month = [
                    year : command.year,
                    month: month,
                    week: command.week,
                    monthName: monthName,
                    days: dayMap.values().sort { DayDistanceTotal a, DayDistanceTotal b ->
                        a.day <=> b.day
                    }
            ]
        }

        respond responseJSON
    }

    def load() {
        def responseJSON = [status: 'Success']
        try {
            workoutService.load()
        } catch (e) {
            responseJSON.status = "Error"
            responseJSON.errorMessage = "${e.message}"
        }

       respond responseJSON
    }

    def index() { }
}
