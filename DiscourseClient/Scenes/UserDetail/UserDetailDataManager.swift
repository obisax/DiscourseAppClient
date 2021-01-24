//
//  UserDetailDataManager.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 23/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UserDetailDataManager: class {
    func fetchUser(username: String, completion: @escaping (Result<UserDetailResponse?, Error>) -> ())
    func updateName(username: String, name: String, completion: @escaping (Result<UpdateUserNameResponse?, Error>) -> ())
}
