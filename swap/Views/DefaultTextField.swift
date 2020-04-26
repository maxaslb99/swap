//
//  DefaultTextField.swift
//  swap
//
//  Created by Мария on 16/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

class DefaultTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return recalculate(bounds: bounds, withOffset: 16)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return recalculate(bounds: bounds, withOffset: 16)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return recalculate(bounds: bounds, withOffset: 16)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        borderStyle = .none
        layer.cornerRadius = 20
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.3
        backgroundColor = UIColor.clear
        layer.masksToBounds = true
    }
    
    func recalculate(bounds: CGRect, withOffset offset: CGFloat) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += offset
        newBounds.size.width -= offset
        return newBounds
    }
    
}
