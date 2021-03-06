//
//  UserCell.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 22/01/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak private var avatarImage: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    
    var viewModel : UserCellViewModel?{
        
        didSet{
            guard let viewModel = viewModel else {return}
            viewModel.delegate = self
            avatarImage.image = viewModel.avatarImage
            nameLabel.text = viewModel.textLabelText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        avatarImage.image = nil
    }
    
    private func configureUI() {
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        avatarImage.layer.masksToBounds = true
        
        nameLabel.font = UIFont.avatar
    }
    
    private func showImage(_ image: UIImage?) {
        avatarImage.alpha = 0
        avatarImage.image = image
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.avatarImage.alpha = 1
        }
    }
}

extension UserCell: UserCellViewModelDelegate {
    
    func userImageFetched() {
        avatarImage.image = viewModel?.avatarImage
        setNeedsLayout()
    }
}
