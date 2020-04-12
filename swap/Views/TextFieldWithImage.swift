//
//  TextFieldWithImage.swift
//  swap
//
//  Created by Мария on 22/03/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TextFieldWithImage: UITextField {
    
    @IBInspectable var image: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupImage()
        setupBorders()
    }
    
    func setupBorders() {
        borderStyle = .none
        layer.cornerRadius = bounds.height/2
        layer.borderWidth = 0.4
        layer.borderColor =  UIColor(named: "light gray")?.cgColor
    }
    
    func setupImage() {
        guard let image = image else { return }
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        let imageHeight = self.bounds.height * 19.0/48.0
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: imageHeight)
        let widthConstraint = imageView.widthAnchor.constraint(equalToConstant: imageHeight*2.5)
        NSLayoutConstraint.activate([widthConstraint, heightConstraint])
        leftView = imageView
        
        leftViewMode = .always
    }
    
}
