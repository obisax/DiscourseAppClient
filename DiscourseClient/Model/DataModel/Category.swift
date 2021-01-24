//
//  Category.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

typealias Categories = [Category]

struct Category: Codable {
    
    let id: Int
    let name: String
    let color: String
    let textColor: String
    let slug: String
    let topicCount: Int
    let postCount: Int
    let position: Int
    let description: String
    let descriptionText: String
    let readRestricted: Bool
    let canEdit: Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case id, name, color, slug, position, description
        case textColor = "text_color"
        case topicCount = "topic_count"
        case postCount = "post_count"
        case descriptionText = "description_text"
        case readRestricted = "read_restricted"
        case canEdit = "can_edit"
    }
}
