//
//  Order.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

enum Order: String {
        case likesReceived = "likes_received"
        case likesGiven = "likes_given"
        case topicCount = "topic_count"
        case postCount = "post_count"
        case postsRead = "posts_read"
        case daysVisited = "days_visited"
    }
