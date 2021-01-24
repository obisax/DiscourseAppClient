//
//  AddTopicViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate para comunicar aspectos relacionados con navegación
protocol AddTopicCoordinatorDelegate: class {
    func addTopicCancelButtonTapped()
    func topicSuccessfullyAdded()
}

/// Delegate para comunicar a la vista aspectos relacionados con UI
protocol AddTopicViewDelegate: class {
    func errorAddingTopic()
}

class AddTopicViewModel {
    weak var viewDelegate: AddTopicViewDelegate?
    weak var coordinatorDelegate: AddTopicCoordinatorDelegate?
    let dataManager: AddTopicDataManager
    

    init(dataManager: AddTopicDataManager) {
        self.dataManager = dataManager
    }

    func cancelButtonTapped() {
        coordinatorDelegate?.addTopicCancelButtonTapped()
    }

    func submitButtonTapped(title: String) {
    
        dataManager.addTopic(title: title){ [weak self] result in
            guard let self = self else { return }
            
            switch result  {
            case .success (let result):
                guard let result = result else {return}
                if result.id != 0{
                self.coordinatorDelegate?.topicSuccessfullyAdded()
                }
            case .failure(let error):
                print(error)
                self.viewDelegate?.errorAddingTopic()
            }
        }
    }
}

