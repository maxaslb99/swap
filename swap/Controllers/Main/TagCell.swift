//
//  TagCell.swift
//  swap
//
//  Created by Мария on 02/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class TagCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = containerView.bounds.height/2
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = UIColor(named: "orange")!.cgColor
    }
    
    func fill(with tag: Tag) {
        nameLabel.text = tag.name
    }
    
    func set(isSelected: Bool) {
        if isSelected {
            containerView.backgroundColor = UIColor(named: "orange")!
            nameLabel.textColor = UIColor.white
        } else {
            nameLabel.textColor = UIColor(named: "Dark gray")
            containerView.backgroundColor = UIColor.clear
        }
    }
    
    override func prepareForReuse() {
        set(isSelected: false)
    }
    
}
