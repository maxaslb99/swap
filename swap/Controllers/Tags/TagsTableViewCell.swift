//
//  TagsViewCell.swift
//  swap
//
//  Created by Мария on 22/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class TagsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var doneImageView: UIImageView!
    
    func setSelection(_ isSelected: Bool) {
        doneImageView.image = isSelected ? UIImage(named: "done") :  UIImage(named: "free")
    }
}
