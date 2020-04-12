//
//  TextField.swift
//  swap
//
//  Created by Мария on 22/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class TextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBorders()
    }
    
   func setupBorders() {
       borderStyle = .none
       layer.cornerRadius = 7
       layer.borderWidth = 0.5
       layer.borderColor =  UIColor(named: "light gray")?.cgColor
    
   }
}
