grails {
    mongo {
        host = "localhost"
        port = 27017
        username = ""
        password = ""
        databaseName = "fitness"
    }
}

// environment specific settings
environments {
    development {
        dataSource {
        }
    }
    test {
        dataSource {
        }
    }
    production {
        dataSource {
        }
    }
}