//
//  RoundedButton.swift
//  swap
//
//  Created by Мария on 08/12/2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = layer.frame.height/2
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(named: "light gray")?.cgColor
    }
    
}
