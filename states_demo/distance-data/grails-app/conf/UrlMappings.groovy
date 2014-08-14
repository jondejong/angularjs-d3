class UrlMappings {

	static mappings = {
        "/workout/load"(controller: 'workout', action: 'load')

        "/workout/$year?/$month?/$week?"(controller: "workout", action: "list")

//        "/$controller/$action?/$id?(.$format)?"{
//            constraints {
//                // apply constraints here
//            }
//        }

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
