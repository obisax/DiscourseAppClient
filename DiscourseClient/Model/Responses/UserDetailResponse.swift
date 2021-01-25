//
//  UserDetailResponse.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 23/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UserDetailResponse: Codable {
    let user: PurpleUser?

    enum CodingKeys: String, CodingKey {
        case user
    }
}

struct PurpleUser: Codable {
    let id: Int?
    let username, name, avatarTemplate, email: String?
    let canEditName: Bool?

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case avatarTemplate = "avatar_template"
        case email
        case canEditName = "can_edit_name"
    }
}
