//
//  UsersResponse.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UsersResponse: Codable {
    let directoryItems: [DirectoryItem]?
    let totalRowsDirectoryItems: Int?
    let loadMoreDirectoryItems: String?

    enum CodingKeys: String, CodingKey {
        case directoryItems = "directory_items"
        case totalRowsDirectoryItems = "total_rows_directory_items"
        case loadMoreDirectoryItems = "load_more_directory_items"
    }
}

// MARK: - DirectoryItem
struct DirectoryItem: Codable {
    let id, timeRead, likesReceived, likesGiven: Int?
    let topicsEntered, topicCount, postCount, postsRead: Int?
    let daysVisited: Int?
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case timeRead = "time_read"
        case likesReceived = "likes_received"
        case likesGiven = "likes_given"
        case topicsEntered = "topics_entered"
        case topicCount = "topic_count"
        case postCount = "post_count"
        case postsRead = "posts_read"
        case daysVisited = "days_visited"
        case user
    }
}
