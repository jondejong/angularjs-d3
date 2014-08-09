package distance.data

import org.bson.types.ObjectId

class Workout {

    ObjectId id

    String type
    Date date

    Integer year
    Integer month
    Integer weekInYear
    Integer weekInMonth
    Integer dayInMonth
    Integer dayInWeek

    Long distance

    static mapping = {
        compoundIndex year:1, month:1
    }
}
