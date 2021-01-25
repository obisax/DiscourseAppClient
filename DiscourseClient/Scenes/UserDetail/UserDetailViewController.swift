//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 23/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

/// ViewController que representa el detalle de un User
class UserDetailViewController: UIViewController {
    
    lazy var labelUserID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelUsername: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userIDStackView: UIStackView = {
        let labelUserIDTitle = UILabel()
        labelUserIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelUserIDTitle.text = NSLocalizedString("User ID: ", comment: "")
        labelUserIDTitle.textColor = .black
        
        let userIDStackView = UIStackView(arrangedSubviews: [labelUserIDTitle, labelUserID])
        userIDStackView.translatesAutoresizingMaskIntoConstraints = false
        userIDStackView.axis = .horizontal
        
        return userIDStackView
    }()
    
    lazy var usernameStackView: UIStackView = {
        let labelUsernameTitle = UILabel()
        labelUsernameTitle.text = NSLocalizedString("User username: ", comment: "")
        labelUsernameTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let usernameStackView = UIStackView(arrangedSubviews: [labelUsernameTitle, labelUsername])
        usernameStackView.translatesAutoresizingMaskIntoConstraints = false
        usernameStackView.axis = .horizontal
        
        return usernameStackView
    }()
    
    lazy var userEmailStackView: UIStackView = {
        let userEmailLabel = UILabel()
        userEmailLabel.text = NSLocalizedString("User email: ", comment: "")
        userEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let userEmailStackView = UIStackView(arrangedSubviews: [userEmailLabel, labelEmail])
        userEmailStackView.translatesAutoresizingMaskIntoConstraints = false
        userEmailStackView.axis = .horizontal
        
        return userEmailStackView
    }()
    
    
    lazy var updateButton: UIButton = {
            let btn = UIButton(type: UIButton.ButtonType.system)
            btn.isHidden = true
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.setTitle("Update", for: .normal)
        btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = .darkGray
            btn.layer.cornerRadius = 5.0
            btn.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
            return btn
        }()
    
    
    let viewModel: UserDetailViewModel
    var editedName: String?
    
    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(userIDStackView)
        NSLayoutConstraint.activate([
            userIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        view.addSubview(usernameStackView)
        NSLayoutConstraint.activate([
            usernameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            usernameStackView.topAnchor.constraint(equalTo: userIDStackView.bottomAnchor, constant: 8)
        ])
        
        view.addSubview(userEmailStackView)
        NSLayoutConstraint.activate([
            userEmailStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userEmailStackView.topAnchor.constraint(equalTo: usernameStackView.bottomAnchor, constant: 8)
        ])
        
        view.addSubview(updateButton)
        NSLayoutConstraint.activate([
                   updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   updateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                   updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                   updateButton.heightAnchor.constraint(equalToConstant: 40)
               ])
        
        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    @objc func backButtonTapped() {
        viewModel.backButtonTapped()
    }
    
    fileprivate func showErrorFetchingUserDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching user detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    
    fileprivate func updateUI() {
        labelUserID.text = viewModel.labelUserIDText
        labelUsername.text = viewModel.labelUserNameText
        labelEmail.text = viewModel.labelEmailText
        
        showNameStack(name: viewModel.labelNameText, editable: viewModel.canModifyName)
        
        if  viewModel.canModifyName {
            updateButton.isHidden = false
        }
    }
    
    fileprivate func showErrorModifingUserDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error modifing user\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    
    private func showNameStack(name: String?, editable: Bool) {
        let nameLabel = UILabel()
        nameLabel.text = NSLocalizedString("User name: ", comment: "")
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let nameStackView = UIStackView(arrangedSubviews: [nameLabel])
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.axis = .horizontal
        
        if editable {
            let nameField = UITextField()
            nameField.translatesAutoresizingMaskIntoConstraints = false
            nameField.borderStyle = .line
            nameField.placeholder = NSLocalizedString("User name", comment: "")
            nameField.text = name
            nameField.addTarget(self, action: #selector(nameDidChange(_:)), for: .editingChanged)
            nameStackView.addArrangedSubview(nameField)
        } else {
            let nameField = UILabel()
            nameField.translatesAutoresizingMaskIntoConstraints = false
            nameField.text = name
            nameStackView.addArrangedSubview(nameField)
        }
        
        view.addSubview(nameStackView)
        NSLayoutConstraint.activate([
            nameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nameStackView.topAnchor.constraint(equalTo: userEmailStackView.bottomAnchor, constant: 8)
        ])
    }
    
   
    @objc private func nameDidChange(_ textField: UITextField){
        editedName = textField.text
    }
    
 
    @objc func updateButtonTapped() {
           guard let editedName = editedName, !editedName.isEmpty, editedName != viewModel.labelNameText else { return }
           viewModel.modifyUser(newName: editedName)
       }
    
    fileprivate func showErrorEditidingName() {
        let alertMessage: String = NSLocalizedString("User name can not be empty or the same value", comment: "")
        showAlert(alertMessage)
    }
    
    fileprivate func successModification(){
        let alertMessage: String = NSLocalizedString("User name updated!", comment: "")
        showAlert(alertMessage, "Success!")
    }
}

extension UserDetailViewController: UserDetailViewDelegate {
    func userDetailFetched() {
        updateUI()
    }
    
    func errorFetchingUserDetail() {
        showErrorFetchingUserDetailAlert()
    }
    
    func errorModifingUserDetail() {
        showErrorModifingUserDetailAlert()
    }
    
    func successModifingUserDetail() {
        successModification()
    }
}
