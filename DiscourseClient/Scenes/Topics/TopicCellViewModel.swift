//
//  TopicCellViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// ViewModel que representa un topic en la lista
class TopicCellViewModel {
   
    let topic: Topic
    var textLabelText: String?
    var postsCount: String?
    
    init(topic: Topic) {
        self.topic = topic
        self.textLabelText = topic.title
        self.postsCount = "\(topic.postsCount)"
    }
}