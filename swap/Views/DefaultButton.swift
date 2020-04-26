//
//  DefaultButton.swift
//  swap
//
//  Created by Мария on 16/04/2020.
//  Copyright © 2020 Мария. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class DefaultButton: UIButton {
    
    private var activityIndicator: ActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if activityIndicator == nil {
            initActivityIndcatorView()
        }
    }
    
    func setup() {
        setTitleColor(UIColor.white, for: .normal)
        layer.cornerRadius = 6
        // font
        // bacground color
    }
    
    private func initActivityIndcatorView() {
        let width: CGFloat = 30
        let height: CGFloat = 30
        let origin = CGPoint(x: bounds.midX - width/2, y: bounds.midY - height/2)
        let frame = CGRect(origin: origin, size: CGSize(width: width, height: height))
        activityIndicator = ActivityIndicatorView(frame: frame)
        activityIndicator.isUserInteractionEnabled = false
        addSubview(activityIndicator)
        activityIndicator.isHidden = true
    }
    
    func startLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        setTitleColor(.clear, for: .normal)
        isEnabled = false
    }
    
    func stopLoading() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimation()
        setTitleColor(.white, for: .normal)
        isEnabled = true
    }
    
}
