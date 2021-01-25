//
//  CategoriesResponse.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct CategoriesResponse: Codable {
    let categoryList: CategoryList?

    enum CodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }
}

// MARK: - CategoryList
struct CategoryList: Codable {
    let categories: [Category]?

    enum CodingKeys: String, CodingKey {
        case categories
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
