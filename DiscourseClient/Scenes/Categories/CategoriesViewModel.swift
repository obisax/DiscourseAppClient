//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// ViewModel representando un listado de categorías
protocol CategoriesCoordinatorDelegate: class {
    
}


protocol CategoriesViewDelegate: class {
    func categoriesFetched()
    func errorFetchingCategories()
}

/// ViewModel representando un listado de categorías
class CategoriesViewModel {
    weak var coordinatorDelegate: CategoriesCoordinatorDelegate?
    weak var viewDelegate: CategoriesViewDelegate?
    let categoriesDataManager: CategoriesDataManager
    var categoriesViewModels: [CategoryCellViewModel] = []
    
    init(categoriesDataManager: CategoriesDataManager) {
        self.categoriesDataManager = categoriesDataManager
    }
    
    func viewWasLoaded() {
        fetchCategories()
    }
    
    private func fetchCategories() {
        categoriesDataManager.fetchAllCategories { [weak self] result in
            guard let self = self else { return}
            
            switch result {
            case .success(let categoriesResp):
                guard let categories = categoriesResp?.categoryList?.categories else { return }
                self.categoriesViewModels = categories.map ({category -> CategoryCellViewModel in
                    return CategoryCellViewModel(category: category)
                })
                
                self.viewDelegate?.categoriesFetched()
                
            case .failure:
                self.viewDelegate?.errorFetchingCategories()
            }
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return categoriesViewModels.count
    }
    
    func viewModel(at indexPath: IndexPath) -> CategoryCellViewModel? {
        guard indexPath.row < categoriesViewModels.count else { return nil }
        return categoriesViewModels[indexPath.row]
    }
}

