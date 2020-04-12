//
//  SecondSeleclionCityCell.swift
//  swap
//
//  Created by Мария on 21/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class SecondSelectionCityCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    func setSelected(_ isSelected: Bool) {
        checkImageView.image = isSelected ? UIImage(named: "done") : UIImage(named: "free")
    }
}
