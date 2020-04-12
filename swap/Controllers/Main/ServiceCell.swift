//
//  ServiceViewController.swift
//  swap
//
//  Created by Мария on 23/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class ServiceCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 13
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func fill(with service: Service) {
        imageView.image = service.image
        nameLabel.text = service.name
    }
}
