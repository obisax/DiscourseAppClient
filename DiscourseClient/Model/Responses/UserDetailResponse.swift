//
//  UserDetailResponse.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 23/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UserDetailResponse: Decodable {
    let user: User
    
    init(from decoder: Decoder) throws {
        let rootObject = try decoder.singleValueContainer()
        user = try rootObject.decode(User.self)
    }
}
