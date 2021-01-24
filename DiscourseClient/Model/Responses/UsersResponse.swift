//
//  UsersResponse.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UsersResponse: Decodable {
    let users: Users

    enum CodingKeys: String, CodingKey {
        case users = "directory_items"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        users = try container.decode(Users.self, forKey: .users)
    }
}
