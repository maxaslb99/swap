//
//  ShadowView.swift
//  swap
//
//  Created by Мария on 15/12/2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import Foundation
import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.06
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 13
    }
    
}
