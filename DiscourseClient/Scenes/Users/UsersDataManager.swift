//
//  UsersDataManager.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

enum UsersDataManagerError: Error {
    case unknown
}

/// Data Manager con las opraciones necesarias de este módulo
protocol UsersDataManager {
    func fetchAllUsers(completion: @escaping (Result<UsersResponse?, Error>) -> ())
}
