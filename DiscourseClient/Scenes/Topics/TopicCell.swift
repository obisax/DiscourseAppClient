//
//  TopicCell.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Celda que representa un topic en la lista
class TopicCell: UITableViewCell {
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var topicTitleLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
    
    var viewModel: TopicCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            topicTitleLabel.text = viewModel.topicTitleLabel
            imagePost.image = viewModel.imagePost
            commentCountLabel.text = viewModel.commentCountLabel
            viewCountLabel.text = viewModel.viewCountLabel
            postDateLabel.text = viewModel.postDateLabel
            
            viewModel.delegate = self 
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imagePost.image = nil
    }
    
    private func configureUI(){
        imagePost.layer.cornerRadius = imagePost.frame.height / 2
        topicTitleLabel.font = UIFont.style27
        commentCountLabel.font = UIFont.textStyle7
        viewCountLabel.font = UIFont.textStyle7
        postDateLabel.font = UIFont.textStyle2
    }
    
    private func showImage( _ image: UIImage?){
        imagePost.alpha = 0
        imagePost.image = image
        
        UIView.animate(withDuration: 0.5){ [ weak self] in
            self?.imagePost.alpha = 1 
        }
    }
}

extension TopicCell: TopicCellViewModelViewDelegate {
    
    func userImageFetched() {
        imagePost.image = viewModel?.imagePost
        setNeedsLayout()
    }
}

