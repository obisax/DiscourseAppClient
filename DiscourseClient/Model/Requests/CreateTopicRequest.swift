//
//  CreateTopicRequest.swift
//  Eh-Ho
//
//  Created by Ignacio Garcia Sainz on 17/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

// TODO: Implementar las propiedades de esta request
struct CreateTopicRequest: APIRequest {
    
    typealias Response = AddNewTopicResponse
    
    let title: String

    
    init(title: String) {
        self.title = title

    }
    
    var method: Method {
        return .POST
    }
    
    var path: String {
        return "/post.json"
    }
    
    var parameters: [String : String] {
        return[:]
    }
    
    var body: [String : Any] {
        return [
            "title": title,
//            "raw": raw,
//            "createdAt": createdAt
        ]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
