//
//  CategoriesResponse.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct CategoriesResponse: Decodable {
    let categories: Categories
    
    enum CodingKeys: String, CodingKey {
        case categoriesRoot = "category_list"
        case categories
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let rootCategories = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .categoriesRoot)
        
        categories = try rootCategories.decode(Categories.self, forKey: .categories)
    }
}
