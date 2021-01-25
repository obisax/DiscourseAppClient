//
//  TopicDetailViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate que usaremos para comunicar eventos relativos a navegación, al coordinator correspondiente
protocol TopicDetailCoordinatorDelegate: class {
    func topicDetailBackButtonTapped()
    func topicDeleted()
}

/// Delegate para comunicar a la vista cosas relacionadas con UI
protocol TopicDetailViewDelegate: class {
    func topicDetailFetched()
    func errorFetchingTopicDetail()
    func errorDeletingTopicDetail()
}

class TopicDetailViewModel {
    var labelTopicIDText: String?
    var labelTopicNameText: String?
    var postsNumberLabelText: String?
    var canDeleteTopic = false

    weak var viewDelegate: TopicDetailViewDelegate?
    weak var coordinatorDelegate: TopicDetailCoordinatorDelegate?
    let topicDetailDataManager: TopicDetailDataManager
    let topicID: Int

    init(topicID: Int, topicDetailDataManager: TopicDetailDataManager) {
        self.topicID = topicID
        self.topicDetailDataManager = topicDetailDataManager
    }

    func viewDidLoad() {
        topicDetailDataManager.fetchTopic(id: topicID){ [weak self] result in
            guard let self = self else { return}
            switch result {
            case .success(let topicResp):
                
                if let topiclabelID = topicResp?.id{
                    self.labelTopicIDText = String(topiclabelID)
                }
                self.labelTopicNameText = topicResp?.fancyTitle
                if let topicNumberPostsLabel = topicResp?.postsCount{
                    self.postsNumberLabelText = String(topicNumberPostsLabel)
                }

                if let topicCanDelete = topicResp?.details?.canDelete{
                    self.canDeleteTopic = topicCanDelete
                }else {
                    self.canDeleteTopic = false

                }
                self.viewDelegate?.topicDetailFetched()
            case .failure(let error):
                print(error)
                self.viewDelegate?.errorFetchingTopicDetail()
            }
        }
    }
    
    func deleteTopic() {
        topicDetailDataManager.deleteTopic(id: topicID) { [weak self] result in
            guard let self = self else { return}
            
            switch result {
            case .success:
                self.coordinatorDelegate?.topicDeleted()
            case .failure:
         
                self.viewDelegate?.errorDeletingTopicDetail()
            }
        }
    }

    func backButtonTapped() {
        coordinatorDelegate?.topicDetailBackButtonTapped()
    }
}
