package distance.data

import com.jondejong.fitness.ListWorkoutsCommand
import com.jondejong.fitness.MonthDistanceTotal
import com.jondejong.fitness.YearDistanceTotal


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
