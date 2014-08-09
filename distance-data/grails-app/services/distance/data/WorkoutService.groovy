package distance.data

import grails.transaction.Transactional

import java.text.SimpleDateFormat

@Transactional
class WorkoutService {

    def load() {
        def date = new SimpleDateFormat("MM/dd/yyyy").parse('01/01/2010')
        def lastDay = new Date() - 2

        while (date < lastDay) {
            if (new Random().nextInt(7) < 5) {
                // Worked out on this date
                def typeVal = new Random().nextInt(7)
                if (typeVal < 3) {
                    createWorkout('Run', getRunDistance(), date).save(failOnError: true)
                } else if(typeVal < 7) {
                    createWorkout('Bike', getBikeDistance(), date).save(failOnError: true)
                } else {
                    createWorkout('Run', getRunDistance(), date).save(failOnError: true)
                    createWorkout('Bike', getBikeDistance(), date).save(failOnError: true)
                }
            }
            date = date + 1
        }
    }

    def createWorkout(type, distance, date) {
        def cal = Calendar.getInstance()
        cal.setTime(date)
        def workout = new Workout(type: type, distance: distance, date: date)
        workout.year = cal.get(Calendar.YEAR)
        workout.month = cal.get(Calendar.MONTH)
        workout.weekInYear = cal.get(Calendar.WEEK_OF_YEAR)
        workout.weekInMonth = cal.get(Calendar.WEEK_OF_MONTH)
        workout.dayInMonth = cal.get(Calendar.DAY_OF_MONTH)
        workout.dayInWeek = cal.get(Calendar.DAY_OF_WEEK)
        workout
    }

    def getBikeDistance() {
        def distanceType = new Random().nextInt(10)
        Boolean shrt = distanceType < 4
        Boolean med = distanceType >= 4 && distanceType < 10
        Boolean lng = !shrt && !med

        def distance = 0
        if(shrt) {
            distance = new Random().nextInt(15) + 5
        } else if(med) {
            distance = new Random().nextInt(40) + 15
        } else if(lng) {
            distance = new Random().nextInt(40) + 65
        }

        distance
    }

    def getRunDistance() {
        def distanceType = new Random().nextInt(10)
        Boolean shrt = distanceType < 4
        Boolean med = distanceType >= 4 && distanceType < 10
        Boolean lng = !shrt && !med

        def distance = 0
        if(shrt) {
            distance = new Random().nextInt(3) + 1
        } else if(med) {
            distance = new Random().nextInt(4) + 3
        } else if(lng) {
            distance = new Random().nextInt(10) + 6
        }

        distance
    }
}
