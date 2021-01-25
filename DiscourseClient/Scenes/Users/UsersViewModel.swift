//
//  UsersViewModel.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation
protocol UsersCoordinatorDelegate: class {
    func didSelect(user: User)
}


protocol UsersViewDelegate: class {
    func usersFetched()
    func errorFetchingUsers()
}

/// ViewModel representando un listado de categorías
class UsersViewModel {
    weak var coordinatorDelegate: UsersCoordinatorDelegate?
    weak var viewDelegate: UsersViewDelegate?
    let usersDataManager: UsersDataManager
    var usersViewModels: [UserCellViewModel] = []

    
    init(usersDataManager: UsersDataManager) {
        self.usersDataManager = usersDataManager
    }
    
    func viewWasLoaded() {
        fetchUsers()
    }
    
    func refreshUsers() {
        fetchUsers()
    }
    
    private func fetchUsers() {
        usersDataManager.fetchAllUsers{ [weak self] result in
            guard let self = self else { return}
            
            switch result {
            case .success(let usersResp):
                guard let users = usersResp?.directoryItems else { return }
                self.usersViewModels = users.map ({ directoryItems -> UserCellViewModel in
                    return UserCellViewModel(user: directoryItems.user)
                })
                
                self.viewDelegate?.usersFetched()
                
            case .failure:
                self.viewDelegate?.errorFetchingUsers()
            }
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return usersViewModels.count
    }
    
    func viewModel(at indexPath: IndexPath) -> UserCellViewModel? {
        guard indexPath.row < usersViewModels.count else { return nil }
        return usersViewModels[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < usersViewModels.count else { return }
        coordinatorDelegate?.didSelect(user: usersViewModels[indexPath.row].user)
    }
}

