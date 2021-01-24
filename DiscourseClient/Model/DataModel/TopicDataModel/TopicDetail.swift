//
//  TopicDetail.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct TopicDetails: Codable {
    
    let canEdit: Bool?
    let canDelete: Bool?
    let canCreatePost: Bool?
    let canFlagTopic: Bool
    
    enum CodingKeys: String, CodingKey {
        case canEdit = "can_edit"
        case canDelete = "can_delete"
        case canCreatePost = "can_create_post"
        case canFlagTopic = "can_flag_topic"
    }
    
}
