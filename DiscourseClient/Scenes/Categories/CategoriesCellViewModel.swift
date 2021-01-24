//
//  CategoriesCellViewModel.swift
//  DiscourseClient
//
//  Created by  Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

class CategoryCellViewModel {
    let category: Category
    var textLabelText: String?
    
    init(category: Category) {
        self.category = category
        self.textLabelText = category.name
    }
}
