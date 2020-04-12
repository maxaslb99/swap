//
//  DefaultTextView.swift
//  swap
//
//  Created by Мария on 22/12/2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import Foundation
import UIKit

class DefaultTextView: UITextView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor(named: "light gray")?.cgColor
        layer.borderWidth = 1
        textContainerInset = .init(top: 18, left: 16, bottom: 18, right: 16)
    }
    
}
