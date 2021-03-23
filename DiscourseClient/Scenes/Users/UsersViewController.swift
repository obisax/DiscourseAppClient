//
//  UsersViewController.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    lazy private var flowLayout : UICollectionViewFlowLayout={
        let numberOfColumns: Int = 3
        let sectionInset: CGFloat = 16.0
        let minimumInteritemSpacing: CGFloat = 8.0
        let height: CGFloat = 160
        
        let layout = UICollectionViewFlowLayout()
        let width : CGFloat =  (UIScreen.main.bounds.width - sectionInset * 2 - minimumInteritemSpacing * (CGFloat(numberOfColumns) - 1)) / CGFloat(numberOfColumns)
        
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "UserCell", bundle: nil), forCellWithReuseIdentifier: "UserCell")
       
        return  collectionView
    }()
    
   
    let viewModel: UsersViewModel
    
    init(viewModel:UsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewWasLoaded()
    }
    
  
    fileprivate func showErrorFetchingUsersAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching categories\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    
}

extension UsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCell else { fatalError() }
        cell.viewModel = viewModel.viewModel(at: indexPath)
        return cell
    }
}
  
extension UsersViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}
extension UsersViewController: UsersViewDelegate {
    
    func usersFetched() {
         collectionView.reloadData()
    }
    
    func errorFetchingUsers() {
        showErrorFetchingUsersAlert()
    }
}

