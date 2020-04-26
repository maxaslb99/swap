//
//  ShadowViev-2.swift
//  swap
//
//  Created by Мария on 26/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class ShadowView2: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.06
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 24
    }
    
}
