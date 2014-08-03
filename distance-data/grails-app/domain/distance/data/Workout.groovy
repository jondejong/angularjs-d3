package distance.data

class Workout {

    String type
    Integer year
    Integer month
    Integer weekInYear
    Integer dayInMonth

    BigDecimal distance


    static mapping = {
        compoundIndex year:1, month:1, weekInYear, dayInMonth
    }
}
