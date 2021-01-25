//
//  UsersRequest.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UsersRequest: APIRequest {
    
    typealias Response = UsersResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
    }
        
    var parameters: [String : String] {
        return [
            "period": "all",
            "order": "topic_count",
        ]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }

}
