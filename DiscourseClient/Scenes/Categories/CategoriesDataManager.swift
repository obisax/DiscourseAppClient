//
//  CategoriesDataManager.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation
enum CategoriesDataManagerError: Error {
    case unknown
}

protocol CategoriesDataManager {
    func fetchAllCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ())
}
