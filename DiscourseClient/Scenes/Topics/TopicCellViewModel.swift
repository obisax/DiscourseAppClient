//
//  TopicCellViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// ViewModel que representa un topic en la lista

protocol  TopicCellViewModelViewDelegate {
    func userImageFetched()
}

class TopicCellViewModel {
   
    static let imageSize = 80
    let topic: Topic
    let userLastPoster : User
    
    var delegate: TopicCellViewModelViewDelegate?
    
    var imagePost: UIImage?{
        didSet {
            delegate?.userImageFetched()
        }
    }
    var topicTitleLabel: String?
    var commentCountLabel: String?
    var viewCountLabel:String?
    var postDateLabel: String?
   
    
    init(topic: Topic, userLastPoster:User) {
        self.topic = topic
        self.userLastPoster = userLastPoster
        
        self.topicTitleLabel = topic.title
        self.commentCountLabel = "\(topic.postsCount)"
        self.viewCountLabel = "\(topic.posters.count )"
        self.postDateLabel = ""
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = Locale(identifier: "es_ES")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let lastPostDate = formatter.date(from: topic.lastPostedAt) {
            formatter.dateFormat = "MMM d"
            self.postDateLabel = formatter.string(from: lastPostDate).capitalized
        }
        
        let avatarUrl: String = userLastPoster.avatarTemplate.replacingOccurrences(of: "{size}", with: "\(TopicCellViewModel.imageSize)")
        if let imageUrl = URL(string: "\(apiURL)\(avatarUrl)") {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                guard let data = try? Data(contentsOf: imageUrl),
                    let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async {
                    self?.imagePost = image
                }
            }
        }
    }
}
