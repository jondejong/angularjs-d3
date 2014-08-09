package distance.data

import com.jondejong.fitness.ListWorkoutsCommand
import com.jondejong.fitness.YearDistanceTotal


class WorkoutController {

    static responseFormats = ['json']

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
