//
//  UpdateUserName.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 23/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UpdateUserNameRequest: APIRequest {
    
    typealias Response = UpdateUserNameResponse
    
    let username: String
    let name: String
    
    init(username: String, name: String) {
        self.username = username
        self.name = name
    }
    
    var method: Method {
        return .PUT
    }
    
    var path: String {
        return "/users/\(username).json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [
            "name": name
        ]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
}
