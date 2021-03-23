//
//  TopicCellPinned.swift
//  DiscourseClient
//
//  Created by Franco Paredes on 20/03/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class TopicCellPinned: UITableViewCell {
    
   
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var subtitleLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        containerView.layer.cornerRadius = 8
        titleLabel.font = UIFont.textStyle4
        subtitleLabel.font = UIFont.textStyle8
    }

}
