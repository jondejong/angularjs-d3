package com.jondejong.fitness

import grails.validation.Validateable

@Validateable
class ListWorkoutsCommand {

    Integer year
    String month
    Integer week


    static constraints = {
        year nullable: true
        year month: true
        year week: true
    }
}
